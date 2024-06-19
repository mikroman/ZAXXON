#import "8000mirror.asm"

* = $8000
	.word coldstart
	.word warmstart
//	.byte $0D,$80
//	.byte $29,$80
	.byte $C3,$C2,$CD,$38,$30

L_JMP_8009_800A:	// BRK jumps here

	sei
	jmp L_JMP_8009_800A

coldstart:

	sei
	lda #$00
	sta $D016                         // Control Register 2
	jsr $FDA3                         // Initialise I/O
	jsr $FD15                         // Restore Kernal Vectors
	ldx #$0B
	lda #$00
	sta $3427

L_BRS_8020_8024:

	sta $3400,X
	dex
	bpl L_BRS_8020_8024
	jsr L_JSR_81BA_8026

warmstart:

	sei
	cld
	lda #$00
	sta $D011                          // Control Register 1
	jsr $B668
	sei
	ldx #$FF
	txs
	jsr L_JSR_8B7E_8037

L_JMP_803A_805E:
L_JMP_803A_8B51:

	jsr $A961
	jsr $B47E
	jsr $B102
	jsr $B16D
	jsr $A000                         // Restart Vectors
	jsr $B016                         // Perform <, =, >
	jsr $AF16
	jsr L_JSR_8061_804F
	jsr L_JSR_8AA8_8052
	jsr $AD71
	jsr $AB6D
	jsr $A740
	jmp L_JMP_803A_805E

L_JSR_8061_804F:

	lda $2269
	bmi L_BRS_8079_8064
	dec $342D
	bne L_BRS_8079_8069
	lda $3426
	sta $342D
	dec $3420
	bne L_BRS_8079_8074
	jmp $A85B

L_BRS_8079_8064:
L_BRS_8079_8069:
L_BRS_8079_8074:

	rts
	lda $10
	cmp #$05
	bcc L_BRS_80B7_807E
	lda $341B
	cmp #$01
	beq L_BRS_80B7_8085
	lda $12
	and #$10
	lsr
	lsr
	ora #$50
	sta $03
	lda $E4
	and #$03
	ora $03
	sta $E4
	ldy #$00

L_BRS_809B_80A9:
L_BRS_809B_80B3:

	lda ($E3),Y
	beq L_BRS_80A7_809D
	cmp #$1F
	beq L_BRS_80A7_80A1
	cmp #$22
	bne L_BRS_80BA_80A5

L_BRS_80A7_809D:
L_BRS_80A7_80A1:
L_BRS_80A7_80D0:

	inc $E3
	bne L_BRS_809B_80A9
	inc $E4
	lda $E4
	and #$03
	cmp #$03
	bne L_BRS_809B_80B3
	inc $E4

L_BRS_80B7_807E:
L_BRS_80B7_8085:

	lda #$00
	rts

L_BRS_80BA_80A5:

	cmp #$3F
	beq L_BRS_80D2_80BC
	cmp #$A1
	beq L_BRS_80D2_80C0
	cmp #$53
	beq L_BRS_80D2_80C4
	cmp #$61
	beq L_BRS_80D2_80C8
	cmp #$5F
	beq L_BRS_80D2_80CC
	cmp #$A6
	bne L_BRS_80A7_80D0

L_BRS_80D2_80BC:
L_BRS_80D2_80C0:
L_BRS_80D2_80C4:
L_BRS_80D2_80C8:
L_BRS_80D2_80CC:

	pha
	lda $E3
	sta $02
	lda $E4
	sta $03
	jsr L_JSR_80F4_80DB
	inc $E3
	bne L_BRS_80F0_80E0
	inc $E4
	lda $E4
	and #$03
	cmp #$03
	bne L_BRS_80F0_80EA
	lda #$00
	sta $E4

L_BRS_80F0_80E0:
L_BRS_80F0_80EA:

	pla
	ora #$00
	rts

L_JSR_80F4_80DB:

	lda $02
	sta $06
	lda $03
	and #$03
	sec
	ldx #$FF

L_BRS_80FF_810C:

	inx
	sta $07
	lda $06
	sbc #$28
	sta $06
	lda $07
	sbc #$00
	bcs L_BRS_80FF_810C
	lda $06
	adc #$28
	sta $06
	lda #$00
	asl $06
	rol
	asl $06
	rol
	asl $06
	rol
	sta $07
	lda $10
	adc #$19
	adc $06
	sta $06
	lda $07
	adc #$00
	sta $07
	lda $11
	adc #$04
	and #$07
	adc #$2E
	sta $05
	txa
	asl
	asl
	asl
	adc $05
	sta $05
	rts

L_JSR_8142_8C67:

	ldx #$00
	ldy #$FE
	jmp L_JMP_8162_8146

L_BRS_8149_8167:

	cpx $341E
	bcs L_BRS_8169_814C
	lda #$1B
	sta $5371,Y
	lda #$1C
	sta $5372,Y
	lda #$1D
	sta $5399,Y
	lda #$1E
	sta $539A,Y

L_JMP_8162_8146:

	iny
	iny
	inx
	cpx #$06
	bne L_BRS_8149_8167

L_BRS_8169_814C:

	rts

L_JSR_816A_85C8:

	ldx #$07
	lda #$80
	sta $02
	lda #$B8
	sta $03
	lda #$00
	sta $04
	lda #$40
	sta $05
	ldy #$00
	lda ($02),Y
	sta $06

L_BRS_8182_81AD:

	inc $02
	bne L_BRS_8188_8184
	inc $03

L_BRS_8188_8184:

	lda ($02),Y
	and #$F0
	cmp $06
	bne L_BRS_81A7_818E
	lda ($02),Y
	and #$0F
	sta $07
	inc $02
	bne L_BRS_819C_8198
	inc $03

L_BRS_819C_8198:

	lda ($02),Y

L_BRS_819E_81A3:

	jsr L_JSR_81B0_819E
	dec $07
	bne L_BRS_819E_81A3
	beq L_BRS_81AC_81A5

L_BRS_81A7_818E:

	lda ($02),Y
	jsr L_JSR_81B0_81A9

L_BRS_81AC_81A5:

	txa
	bpl L_BRS_8182_81AD
	rts

L_JSR_81B0_819E:
L_JSR_81B0_81A9:

	sta ($04),Y
	inc $04
	bne L_BRS_81B9_81B4
	inc $05
	dex

L_BRS_81B9_81B4:

	rts

L_JSR_81BA_8026:

	lda #$80
	sta $3439
	jsr L_JSR_820A_81BF
	lda #$08
	jsr L_JSR_8246_81C4

L_BRS_81C7_81DC:

	lda #$05
	jsr L_JSR_829B_81C9
	lda $14
	and #$10
	beq L_BRS_81E0_81D0
	lda $14
	and #$04
	beq L_BRS_81E0_81D6
	lda $14
	and #$08
	bne L_BRS_81C7_81DC
	lda #$FF

L_BRS_81E0_81D0:
L_BRS_81E0_81D6:

	sta $3439
	rts

