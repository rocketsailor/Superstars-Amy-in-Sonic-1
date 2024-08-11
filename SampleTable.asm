
; ---------------------------------------------------------------
SampleTable:
	;			type			pointer		Hz
	dcSample	TYPE_DPCM, 		Kick, 		8000				; $81
	dcSample	TYPE_PCM,		Snare,		24000				; $82
	dcSample	TYPE_DPCM, 		Timpani, 	7250				; $83
	dcSample	TYPE_PCM,		DblJump,	0, FLAGS_SFX		; $84
	dcSample	TYPE_PCM,		Bonk,		0, FLAGS_SFX		; $85
	dcSample	TYPE_NONE										; $86
	dcSample	TYPE_NONE										; $87
	dcSample	TYPE_DPCM, 		Timpani, 	9750				; $88
	dcSample	TYPE_DPCM, 		Timpani, 	8750				; $89
	dcSample	TYPE_DPCM, 		Timpani, 	7150				; $8A
	dcSample	TYPE_DPCM, 		Timpani, 	7000				; $8B
	dcSample	TYPE_PCM,		SegaPCM,	0, FLAGS_SFX		; $8C	NOTE: sample rate is auto-detected from WAV file
	dc.w	-1	; end marker

; ---------------------------------------------------------------
	incdac	Kick, "sound/dac/kick.dpcm"
	incdac	Snare, "sound/dac/snare.pcm"
	incdac	Timpani, "sound/dac/timpani.dpcm"
	incdac	DblJump, "sound/dac/sfx/DblJump.wav"
	incdac	Bonk, "sound/dac/sfx/Bonk.wav"
	incdac	SegaPCM, "sound/dac/sega.wav"
	even
