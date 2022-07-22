#!/usr/bin/env python3

import argparse
import os
import platform
import sys
sys.dont_write_bytecode = True
from subprocess import call
import subprocess
import hashlib

# Paths to build tools, depending on OS

if platform.system() == "Windows" or "MSYS" in platform.system() or "MINGW" in platform.system():
	platformDir = "AS/Win32"
	asBinary = "AS/Win32/asw.exe"
	s1p2binBinary = "AS/Win32/s1p2bin.exe"

elif platform.system() == "Darwin": # Osx
	platformDir = "AS/Osx"
	asBinary = "AS/Osx/asl"
	s1p2binBinary = "AS/Osx/s1p2bin"

elif platform.system() == "Linux":
	if sys.maxsize > 2**32:	# detect if running in 64-bit environment
		platformDir = "AS/Linux"
		asBinary = "AS/Linux/asl"
		s1p2binBinary = "AS/Linux/s1p2bin"
	else:
		platformDir = "AS/Linux32"
		asBinary = "AS/Linux32/asl"
		s1p2binBinary = "AS/Linux32/s1p2bin"

else:
	print("Unknown platform")
	sys.exit()

if not os.path.isfile(s1p2binBinary):
	print(
		"Sorry, the s1p2bin tool for your platform is outdated and needs recompiling.\n\n"
		f"You can find the source code as well as a Makefile in 'AS/s1p2bin'. Once compiled, copy the executable to '{platformDir}'.\n\n"
		"We'd appreciate it if you could send us your binary in a pull request at https://github.com/sonicretro/s1disasm, so other users don't have this problem in the future."
	)
	sys.exit()

def delete(path):
	if os.path.isfile(path):
		os.remove(path)

def move(path1, path2):
	if os.path.isfile(path1):
		os.rename(path1, path2)

def update_checksum(path):
	with open(path, "r+b") as file:
		# Read the whole file in memory
		bytes = file.read()

		# Calculate the checksum
		checksum = 0
		for i in range(0x200, len(bytes), 2):
			checksum += (bytes[i + 0] << 8) + (bytes[i + 1] << 0)

		# Write the checksum to the header
		file.seek(0x18E)
		file.write(bytearray([(checksum >> 8) & 0xFF, (checksum >> 0) & 0xFF]))

def check_bitperfect(path):
	hashobj = hashlib.sha256()

	with open(path, "rb") as file:
		hashobj.update(file.read())

	if hashobj.hexdigest() == "46160baa06362c711c9f1a5017cb7371026444936c8af5e93a78996cf32ff2a6":
		print("  New build is bit-perfect with REV00")
	elif hashobj.hexdigest() == "1b7f6635bd713f37f3c2f44f302b872c2e3c5f56e63637918dad4637146900fd":
		print("  New build is bit-perfect with REV01")
	elif hashobj.hexdigest() == "94a5379fa0bd6760cb0606b77f705a85b6af1724da99e8c765b34ba2ab825e1a":
		print("  New build is bit-perfect with REVXB")
	else:
		print("  New build is not bit-perfect with REV00, REV01, or REVXB")


# Define and parse arguments
parser = argparse.ArgumentParser()
parser.add_argument("-a", "--accurate", action="store_true", help="compress the DAC driver in a way that's accurate to the original ROM (uses sub-optimal compression)")
args = parser.parse_args()

if platform.system() == "Windows":
	os.environ["AS_MSGPATH"] = "AS/Win32"
	os.environ["USEANSI"] = "n"

# Build ROM
print("Building s1built")

# Create full paths for all files
romPath = "s1built.bin"
romPathPrev = "s1built.prev.bin"
errorsPath = "sonic.log"
outputPath = "_Output.txt"
binaryOutputPath = "_BinaryOutput.txt"

print("  Cleaning previous build")
# Remove old output
delete(romPathPrev)
move(romPath, romPathPrev)
delete(errorsPath)
delete(outputPath)
delete(binaryOutputPath)
delete("sonic.p")

assembleCommand = [asBinary, "-xx", "-n", "-q", "-A", "-L", "-U", "-i", "."]

# Input asm file
assembleCommand.append("sonic.asm")

print("  Assembling .p file")

assembleProcess = subprocess.Popen(assembleCommand, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
output, errors = assembleProcess.communicate()
with open(errorsPath, "wb") as errorsFile:
	errorsFile.write(errors)
with open(outputPath, "wb") as outputFile:
	outputFile.write(output)

# Detect if there was an error
if os.path.isfile("sonic.p") == False:
	print("There was a fatal error during assembly: see sonic.log for details")
	sys.exit()

# Create binary

if args.accurate:
	binaryCommand = [s1p2binBinary, "-a", "sonic.p", romPath]
else:
	binaryCommand = [s1p2binBinary, "sonic.p", romPath]

# Output file

print("  Converting .p to .bin")

binaryProcess = subprocess.Popen(binaryCommand, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
output, errors = binaryProcess.communicate()
outputFile = open(binaryOutputPath, "wb")
outputFile.write(output)
outputFile.close()

# Fixing checksum

print("  Calculating checksum")
update_checksum(romPath)

print("  Removing temporary files")

# delete working files
delete("sonic.p")

# Ensure bit-perfection
if args.accurate:
	check_bitperfect(romPath)

print("Finished!")