L_JSR_81E4_8220:
L_JSR_81E4_822B:
L_JSR_81E4_8442:
L_JSR_81E4_844B:
L_JSR_81E4_8456:
L_JSR_81E4_845D:

	ldy #$00

L_BRS_81E6_81E9:
L_BRS_81E6_81EE:

	sta ($02),Y
	iny
	bne L_BRS_81E6_81E9
	inc $03
	dex
	bne L_BRS_81E6_81EE
	rts

L_JSR_81F1_89E1:
L_JSR_81F1_89F0:
L_JSR_81F1_8A20:

	sta ($15),Y
	lsr
	tay
	lda $B800,Y
	bcs L_BRS_81FE_81F8
	lsr
	lsr
	lsr
	lsr

L_BRS_81FE_81F8:

	rts

L_JSR_81FF_8B55:
L_JSR_81FF_8C6A:

	ldx #$0F
	lda #$00

L_BRS_8203_8207:

	sta $2000,X
	dex
	bpl L_BRS_8203_8207
	rts

L_JSR_820A_81BF:
L_JSR_820A_8AC6:
L_JSR_820A_8B0A:

	sei
	lda #$00
	sta $D011                          // Control Register 1
	sta $D020                          // Border Color
	sta $D418                          // Select Filter Mode and Volume
	sta $02
	lda #$04
	sta $03
	ldx #$04
	lda #$A0
	jsr L_JSR_81E4_8220
	lda #$D8
	sta $03
	lda #$00
	ldx #$04
	jsr L_JSR_81E4_822B
	sta $D015                          // Sprite display Enable
	lda #$00
	sta $D016                          // Control Register 2
	lda #$10
	sta $D011                          // Control Register 1
	lda #$14
	sta $D018                          // Memory Control Register
	lda #$03
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	rts

L_JSR_8246_81C4:
L_JSR_8246_8ACB:
L_JSR_8246_8B21:

	asl
	tax
	lda $8325,X
	sta $04
	lda $8326,X
	sta $05
	ldy #$00
	lda ($04),Y
	sta $02
	jsr L_JSR_8294_8258
	lda ($04),Y
	sta $03

L_JMP_825F_828A:

	jsr L_JSR_8294_825F

L_JMP_8262_8276:

	lda ($04),Y
	beq L_BRS_827A_8264
	cmp #$FF
	beq L_BRS_8279_8268
	and #$3F
	ora #$80
	sta ($02),Y
	jsr L_JSR_828D_8270
	jsr L_JSR_8294_8273
	jmp L_JMP_8262_8276

L_BRS_8279_8268:

	rts

L_BRS_827A_8264:

	jsr L_JSR_8294_827A
	clc
	lda ($04),Y
	adc $02
	sta $02
	lda #$00
	adc $03
	sta $03
	jmp L_JMP_825F_828A

L_JSR_828D_8270:

	inc $02
	bne L_BRS_829A_828F
	inc $03
	rts

L_JSR_8294_8258:
L_JSR_8294_825F:
L_JSR_8294_8273:
L_JSR_8294_827A:

	inc $04
	bne L_BRS_829A_8296
	inc $05

L_BRS_829A_828F:
L_BRS_829A_8296:

	rts

L_JSR_829B_81C9:
L_JSR_829B_8AD0:
L_JSR_829B_8B36:

	sta $04
	lda #$00
	sta $EB
	lda #$06
	sta $06

L_BRS_82A5_8321:

	lda #$3C
	sta $05

L_BRS_82A9_82AE:
L_BRS_82A9_831B:

	lda $D012                          // Raster Position
	cmp #$36
	bne L_BRS_82A9_82AE
	lda $02
	sta $03

L_BRS_82B4_82CF:

	ldy $03
	lda $D012                          // Raster Position
	beq L_BRS_82D1_82B9

L_BRS_82BB_82BE:

	cmp $D012                          // Raster Position
	beq L_BRS_82BB_82BE
	sty $D021                          // Background Color 0
	inc $03
	lda $03
	and #$0F
	bne L_BRS_82CD_82C9
	lda #$01

L_BRS_82CD_82C9:

	sta $03
	bne L_BRS_82B4_82CF

L_BRS_82D1_82B9:

	dec $06
	bne L_BRS_82E5_82D3
	lda #$06
	sta $06
	inc $02
	lda $02
	and #$0F
	bne L_BRS_82E3_82DF
	lda #$01

L_BRS_82E3_82DF:

	sta $02

L_BRS_82E5_82D3:

	lda $EB
	cmp #$02
	bcc L_BRS_8319_82E9
	jsr L_JSR_8308_82EB
	beq L_BRS_8319_82EE
	pha
	lda $3439
	cmp #$80
	beq L_BRS_8305_82F6

L_BRS_82F8_82FF:

	lda #$00
	sta $03

L_BRS_82FC_8303:

	jsr L_JSR_8308_82FC
	bne L_BRS_82F8_82FF
	dec $03
	bne L_BRS_82FC_8303

L_BRS_8305_82F6:

	pla
	sec
	rts

L_JSR_8308_82EB:
L_JSR_8308_82FC:

	jsr $A961
	lda $14
	ldx $3439
	cpx #$80
	beq L_BRS_8316_8312
	ora #$0F

L_BRS_8316_8312:

	cmp #$FF
	rts

L_BRS_8319_82E9:
L_BRS_8319_82EE:

	dec $05
	bne L_BRS_82A9_831B
	inc $EB
	dec $04
	bne L_BRS_82A5_8321
	clc
	rts



	.byte $39,$83,$4E,$83,$5C,$83,$97,$83
	.byte $97,$83,$C9,$83,$DC,$83,$EF,$83
	.byte $02,$84,$20,$84,$9A,$05,$50,$4C
	.byte $41,$59,$45,$52,$20,$20,$20,$47
	.byte $41,$4D,$45,$20,$4F,$56,$45,$52
	.byte $FF,$17,$06,$50,$4C,$41,$59,$45
	.byte $52,$20,$20,$20,$55,$50,$FF,$94
	.byte $05,$53,$55,$50,$45,$52,$20,$5A
	.byte $41,$58,$58,$4F,$4E,$20,$20,$43
	.byte $4F,$50,$59,$52,$49,$47,$48,$54
	.byte $20,$53,$45,$47,$41,$20,$31,$39
	.byte $38,$34,$00,$0F,$53,$45,$4C,$45
	.byte $43,$54,$20,$31,$20,$4F,$52,$20
	.byte $32,$20,$50,$4C,$41,$59,$45,$52
	.byte $53,$FF,$9A,$05,$43,$4F,$4E,$47
	.byte $52,$41,$54,$55,$4C,$41,$54,$49
	.byte $4F,$4E,$53,$21,$21,$21,$20,$59
	.byte $4F,$55,$20,$47,$45,$54,$00,$11
	.byte $2D,$2D,$2D,$20,$31,$30,$30,$30
	.byte $20,$50,$4F,$49,$4E,$54,$53,$20
	.byte $2D,$2D,$2D,$FF,$7C,$04,$50,$4C
	.byte $41,$59,$45,$52,$20,$31,$20,$53
	.byte $43,$4F,$52,$45,$20,$3D,$FF,$A4
	.byte $04,$50,$4C,$41,$59,$45,$52,$20
	.byte $32,$20,$53,$43,$4F,$52,$45,$20
	.byte $3D,$FF,$F4,$04,$48,$49,$47,$48
	.byte $45,$53,$54,$20,$20,$53,$43,$4F
	.byte $52,$45,$20,$3D,$FF,$97,$05,$4A
	.byte $4F,$59,$53,$54,$49,$43,$4B,$20
	.byte $4F,$52,$20,$4B,$45,$59,$42,$4F
	.byte $41,$52,$44,$20,$28,$4A,$2F,$4B
	.byte $29,$3F,$FF,$A0,$05,$54,$55,$4E
	.byte $4E,$45,$4C,$20,$49,$4E,$21,$21
	.byte $FF

