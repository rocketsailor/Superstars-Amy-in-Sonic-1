; ---------------------------------------------------------------------------
; Subroutine controlling Sonic's jump height/duration
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_JumpHeight:
		tst.b	$3C(a0) 	; is player jumping?
		beq.s	loc_134C4	; if not, branch
		move.w	#-$400,d1	; default value
		btst	#6,obStatus(a0) 	; is player underwater?
		beq.s	loc_134AE 	; if not, branch
		move.w	#-$200,d1 	; Underwater-specific value

loc_134AE:
		cmp.w	obVelY(a0),d1	; is y speed greater than 4? (2 if underwater)
		ble.s	locret_134C2	; if not, branch
		move.b	(v_jpadhold2).w,d0
		andi.b	#btnABC,d0	; is A, B or C pressed?
		bne.s	locret_134C2	; if yes, branch
		move.w	d1,obVelY(a0)	; cap jump height

locret_134C2:
		cmpi.b	#id_HammerCharge,obAnim(a0) ; is player double jumping?
		beq.s 	locret_134D2	; if yes, branch
		tst.b 	obVelY(a0) ; is player exactly at the height of their jump?
		beq.s 	SwitchToRolling ; if yes, branch
		rts	

SwitchToRolling:
		move.b 	#id_Roll,obAnim(a0) ; set animation to rolling
		rts
; ===========================================================================

loc_134C4:
		cmpi.w	#-$FC0,obVelY(a0) ; is player's Y speed faster (less than) than -15.75 (-$FC0)?
		bge.s	locret_134D2	; if not, branch
		move.w	#-$FC0,obVelY(a0)	; cap upward speed

locret_134D2:
		rts	

; End of function Sonic_JumpHeight