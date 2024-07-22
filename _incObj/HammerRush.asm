; =========================================================================
; rocketsailor's note: 
; This is the subroutine for the hammer rush.
; =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerRush:
        clr.b	(f_hammercharge).w ; clear hammer rush charging flag
        move.b	(v_jpadhold2).w,d0
        andi.b	#btnABC,d0	; is A, B or C pressed?
        beq.s	HammerRushEnd	; if not, branch
        move.b	#id_HammerRush,obAnim(a0) ; use hammer rush animation
        move.b	#1,(f_hammerrush).w ; set flag for hammer rush
        move.w	#$AE,(v_player+$3A).w	; time limit for the hammer rush
        rts

HammerRushEnd:
        move.b	#id_Walk,obAnim(a0) ; use running/walking animation
        clr.b   (f_hammerobject).w ; clear hammer object flag
        clr.b	(f_hammerrush).w ; clear hammer rush flag
        rts