L_JSR_842E_8AD3:
L_JSR_842E_8B46:
L_JSR_842E_8B81:

	lda #$00
	sta $D011                          // Control Register 1
	ldx #$02
	lda #$00

L_BRS_8437_843A:

	sta $00,X
	inx
	bne L_BRS_8437_843A
	ldy #$02
	sty $03
	ldx #$32
	jsr L_JSR_81E4_8442
	ldy #$C0
	sty $03
	ldx #$20
	jsr L_JSR_81E4_844B
	lda #$1F
	ldy #$50
	sty $03
	ldx #$08
	jsr L_JSR_81E4_8456
	lda #$00
	ldx #$18
	jsr L_JSR_81E4_845D
	ldy #$68
	lda #$FF

L_BRS_8464_8468:

	sta $219F,Y
	dey
	bne L_BRS_8464_8468
	ldy #$00

L_JMP_846C_849E:

	txa
	clc
	adc $8CFC,Y
	tax
	iny
	lda $8CFC,Y
	beq L_BRS_84A1_8476
	sta $03
	iny
	lda $8CFC,Y
	sta $04
	lsr
	lsr
	lsr
	lsr
	sta $05
	iny

L_BRS_8487_849C:

	lda $05
	beq L_BRS_8494_8489
	lda $8CFC,Y
	sta $5348,X
	dec $05
	iny

L_BRS_8494_8489:

	lda $04
	sta $DB48,X
	inx
	dec $03
	bne L_BRS_8487_849C
	jmp L_JMP_846C_849E

L_BRS_84A1_8476:

	lda $3427
	cmp #$01
	beq L_BRS_84BA_84A6
	ldx #$5D
	lda #$08
	sta $02

L_BRS_84AE_84B8:

	iny
	lda $8CFC,Y
	sta $5348,X
	inx
	dec $02
	bne L_BRS_84AE_84B8

L_BRS_84BA_84A6:

	ldx #$18

L_BRS_84BC_84D0:

	lda #$07
	sta $DB4E,X
	lda #$00
	sta $534E,X
	sta $534D,X
	dex
	lda #$02
	sta $DB4E,X
	dex
	bne L_BRS_84BC_84D0
	ldx #$0C

L_BRS_84D4_84E5:

	lda #$01
	sta $DB70,X
	sta $DB98,X
	lda #$00
	sta $5370,X
	sta $5398,X
	dex
	bne L_BRS_84D4_84E5
	lda #$02
	sta $02
	lda #$A0
	sta $03
	lda #$00
	sta $04
	sta $06
	lda #$58
	sta $05
	jsr $9F25
	jsr $9F25
	ldx #$C0

L_JMP_8501_850F:

	ldy #$40

L_BRS_8503_850D:

	lda $583F,Y
	sta $587F,X
	dex
	beq L_BRS_8512_850A
	dey
	bne L_BRS_8503_850D
	jmp L_JMP_8501_850F

L_BRS_8512_850A:

	lda #$40
	sta $04
	lda #$59
	sta $05
	jsr $9F25
	jsr $9F25
	lda #$12
	sta $07

L_BRS_8524_855F:

	lda $07
	sta $08
	ldx #$00
	lda #$15
	sta $09

L_BRS_852E_854F:

	lda #$03
	sta $0A
	dec $08

L_BRS_8534_854B:

	lda $08
	bpl L_BRS_853D_8536
	lda #$00
	jmp L_JMP_8540_853A

L_BRS_853D_8536:

	lda $5980,X

L_JMP_8540_853A:

	inx
	sta ($04),Y
	inc $04
	bne L_BRS_8549_8545
	inc $05

L_BRS_8549_8545:

	dec $0A
	bne L_BRS_8534_854B
	dec $09
	bne L_BRS_852E_854F
	lda $07
	sta ($04),Y
	inc $04
	bne L_BRS_855B_8557
	inc $05

L_BRS_855B_8557:

	dec $07
	dec $07
	bne L_BRS_8524_855F
	lda #$1C
	sta $0D

L_BRS_8565_856A:

	jsr $9F25
	dec $0D
	bne L_BRS_8565_856A
	lda #$00
	sta $07
	sta $08
	sta $09
	lda #$00
	sta $0A
	lda #$63
	sta $0B

L_BRS_857C_85AC:

	ldy #$00
	lda #$15
	sta $0C

L_BRS_8582_8593:

	ldx #$00

L_BRS_8584_858F:

	lda $5EC0,Y
	and $07,X
	sta ($0A),Y
	iny
	inx
	cpx #$03
	bne L_BRS_8584_858F
	dec $0C
	bne L_BRS_8582_8593
	lda #$15
	sta ($0A),Y
	lda $0A
	clc
	adc #$40
	sta $0A
	bcc L_BRS_85A4_85A0
	inc $0B

L_BRS_85A4_85A0:

	ldx #$00

L_BRS_85A6_85B1:

	sec
	ror $07,X
	sec
	ror $07,X
	bcc L_BRS_857C_85AC
	inx
	cpx #$03
	bne L_BRS_85A6_85B1
	jsr $B1C4
	rts

L_JSR_85B7_8CE6:

	lda #$00
	sta $D011                          // Control Register 1
	lda #$01
	sta $2271
	lda #$40
	sta $D018                          // Memory Control Register
	sta $12
	jsr L_JSR_816A_85C8
	lda $341C
	and #$C0
	sta $06
	lda #$00
	sta $13
	jsr $9ED7
	lda $341D
	and #$03
	sta $341B
	beq L_BRS_85F6_85E1
	cmp #$01
	beq L_BRS_8611_85E5
	cmp #$02
	beq L_BRS_85F9_85E9
	lda #$FC
	jsr $9EF8
	jsr L_JSR_8D49_85F0
	jmp L_JMP_8602_85F3

L_BRS_85F6_85E1:

	jsr $9ED1

L_BRS_85F9_85E9:

	lda $06
	beq L_BRS_8600_85FB
	jsr $9EF8

L_BRS_8600_85FB:

	dec $13

L_JMP_8602_85F3:

	lda #$05
	sta $ED
	lda #$0F
	sta $EE
	lda #$0C
	sta $EF
	jmp L_JMP_862C_860E

