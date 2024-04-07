;  =========================================================================
;   rocketsailor's note: 
;   This script checks if player is holding the jump button while double jumping. 
;   If the button isn't held, the jump turns into a regular roll.
;  =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerChargeCheck:
		cmpi.b	#id_HammerCharge,obAnim(a0) ; is player double jumping?
        bne.s   ChargeCheckEnd  ; if not, branch
        move.b	(v_jpadhold2).w,d0
		andi.b	#btnABC,d0	; is A, B or C pressed?
		bne.s	ChargeCheckEnd	; if yes, branch
        move.b  #id_Roll,obAnim(a0) ; set animation to roll

ChargeCheckEnd:
        rts