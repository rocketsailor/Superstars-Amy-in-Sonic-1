; =========================================================================
; rocketsailor's note: 
; This is the subroutine for the hammer rush. (CURRENTLY NON-FUNCTIONAL)
; =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerRush:
        ;btst    #7,obStatus(a0)        ; is player double jumping?
        ;beq.s   HammerRushEnd ; if so, branch
		;tst.b	(f_hammerrush).w ; is hammer rush flag set?
        ;beq.s   HammerRushEnd ; if not, branch
        btst	#2,obStatus(a0) ; is player rolling or jumping?
        beq.s   HammerRushEnd ; if not, branch
        move.b	(v_jpadhold2).w,d0
        andi.b	#btnABC,d0	; is A, B or C pressed?
        beq.s	HammerRushEnd	; if not, branch
        move.b	#id_HammerRush,obAnim(a0) ; use hammer rush animation
        rts

HammerRushEnd:
        clr.b   (f_hammerobject).w ; clear hammer flag
        clr.b	(f_hammerrush).w ; clear hammer rush flag
        rts