L_BRS_8611_85E5:

	lda #$00
	sta $ED
	lda #$0F
	sta $EE
	lda #$05
	sta $EF
	lda $06
	sta $341C
	jsr L_JSR_8ECB_8622
	lda #$28
	jsr $9EF8
	dec $13

L_JMP_862C_860E:

	lda #$00
	sta $226C
	lda #$07
	sta $D012                          // Raster Position
	lda #$10
	sta $D011                          // Control Register 1
	lda #$54
	sta $0314
	lda #$86
	sta $0315
	lda #$01
	sta $D01A                          // Interrupt Mask Register (IMR)
	lda #$04
	sta $11
	lda #$07
	sta $10
	cli
	rts
	cld
	lda $11
	clc
	adc #$04
	and #$07
	ora #$10
	sta $D011                          // Control Register 1
	lda #$10
	ora $10
	sta $D016                          // Control Register 2
	lda $12
	sta $D018                          // Memory Control Register
	lda $ED
	sta $D021                          // Background Color 0
	lda $EE
	sta $D022                          // Background Color 1, Multi-Color Register 0
	lda $EF
	sta $D023                          // Background Color 2, Multi-Color Register 1
	lda $2271
	sta $D026                          // Sprite Multi-Color Register 1
	lda #$00
	sta $D7
	sta $D015                          // Sprite display Enable
	lda $DC
	eor #$30
	sta $DD
	lda $895F
	sta $D012                          // Raster Position
	lda #$A8
	sta $0314
	lda #$86
	sta $0315
	jsr L_JSR_88C9_869F
	jsr L_JSR_8A49_86A2
	jmp L_JMP_87CF_86A5
	cld
	jsr L_JSR_8846_86A9
	cpy #$02
	beq L_BRS_86C4_86AE
	cpy #$04
	beq L_BRS_86B7_86B2
	jmp L_JMP_87CA_86B4

L_BRS_86B7_86B2:

	lda #$F9
	sta $0314
	lda #$86
	sta $0315
	jmp L_JMP_87CA_86C1

L_BRS_86C4_86AE:

	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)
	cli
	lda $13
	beq L_BRS_86EA_86CC
	dec $10
	lda $10
	and #$07
	sta $10
	and #$01
	beq L_BRS_86EA_86D8
	inc $11
	lda $11
	and #$07
	sta $11
	beq L_BRS_86ED_86E2
	lda $10
	cmp #$07
	beq L_BRS_86F3_86E8

L_BRS_86EA_86CC:
L_BRS_86EA_86D8:

	jmp L_JMP_87CF_86EA

L_BRS_86ED_86E2:

	jsr L_JSR_87EA_86ED
	jmp L_JMP_87CF_86F0

L_BRS_86F3_86E8:

	jsr L_JSR_87D5_86F3
	jmp L_JMP_87CF_86F6
	cld
	lda #$D5
	sta $D012                          // Raster Position
	lda #$A6
	sta $0314
	lda #$87
	sta $0315
	lda $200F
	bne L_BRS_8711_870C
	jmp L_JMP_87CA_870E

L_BRS_8711_870C:

	ldy #$00
	lda #$CE

L_BRS_8715_871A:

	cmp $D012                          // Raster Position
	beq L_BRS_8721_8718
	bcs L_BRS_8715_871A
	lda #$D5
	sta $D012                          // Raster Position

L_BRS_8721_8718:

	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	sty $D021                          // Background Color 0
	sty $D022                          // Background Color 1, Multi-Color Register 0
	sty $D023                          // Background Color 2, Multi-Color Register 1
	sty $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	sty $D018                          // Memory Control Register
	lda #$00
	sta $D016                          // Control Register 2
	lda #$17
	sta $D011                          // Control Register 1
	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)
	cli
	lda #$00
	ldy #$01

L_BRS_875B_876B:

	sta $D025,Y                          // Sprite Multi-Color Register 0
	sta $D027,Y                          // Sprite 0 Color
	sta $D029,Y                          // Sprite 2 Color
	sta $D02B,Y                          // Sprite 4 Color
	sta $D02D,Y                          // Sprite 6 Color
	dey
	bpl L_BRS_875B_876B
	lda #$00
	sta $D015                          // Sprite display Enable
	lda $13
	beq L_BRS_87A3_8774
	ldx #$0F

L_BRS_8778_87A1:

	lda $2130,X
	bpl L_BRS_87A0_877B
	lda $10
	and #$01
	beq L_BRS_8788_8781
	inc $2050,X
	beq L_BRS_879B_8786

L_BRS_8788_8781:

	lda $2030,X
	sec
	sbc #$01
	sta $2030,X
	lda $2040,X
	sbc #$00
	sta $2040,X
	bcs L_BRS_87A0_8799

L_BRS_879B_8786:

	lda #$00
	sta $2000,X

L_BRS_87A0_877B:
L_BRS_87A0_8799:

	dex
	bpl L_BRS_8778_87A1

L_BRS_87A3_8774:

	jmp L_JMP_87CF_87A3
	cld
	lda #$07
	sta $D012                          // Raster Position
	lda #$54
	sta $0314
	lda #$86
	sta $0315
	ldy #$02
	lda #$D6

L_BRS_87BA_87BD:

	cmp $D012                          // Raster Position
	bcs L_BRS_87BA_87BD
	sty $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda #$40
	sta $D018                          // Memory Control Register
	jmp L_JMP_87CA_87C7

L_JMP_87CA_86B4:
L_JMP_87CA_86C1:
L_JMP_87CA_870E:
L_JMP_87CA_87C7:
L_JMP_87CA_88CF:

	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)

L_JMP_87CF_86A5:
L_JMP_87CF_86EA:
L_JMP_87CF_86F0:
L_JMP_87CF_86F6:
L_JMP_87CF_87A3:

	pla
	tay
	pla
	tax
	pla
	rti

L_JSR_87D5_86F3:
L_JSR_87D5_8F09:

	jsr L_JSR_8804_87D5
	bne L_BRS_87E0_87D8
	jsr $0800
	jmp L_JMP_87E3_87DD

L_BRS_87E0_87D8:

	jsr $0803

L_JMP_87E3_87DD:

	jsr $080C
	jsr L_JSR_8A03_87E6
	rts

L_JSR_87EA_86ED:
L_JSR_87EA_8F03:

	jsr L_JSR_8804_87EA
	bne L_BRS_87F5_87ED
	jsr $0806
	jmp L_JMP_87F8_87F2

L_BRS_87F5_87ED:

	jsr $0809

L_JMP_87F8_87F2:

	jsr $080F
	lda #$00
	sta $300F
	jsr L_JSR_89C8_8800
	rts

L_JSR_8804_87D5:
L_JSR_8804_87EA:
L_JSR_8804_8F0F:

	inc $226C
	lda $2268
	beq L_BRS_8813_880A
	inc $342F
	lda #$FF
	bne L_BRS_883A_8811

