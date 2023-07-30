; ---------------------------------------------------------------------------
;   rocketsailor's note: 
;   Double jump code accessed from an SSRG forum thread by FlyTF
;   Original code by EB, modified by rocketsailor
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

HammerAttack:
        cmpi.b    #2,$1C(a0)            ; EB: is the current animation rolling?
        bne.s    return                ; EB:  if not, branch
        btst    #7,$22(a0)        ; EB: read if DoubleJump flag was set
        bne.s    return                ; EB: was it set? if not, branch
		move.b	(v_jpadpress2).w,d0
		andi.b	#btnABC,d0	           ; is A, B or C pressed?
        beq.w    return                ; EB: if not, branch
        bset    #7,$22(a0)        ; EB: set DoubleJump flag
        move.w    #$A0,d0            ; EB: play 'jump' sound
        jsr    (PlaySound_Special).l   ; ^
		move.b	#id_HammerAttack,obAnim(a0) ; use hammer attack animation

return:
        rts                             ; EB: return