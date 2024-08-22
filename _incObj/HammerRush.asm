; =========================================================================
; rocketsailor's note: 
; This is the subroutine for initiating the hammer rush.
; Ongoing hammer rush checks are located at Sonic_Display.
; =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerRush:
        cmpi.b	#id_HammerCharge,obAnim(a0) ; if animation is not hammer charge,
        bne.s   .exit ; then branch
        move.w	#$AE,(v_player+$3A).w	; set 3-second time limit for hammer rush
        move.b	#1,(f_hammerrush).w ; set flag for hammer rush
        move.b	#id_HammerRush,obAnim(a0) ; use hammer rush animation
        move.w	#sfx_SpindashRelease,d0  ; load sfx
        jsr	(PlaySound_Special).l  ; play it

.exit:
        rts