L_BRS_8813_880A:

	inc $341C
	lda $341C
	cmp #$FD
	bne L_BRS_882D_881B
	lda #$FF
	sta $2268
	lda $341B
	cmp #$02
	bne L_BRS_882D_8827
	lda #$00
	sta $13

L_BRS_882D_881B:
L_BRS_882D_8827:

	lda $E5
	beq L_BRS_883A_882F
	dec $E5
	bne L_BRS_883A_8833
	lda #$77
	sta $200E

L_BRS_883A_8811:
L_BRS_883A_882F:
L_BRS_883A_8833:

	jsr $0812
	lda $12
	eor #$10
	sta $12
	and #$10
	rts

L_JSR_8846_86A9:

	lda #$07
	sta $D5
	lda $D7
	asl
	asl
	asl
	adc $DD
	sta $D8

L_BRS_8853_88AC:

	ldy $D8
	ldx $21A8,Y
	bmi L_BRS_88A8_8858
	ldy $D5
	lda $D015                          // Sprite display Enable
	and $88C1,Y
	sta $D015                          // Sprite display Enable
	tya
	lda $D5
	asl
	tay
	lda $2050,X
	sta $D001,Y                          // Sprite 0 Y Pos
	lda $2030,X
	sta $D000,Y                          // Sprite 0 X Pos
	ldy $D5
	lda $2000,X
	beq L_BRS_88A8_887B
	sta $53F8,Y
	sta $57F8,Y
	lda $2040,X
	beq L_BRS_8890_8886
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ora $88B9,Y
	bne L_BRS_8896_888E

L_BRS_8890_8886:

	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and $88C1,Y

L_BRS_8896_888E:

	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda $D015                          // Sprite display Enable
	ora $88B9,Y
	sta $D015                          // Sprite display Enable
	lda $2110,X
	sta $D027,Y                          // Sprite 0 Color

L_BRS_88A8_8858:
L_BRS_88A8_887B:

	inc $D8
	dec $D5
	bpl L_BRS_8853_88AC
	ldy $D7
	lda $8960,Y
	sta $D012                          // Raster Position
	inc $D7
	rts
	.byte $01,$02,$04,$08,$10,$20,$40,$80
	.byte $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F

L_JSR_88C9_869F:

	lda $DE
	beq L_BRS_88D2_88CB
	pla
	pla
	jmp L_JMP_87CA_88CF

L_BRS_88D2_88CB:

	inc $DE
	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)
	cli
	lda $DC
	tay
	ldx #$28
	lda #$FF

L_BRS_88E1_88E6:

	sta $21A8,Y
	iny
	dex
	bne L_BRS_88E1_88E6
	lda #$00
	sta $E2
	lda $341B
	cmp #$03
	bne L_BRS_8901_88F1
	ldx #$0E
	jsr L_JSR_8965_88F5
	ldx #$0F
	jsr L_JSR_8965_88FA
	ldx #$0D
	bne L_BRS_8903_88FF

L_BRS_8901_88F1:

	ldx #$0F

L_BRS_8903_88FF:
L_BRS_8903_890E:

	lda $2000,X
	beq L_BRS_890B_8906
	jsr L_JSR_8965_8908

L_BRS_890B_8906:

	dex
	cpx #$07
	bne L_BRS_8903_890E
	ldx $E1

L_BRS_8912_891E:

	lda $2000,X
	bne L_BRS_8923_8915

L_JMP_8917_8930:
L_JMP_8917_8936:

	dex
	bpl L_BRS_891C_8918
	ldx #$07

L_BRS_891C_8918:

	cpx $E1
	bne L_BRS_8912_891E
	jmp L_JMP_8939_8920

L_BRS_8923_8915:

	lda $20A0,X
	beq L_BRS_8933_8926
	ldy $E2
	txa
	sta $2190,Y
	inc $E2
	jmp L_JMP_8917_8930

L_BRS_8933_8926:

	jsr L_JSR_8965_8933
	jmp L_JMP_8917_8936

L_JMP_8939_8920:
L_JMP_8939_8945:

	dec $E2
	bmi L_BRS_8948_893B
	ldy $E2
	ldx $2190,Y
	jsr L_JSR_8965_8942
	jmp L_JMP_8939_8945

L_BRS_8948_893B:

	lda $E1
	clc
	adc #$03
	cmp #$08
	bcc L_BRS_8954_894F
	sec
	sbc #$08

L_BRS_8954_894F:

	sta $E1
	lda $DC
	eor #$30
	sta $DC
	dec $DE
	rts
	.byte $0F,$32,$55,$78,$9B,$CA

L_JSR_8965_88F5:
L_JSR_8965_88FA:
L_JSR_8965_8908:
L_JSR_8965_8933:
L_JSR_8965_8942:

	lda $2050,X
	cmp #$CE
	bcs L_BRS_89AE_896A
	sec
	sbc #$11
	ldy #$04

L_BRS_8971_8977:

	cmp $895F,Y
	bcs L_BRS_8979_8974
	dey
	bne L_BRS_8971_8977

L_BRS_8979_8974:

	lda $895F,Y
	sta $DA
	lda $DC
	sta $D6
	tya
	asl
	asl
	asl
	adc $D6
	tay
	lda #$08
	sta $D6
	lda $341B
	cmp #$03
	beq L_BRS_8999_8992
	tya
	clc
	adc #$07
	tay

L_BRS_8999_8992:
L_BRS_8999_89AC:

	lda $21A8,Y
	bmi L_BRS_89B4_899C

L_BRS_899E_89B7:
L_BRS_899E_89BC:

	lda $341B
	cmp #$03
	bne L_BRS_89A9_89A3
	iny
	jmp L_JMP_89AA_89A6

L_BRS_89A9_89A3:

	dey

L_JMP_89AA_89A6:

	dec $D6
	bne L_BRS_8999_89AC

L_BRS_89AE_896A:

	lda #$00
	sta $20A0,X
	rts

L_BRS_89B4_899C:

	lda $21A0,Y
	bpl L_BRS_899E_89B7
	lda $21B0,Y
	bpl L_BRS_899E_89BC
	txa
	sta $21A8,Y
	lda #$01
	sta $20A0,X
	rts

L_JSR_89C8_8800:
L_JSR_89C8_8F17:

	lda $12
	and #$10
	lsr
	lsr
	eor #$54
	sta $16
	lda #$10
	sta $15
	ldx #$00
	ldy #$00
	sty $19

L_BRS_89DC_89FE:

	jsr $9DF9
	ldy $19
	jsr L_JSR_81F1_89E1
	ldy $19
	sta $3010,Y
	inc $19
	jsr $9DF9
	ldy $19
	jsr L_JSR_81F1_89F0
	ldy $19
	sta $3010,Y
	inc $19
	inx
	inx
	cpx #$18
	bne L_BRS_89DC_89FE
	jmp L_JMP_8A03_8A00

L_JSR_8A03_87E6:
L_JMP_8A03_8A00:
L_JSR_8A03_8F1D:

	lda $12
	and #$10
	lsr
	lsr
	eor #$54
	sta $16
	lda #$27
	sta $15
	lda #$27
	sta $17
	lda #$30
	sta $18
	ldx #$18

