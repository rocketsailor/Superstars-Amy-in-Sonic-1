; ---------------------------------------------------------------------------
; Subroutine to	reset player's mode when they land on the floor
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_ResetOnFloor:
		bclr 	#7,obStatus(a0)
		btst	#4,obStatus(a0)
		beq.s	loc_137AE
		nop	
		nop	
		nop	

loc_137AE:
		bclr	#5,obStatus(a0)
		bclr	#1,obStatus(a0)
		bclr	#4,obStatus(a0)
		btst	#2,obStatus(a0)
		beq.s	loc_137E4
		bclr	#2,obStatus(a0)
		move.b	#$F,obHeight(a0)
		move.b	#9,obWidth(a0)
		subq.w	#1,obY(a0)
		tst.b	(f_hammercharge).w	; is charging hammer rush flag set?
		beq.s 	BranchtoHammerRush
		move.b	#id_Walk,obAnim(a0) ; use running/walking animation

loc_137E4:
		move.b	#0,$3C(a0)
		move.w	#0,(v_itembonus).w
		rts	

BranchtoHammerRush:
		move.b	#0,$3C(a0)
		move.w	#0,(v_itembonus).w
		beq.w 	HammerRush
		rts

; End of function Sonic_ResetOnFloor