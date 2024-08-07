;  =========================================================================
;   rocketsailor's note: 
; 	This script contains code written by MarkeyJester (extending art limits) 
; 	and Clownacy (DMA queue).
;  =========================================================================
; ---------------------------------------------------------------------------
; Sonic	graphics loading subroutine
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_LoadGfx:
		moveq	#0,d0
		move.b	obFrame(a0),d0	; load frame number
		cmp.b	(v_sonframenum).w,d0 ; has frame changed?
		beq.s	.nochange	; if not, branch

		move.b	d0,(v_sonframenum).w
		lea	(SonicDynPLC).l,a2 ; load PLC script
		add.w	d0,d0
		adda.w	(a2,d0.w),a2
		moveq	#0,d6
		move.b	(a2)+,d6	; read "number of entries" value
		subq.b	#1,d6
		bmi.s	.nochange	; if zero, branch
		move.w 	#vram_sonic,d5

.readentry:
		moveq	#0,d1
		move.b	(a2)+,d1
		move.w	d1,d3
		andi.b 	#$F0,d3
		addi.w 	#$10,d3
		lsl.w	#8,d1
		move.b	(a2)+,d1

		; Art limit extensions by MarkeyJester
		andi.w	#$0FFF,d1	; MJ: clear the counter
		lsl.l	#5,d1		; MJ: shifting long-word instead of word (more than FFFF bytes)
		addi.l 	#Art_Sonic,d1
		move.w 	d5,d2
		add.w 	d3,d5
		add.w 	d3,d5

		jsr		(QueueDMATransfer).w 

		dbf		d6,.readentry	; repeat for number of entries

.nochange:
		rts	

; End of function Sonic_LoadGfx