L_JMP_8A1B_8A45:

	jsr $9DF9
	ldy #$00
	jsr L_JSR_81F1_8A20
	ldy #$00
	sta ($17),Y
	inx
	inx
	cpx #$36
	beq L_BRS_8A48_8A2B
	lda #$28
	adc $15
	sta $15
	lda #$00
	adc $16
	sta $16
	lda #$28
	adc $17
	sta $17
	lda #$00
	adc $18
	sta $18
	jmp L_JMP_8A1B_8A45

L_BRS_8A48_8A2B:

	rts

L_JSR_8A49_86A2:

	lda $EC
	bne L_BRS_8A57_8A4B
	ldx #$02

L_BRS_8A4F_8A55:

	lda $BD,X
	bne L_BRS_8A58_8A51

L_BRS_8A53_8A5A:
L_JMP_8A53_8A7C:
L_JMP_8A53_8A92:
L_JMP_8A53_8A9C:

	dex
	dex
	bpl L_BRS_8A4F_8A55

L_BRS_8A57_8A4B:

	rts

L_BRS_8A58_8A51:

	dec $CA,X
	bne L_BRS_8A53_8A5A
	lda $C6,X
	sta $CA,X
	ldy #$00
	cpx #$00
	beq L_BRS_8A68_8A64
	ldy #$07

L_BRS_8A68_8A64:

	dec $C9,X
	beq L_BRS_8A95_8A6A
	lda $C5,X
	bmi L_BRS_8A7F_8A6E
	jsr L_JSR_8A9F_8A70
	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	jsr L_JSR_8A9F_8A76
	sta $D401,Y                          // Voice 1: Frequency Control - High-Byte
	jmp L_JMP_8A53_8A7C

L_BRS_8A7F_8A6E:

	clc
	lda $CD,X
	adc $D1,X
	sta $D1,X
	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	lda $CE,X
	adc $D2,X
	sta $D2,X
	sta $D401,Y                          // Voice 1: Frequency Control - High-Byte
	jmp L_JMP_8A53_8A92

L_BRS_8A95_8A6A:

	lda #$00
	sta $BD,X
	sta $D404,Y                          // Voice 1: Control Register
	jmp L_JMP_8A53_8A9C

L_JSR_8A9F_8A70:
L_JSR_8A9F_8A76:

	lda ($C1,X)
	inc $C1,X
	bne L_BRS_8AA7_8AA3
	inc $C2,X

L_BRS_8AA7_8AA3:

	rts

L_JSR_8AA8_8052:

	lda $2268
	bne L_BRS_8AAE_8AAB

L_BRS_8AAD_8AC4:

	rts

L_BRS_8AAE_8AAB:

	lda $341B
	beq L_BRS_8ABF_8AB1
	cmp #$01
	beq L_BRS_8ADE_8AB5
	cmp #$03
	beq L_BRS_8B04_8AB9
	jsr L_JSR_8D49_8ABB
	rts

L_BRS_8ABF_8AB1:

	lda $342F
	cmp #$01
	bcc L_BRS_8AAD_8AC4
	jsr L_JSR_820A_8AC6
	lda #$09
	jsr L_JSR_8246_8ACB
	lda #$04
	jsr L_JSR_829B_8AD0
	jsr L_JSR_842E_8AD3

L_BRS_8AD6_8AE3:

	inc $341D
	sei
	jsr L_JSR_8B54_8ADA
	rts

L_BRS_8ADE_8AB5:

	lda $342F
	cmp #$28
	bcs L_BRS_8AD6_8AE3
	ldx #$07

L_BRS_8AE7_8AED:

	lda $2000,X
	bne L_BRS_8AF0_8AEA

L_BRS_8AEC_8AF5:
L_JMP_8AEC_8B01:

	dex
	bpl L_BRS_8AE7_8AED
	rts

L_BRS_8AF0_8AEA:

	lda $2010,X
	cmp #$08
	bne L_BRS_8AEC_8AF5
	lda #$84
	sta $2130,X
	lda #$28
	sta $2140,X
	jmp L_JMP_8AEC_8B01

L_BRS_8B04_8AB9:

	dec $342F
	beq L_BRS_8B0A_8B07
	rts

L_BRS_8B0A_8B07:

	jsr L_JSR_820A_8B0A
	lda $E8
	cmp #$98
	beq L_BRS_8B18_8B11
	ldy #$10
	jmp L_JMP_8B1A_8B15

L_BRS_8B18_8B11:

	ldy #$05

L_JMP_8B1A_8B15:

	ldx #$00
	jsr $B715
	lda #$03
	jsr L_JSR_8246_8B21
	lda $E8
	cmp #$98
	bne L_BRS_8B34_8B28
	lda #$A0
	sta $05C9
	lda #$B5
	sta $05CA

L_BRS_8B34_8B28:

	lda #$03
	jsr L_JSR_829B_8B36
	lda #$00
	sta $341C
	dec $3430
	bne L_BRS_8B46_8B41
	inc $341D

L_BRS_8B46_8B41:

	jsr L_JSR_842E_8B46
	jsr L_JSR_8B54_8B49
	lda #$21
	sta $341F
	jmp L_JMP_803A_8B51

L_JSR_8B54_8ADA:
L_JSR_8B54_8B49:

	sei
	jsr L_JSR_81FF_8B55
	lda #$00
	sta $D021                          // Background Color 0
	lda #$2F
	sta $DD02                          // Data Direction Register A
	lda #$02
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda #$40
	sta $D018                          // Memory Control Register
	lda #$00
	sta $D016                          // Control Register 2
	lda #$17
	sta $D011                          // Control Register 1
	lda #$00
	sta $341C
	jmp L_JMP_8B84_8B7B

L_JSR_8B7E_8037:

	jsr $B7A7
	jsr L_JSR_842E_8B81

L_JMP_8B84_8B7B:

	lda #$0F
	sta $D019                          // Interrupt Request Register (IRR)
	lda #$7F
	sta $DC0D                          // Interrupt (IRQ) Control Register
	sta $DD0D                          // Interrupt (NMI) Control Register
	lda $DC0D                          // Interrupt (IRQ) Control Register
	lda $DD0D                          // Interrupt (NMI) Control Register
	lda #$2F
	sta $DD02                          // Data Direction Register A
	lda #$02
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda #$FF
	sta $D01C                          // Sprites Multi-Color Mode Select
	lda #$40
	sta $D018                          // Memory Control Register
	sta $12
	ldy #$08
	lda $3427
	bpl L_BRS_8BB6_8BB2
	ldy #$00

L_BRS_8BB6_8BB2:

	sty $D418                          // Select Filter Mode and Volume
	lda #$81
	sta $D412                          // Voice 3: Control Register
	lda #$4F
	sta $D413                          // Voice 3: Attack / Decay Cycle Control
	sta $D414                          // Voice 3: Sustain / Release Cycle Control
	ldy #$03
	lda $341D
	and #$0F
	sta $341D
	sta $03
	lsr
	sta $02
	asl $03
	lda #$F0
	sec
	sbc $03
	sta $226D

