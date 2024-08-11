; =========================================================================
; rocketsailor's note: 
; This is the subroutine for the hammer rush.
; =========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerRush:
        cmpi.b	#id_HammerCharge,obAnim(a0) ; if animation is not hammer charge or hammer rush,
        blt.s   .exit ; then branch
        move.b	(v_jpadhold2).w,d0
        andi.b	#btnABC,d0	; is A, B or C pressed?
        beq.s	.walk	; if not, branch
        cmpi.b	#id_HammerRush,obAnim(a0) ; is player already using hammer rush?
        beq.s 	.timer	; if yes, branch
        move.w	#$AE,(v_player+$3A).w	; set 3-second time limit for hammer rush
        move.b	#1,(f_hammerrush).w ; set flag for hammer rush
        move.b	#id_HammerRush,obAnim(a0) ; use hammer rush animation
        move.w	#sfx_SpindashRelease,d0  ; load sfx
        jsr	(PlaySound_Special).l  ; play it

.timer:
        tst.w	rushtime(a0)	; check	time remaining
	beq.s	.exit  ; if no time remains, branch
	subq.w	#1,rushtime(a0)	; subtract 1 from time
	bne.s	.exit

.walk:
        move.b	#id_Walk,obAnim(a0) ; use running/walking animation
        clr.b   (f_hammerobject).w ; clear hammer object flag
        clr.b   (f_hammerrush).w ; clear hammer rush flag

.exit:
        rts