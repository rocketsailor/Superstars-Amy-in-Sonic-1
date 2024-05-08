;  =========================================================================
;   rocketsailor's note: 
;   This script checks if player is holding the jump button while double jumping. 
;   If the button isn't held, the jump turns into a regular roll.
;  =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerChargeCheck:
        btst    #7,$22(a0)        ; is player double jumping?
        beq.s   ChargeCheckEnd  ; if not, branch
        move.b	(v_jpadhold2).w,d0
		andi.b	#btnABC,d0	; is A, B or C pressed?
		bne.s	ChargeCheckEnd	; if not, branch
        move.b  #id_Roll,obAnim(a0) ; set animation to roll
        clr.b	($FFFFFFA4).w ; clear hammer flag

ChargeCheckEnd:
        rts