L_BRS_8BDF_8BF4:

	lda $8D45,Y
	sec
	sbc $02
	bcs L_BRS_8BE9_8BE5
	lda #$01

L_BRS_8BE9_8BE5:

	bne L_BRS_8BED_8BE9
	lda #$01

L_BRS_8BED_8BE9:

	sta $3421,Y
	sta $3428,Y
	dey
	bpl L_BRS_8BDF_8BF4
	lda #$28
	sta $F1
	lsr $02
	lda $02
	cmp #$06
	bcc L_BRS_8C06_8C00
	lda #$06
	sta $02

L_BRS_8C06_8C00:

	lda #$00
	sta $342E
	lda #$01
	sta $342F
	sed

L_JMP_8C11_8C26:

	dec $02
	bmi L_BRS_8C29_8C13
	lda $342E
	clc
	adc #$50
	sta $342E
	lda $342F
	adc #$00
	sta $342F
	jmp L_JMP_8C11_8C26

L_BRS_8C29_8C13:

	cld
	lda $3420
	beq L_BRS_8C36_8C2D
	lda $341D
	and #$01
	bne L_BRS_8C3B_8C34

L_BRS_8C36_8C2D:

	lda #$C0
	sta $3420

L_BRS_8C3B_8C34:

	lda #$0A
	sta $3425
	sta $342C
	lda #$04
	sta $E7
	lda #$09
	sta $0316			// BRK vector
	lda #$80
	sta $0317
	lda $8002
	sta $0318			// NMI vector
	lda $8003
	sta $0319
	ldx #$0C
	lda #$FF

L_BRS_8C61_8C65:

	sta $340C,X
	dex
	bpl L_BRS_8C61_8C65
	jsr L_JSR_8142_8C67
	jsr L_JSR_81FF_8C6A
	lda #$01
	jsr $AADD
	lda #$79
	sta $2000,X
	lda #$01
	jsr $AADD
	lda #$77
	sta $2000,X
	lda #$60
	sta $2030,X
	sta $2031,X
	lda $341D
	and #$03
	cmp #$01
	bne L_BRS_8C9E_8C90
	lda #$6B
	sta $2051,X
	lda #$25
	sta $2021,X
	bne L_BRS_8CA8_8C9C

L_BRS_8C9E_8C90:

	lda #$52
	sta $2051,X
	lda #$3E
	sta $2021,X

L_BRS_8CA8_8C9C:

	lda #$92
	sta $2050,X
	lda #$06
	sta $05
	lda #$60
	sta $06
	lda #$1F
	sta $07
	lda #$2D
	sta $08

L_BRS_8CBD_8CDA:

	lda #$00
	jsr $AADD
	lda $06
	sta $2000,X
	inc $06
	lda $07
	sta $2030,X
	lda $08
	sta $2050,X
	clc
	adc #$15
	sta $08
	dec $05
	bne L_BRS_8CBD_8CDA
	lda #$05
	sta $2115,X
	lda #$02
	sta $2110,X
	jsr L_JSR_85B7_8CE6
	lda #$10
	sta $3426
	sta $342D
	lda #$03
	bit $341D
	bne L_BRS_8CFB_8CF6
	sta $3430

L_BRS_8CFB_8CF6:

	rts


	.byte $01,$04,$45,$01,$02,$03,$04,$01
	.byte $01,$12,$03,$18,$01,$12,$01,$02
	.byte $05,$57,$03,$05,$03,$06,$07,$0E
	.byte $08,$83,$08,$04,$09,$07,$03,$0A
	.byte $00,$10,$01,$08,$03,$03,$06,$67
	.byte $08,$04,$09,$05,$03,$0B,$0E,$08
	.byte $83,$08,$04,$09,$07,$03,$0A,$00
	.byte $11,$01,$08,$03,$05,$02,$07,$00
	.byte $00,$0C,$0D,$00,$0B,$0E,$0F,$0A
	.byte $03,$04,$60,$20,$0A

L_JSR_8D49_85F0:
L_JSR_8D49_8ABB:

	ldx #$0D

L_BRS_8D4B_8D51:

	lda #$00
	sta $2000,X
	dex
	bpl L_BRS_8D4B_8D51
	lda #$05
	sta $05

L_BRS_8D57_8DA9:

	lda #$00
	jsr $AADD
	ldy $05
	lda $8DD5,Y
	sta $2030,X
	lda #$01
	sta $2040,X
	lda $8DDB,Y
	sta $2050,X
	lda $8DE7,Y
	sta $2020,X
	lda $8DED,Y
	sta $2160,X
	lda $8DF3,Y
	sta $2150,X
	lda #$03
	sta $2110,X
	lda #$0B
	sta $2010,X
	lda $AC26
	sta $20B0,X
	lda $AC27
	sta $20C0,X
	lda #$01
	sta $20D0,X
	lda $8DE1,Y
	sta $2000,X
	lda #$01
	sta $2140,X
	dec $05
	bpl L_BRS_8D57_8DA9
	lda #$03
	sta $2018
	lda #$07
	sta $2118
	lda #$06
	sta $226A
	lda #$03
	sta $226D
	lda #$01
	sta $226F
	lda #$03
	sta $341B
	ora $341D
	sta $341D
	lda #$00
	sta $2268
	rts

// $8DD5
	.byte $70,$70,$6E,$86,$8E,$70
// $8DDB	
	.byte $4F,$40,$55,$57,$60,$6A
// $8DE1	
	.byte $8F,$85,$86,$87,$88,$89
// $8DE7	
	.byte $1B,$2A,$15,$13,$0A,$00
// $8DED	
	.byte $08,$18,$18,$10,$10,$16
// $8DF3	
	.byte $08,$15,$15,$13,$0A,$04
//	.byte $70,$70,$6E,$86,$8E,$70,$4F,$40
//	.byte $55,$57,$60,$6A,$8F,$85,$86,$87
//	.byte $88,$89,$1B,$2A,$15,$13,$0A,$00
//	.byte $08,$18,$18,$10,$10,$16,$08,$15
//	.byte $15,$13,$0A,$04,$AD,$1D,$34,$29
//	.byte $03,$C9,$01,$D0,$03,$4C,$05,$8E 
// the next five lines are, possibly, not used

	lda $341D
	and #$03
	cmp #$01
	bne L_BRS_8E05_8E00
	jmp L_JMP_8E05_8E02

L_BRS_8E05_8E00:
L_JMP_8E05_8E02:

	lda $2268
	beq L_BRS_8E0D_8E08
	lda #$1F
	rts

L_BRS_8E0D_8E08:

	lda $87,X
	ora $88,X
	beq L_BRS_8E6A_8E11
	lda $51,X
	ora $52,X
	beq L_BRS_8E46_8E17

L_BRS_8E19_8E91:

	lda ($51,X)
	inc $51,X
	bne L_BRS_8E21_8E1D
	inc $52,X

L_BRS_8E21_8E1D:

	dec $88,X
	beq L_BRS_8E26_8E23

