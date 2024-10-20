; =========================================================================
; rocketsailor's note: 
; Modifications are originally based off of LuigiXHero's drop dash code.
; =========================================================================
; ---------------------------------------------------------------------------
; Subroutine to	reset player's mode when they land on the floor
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_ResetOnFloor:
		bclr 	#7,obStatus(a0)
		bclr 	#1,hammercharge(a0)
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
		cmpi.b	#id_HammerCharge,obAnim(a0) ; is player jumping with hammer?
		beq.s 	loc_137E4 ; if so, branch
		cmpi.b	#id_HammerRush,obAnim(a0) ; is player already using hammer rush?
		beq.s 	loc_137E4 ; if so, branch
		move.b	#id_Walk,obAnim(a0) ; use running/walking animation

loc_137E4:
		move.b	#0,$3C(a0)
		move.w	#0,(v_itembonus).w
		cmpi.b	#id_HammerCharge,obAnim(a0) ; is player jumping with hammer?
		bne.s 	.return ; if not, branch
		cmpi.b	#id_HammerRush,obAnim(a0) ; is player already using hammer rush?
		bne.s 	.return ; if not, branch
		beq.w 	HammerRush

.return:
		rts	

; End of function Sonic_ResetOnFloor