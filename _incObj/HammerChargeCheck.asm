;  =========================================================================
;   rocketsailor's note: 
;   This script checks if player is holding the jump button while double jumping. 
;   If the button isn't held, the jump turns into a regular roll,
;   and the hammer rush will not activate.
;  =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerChargeCheck:
        btst    #7,obStatus(a0) ; is player double jumping?
        beq.s   .end  ; if not, branch
        move.b	(v_jpadhold2).w,d0
        andi.b	#btnABC,d0	; is A, B or C pressed?
        bne.s	.pressed	; if so, branch
        move.b  #id_Roll,obAnim(a0) ; set animation to roll
        clr.b	(f_hammerobject).w ; clear hammer flag
        rts 

.pressed:
	btst 	#1,hammercharge(a0) ; is the flag of no return set?
        bne.s   .end ; if so, branch
       	cmpi.b	#id_Roll,obAnim(a0) ; is player rolling?
        bne.s   .end ; if not, branch
	move.b	#id_PreHammerCharge,obAnim(a0) ; use hammer animation
        move.b	#1,(f_hammerobject).w ; set flag for using the hammer 

.end:
        rts