L_BRS_8E25_8E28:

	rts

L_BRS_8E26_8E23:

	ldy $87,X
	beq L_BRS_8E25_8E28
	dec $87,X
	bne L_BRS_8E37_8E2C
	ldy $51,X
	sty $1B,X
	ldy $52,X
	sty $1C,X
	rts

L_BRS_8E37_8E2C:

	pha
	lda $1B,X
	sta $51,X
	lda $1C,X
	sta $52,X
	lda #$02
	sta $88,X
	pla
	rts

L_BRS_8E46_8E17:
L_BRS_8E46_8EC1:

	lda ($1B,X)
	ldy $88,X
	beq L_BRS_8E55_8E4A
	inc $1B,X
	bne L_BRS_8E52_8E4E
	inc $1C,X

L_BRS_8E52_8E4E:

	dec $88,X
	rts

L_BRS_8E55_8E4A:

	dec $87,X
	bne L_BRS_8E5F_8E57
	inc $1B,X
	bne L_BRS_8E5F_8E5B
	inc $1C,X

L_BRS_8E5F_8E57:
L_BRS_8E5F_8E5B:

	rts

L_BRS_8E60_8E6C:

	lda $BE9E,X
	sta $1B,X
	lda $BE9F,X
	sta $1C,X

L_BRS_8E6A_8E11:

	lda ($1B,X)
	beq L_BRS_8E60_8E6C
	asl
	bcc L_BRS_8EAD_8E6F
	bpl L_BRS_8E93_8E71
	and #$7E
	tay
	lda $A59B,Y
	sta $51,X
	lda $A59C,Y
	sta $52,X
	lda ($51,X)
	sta $88,X
	inc $51,X
	bne L_BRS_8E8A_8E86
	inc $52,X

L_BRS_8E8A_8E86:

	inc $1B,X
	bne L_BRS_8E90_8E8C
	inc $1C,X

L_BRS_8E90_8E8C:
L_BRS_8E90_8EAB:

	clc
	bcc L_BRS_8E19_8E91

L_BRS_8E93_8E71:

	lsr
	and #$3F
	sta $87,X
	inc $1B,X
	bne L_BRS_8E9E_8E9A
	inc $1C,X

L_BRS_8E9E_8E9A:

	lda #$02
	sta $88,X
	lda $1B,X
	sta $51,X
	lda $1C,X
	sta $52,X
	clc
	bcc L_BRS_8E90_8EAB

L_BRS_8EAD_8E6F:

	bpl L_BRS_8EC3_8EAD
	lsr
	and #$3F
	sta $87,X

L_BRS_8EB4_8EC9:

	inc $1B,X
	bne L_BRS_8EBA_8EB6
	inc $1C,X

L_BRS_8EBA_8EB6:

	lda #$00
	sta $51,X
	sta $52,X
	clc
	bcc L_BRS_8E46_8EC1

L_BRS_8EC3_8EAD:

	lsr
	and #$3F
	sta $88,X
	clc
	bcc L_BRS_8EB4_8EC9

L_JSR_8ECB_8622:

	lda #$9E
	ldy #$BE
	bne L_BRS_8EDB_8ECF
	lda #$2F
	ldy #$A5
	bne L_BRS_8EDB_8ED5
	lda #$65
	ldy #$A5

L_BRS_8EDB_8ECF:
L_BRS_8EDB_8ED5:

	sta $03
	sty $04
	ldy #$36

L_BRS_8EE1_8EEC:

	lda ($03),Y
	sta $001B,Y
	lda #$00
	sta $0087,Y
	dey
	bpl L_BRS_8EE1_8EEC
	sta $341C
	sta $2268
	sta $342F
	rts
	sta $06

L_BRS_8EFA_8F22:

	lda $06
	cmp #$28
	bcs L_BRS_8F0F_8EFE
	ror
	bcs L_BRS_8F09_8F01
	jsr L_JSR_87EA_8F03
	clc
	bcc L_BRS_8F20_8F07

L_BRS_8F09_8F01:

	jsr L_JSR_87D5_8F09
	clc
	bcc L_BRS_8F20_8F0D

L_BRS_8F0F_8EFE:

	jsr L_JSR_8804_8F0F
	lda $06
	ror
	bcs L_BRS_8F1D_8F15
	jsr L_JSR_89C8_8F17
	clc
	bcc L_BRS_8F20_8F1B

L_BRS_8F1D_8F15:

	jsr L_JSR_8A03_8F1D

L_BRS_8F20_8F07:
L_BRS_8F20_8F0D:
L_BRS_8F20_8F1B:

	dec $06
	bne L_BRS_8EFA_8F22
	rts
	lda $06
	asl
	adc $A000                          // Restart Vectors
	sta $07
	lda #$00
	adc $A001
	sta $08
	ldy #$00
	lda ($07),Y
	sta $09
	sta $0C
	iny
	lda ($07),Y
	sta $08
	dey
	inc $06
	lda #$15
	sta $0B

L_BRS_8F48_8F74:

	lda $08
	sta $07
	lda #$03
	sta $0A
	dec $09

L_BRS_8F52_8F70:

	lda #$00
	ldx $09
	bpl L_BRS_8F5A_8F56
	sta $07

L_BRS_8F5A_8F56:

	dec $07
	bmi L_BRS_8F66_8F5C
	lda ($02),Y
	inc $02
	bne L_BRS_8F66_8F62
	inc $03

L_BRS_8F66_8F5C:
L_BRS_8F66_8F62:

	sta ($04),Y
	inc $04
	bne L_BRS_8F6E_8F6A
	inc $05

L_BRS_8F6E_8F6A:

	dec $0A
	bne L_BRS_8F52_8F70
	dec $0B
	bne L_BRS_8F48_8F74
	lda $0C
	sta ($04),Y
	inc $04
	bne L_BRS_8F80_8F7C
	inc $05

L_BRS_8F80_8F7C:

	rts


	.byte $02,$6F,$70,$50,$3D,$46,$1F,$F5
	.byte $02,$83,$84,$83,$74,$75,$82,$6F
	.byte $70,$4A,$00,$DD,$C7,$44,$00,$02
	.byte $83,$84,$83,$74,$75,$01,$F0,$44
	.byte $00,$01,$21,$4A,$00,$82,$21,$22
	.byte $46,$00,$02,$83,$84,$83,$74,$75
	.byte $01,$F0,$5B,$00,$03,$83,$84,$74
	.byte $E8,$4C,$00,$82,$21,$00,$4D,$00
	.byte $05,$83,$84,$74,$75,$74,$E8,$48
	.byte $00,$01,$3E,$44,$00,$83,$21,$22
	.byte $48,$00,$02,$83,$84,$82,$74,$75
	.byte $01,$74,$E8,$4C,$00,$01,$CE,$48
	.byte $00,$84,$26,$27,$02,$00,$00,$82
	.byte $83,$84,$44,$00,$82,$83,$84,$4C
	.byte $00,$44,$1F,$01,$74,$E8,$02,$28
	.byte $81,$CC,$01,$75,$F1,$02,$71
