// disassembly of the ZAXXON.CRT for Commodore64. By Mike Loewen (mikroman)

* = $8000 "8000 cartridge slot"
	.word coldstart
	.word warmstart
	.byte $C3,$C2,$CD,$38,$30	// crt signature bytes

L_JMP_8009_800A:
L_JMP_8009_900A:

	sei
	jmp L_JMP_8009_800A

coldstart:	// cold start area

	sei
	lda #$00
	sta $D016                          // Control Register 2
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
L_JMP_8029_A956:
L_JMP_8029_AA77:
L_JMP_8029_B7B8:

	sei
	cld
	lda #$00
	sta $D011                          // Control Register 1
	jsr L_JSR_B668_8030

L_JMP_8033_A953:

	sei
	ldx #$FF
	txs
	jsr L_JSR_8B7E_8037

L_JMP_803A_805E:
L_JMP_803A_8B51:
L_JMP_803A_905E:
L_JMP_803A_9B51:
L_JMP_803A_A5E4:

	jsr L_JSR_A961_803A
	jsr L_JSR_B47E_803D
	jsr L_JSR_B102_8040
	jsr L_JSR_B16D_8043
	jsr L_JSR_A000_8046
	jsr L_JSR_B016_8049
	jsr L_JSR_AF16_804C
	jsr L_JSR_8061_804F
	jsr L_JSR_8AA8_8052
	jsr L_JSR_AD71_8055
	jsr L_JSR_AB6D_8058
	jsr L_JSR_A740_805B
	jmp L_JMP_803A_805E

L_JSR_8061_804F:
L_JSR_8061_904F:

	lda $2269
	bmi L_BRS_8079_8064
	dec $342D
	bne L_BRS_8079_8069
	lda $3426
	sta $342D
	dec $3420
	bne L_BRS_8079_8074
	jmp L_JMP_A85B_8076

L_BRS_8079_8064:
L_BRS_8079_8069:
L_BRS_8079_8074:

	rts

L_JSR_807A_B020:

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
L_JSR_80F4_90DB:
L_JSR_80F4_A3E8:
L_JSR_80F4_A4F2:

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
L_JSR_8142_9C67:
L_JSR_8142_B79E:

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
L_JMP_8162_9146:

	iny
	iny
	inx
	cpx #$06
	bne L_BRS_8149_8167

L_BRS_8169_814C:

	rts

L_JSR_816A_85C8:
L_JSR_816A_95C8:

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
L_JSR_81B0_919E:
L_JSR_81B0_91A9:

	sta ($04),Y
	inc $04
	bne L_BRS_81B9_81B4
	inc $05
	dex

L_BRS_81B9_81B4:

	rts

L_JSR_81BA_8026:
L_JSR_81BA_9026:

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
L_JSR_81E4_9220:
L_JSR_81E4_922B:
L_JSR_81E4_9442:
L_JSR_81E4_944B:
L_JSR_81E4_9456:
L_JSR_81E4_945D:
L_JSR_81E4_A890:
L_JSR_81E4_A89F:

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
L_JSR_81F1_99E1:
L_JSR_81F1_99F0:
L_JSR_81F1_9A20:

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
L_JSR_81FF_9B55:
L_JSR_81FF_9C6A:

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
L_JSR_820A_91BF:
L_JSR_820A_9AC6:
L_JSR_820A_9B0A:
L_JSR_820A_A5C7:
L_JSR_820A_A91C:
L_JSR_820A_B675:
L_JSR_820A_B7CD:

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
L_JSR_8246_91C4:
L_JSR_8246_9ACB:
L_JSR_8246_9B21:
L_JSR_8246_A5CC:
L_JSR_8246_A921:
L_JSR_8246_B67A:
L_JSR_8246_B67F:
L_JSR_8246_B684:
L_JSR_8246_B689:
L_JSR_8246_B7D2:

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
L_JMP_825F_928A:

	jsr L_JSR_8294_825F

L_JMP_8262_8276:
L_JMP_8262_9276:

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
L_JSR_828D_9270:

	inc $02
	bne L_BRS_829A_828F
	inc $03
	rts

L_JSR_8294_8258:
L_JSR_8294_825F:
L_JSR_8294_8273:
L_JSR_8294_827A:
L_JSR_8294_9258:
L_JSR_8294_925F:
L_JSR_8294_9273:
L_JSR_8294_927A:

	inc $04
	bne L_BRS_829A_8296
	inc $05

L_BRS_829A_828F:
L_BRS_829A_8296:

	rts

L_JSR_829B_81C9:
L_JSR_829B_8AD0:
L_JSR_829B_8B36:
L_JSR_829B_91C9:
L_JSR_829B_9AD0:
L_JSR_829B_9B36:
L_JSR_829B_A5D1:
L_JSR_829B_A92F:
L_JSR_829B_B6C5:
L_JSR_829B_B7E0:

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
L_JSR_8308_92EB:
L_JSR_8308_92FC:

	jsr L_JSR_A961_8308
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
L_JSR_842E_9AD3:
L_JSR_842E_9B46:
L_JSR_842E_9B81:
L_JSR_842E_A5DE:

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
L_JMP_846C_949E:

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
	jsr L_JSR_9F25_84F9
	jsr L_JSR_9F25_84FC
	ldx #$C0

L_JMP_8501_850F:
L_JMP_8501_950F:

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
	jsr L_JSR_9F25_851A
	jsr L_JSR_9F25_851D
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
L_JMP_8540_953A:

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

	jsr L_JSR_9F25_8565
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
	jsr L_JSR_B1C4_85B3
	rts

L_JSR_85B7_8CE6:
L_JSR_85B7_9CE6:

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
	jsr L_JSR_9ED7_85D6
	lda $341D
	and #$03
	sta $341B
	beq L_BRS_85F6_85E1
	cmp #$01
	beq L_BRS_8611_85E5
	cmp #$02
	beq L_BRS_85F9_85E9
	lda #$FC
	jsr L_JSR_9EF8_85ED
	jsr L_JSR_8D49_85F0
	jmp L_JMP_8602_85F3

L_BRS_85F6_85E1:

	jsr L_JSR_9ED1_85F6

L_BRS_85F9_85E9:

	lda $06
	beq L_BRS_8600_85FB
	jsr L_JSR_9EF8_85FD

L_BRS_8600_85FB:

	dec $13

L_JMP_8602_85F3:
L_JMP_8602_95F3:

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
	jsr L_JSR_9EF8_8627
	dec $13

L_JMP_862C_860E:
L_JMP_862C_960E:

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
L_JMP_87CA_96B4:
L_JMP_87CA_96C1:
L_JMP_87CA_970E:
L_JMP_87CA_97C7:
L_JMP_87CA_98CF:

	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)

L_JMP_87CF_86A5:
L_JMP_87CF_86EA:
L_JMP_87CF_86F0:
L_JMP_87CF_86F6:
L_JMP_87CF_87A3:
L_JMP_87CF_96A5:
L_JMP_87CF_96EA:
L_JMP_87CF_96F0:
L_JMP_87CF_96F6:
L_JMP_87CF_97A3:

	pla
	tay
	pla
	tax
	pla
	rti

L_JSR_87D5_86F3:
L_JSR_87D5_8F09:
L_JSR_87D5_96F3:
L_JSR_87D5_9F09:

	jsr L_JSR_8804_87D5
	bne L_BRS_87E0_87D8
	jsr $0800
	jmp L_JMP_87E3_87DD

L_BRS_87E0_87D8:

	jsr $0803

L_JMP_87E3_87DD:
L_JMP_87E3_97DD:

	jsr $080C
	jsr L_JSR_8A03_87E6
	rts

L_JSR_87EA_86ED:
L_JSR_87EA_8F03:
L_JSR_87EA_96ED:
L_JSR_87EA_9F03:

	jsr L_JSR_8804_87EA
	bne L_BRS_87F5_87ED
	jsr $0806
	jmp L_JMP_87F8_87F2

L_BRS_87F5_87ED:

	jsr $0809

L_JMP_87F8_87F2:
L_JMP_87F8_97F2:

	jsr $080F
	lda #$00
	sta $300F
	jsr L_JSR_89C8_8800
	rts

L_JSR_8804_87D5:
L_JSR_8804_87EA:
L_JSR_8804_8F0F:
L_JSR_8804_97D5:
L_JSR_8804_97EA:
L_JSR_8804_9F0F:

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
L_JSR_8846_96A9:

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
L_JSR_88C9_969F:

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
L_JMP_8917_9930:
L_JMP_8917_9936:

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
L_JMP_8939_9920:
L_JMP_8939_9945:

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
L_JSR_8965_98F5:
L_JSR_8965_98FA:
L_JSR_8965_9908:
L_JSR_8965_9933:
L_JSR_8965_9942:

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
L_JMP_89AA_99A6:

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
L_JSR_89C8_9800:
L_JSR_89C8_9F17:

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

	jsr L_JSR_9DF9_89DC
	ldy $19
	jsr L_JSR_81F1_89E1
	ldy $19
	sta $3010,Y
	inc $19
	jsr L_JSR_9DF9_89EB
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
L_JSR_8A03_97E6:
L_JMP_8A03_9A00:
L_JSR_8A03_9F1D:

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
L_JMP_8A1B_9A45:

	jsr L_JSR_9DF9_8A1B
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
L_JSR_8A49_96A2:

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
L_JMP_8A53_9A7C:
L_JMP_8A53_9A92:
L_JMP_8A53_9A9C:

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
L_JSR_8A9F_9A70:
L_JSR_8A9F_9A76:
L_JSR_8A9F_B32F:
L_JSR_8A9F_B36D:
L_JSR_8A9F_B372:

	lda ($C1,X)
	inc $C1,X
	bne L_BRS_8AA7_8AA3
	inc $C2,X

L_BRS_8AA7_8AA3:

	rts

L_JSR_8AA8_8052:
L_JSR_8AA8_9052:

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
L_JMP_8AEC_9B01:

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
L_JMP_8B1A_9B15:

	ldx #$00
	jsr L_JSR_B715_8B1C
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
L_JSR_8B54_9ADA:
L_JSR_8B54_9B49:
L_JSR_8B54_A5E1:

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
L_JSR_8B7E_9037:

	jsr L_JSR_B7A7_8B7E
	jsr L_JSR_842E_8B81

L_JMP_8B84_8B7B:
L_JMP_8B84_9B7B:

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
L_JMP_8C11_9C26:

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
	sta $0316
	lda #$80
	sta $0317
	lda $8002
	sta $0318
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
	jsr L_JSR_AADD_8C6F
	lda #$79
	sta $2000,X
	lda #$01
	jsr L_JSR_AADD_8C79
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
	jsr L_JSR_AADD_8CBF
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
L_JSR_8D49_95F0:
L_JSR_8D49_9ABB:

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
	jsr L_JSR_AADD_8D59
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


	lda $341D
	and #$03
	cmp #$01
	bne L_BRS_8E05_8E00
	jmp L_JMP_8E05_8E02

L_BRS_8E05_8E00:
L_JMP_8E05_8E02:
L_JMP_8E05_9E02:

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
L_JSR_8ECB_9622:

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

// 8F82

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

* = $9000 "mirrored block from 8000"

.fill $0DF9,$A5     // code necessary in this bank follows

L_JSR_9DF9_89DC:
L_JSR_9DF9_89EB:
L_JSR_9DF9_8A1B:
L_JSR_9DF9_99DC:
L_JSR_9DF9_99EB:
L_JSR_9DF9_9A1B:	// banked

	lda $341D
	and #$03
	cmp #$01
	bne L_BRS_9E05_9E00
	jmp L_JMP_8E05_9E02

L_BRS_9E05_9E00:

	lda $2268
	beq L_BRS_9E0D_9E08
	lda #$1F
	rts

L_BRS_9E0D_9E08:

	lda $87,X
	ora $88,X
	beq L_BRS_9E6A_9E11
	lda $51,X
	ora $52,X
	beq L_BRS_9E46_9E17

L_BRS_9E19_9E91:

	lda ($51,X)
	inc $51,X
	bne L_BRS_9E21_9E1D
	inc $52,X

L_BRS_9E21_9E1D:

	dec $88,X
	beq L_BRS_9E26_9E23

L_BRS_9E25_9E28:

	rts

L_BRS_9E26_9E23:

	ldy $87,X
	beq L_BRS_9E25_9E28
	dec $87,X
	bne L_BRS_9E37_9E2C
	ldy $51,X
	sty $1B,X
	ldy $52,X
	sty $1C,X
	rts

L_BRS_9E37_9E2C:

	pha
	lda $1B,X
	sta $51,X
	lda $1C,X
	sta $52,X
	lda #$02
	sta $88,X
	pla
	rts

L_BRS_9E46_9E17:
L_BRS_9E46_9EC1:

	lda ($1B,X)
	ldy $88,X
	beq L_BRS_9E55_9E4A
	inc $1B,X
	bne L_BRS_9E52_9E4E
	inc $1C,X

L_BRS_9E52_9E4E:

	dec $88,X
	rts

L_BRS_9E55_9E4A:

	dec $87,X
	bne L_BRS_9E5F_9E57
	inc $1B,X
	bne L_BRS_9E5F_9E5B
	inc $1C,X

L_BRS_9E5F_9E57:
L_BRS_9E5F_9E5B:

	rts

L_BRS_9E60_9E6C:

	lda $BE9E,X
	sta $1B,X
	lda $BE9F,X
	sta $1C,X

L_BRS_9E6A_9E11:

	lda ($1B,X)
	beq L_BRS_9E60_9E6C
	asl
	bcc L_BRS_9EAD_9E6F
	bpl L_BRS_9E93_9E71
	and #$7E
	tay
	lda $A59B,Y
	sta $51,X
	lda $A59C,Y
	sta $52,X
	lda ($51,X)
	sta $88,X
	inc $51,X
	bne L_BRS_9E8A_9E86
	inc $52,X

L_BRS_9E8A_9E86:

	inc $1B,X
	bne L_BRS_9E90_9E8C
	inc $1C,X

L_BRS_9E90_9E8C:
L_BRS_9E90_9EAB:

	clc
	bcc L_BRS_9E19_9E91

L_BRS_9E93_9E71:

	lsr
	and #$3F
	sta $87,X
	inc $1B,X
	bne L_BRS_9E9E_9E9A
	inc $1C,X

L_BRS_9E9E_9E9A:

	lda #$02
	sta $88,X
	lda $1B,X
	sta $51,X
	lda $1C,X
	sta $52,X
	clc
	bcc L_BRS_9E90_9EAB

L_BRS_9EAD_9E6F:

	bpl L_BRS_9EC3_9EAD
	lsr
	and #$3F
	sta $87,X

L_BRS_9EB4_9EC9:

	inc $1B,X
	bne L_BRS_9EBA_9EB6
	inc $1C,X

L_BRS_9EBA_9EB6:

	lda #$00
	sta $51,X
	sta $52,X
	clc
	bcc L_BRS_9E46_9EC1

L_BRS_9EC3_9EAD:

	lsr
	and #$3F
	sta $88,X
	clc
	bcc L_BRS_9EB4_9EC9
	lda #$9E
	ldy #$BE
	bne L_BRS_9EDB_9ECF

L_JSR_9ED1_85F6:
L_JSR_9ED1_95F6:

	lda #$2F
	ldy #$A5
	bne L_BRS_9EDB_9ED5

L_JSR_9ED7_85D6:
L_JSR_9ED7_95D6:

	lda #$65
	ldy #$A5

L_BRS_9EDB_9ECF:
L_BRS_9EDB_9ED5:

	sta $03
	sty $04
	ldy #$36

L_BRS_9EE1_9EEC:

	lda ($03),Y
	sta $001B,Y
	lda #$00
	sta $0087,Y
	dey
	bpl L_BRS_9EE1_9EEC
	sta $341C
	sta $2268
	sta $342F
	rts

L_JSR_9EF8_85ED:
L_JSR_9EF8_85FD:
L_JSR_9EF8_8627:
L_JSR_9EF8_95ED:
L_JSR_9EF8_95FD:
L_JSR_9EF8_9627:

	sta $06

L_BRS_9EFA_9F22:

	lda $06
	cmp #$28
	bcs L_BRS_9F0F_9EFE
	ror
	bcs L_BRS_9F09_9F01
	jsr L_JSR_87EA_9F03
	clc
	bcc L_BRS_9F20_9F07

L_BRS_9F09_9F01:

	jsr L_JSR_87D5_9F09
	clc
	bcc L_BRS_9F20_9F0D

L_BRS_9F0F_9EFE:

	jsr L_JSR_8804_9F0F
	lda $06
	ror
	bcs L_BRS_9F1D_9F15
	jsr L_JSR_89C8_9F17
	clc
	bcc L_BRS_9F20_9F1B

L_BRS_9F1D_9F15:

	jsr L_JSR_8A03_9F1D

L_BRS_9F20_9F07:
L_BRS_9F20_9F0D:
L_BRS_9F20_9F1B:

	dec $06
	bne L_BRS_9EFA_9F22
	rts

L_JSR_9F25_84F9:
L_JSR_9F25_84FC:
L_JSR_9F25_851A:
L_JSR_9F25_851D:
L_JSR_9F25_8565:
L_JSR_9F25_94F9:
L_JSR_9F25_94FC:
L_JSR_9F25_951A:
L_JSR_9F25_951D:
L_JSR_9F25_9565:

	lda $06
	asl
	adc $A000                         // Restart Vectors
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

L_BRS_9F48_9F74:

	lda $08
	sta $07
	lda #$03
	sta $0A
	dec $09

L_BRS_9F52_9F70:

	lda #$00
	ldx $09
	bpl L_BRS_9F5A_9F56
	sta $07

L_BRS_9F5A_9F56:

	dec $07
	bmi L_BRS_9F66_9F5C
	lda ($02),Y
	inc $02
	bne L_BRS_9F66_9F62
	inc $03

L_BRS_9F66_9F5C:
L_BRS_9F66_9F62:

	sta ($04),Y
	inc $04
	bne L_BRS_9F6E_9F6A
	inc $05

L_BRS_9F6E_9F6A:

	dec $0A
	bne L_BRS_9F52_9F70
	dec $0B
	bne L_BRS_9F48_9F74
	lda $0C
	sta ($04),Y
	inc $04
	bne L_BRS_9F80_9F7C
	inc $05

L_BRS_9F80_9F7C:

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

* = $A000 "ROM bank 0" 	// a read access from $9000-$9FFF will bank in the alternate $A000 ROM

L_JSR_A000_8046:
L_JSR_A000_9046:
L_JSR_A000_A8FE:

	ldx #$0F

L_BRS_A002_A008:

	lda $2000,X
	bne L_BRS_A00B_A005

L_JMP_A007_A01A:
L_JMP_A007_A10F:

	dex
	bpl L_BRS_A002_A008
	rts

L_BRS_A00B_A005:

	lda $2070,X
	beq L_BRS_A01D_A00E
	dec $2070,X
	bne L_BRS_A01D_A013
	lda #$00
	sta $2000,X
	jmp L_JMP_A007_A01A

L_BRS_A01D_A00E:
L_BRS_A01D_A013:

	lda #$00
	sta $05
	sta $06
	lda $20E0,X
	sta $02
	and #$F0
	sta $03
	lda $2140,X
	clc
	adc $02
	sta $20E0,X
	sec
	sbc $03
	lsr
	lsr
	lsr
	lsr
	sta $2270
	bne L_BRS_A044_A03F
	jmp L_JMP_A112_A041

L_BRS_A044_A03F:

	sta $03
	sta $04
	asl $04
	lda $2130,X
	and #$7F
	tay
	lda $A72A,Y
	sta $02
	lsr $02
	bcs L_BRS_A060_A057
	clc
	lda $06
	adc $04
	sta $06

L_BRS_A060_A057:

	lsr $02
	bcs L_BRS_A06B_A062
	sec
	lda $06
	sbc $04
	sta $06

L_BRS_A06B_A062:

	lsr $02
	bcs L_BRS_A076_A06D
	clc
	lda $05
	adc $04
	sta $05

L_BRS_A076_A06D:

	lsr $02
	bcs L_BRS_A081_A078
	sec
	lda $05
	sbc $04
	sta $05

L_BRS_A081_A078:

	lsr $02
	bcs L_BRS_A08C_A083
	clc
	lda $06
	adc $03
	sta $06

L_BRS_A08C_A083:

	lsr $02
	bcs L_BRS_A097_A08E
	sec
	lda $06
	sbc $03
	sta $06

L_BRS_A097_A08E:

	lsr $02
	bcs L_BRS_A09E_A099
	inc $2020,X

L_BRS_A09E_A099:

	lsr $02
	bcs L_BRS_A0A5_A0A0
	dec $2020,X

L_BRS_A0A5_A0A0:

	lda $06
	bpl L_BRS_A0BF_A0A7
	eor #$FF
	sta $06
	inc $06
	sei
	sec
	lda $2050,X
	sbc $06
	sta $2050,X
	cli
	bcs L_BRS_A0CA_A0BA
	jmp L_JMP_A10A_A0BC

L_BRS_A0BF_A0A7:

	clc
	sei
	adc $2050,X
	sta $2050,X
	cli
	bcs L_BRS_A10A_A0C8

L_BRS_A0CA_A0BA:

	lda $05
	bpl L_BRS_A0EC_A0CC
	eor #$FF
	sta $05
	inc $05
	sec
	sei
	lda $2030,X
	sbc $05
	sta $2030,X
	lda $2040,X
	sbc #$00
	sta $2040,X
	cli
	bcs L_BRS_A112_A0E7
	jmp L_JMP_A10A_A0E9

L_BRS_A0EC_A0CC:

	clc
	sei
	adc $2030,X
	sta $2030,X
	lda $2040,X
	adc #$00
	sta $2040,X
	cli
	beq L_BRS_A112_A0FD
	cmp #$02
	bcs L_BRS_A10A_A101
	lda $2030,X
	cmp #$90
	bcc L_BRS_A112_A108

L_JMP_A10A_A0BC:
L_BRS_A10A_A0C8:
L_JMP_A10A_A0E9:
L_BRS_A10A_A101:

	lda #$00
	sta $2000,X
	jmp L_JMP_A007_A10F

L_JMP_A112_A041:
L_BRS_A112_A0E7:
L_BRS_A112_A0FD:
L_BRS_A112_A108:

	lda $2010,X
	asl
	tay
	lda #$A0
	pha
	lda #$06
	pha
	lda $A127,Y
	pha
	lda $A126,Y
	pha
	rts
	.byte $24,$A1,$24,$A1,$70,$A2,$DF,$A1
	.byte $FD,$A2,$1E,$A7,$1E,$A7,$1E,$A7
	.byte $7B,$A6,$93,$A2,$EC,$A2,$3F,$A1
	.byte $84,$A1

L_JSR_A140_A231:
L_JSR_A140_A67C:

	lda $20B0,X
	sta $02
	lda $20C0,X
	sta $03
	ldy #$00
	lda ($02),Y
	cmp #$FF
	beq L_BRS_A17E_A150
	lda $2270
	beq L_BRS_A17C_A155
	lda $20D0,X
	sec
	sbc $2270
	sta $20D0,X
	bcs L_BRS_A17C_A161
	lda ($02),Y
	sta $2130,X
	iny
	lda ($02),Y
	sta $20D0,X
	clc
	lda $20B0,X
	adc #$02
	sta $20B0,X
	bcc L_BRS_A17C_A177
	inc $20C0,X

L_BRS_A17C_A155:
L_BRS_A17C_A161:
L_BRS_A17C_A177:

	clc
	rts

L_BRS_A17E_A150:

	lda #$04
	sta $2130,X
	sec
	rts
	dec $E9
	bne L_BRS_A1DE_A187
	lda #$05
	sta $E9
	dec $20F0,X
	bne L_BRS_A1BD_A190
	sec
	sei
	lda $2050,X
	sbc #$30
	sta $2050,X
	bcc L_BRS_A1AD_A19C
	lda $2030,X
	sbc #$60
	sta $2030,X
	bcs L_BRS_A1B4_A1A6
	dec $2040,X
	beq L_BRS_A1B4_A1AB

L_BRS_A1AD_A19C:
L_BRS_A1AD_A1C7:
L_BRS_A1AD_A1DC:

	cli
	lda #$00
	sta $2000,X
	rts

L_BRS_A1B4_A1A6:
L_BRS_A1B4_A1AB:

	cli
	lda #$05
	sta $20F0,X
	inc $EA
	rts

L_BRS_A1BD_A190:

	clc
	sei
	lda $2050,X
	adc #$0C
	sta $2050,X
	bcs L_BRS_A1AD_A1C7
	lda $2030,X
	adc #$18
	sta $2030,X
	bcc L_BRS_A1DE_A1D1
	inc $2040,X
	cli
	lda $2040,X
	cmp #$01
	bne L_BRS_A1AD_A1DC

L_BRS_A1DE_A187:
L_BRS_A1DE_A1D1:

	cli
	rts
	lda $2000,X
	cmp #$8F
	bcs L_BRS_A225_A1E5

L_JMP_A1E7_A254:

	lda $202F
	sta $2020,X
	lda $205F
	sec
	sbc #$08
	cmp $2050,X
	beq L_BRS_A203_A1F6
	bcs L_BRS_A1FE_A1F8
	lda #$09
	bne L_BRS_A200_A1FC

L_BRS_A1FE_A1F8:

	lda #$0C

L_BRS_A200_A1FC:

	sta $2130,X

L_BRS_A203_A1F6:
L_JMP_A203_A25A:

	dec $226F
	bne L_BRS_A224_A206
	lda #$14
	sta $226F
	lda $341B
	cmp #$03
	bne L_BRS_A21F_A212
	lda $2000,X
	cmp #$8C
	bne L_BRS_A21F_A219
	lda #$0A
	bne L_BRS_A221_A21D

L_BRS_A21F_A212:
L_BRS_A21F_A219:

	lda #$09

L_BRS_A221_A21D:

	jsr L_JSR_B313_A221

L_BRS_A224_A206:
L_BRS_A224_A262:
L_BRS_A224_A267:
L_BRS_A224_A26C:

	rts

L_BRS_A225_A1E5:

	php
	lda #$00
	sta $02

L_BRS_A22A_A22C:

	dec $02
	bne L_BRS_A22A_A22C
	plp
	bne L_BRS_A240_A22F
	jsr L_JSR_A140_A231
	bcc L_BRS_A25D_A234

L_JMP_A236_A26E:

	lda #$0A
	sta $2130,X
	lda #$06
	sta $2140,X

L_BRS_A240_A22F:

	inc $2000,X
	lda $2000,X
	cmp #$98
	bcc L_BRS_A257_A248
	lda #$98
	sta $2000,X
	lda #$10
	sta $2140,X
	jmp L_JMP_A1E7_A254

L_BRS_A257_A248:

	sta $2000,X
	jmp L_JMP_A203_A25A

L_BRS_A25D_A234:

	lda $D41B                          // Oscillator 3 Output
	and #$0F
	beq L_BRS_A224_A262
	dec $226E
	bne L_BRS_A224_A267
	dec $226D
	bne L_BRS_A224_A26C
	jmp L_JMP_A236_A26E
	lda $2000,X
	cmp #$66
	beq L_BRS_A27C_A276
	dec $2000,X

L_BRS_A27B_A281:

	rts

L_BRS_A27C_A276:

	lda $2020,X
	cmp #$46
	bcc L_BRS_A27B_A281
	jsr L_JSR_A2CA_A283
	ldy $2080,X
	lda #$00
	sta $2000,Y
	lda #$02
	sta $2110,X
	rts
	lda $2070,X
	beq L_BRS_A2A6_A297
	cmp #$01
	beq L_BRS_A2AA_A29B
	and #$02
	lsr
	eor $2000,X
	sta $2000,X

L_BRS_A2A6_A297:

	inc $2110,X
	rts

L_BRS_A2AA_A29B:

	lda #$00
	sta $2070,X
	clc
	sei
	lda $2030,X
	adc #$08
	sta $2030,X
	cli
	lda #$72
	sta $2000,X
	lda #$8D
	sta $2130,X
	lda #$08
	sta $2140,X
	rts

L_JSR_A2CA_A283:
L_JSR_A2CA_A595:
L_JSR_A2CA_A5F4:
L_JSR_A2CA_A618:
L_JSR_A2CA_A65E:
L_JSR_A2CA_A676:

	sty $09
	lda #$0A
	sta $2010,X
	lda #$73
	sta $2000,X
	lda #$80
	sta $2130,X
	lda #$00
	sta $2140,X
	lda #$0F
	sta $2070,X
	lda #$03
	jsr L_JSR_B313_A2E7
	ldy $09
	rts
	lda $2000,X
	cmp #$76
	bne L_BRS_A2FA_A2F2
	lda #$73
	sta $2000,X
	rts

L_BRS_A2FA_A2F2:

	inc $2000,X
	rts
	lda $2000,X
	cmp #$7C
	bne L_BRS_A34C_A303
	lda $2040,X
	beq L_BRS_A317_A308
	lda $2030,X
	cmp #$3A
	bcc L_BRS_A317_A30F
	lda #$00
	sta $2000,X
	rts

L_BRS_A317_A308:
L_BRS_A317_A30F:

	jsr L_JSR_ADE1_A317
	bne L_BRS_A320_A31A
	jsr L_JSR_A52E_A31C
	rts

L_BRS_A320_A31A:

	lda $0B
	bne L_BRS_A359_A322

L_JMP_A324_A579:

	lda #$73
	sta $2000,X
	lda #$07
	sta $2070,X
	lda #$80
	sta $2130,X
	lda #$00
	sta $2140,X
	lda #$07
	sta $2110,X
	lda $2050,X
	sec
	sbc #$0A
	sta $2050,X
	lda #$02
	jsr L_JSR_B313_A348
	rts

L_BRS_A34C_A303:

	lda $2070,X
	cmp #$03
	bcs L_BRS_A358_A351
	lda #$76
	sta $2000,X

L_BRS_A358_A351:

	rts

L_BRS_A359_A322:

	lda #$0A
	sta $2010,X
	lda #$73
	sta $2000,X
	lda #$80
	sta $2130,X
	lda #$00
	sta $2140,X
	lda #$1E
	sta $2070,X
	ldy $0B
	lda $A713,Y
	sta $04
	lda $02
	sec
	sbc #$08
	sta $02
	lda $03
	sbc #$00
	sta $03
	lda #$05
	sta $05

L_BRS_A38A_A38E:

	lda $10
	cmp #$03
	bcc L_BRS_A38A_A38E
	lda $341C
	sta $09
	lda $03
	and #$FB
	sta $03
	lda $12
	and #$10
	lsr
	lsr
	eor #$04
	ora $03
	sta $03

L_BRS_A3A7_A3C1:

	ldy #$08

L_BRS_A3A9_A3B0:

	lda ($02),Y
	cmp $04
	beq L_BRS_A3C6_A3AD
	dey
	bpl L_BRS_A3A9_A3B0
	lda $02
	clc
	adc #$28
	sta $02
	lda $03
	adc #$00
	sta $03
	dec $05
	bne L_BRS_A3A7_A3C1
	ldx $08
	rts

L_BRS_A3C6_A3AD:

	tya
	clc
	adc $02
	sta $02
	lda $03
	adc #$00
	sta $03
	lda $0B
	cmp #$06
	bne L_BRS_A3DB_A3D6
	jmp L_JMP_A4CC_A3D8

L_BRS_A3DB_A3D6:

	lda $02
	sec
	sbc #$78
	sta $02
	lda $03
	sbc #$00
	sta $03
	jsr L_JSR_80F4_A3E8
	ldx $08
	lda $05
	adc #$04
	sta $2050,X
	sei
	lda $06
	adc #$08
	sta $2030,X
	lda $07
	adc #$00
	sta $2040,X
	cli
	ldy #$03
	lda #$03
	sta $04
	ldx #$00

L_BRS_A40C_A422:

	lda #$03
	sta $05
	tya
	clc
	adc #$25
	tay

L_BRS_A415_A41E:

	lda $A70B,X
	sta ($02),Y
	iny
	inx
	dec $05
	bne L_BRS_A415_A41E
	dec $04
	bne L_BRS_A40C_A422
	ldx $0B
	cpx #$01
	beq L_BRS_A432_A428
	cpx #$02
	beq L_BRS_A432_A42C
	cpx #$04
	bne L_BRS_A43B_A430

L_BRS_A432_A428:
L_BRS_A432_A42C:

	lda #$00
	ldy #$02

L_BRS_A436_A439:

	sta ($02),Y
	dey
	bpl L_BRS_A436_A439

L_BRS_A43B_A430:

	ldy #$2B
	lda $A719,X

L_BRS_A440_A45B:

	sty $05
	sta $04
	and #$03
	beq L_BRS_A451_A446
	tax
	lda #$00

L_BRS_A44B_A44F:

	sta ($02),Y
	iny
	dex
	bne L_BRS_A44B_A44F

L_BRS_A451_A446:

	lda $05
	clc
	adc #$28
	tay
	lda $04
	lsr
	lsr
	bne L_BRS_A440_A45B
	lda $02
	sec
	sbc #$D8
	sta $02
	lda $03
	and #$FB
	sbc #$1F
	sta $03
	ldx #$1E

L_BRS_A46E_A475:

	lda $2208,X
	beq L_BRS_A479_A471
	dex
	dex
	bpl L_BRS_A46E_A475
	ldx #$00

L_BRS_A479_A471:

	lda #$05
	sta $2208,X
	lda $09
	sta $2209,X
	sta $2228,X
	lda $08
	sta $2229,X
	lda $02
	sta $2248,X
	lda $03
	sta $2249,X
	ldy $0B
	cpy #$01
	beq L_BRS_A4AF_A499
	cpy #$02
	beq L_BRS_A4C2_A49D
	lda $10
	and #$01
	beq L_BRS_A4AA_A4A3
	ldy #$02
	jmp L_JMP_A4C4_A4A7

L_BRS_A4AA_A4A3:

	ldy #$05
	jmp L_JMP_A4C4_A4AC

L_BRS_A4AF_A499:

	lda #$1E
	adc $3420
	cmp #$C0
	bcc L_BRS_A4BA_A4B6
	lda #$C0

L_BRS_A4BA_A4B6:

	sta $3420
	ldy #$03
	jmp L_JMP_A4C4_A4BF

L_BRS_A4C2_A49D:

	ldy #$10

L_JMP_A4C4_A4A7:
L_JMP_A4C4_A4AC:
L_JMP_A4C4_A4BF:

	ldx #$00
	jsr L_JSR_B715_A4C6
	jmp L_JMP_A526_A4C9

L_JMP_A4CC_A3D8:

	ldx #$00
	lda #$02
	sta $04

L_BRS_A4D2_A4F0:

	ldy #$00
	lda #$03
	sta $05

L_BRS_A4D8_A4E1:

	lda $A705,X
	sta ($02),Y
	inx
	iny
	dec $05
	bne L_BRS_A4D8_A4E1
	lda $02
	sec
	sbc #$28
	sta $02
	bcs L_BRS_A4EE_A4EA
	dec $03

L_BRS_A4EE_A4EA:

	dec $04
	bne L_BRS_A4D2_A4F0
	jsr L_JSR_80F4_A4F2
	ldx $08
	lda $05
	adc #$04
	sta $2050,X
	sei
	lda $06
	adc #$08
	sta $2030,X
	lda $07
	adc #$00
	sta $2040,X
	cli
	ldx $342E
	ldy $342F
	jsr L_JSR_B715_A514
	lda $341F
	cmp #$01
	beq L_BRS_A526_A51C
	sed
	sec
	sbc #$01
	sta $341F
	cld

L_JMP_A526_A4C9:
L_BRS_A526_A51C:

	ldx $08
	lda #$06
	jsr L_JSR_B313_A52A
	rts

L_JSR_A52E_A31C:

	lda $341B
	cmp #$03
	bne L_BRS_A550_A533
	ldy #$08
	lda $2000,Y
	beq L_BRS_A55A_A53A
	lda $2010,Y
	cmp #$03
	bne L_BRS_A55A_A541
	jsr L_JSR_AC5B_A543
	bcc L_BRS_A54B_A546
	jmp L_JMP_A618_A548

L_BRS_A54B_A546:

	ldy #$0E
	jmp L_JMP_A552_A54D

L_BRS_A550_A533:

	ldy #$07

L_JMP_A552_A54D:
L_BRS_A552_A558:

	lda $2000,Y
	bne L_BRS_A55B_A555

L_BRS_A557_A570:
L_BRS_A557_A575:
L_BRS_A557_A57F:
L_BRS_A557_A58C:
L_JMP_A557_A5EC:
L_JMP_A557_A60D:
L_JMP_A557_A615:
L_JMP_A557_A64A:

	dey
	bpl L_BRS_A552_A558

L_BRS_A55A_A53A:
L_BRS_A55A_A541:

	rts

L_BRS_A55B_A555:

	lda $2010,Y
	cmp #$02
	beq L_BRS_A586_A560
	cmp #$03
	beq L_BRS_A583_A564
	cmp #$08
	beq L_BRS_A589_A568
	cmp #$0C
	beq L_BRS_A57C_A56C
	cmp #$0B
	bne L_BRS_A557_A570
	jsr L_JSR_AC5B_A572
	bcc L_BRS_A557_A575

L_BRS_A577_A581:
L_BRS_A577_A593:

	pla
	pla
	jmp L_JMP_A324_A579

L_BRS_A57C_A56C:

	jsr L_JSR_AEA5_A57C
	bcc L_BRS_A557_A57F
	bcs L_BRS_A577_A581

L_BRS_A583_A564:

	jmp L_JMP_A610_A583

L_BRS_A586_A560:

	jmp L_JMP_A5EF_A586

L_BRS_A589_A568:

	jsr L_JSR_AC5B_A589
	bcc L_BRS_A557_A58C
	lda $2000,Y
	cmp #$83
	beq L_BRS_A577_A593
	jsr L_JSR_A2CA_A595
	lda $2000,Y
	cmp #$8A
	beq L_BRS_A5A3_A59D
	cmp #$84
	bne L_BRS_A5AC_A5A1

L_BRS_A5A3_A59D:

	lda #$00
	sta $2000,Y
	lda $2080,Y
	tay

L_BRS_A5AC_A5A1:

	lda #$00
	sta $2000,Y
	ldx $342E
	ldy $342F
	jsr L_JSR_B715_A5B7
	sed
	lda $341F
	sec
	sbc #$01
	sta $341F
	cld
	bne L_BRS_A5E7_A5C5
	jsr L_JSR_820A_A5C7
	lda #$04
	jsr L_JSR_8246_A5CC
	lda #$05
	jsr L_JSR_829B_A5D1
	ldx #$00
	ldy #$10
	jsr L_JSR_B715_A5D8
	inc $341D
	jsr L_JSR_842E_A5DE
	jsr L_JSR_8B54_A5E1
	jmp L_JMP_803A_A5E4

L_BRS_A5E7_A5C5:

	cld
	ldx $08
	ldy $09

L_BRS_A5EC_A5F2:

	jmp L_JMP_A557_A5EC

L_JMP_A5EF_A586:

	jsr L_JSR_AC5B_A5EF
	bcc L_BRS_A5EC_A5F2
	jsr L_JSR_A2CA_A5F4
	ldx $2080,Y
	lda #$00
	sta $2000,X
	sta $2000,Y
	ldx #$50
	ldy #$01
	jsr L_JSR_B715_A606
	ldx $08
	ldy $09
	jmp L_JMP_A557_A60D

L_JMP_A610_A583:

	jsr L_JSR_AC5B_A610
	bcs L_BRS_A618_A613
	jmp L_JMP_A557_A615

L_JMP_A618_A548:
L_BRS_A618_A613:

	jsr L_JSR_A2CA_A618
	txa
	pha
	ldx #$0D

L_BRS_A61F_A625:

	inc $2110,X
	dex
	cpx #$08
	bne L_BRS_A61F_A625
	pla
	tax
	dec $226A
	bne L_BRS_A64A_A62C
	lda $341B
	cmp #$03
	beq L_BRS_A64D_A633
	lda #$02
	sta $2110,X
	lda #$00
	sta $2000,Y
	ldx #$00
	ldy #$02
	jsr L_JSR_B715_A643

L_JMP_A646_A671:

	ldx $08
	ldy $09

L_BRS_A64A_A62C:

	jmp L_JMP_A557_A64A

L_BRS_A64D_A633:

	lda $08
	pha
	lda $09
	pha
	lda $2000,Y
	sta $E8
	cmp #$98
	beq L_BRS_A674_A65A
	ldx #$0D

L_BRS_A65E_A664:

	jsr L_JSR_A2CA_A65E
	dex
	cpx #$07
	bne L_BRS_A65E_A664

L_JMP_A666_A679:

	pla
	sta $09
	pla
	sta $08
	lda #$FF
	sta $2268
	jmp L_JMP_A646_A671

L_BRS_A674_A65A:

	tya
	tax
	jsr L_JSR_A2CA_A676
	jmp L_JMP_A666_A679
	jsr L_JSR_A140_A67C
	lda $2000,X
	cmp #$81
	beq L_BRS_A6B8_A684
	cmp #$8A
	beq L_BRS_A68B_A688

L_BRS_A68A_A68E:
L_BRS_A68A_A695:

	rts

L_BRS_A68B_A688:

	lda $2040,X
	bne L_BRS_A68A_A68E
	lda $D41B                          // Oscillator 3 Output
	and #$03
	bne L_BRS_A68A_A695
	lda #$82
	sta $2000,X
	lda $D41B                          // Oscillator 3 Output
	and #$06
	tay
	lda $AC1E,Y
	sta $20B0,X
	lda $AC1F,Y
	sta $20C0,X
	lda $2080,X
	tay
	lda #$83
	sta $2000,Y
	rts

L_BRS_A6B8_A684:

	jmp L_JMP_A704_A6B8
	dec $3429
	bne L_BRS_A704_A6BE
	lda $3422
	sta $3429
	lda $2040,X
	bne L_BRS_A6D3_A6C9
	lda $2030,X
	cmp #$60
	bcs L_BRS_A6D7_A6D0
	rts

L_BRS_A6D3_A6C9:

	cmp #$28
	bcs L_BRS_A704_A6D5

L_BRS_A6D7_A6D0:

	stx $09
	lda #$05
	jsr L_JSR_AADD_A6DB
	bcs L_BRS_A702_A6DE
	lda #$00
	jsr L_JSR_B313_A6E2
	ldy $09
	lda $2030,Y
	sta $2030,X
	lda $2040,Y
	sta $2040,X
	lda $2020,Y
	sta $2020,X
	lda $2050,Y
	clc
	adc #$0A
	sta $2050,X

L_BRS_A702_A6DE:

	ldx $09

L_JMP_A704_A6B8:
L_BRS_A704_A6BE:
L_BRS_A704_A6D5:

	rts
	.byte $AC,$AC,$AC,$CB,$CC,$CD,$B5,$B6
	.byte $B7,$B8,$B9,$BA,$BB,$BC,$BD,$D7
	.byte $4D,$57,$F2,$58,$A9,$00,$00,$15
	.byte $15,$15,$20,$E1,$AD,$F0,$05,$A9
	.byte $00,$9D,$00,$20,$60,$FF,$FE,$FD
	.byte $DB,$E7,$BB,$7A,$EB,$F9,$B5,$77
	.byte $D7,$F6,$9F,$6F,$FF,$EF,$DF,$FB
	.byte $F7,$BF,$7F

L_JSR_A740_805B:
L_JSR_A740_905B:

	ldy #$00

L_BRS_A742_A751:

	lda $A82A,Y
	bmi L_BRS_A753_A745
	cmp $341B
	beq L_BRS_A769_A74A

L_BRS_A74C_A76F:

	tya
	clc
	adc #$08
	tay
	bne L_BRS_A742_A751

L_BRS_A753_A745:

	lda $EA
	beq L_BRS_A764_A755
	dec $E7
	bne L_BRS_A768_A759
	lda #$00
	sta $EA
	lda #$04
	jsr L_JSR_B313_A761

L_BRS_A764_A755:

	lda #$0F
	sta $E7

L_BRS_A768_A759:

	rts

L_BRS_A769_A74A:

	lda $341C
	cmp $A82B,Y
	bne L_BRS_A74C_A76F
	tya
	pha
	ldy #$07

L_BRS_A775_A77B:

	lda $2000,Y
	bne L_BRS_A780_A778

L_BRS_A77A_A785:

	dey
	bpl L_BRS_A775_A77B
	jmp L_JMP_A789_A77D

L_BRS_A780_A778:

	lda $2010,Y
	cmp #$0C
	bne L_BRS_A77A_A785
	pla
	rts

L_JMP_A789_A77D:
L_JMP_A789_A795:

	lda #$00
	jsr L_JSR_AADD_A78B
	bcc L_BRS_A798_A78E
	lda #$00
	sta $2000
	jmp L_JMP_A789_A795

L_BRS_A798_A78E:

	pla
	tay
	lda #$0C
	sta $2010,X
	inc $2040,X
	lda $A82C,Y                          // Perform [stop]
	sta $2030,X
	lda $A82D,Y
	sta $2050,X
	lda $A82F,Y                          // Perform [end]
	sta $2020,X
	lda #$80
	sta $2130,X
	inc $2120,X
	lda #$0C
	sta $2110,X
	lda #$05
	sta $20F0,X
	tya
	sta $2100,X
	lda #$8B
	sta $2000,X
	lda #$01
	sta $E9
	lda $A82E,Y
	sta $05
	jmp L_JMP_A823_A7D8

L_BRS_A7DB_A827:

	tya
	pha
	lda #$00
	jsr L_JSR_AADD_A7DF
	pla
	tay
	bcs L_BRS_A829_A7E4
	inc $2040,X
	lda $2030,Y
	sta $2030,X
	lda $2050,Y
	clc
	adc #$15
	sta $2050,X
	lda $2020,Y
	sec
	sbc #$15
	sta $2020,X
	lda #$0C
	sta $2010,X
	lda #$80
	sta $2130,X
	inc $2120,X
	lda #$0C
	sta $2110,X
	lda #$05
	sta $20F0,X
	lda $2100,Y
	sta $2100,X
	lda #$8B
	sta $2000,X

L_JMP_A823_A7D8:

	txa
	tay
	dec $05
	bne L_BRS_A7DB_A827

L_BRS_A829_A7E4:

	rts
	.byte $00,$A3,$40,$16,$02,$2A,$BB,$00
	.byte $02,$3A,$00,$18,$01,$41,$4D,$00
	.byte $02,$5D,$00,$16,$01,$4B,$70,$00
	.byte $02,$80,$00,$0B,$03,$46,$93,$00
	.byte $02,$A3,$00,$18,$01,$41,$B6,$00
	.byte $02,$C9,$00,$14,$01,$4B,$DC,$00
	.byte $FF

L_JMP_A85B_8076:
L_JMP_A85B_9076:
L_JMP_A85B_AD8B:
L_JMP_A85B_ADDE:

	lda #$00
	sta $13
	sta $D412                          // Voice 3: Control Register
	lda #$07
	jsr L_JSR_B313_A864
	lda #$0F
	sta $02

L_BRS_A86B_A883:

	inc $2271
	lda $341B
	cmp #$01
	beq L_BRS_A877_A873
	inc $ED

L_BRS_A877_A873:

	ldy #$20
	ldx #$00

L_BRS_A87B_A87C:
L_BRS_A87B_A87F:

	dex
	bne L_BRS_A87B_A87C
	dey
	bne L_BRS_A87B_A87F
	dec $02
	bne L_BRS_A86B_A883
	txa
	sta $02
	lda #$D8
	sta $03
	ldx #$04
	lda #$00
	jsr L_JSR_81E4_A890
	lda #$00
	sta $ED
	lda #$50
	sta $03
	ldx #$08
	lda #$1F
	jsr L_JSR_81E4_A89F
	ldx #$0F
	lda #$00

L_BRS_A8A6_A8AA:

	sta $2000,X
	dex
	bpl L_BRS_A8A6_A8AA
	ldx #$07

L_BRS_A8AE_A8D9:

	lda $205F
	sta $2050,X
	lda $203F
	sta $2030,X
	lda $204F
	sta $2040,X
	lda $A959,X
	sta $2130,X
	lda #$20
	sta $2140,X
	lda #$00
	sta $2070,X
	sta $2010,X
	lda #$76
	sta $2000,X
	dex
	bpl L_BRS_A8AE_A8D9
	lda #$08
	jsr L_JSR_B313_A8DD
	lda $3427
	bmi L_BRS_A8EA_A8E3
	lda #$0F
	sta $D418                          // Select Filter Mode and Volume

L_BRS_A8EA_A8E3:

	lda #$38
	sta $1F

L_BRS_A8EE_A90B:

	ldx #$07

L_BRS_A8F0_A8F4:

	inc $2110,X
	dex
	bpl L_BRS_A8F0_A8F4
	lda #$00
	sta $1B
	lda #$0D
	sta $1C
	jsr L_JSR_A000_A8FE

L_BRS_A901_A903:
L_BRS_A901_A907:

	dec $1B
	bne L_BRS_A901_A903
	dec $1C
	bne L_BRS_A901_A907
	dec $1F
	bne L_BRS_A8EE_A90B
	lda $3427
	bmi L_BRS_A956_A910
	lda $2269
	bmi L_BRS_A932_A915
	dec $341E
	bne L_BRS_A932_A91A
	jsr L_JSR_820A_A91C
	lda #$00
	jsr L_JSR_8246_A921
	lda $341A
	clc
	adc #$B1
	sta $05A1
	lda #$03
	jsr L_JSR_829B_A92F

L_BRS_A932_A915:
L_BRS_A932_A91A:

	lda $341A
	asl
	asl
	tay
	ldx #$00

L_BRS_A93A_A944:

	lda $341C,X
	sta $3431,Y
	iny
	inx
	cpx #$04
	bne L_BRS_A93A_A944
	lda $3427
	beq L_BRS_A953_A949
	lda $341A
	eor #$01
	sta $341A

L_BRS_A953_A949:

	jmp L_JMP_8033_A953

L_BRS_A956_A910:

	jmp L_JMP_8029_A956
	.byte $05,$0A,$01,$02,$06,$08,$0C,$09

L_JSR_A961_803A:
L_JSR_A961_8308:
L_JSR_A961_903A:
L_JSR_A961_9308:

	lda #$00
	sta $DC02                          // Data Direction Register A
	sta $DC03                          // Data Direction Register B
	lda $3439
	beq L_BRS_A97D_A96C
	cmp #$80
	bne L_BRS_A98C_A970
	lda $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	and $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	ora #$EF
	jmp L_JMP_A98E_A97A

L_BRS_A97D_A96C:

	lda $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	and $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	sta $14
	ldx #$DF
	ldy #$03
	jmp L_JMP_A994_A989

L_BRS_A98C_A970:

	lda #$FF

L_JMP_A98E_A97A:

	sta $14
	ldx #$FE
	ldy #$0D

L_JMP_A994_A989:

	lda #$FF
	sta $DC02                          // Data Direction Register A

L_BRS_A999_A9B2:

	lda $AAB5,Y
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	and $AAB6,Y
	bne L_BRS_A9AC_A9A5
	txa
	and $14
	sta $14

L_BRS_A9AC_A9A5:

	txa
	sec
	rol
	tax
	dey
	dey
	bpl L_BRS_A999_A9B2
	lda $341B
	bne L_BRS_A9CD_A9B7
	lda $341C
	cmp #$F0
	bcc L_BRS_A9CD_A9BE
	lda $202F
	cmp #$15
	bcc L_BRS_A9CD_A9C5
	lda $14
	and #$FE
	sta $14

L_BRS_A9CD_A9B7:
L_BRS_A9CD_A9BE:
L_BRS_A9CD_A9C5:

	lda $14
	and #$03
	bne L_BRS_A9D9_A9D1
	lda $14
	ora #$03
	sta $14

L_BRS_A9D9_A9D1:

	lda $14
	and #$0C
	bne L_BRS_A9E5_A9DD
	lda $14
	ora #$0C
	sta $14

L_BRS_A9E5_A9DD:

	lda #$FF
	sta $DC02                          // Data Direction Register A
	lda #$7F
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda #$80
	ldx #$00
	bit $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	bne L_BRS_AA0D_A9F6
	ldy $13
	stx $13

L_BRS_A9FC_A9FF:

	jsr L_JSR_AA18_A9FC
	beq L_BRS_A9FC_A9FF

L_BRS_AA01_AA04:

	jsr L_JSR_AA18_AA01
	bne L_BRS_AA01_AA04

L_BRS_AA06_AA09:

	jsr L_JSR_AA18_AA06
	beq L_BRS_AA06_AA09
	sty $13

L_BRS_AA0D_A9F6:

	lda $3427
	bpl L_BRS_AA15_AA10
	jmp L_JMP_AA71_AA12

L_BRS_AA15_AA10:

	lda $14
	rts

L_JSR_AA18_A9FC:
L_JSR_AA18_AA01:
L_JSR_AA18_AA06:
L_BRS_AA18_AA5C:
L_BRS_AA18_AA68:

	ldx $2269
	bmi L_BRS_AA4B_AA1B
	lda $AAC4,X
	bne L_BRS_AA29_AA20
	lda #$80
	sta $2269
	bne L_BRS_AA4B_AA27

L_BRS_AA29_AA20:

	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp #$FF
	beq L_BRS_AA4B_AA31
	cmp $AAC5,X
	bne L_BRS_AA41_AA36
	inc $2269
	inc $2269
	jmp L_JMP_AA4B_AA3E

L_BRS_AA41_AA36:

	cmp $AAC3,X
	beq L_BRS_AA4B_AA44
	lda #$00
	sta $2269

L_BRS_AA4B_AA1B:
L_BRS_AA4B_AA27:
L_BRS_AA4B_AA31:
L_JMP_AA4B_AA3E:
L_BRS_AA4B_AA44:

	ldx #$00
	lda #$7F
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda #$80
	bit $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	bne L_BRS_AA65_AA57

L_BRS_AA59_AA5F:

	bit $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	bne L_BRS_AA18_AA5C
	dex
	bne L_BRS_AA59_AA5F
	bit $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	rts

L_BRS_AA65_AA57:
L_BRS_AA65_AA6B:

	bit $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	beq L_BRS_AA18_AA68
	dex
	bne L_BRS_AA65_AA6B
	bit $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	rts

L_JMP_AA71_AA12:

	lda $14
	and #$10
	bne L_BRS_AA7A_AA75
	jmp L_JMP_8029_AA77

L_BRS_AA7A_AA75:

	lda $341C
	lsr
	lsr
	tay
	lda $AA86,Y                          // Perform [cmd]
	sta $14
	rts
	.byte $FD,$FF,$FF,$FF,$FF,$E5,$E5,$EF
	.byte $FF,$FF,$FF,$F6,$F6,$EA,$EA,$EF
	.byte $FD,$FD,$FD,$FF,$FF,$FE,$FA,$FA
	.byte $FB,$EB,$E7,$E7,$E7,$EF,$FD,$E6
	.byte $F6,$F6,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $7F,$08,$7F,$01,$7F,$10,$EF,$20
	.byte $EF,$04,$FD,$10,$FD,$04,$FD,$DF
	.byte $FB,$BF,$FD,$BF,$F7,$7F,$FD,$BF
	.byte $FD,$FB,$EF,$7F,$FB,$FB,$FB,$FD
	.byte $EF,$BF,$FD,$DF,$FD,$FB,$00

L_JSR_AADD_8C6F:
L_JSR_AADD_8C79:
L_JSR_AADD_8CBF:
L_JSR_AADD_8D59:
L_JSR_AADD_9C6F:
L_JSR_AADD_9C79:
L_JSR_AADD_9CBF:
L_JSR_AADD_9D59:
L_JSR_AADD_A6DB:
L_JSR_AADD_A78B:
L_JSR_AADD_A7DF:
L_JSR_AADD_AB84:
L_JSR_AADD_ABD6:
L_JSR_AADD_B04A:
L_JSR_AADD_B0A5:
L_JSR_AADD_B180:

	ldy #$0F

L_BRS_AADF_AAE5:

	ldx $2000,Y
	beq L_BRS_AAE9_AAE2
	dey
	bpl L_BRS_AADF_AAE5
	sec
	rts

L_BRS_AAE9_AAE2:

	sta $2010,Y
	asl
	asl
	asl
	tax
	lda #$10
	sta $02
	lda #$21
	sta $03
	lda #$08
	sta $04

L_BRS_AAFC_AB11:

	lda $AB25,X
	sta ($02),Y
	inx
	lda $02
	clc
	adc #$10
	sta $02
	lda $03
	adc #$00
	sta $03
	dec $04
	bne L_BRS_AAFC_AB11
	tya
	tax
	lda #$00
	sta $2040,X
	sta $2070,X
	sta $20A0,X
	sta $20E0,X
	clc
	rts


	.byte $03,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$0C,$10,$05,$17,$03
	.byte $0A,$00,$8D,$08,$0E,$05,$0A,$00
	.byte $04,$00,$80,$00,$08,$08,$00,$08
	.byte $08,$01,$03,$20,$06,$03,$06,$00
	.byte $07,$01,$84,$10,$06,$03,$00,$04
	.byte $07,$01,$8B,$10,$06,$03,$00,$00
	.byte $07,$01,$87,$10,$06,$03,$06,$04
	.byte $08,$00,$04,$18,$0A,$05,$17,$03

L_JSR_AB6D_8058:
L_JSR_AB6D_9058:

	lda $2268
	bne L_BRS_AB79_AB70
	lda $341B
	cmp #$01
	beq L_BRS_AB7A_AB77

L_BRS_AB79_AB70:
L_BRS_AB79_AB7C:
L_BRS_AB79_AB87:

	rts

L_BRS_AB7A_AB77:

	dec $F0
	bne L_BRS_AB79_AB7C
	lda $F1
	sta $F0
	lda #$08
	jsr L_JSR_AADD_AB84
	bcs L_BRS_AB79_AB87
	lda #$0C
	sta $2020,X

L_BRS_AB8E_AB93:
L_BRS_AB8E_AB97:

	lda $D41B                          // Oscillator 3 Output
	cmp #$14
	bcc L_BRS_AB8E_AB93
	cmp #$6E
	bcs L_BRS_AB8E_AB97
	sta $2050,X
	lda #$70
	sta $2030,X
	inc $2040,X
	lda $D41B                          // Oscillator 3 Output
	and #$06
	tay
	lda $AC1E,Y
	sta $20B0,X
	lda $AC1F,Y
	sta $20C0,X
	lda #$01
	sta $20D0,X
	lda $D41B                          // Oscillator 3 Output
	and #$01
	bne L_BRS_ABC8_ABC0
	lda #$81
	sta $2000,X
	rts

L_BRS_ABC8_ABC0:

	lda #$06
	sta $2110,X
	lda #$8A
	sta $2000,X
	txa
	pha
	lda #$08
	jsr L_JSR_AADD_ABD6
	pla
	tay
	bcc L_BRS_ABE3_ABDB
	lda #$00
	sta $2000,Y
	rts

L_BRS_ABE3_ABDB:

	lda #$09
	sta $2020,X
	lda $2030,Y
	clc
	adc #$08
	sta $2030,X
	inc $2040,X
	lda $2050,Y
	sta $2050,X
	lda $20B0,Y
	sta $20B0,X
	lda $20C0,Y
	sta $20C0,X
	lda #$01
	sta $20D0,X
	lda #$07
	sta $2110,X
	lda #$84
	sta $2000,X
	txa
	sta $2080,Y
	tya
	sta $2080,X
	rts
	.byte $28,$AC,$33,$AC,$3E,$AC,$49,$AC
	.byte $54,$AC,$01,$0A,$02,$0A,$01,$0A
	.byte $02,$0A,$01,$0A,$FF,$01,$05,$02
	.byte $0A,$01,$05,$02,$05,$01,$14,$FF
	.byte $01,$0A,$02,$05,$01,$05,$02,$05
	.byte $01,$0F,$FF,$01,$0F,$02,$05,$01
	.byte $05,$02,$0F,$01,$0A,$FF,$04,$28
	.byte $0B,$10,$11,$10,$FF

L_JSR_AC5B_A543:
L_JSR_AC5B_A572:
L_JSR_AC5B_A589:
L_JSR_AC5B_A5EF:
L_JSR_AC5B_A610:
L_JSR_AC5B_ADD9:

	lda $2020,X
	sta $03
	sec
	sbc $2160,X
	bcs L_BRS_AC68_AC64
	lda #$00

L_BRS_AC68_AC64:

	sta $02
	lda $2020,Y
	sta $05
	sec
	sbc $2160,Y
	bcs L_BRS_AC77_AC73
	lda #$00

L_BRS_AC77_AC73:

	sta $04
	lda $341B
	cmp #$01
	beq L_BRS_AC87_AC7E
	jsr L_JSR_AD5A_AC80
	bcc L_BRS_ACA2_AC83
	bcs L_BRS_ACA3_AC85

L_BRS_AC87_AC7E:

	lda $03
	cmp #$30
	bcc L_BRS_AC8F_AC8B
	lda #$30

L_BRS_AC8F_AC8B:

	and #$30
	sta $03
	lda $05
	cmp #$30
	bcc L_BRS_AC9B_AC97
	lda #$30

L_BRS_AC9B_AC97:

	and #$30
	cmp $03
	beq L_BRS_ACA3_AC9F
	clc

L_BRS_ACA2_AC83:

	rts

L_BRS_ACA3_AC85:
L_BRS_ACA3_AC9F:

	clc
	sei
	lda $2030,X
	sta $02
	adc $2150,X
	sta $04
	lda $2040,X
	sta $03
	adc #$00
	cli
	sta $05
	clc
	sei
	lda $2030,Y
	sta $06
	adc $2150,Y
	sta $08
	lda $2040,Y
	sta $07
	adc #$00
	cli
	sta $09
	lda $08
	cmp $02
	lda $09
	sbc $03
	bcc L_BRS_ACE3_ACD7
	lda $04
	cmp $08
	lda $05
	sbc $09
	bcs L_BRS_ACF8_ACE1

L_BRS_ACE3_ACD7:

	lda $04
	cmp $06
	lda $05
	sbc $07
	bcc L_BRS_ACF7_ACEB
	lda $08
	cmp $04
	lda $09
	sbc $05
	bcs L_BRS_ACF8_ACF5

L_BRS_ACF7_ACEB:

	rts

L_BRS_ACF8_ACE1:
L_BRS_ACF8_ACF5:

	txa
	pha
	lda #$00
	sta $06
	lda $2000,X
	lsr
	ror $06
	lsr
	ror $06
	sta $07
	lda #$3F
	clc
	adc $06
	sta $06
	lda #$40
	adc $07
	sta $07
	lda $2050,X
	sta $02
	clc
	ldx #$00
	adc ($06,X)
	sec
	sbc #$05
	cmp $02
	bcs L_BRS_AD29_AD25
	adc #$05

L_BRS_AD29_AD25:

	sta $03
	stx $06
	lda $2000,Y
	lsr
	ror $06
	lsr
	ror $06
	sta $07
	lda #$3F
	clc
	adc $06
	sta $06
	lda #$40
	adc $07
	sta $07
	lda $2050,Y
	sta $04
	clc
	adc ($06,X)
	sec
	sbc #$05
	cmp $04
	bcs L_BRS_AD56_AD52
	adc #$05

L_BRS_AD56_AD52:

	sta $05
	pla
	tax

L_JSR_AD5A_AC80:

	lda $05
	cmp $02
	bcc L_BRS_AD66_AD5E
	lda $03
	cmp $05
	bcs L_BRS_AD70_AD64

L_BRS_AD66_AD5E:

	lda $03
	cmp $04
	bcc L_BRS_AD70_AD6A
	lda $05
	cmp $03

L_BRS_AD70_AD64:
L_BRS_AD70_AD6A:

	rts

L_JSR_AD71_8055:
L_JSR_AD71_9055:

	lda $2269
	bpl L_BRS_AD7C_AD74
	lda #$FF
	sta $341E
	rts

L_BRS_AD7C_AD74:

	ldx #$0F
	jsr L_JSR_ADE1_AD7E
	beq L_BRS_AD8E_AD81
	lda $0B
	bne L_BRS_AD8B_AD85
	lda $E5
	bne L_BRS_AD8E_AD89

L_BRS_AD8B_AD85:
L_BRS_AD8B_ADC5:

	jmp L_JMP_A85B_AD8B

L_BRS_AD8E_AD81:
L_BRS_AD8E_AD89:

	lda $0B
	bne L_BRS_ADAE_AD90
	lda $341C
	cmp #$24
	bcc L_BRS_ADAE_AD97
	lda #$07
	sta $E5
	lda $341B
	cmp #$01
	bne L_BRS_ADA9_ADA2
	lda #$77
	jmp L_JMP_ADAB_ADA6

L_BRS_ADA9_ADA2:

	lda #$8C

L_JMP_ADAB_ADA6:

	sta $200E

L_BRS_ADAE_AD90:
L_BRS_ADAE_AD97:

	lda $202F
	adc #$10
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	ldx #$0D

L_BRS_ADB8_ADBE:

	lda $2000,X
	bne L_BRS_ADC8_ADBB

L_BRS_ADBD_ADCD:
L_BRS_ADBD_ADD1:
L_BRS_ADBD_ADD5:
L_BRS_ADBD_ADDC:

	dex
	bpl L_BRS_ADB8_ADBE
	ldx #$0F
	jsr L_JSR_AEA5_ADC2
	bcs L_BRS_AD8B_ADC5
	rts

L_BRS_ADC8_ADBB:

	lda $2010,X
	cmp #$09
	bcs L_BRS_ADBD_ADCD
	cmp #$02
	bcc L_BRS_ADBD_ADD1
	cmp #$04
	beq L_BRS_ADBD_ADD5
	ldy #$0F
	jsr L_JSR_AC5B_ADD9
	bcc L_BRS_ADBD_ADDC
	jmp L_JMP_A85B_ADDE

L_JSR_ADE1_A317:
L_JSR_ADE1_AD7E:

	stx $08
	lda $341B
	cmp #$01
	beq L_BRS_AE4F_ADE8
	lda $2050,X
	clc
	adc $2180,X
	adc $2020,X
	tay
	lda $2030,X
	clc
	adc $2170,X
	sta $09
	lda $2040,X
	adc #$00
	tax
	lda $09
	jsr L_JSR_B40D_AE06
	ldy #$00
	sty $0B

L_JMP_AE0D_AE20:

	ldx $AE60,Y
	sty $0A
	bmi L_BRS_AE4F_AE12
	iny

L_BRS_AE15_AE1C:

	cmp $AE60,Y
	beq L_BRS_AE23_AE18
	iny
	dex
	bne L_BRS_AE15_AE1C
	inc $0B
	jmp L_JMP_AE0D_AE20

L_BRS_AE23_AE18:

	ldx $08
	lda $2050,X
	clc
	adc $2180,X
	tay
	lda $2030,X
	clc
	adc $2170,X
	sta $09
	lda $2040,X
	adc #$00
	tax
	lda $09
	jsr L_JSR_B40D_AE3E
	ldy $0A
	ldx $AE60,Y

L_BRS_AE46_AE4D:

	iny
	cmp $AE60,Y
	beq $AE54
	dex
	bne L_BRS_AE46_AE4D

L_BRS_AE4F_ADE8:
L_BRS_AE4F_AE12:

	ldx $08
	lda #$00
	rts
	.byte $AD,$1C,$34,$C9,$24,$90,$F4,$A6
	.byte $08,$A9,$FF,$60,$0E,$82,$34,$83
	.byte $84,$80,$7A,$3D,$81,$89,$74,$75
	.byte $6F,$76,$77,$0C,$CE,$CF,$D0,$D1
	.byte $D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9
	.byte $0C,$44,$45,$46,$47,$48,$49,$4A
	.byte $4B,$4C,$4D,$4E,$4F,$04,$50,$53
	.byte $54,$57,$07,$61,$62,$63,$64,$65
	.byte $66,$F2,$06,$5B,$5C,$5D,$5E,$5F
	.byte $60,$06,$A6,$A7,$A8,$A9,$AA,$AB
	.byte $FF

L_JSR_AEA5_A57C:
L_JSR_AEA5_ADC2:

	ldy #$07

L_BRS_AEA7_AEAD:

	lda $2000,Y
	bne L_BRS_AEB1_AEAA

L_BRS_AEAC_AEB6:
L_BRS_AEAC_AEBE:
L_BRS_AEAC_AEC6:
L_BRS_AEAC_AED6:
L_BRS_AEAC_AF0A:
L_BRS_AEAC_AF0C:
L_BRS_AEAC_AF12:

	dey
	bpl L_BRS_AEA7_AEAD
	clc
	rts

L_BRS_AEB1_AEAA:

	lda $2010,Y
	cmp #$0C
	bne L_BRS_AEAC_AEB6
	lda $2020,Y
	cmp $2020,X
	bcc L_BRS_AEAC_AEBE
	sec
	sbc #$15
	cmp $2020,X
	bcs L_BRS_AEAC_AEC6
	tya
	pha
	lda $2100,Y
	tay
	lda $A830,Y
	cmp $341C
	pla
	tay
	bcc L_BRS_AEAC_AED6
	lda $2030,X
	sec
	sbc $2030,Y
	sta $02
	lda $2040,X
	sbc $2040,Y
	sta $03
	clc
	bpl L_BRS_AEED_AEEA
	sec

L_BRS_AEED_AEEA:

	ror
	sta $03
	ror $02
	lda $02
	clc
	adc $2050,Y
	sta $02
	bcc L_BRS_AEFE_AEFA
	inc $03

L_BRS_AEFE_AEFA:

	lda $2050,X
	sec
	sbc $02
	sta $02
	lda #$00
	sbc $03
	bmi L_BRS_AEAC_AF0A
	bne L_BRS_AEAC_AF0C
	lda $02
	cmp #$15
	bcs L_BRS_AEAC_AF12
	sec
	rts

L_JSR_AF16_804C:
L_JSR_AF16_904C:

	ldx #$1E

L_BRS_AF18_AF1F:

	lda $2208,X
	bne L_BRS_AF22_AF1B

L_BRS_AF1D_AF49:
L_JMP_AF1D_B007:

	dex
	dex
	bpl L_BRS_AF18_AF1F
	rts

L_BRS_AF22_AF1B:

	ldy $2229,X
	lda $2050,Y
	cmp #$B5
	bcs L_BRS_AF38_AF2A
	lda $2040,Y
	bne L_BRS_AF43_AF2F
	lda $2030,Y
	cmp #$26
	bcs L_BRS_AF43_AF36

L_BRS_AF38_AF2A:
L_BRS_AF38_AF3C:

	lda $10
	cmp #$03
	bcc L_BRS_AF38_AF3C
	lda #$01
	sta $2208,X

L_BRS_AF43_AF2F:
L_BRS_AF43_AF36:

	lda $341C
	cmp $2228,X
	beq L_BRS_AF1D_AF49
	sta $2228,X
	sec
	sbc $2209,X
	sta $02
	sta $03
	lda #$01
	bit $341C
	beq L_BRS_AF64_AF5B
	and $2209,X
	bne L_BRS_AF64_AF60
	inc $03

L_BRS_AF64_AF5B:
L_BRS_AF64_AF60:

	lda #$00
	sta $04
	lsr $03
	lda $03
	asl
	asl
	adc $03
	asl
	asl
	asl
	bcc L_BRS_AF77_AF73
	inc $04

L_BRS_AF77_AF73:

	sec
	sbc $02
	sta $02
	lda $04
	sbc #$00
	sta $03
	lda $2248,X
	clc
	adc $02
	sta $02
	lda $2249,X
	adc $03
	sta $03
	ldy #$00
	lda #$0E
	dec $2208,X
	beq L_BRS_AFA6_AF98
	lda ($02),Y
	cmp #$0A
	beq L_BRS_AFA4_AF9E
	lda #$0A
	bne L_BRS_AFA6_AFA2

L_BRS_AFA4_AF9E:

	lda #$0F

L_BRS_AFA6_AF98:
L_BRS_AFA6_AFA2:

	sta $04
	lda #$03
	sta $05

L_BRS_AFAC_AFC2:

	lda #$03
	sta $06
	lda $04

L_BRS_AFB2_AFB7:

	sta ($02),Y
	iny
	dec $06
	bne L_BRS_AFB2_AFB7
	dec $05
	beq L_BRS_AFC4_AFBB
	tya
	clc
	adc #$25
	tay
	bne L_BRS_AFAC_AFC2

L_BRS_AFC4_AFBB:

	cmp #$0E
	bne L_BRS_B007_AFC6
	lda $02
	clc
	adc #$00
	sta $02
	lda $03
	adc #$20
	sta $03
	lda $12
	and #$10
	lsr
	lsr
	eor #$04
	ora $03
	sta $03
	stx $04
	ldx #$00
	lda #$03
	sta $05
	ldy #$00

L_BRS_AFEB_B003:

	lda #$03
	sta $06

L_BRS_AFEF_AFF8:

	lda $B00A,X
	sta ($02),Y
	iny
	inx
	dec $06
	bne L_BRS_AFEF_AFF8
	dec $05
	beq L_BRS_B005_AFFC
	tya
	clc
	adc #$25
	tay
	bne L_BRS_AFEB_B003

L_BRS_B005_AFFC:

	ldx $04

L_BRS_B007_AFC6:

	jmp L_JMP_AF1D_B007
	.byte $00,$00,$00
	cmp $C6
	.byte $C7
	iny
	cmp #$CA

L_BRS_B013_B027:
L_BRS_B013_B02B:

	jmp L_JMP_B098_B013

L_JSR_B016_8049:
L_JSR_B016_9049:

	lda $341B
	beq L_BRS_B020_B019
	cmp #$03
	bne L_BRS_B020_B01D
	rts

L_BRS_B020_B019:
L_BRS_B020_B01D:

	jsr L_JSR_807A_B020
	beq L_BRS_B06E_B023
	cmp #$3F
	beq L_BRS_B013_B027
	cmp #$A1
	beq L_BRS_B013_B02B
	cmp #$61
	beq L_BRS_B07B_B02F
	cmp #$53
	beq L_BRS_B075_B033
	cmp #$5F
	beq L_BRS_B06F_B037
	dec $342A
	bne L_BRS_B06E_B03C
	lda $3423
	sta $342A
	lda #$05
	ldx #$7C

L_JMP_B048_B095:

	stx $09
	jsr L_JSR_AADD_B04A
	bcs L_BRS_B06E_B04D
	lda #$00
	jsr L_JSR_B313_B051
	lda $09
	sta $2000,X
	lda $05
	sta $2050,X
	lda $06
	sta $2030,X
	lda $07
	sta $2040,X
	lda #$03
	sta $2020,X
	clc

L_BRS_B06E_B023:
L_BRS_B06E_B03C:
L_BRS_B06E_B04D:
L_BRS_B06E_B082:
L_BRS_B06E_B08D:
L_BRS_B06E_B09B:

	rts

L_BRS_B06F_B037:

	lda #$07
	ldx #$7D
	bne L_BRS_B08A_B073

L_BRS_B075_B033:

	lda #$05
	ldx #$7C
	bne L_BRS_B08A_B079

L_BRS_B07B_B02F:

	lda #$06
	ldx #$7D
	jsr L_JSR_B08A_B07F
	bcs L_BRS_B06E_B082
	lda #$0A
	sta $2070,X
	rts

L_BRS_B08A_B073:
L_BRS_B08A_B079:
L_JSR_B08A_B07F:

	dec $3428
	bne L_BRS_B06E_B08D
	ldy $3421
	sty $3428
	jmp L_JMP_B048_B095

L_JMP_B098_B013:

	dec $342B
	bne L_BRS_B06E_B09B
	lda $3424
	sta $342B
	lda #$02
	jsr L_JSR_AADD_B0A5
	bcs L_BRS_B101_B0A8
	stx $02

L_BRS_B0AC_B0B2:

	dex
	bmi L_BRS_B101_B0AD
	lda $2000,X
	bne L_BRS_B0AC_B0B2
	ldy $02
	lda $05
	sta $2050,Y
	sec
	sbc #$0A
	sta $2050,X
	lda $06
	sta $2030,Y
	sbc #$08
	sta $2030,X
	lda $07
	sta $2040,Y
	sbc #$00
	sta $2040,X
	lda #$00
	sta $2020,Y
	lda #$09
	sta $2010,X
	lda #$3C
	sta $2070,X
	lda #$80
	sta $2130,X
	lda #$00
	sta $2140,X
	lda #$6F
	sta $2000,Y
	lda #$70
	sta $2000,X
	txa
	sta $2080,Y
	lda #$05
	jsr L_JSR_B313_B0FE

L_BRS_B101_B0A8:
L_BRS_B101_B0AD:

	rts

L_JSR_B102_8040:
L_JSR_B102_9040:

	lda #$79
	sta $03
	lda $14
	and #$0F
	sta $02
	ldy $202F
	lsr $02
	bcs L_BRS_B11D_B111
	inc $03
	cpy #$04
	bcs L_BRS_B11D_B117
	dec $03
	ora #$01

L_BRS_B11D_B111:
L_BRS_B11D_B117:

	lsr $02
	bcs L_BRS_B136_B11F
	dec $03
	cpy #$41
	bcs L_BRS_B132_B125
	ldx $341B
	cpx #$01
	bne L_BRS_B136_B12C
	cpy #$19
	bcc L_BRS_B136_B130

L_BRS_B132_B125:

	inc $03
	ora #$02

L_BRS_B136_B11F:
L_BRS_B136_B12C:
L_BRS_B136_B130:

	ldy $203F
	lsr $02
	bcs L_BRS_B14E_B13B
	cpy #$6E
	bcs L_BRS_B14E_B13F
	ldx $341B
	cpx #$01
	bne L_BRS_B14C_B146
	cpy #$58
	bcs L_BRS_B14E_B14A

L_BRS_B14C_B146:

	ora #$04

L_BRS_B14E_B13B:
L_BRS_B14E_B13F:
L_BRS_B14E_B14A:

	lsr $02
	bcs L_BRS_B158_B150
	cpy #$C3
	bcc L_BRS_B158_B154
	ora #$08

L_BRS_B158_B150:
L_BRS_B158_B154:

	sta $213F
	ora #$03
	sta $213E
	lda $341B
	cmp #$01
	beq L_BRS_B16C_B165
	lda $03
	sta $200F

L_BRS_B16C_B165:

	rts

L_JSR_B16D_8043:
L_JSR_B16D_9043:

	lda $14
	and #$10
	bne L_BRS_B1B7_B171
	dec $342C
	bne L_BRS_B1B7_B176
	lda $3425
	sta $342C
	lda #$04
	jsr L_JSR_AADD_B180
	bcs L_BRS_B1B7_B183
	lda $200F
	cmp #$7B
	bcc L_BRS_B18F_B18A
	sec
	sbc #$03

L_BRS_B18F_B18A:

	sec
	sbc #$78
	tay
	lda $203F
	clc
	adc $B1B8,Y
	sta $2030,X
	lda $205F
	clc
	adc $B1BE,Y
	sta $2050,X
	lda $202F
	sta $2020,X
	lda #$7C
	sta $2000,X
	lda #$01
	jsr L_JSR_B313_B1B4

L_BRS_B1B7_B171:
L_BRS_B1B7_B176:
L_BRS_B1B7_B183:

	rts
	.byte $0E,$10,$10,$10,$08,$04,$00,$03
	.byte $04,$00,$00,$00

L_JSR_B1C4_85B3:
L_JSR_B1C4_95B3:

	lda #$20
	sta $02
	lda #$08
	sta $03
	ldx #$00
	stx $09

L_BRS_B1D0_B209:

	ldy $09
	lda #$4C
	sta $0800,Y
	lda $02
	sta $0801,Y
	lda $03
	sta $0802,Y
	iny
	iny
	iny
	sty $09
	lda $B27E,X
	sta $04
	lda $B27F,X
	sta $05
	lda $B280,X
	sta $06
	lda $B281,X
	sta $07
	lda $B282,X
	sta $08
	jsr L_JSR_B29C_B1FF
	txa
	clc
	adc #$05
	tax
	cmp #$1E
	bne L_BRS_B1D0_B209
	ldy $09
	lda #$4C
	sta $0800,Y
	lda $02
	sta $0801,Y
	lda $03
	sta $0802,Y
	iny
	iny
	iny
	sty $09
	ldx #$85
	lda #$00
	sta $04
	lda #$30
	sta $05
	lda #$00
	sta $06
	lda #$D8
	sta $07

L_BRS_B233_B26F:
L_BRS_B233_B275:

	ldy #$00
	lda #$AD
	sta ($02),Y
	iny
	lda $04
	sta ($02),Y
	iny
	lda $05
	sta ($02),Y
	iny
	lda #$8D
	sta ($02),Y
	iny
	lda $06
	sta ($02),Y
	iny
	lda $07
	sta ($02),Y
	lda $02
	clc
	adc #$06
	sta $02
	lda $03
	adc #$00
	sta $03
	inc $04
	bne L_BRS_B265_B261
	inc $05

L_BRS_B265_B261:

	inc $06
	bne L_BRS_B26B_B267
	inc $07

L_BRS_B26B_B267:

	lda $06
	cmp #$20
	bne L_BRS_B233_B26F
	lda $07
	cmp #$DB
	bne L_BRS_B233_B275
	ldy #$00
	lda #$60
	sta ($02),Y
	rts

	
	.byte $01,$50,$00,$54,$14,$01,$54,$00
	.byte $50,$14,$01,$50,$28,$54,$13,$01
	.byte $54,$28,$50,$13,$01,$D8,$00,$30
	.byte $14,$01,$D8,$28,$30,$13

L_JSR_B29C_B1FF:

	ldy #$00
	lda #$A2
	sta ($02),Y
	iny
	lda #$00
	sta ($02),Y
	iny

L_BRS_B2A8_B2E2:

	lda #$BD
	sta ($02),Y
	iny
	lda $04
	sta ($02),Y
	iny
	lda $05
	sta ($02),Y
	iny
	lda #$9D
	sta ($02),Y
	iny
	lda $06
	sta ($02),Y
	iny
	lda $07
	sta ($02),Y
	iny
	lda $04
	clc
	adc #$28
	sta $04
	lda $05
	adc #$00
	sta $05
	lda $06
	clc
	adc #$28
	sta $06
	lda $07
	adc #$00
	sta $07
	dec $08
	bne L_BRS_B2A8_B2E2
	lda #$E8
	sta ($02),Y
	iny
	lda #$E0
	sta ($02),Y
	iny
	lda #$27
	sta ($02),Y
	iny
	lda #$D0
	sta ($02),Y
	iny
	tya
	eor #$FF
	clc
	adc #$02
	sta ($02),Y
	iny
	lda #$60
	sta ($02),Y
	iny
	tya
	clc
	adc $02
	sta $02
	lda $03
	adc #$00
	sta $03
	rts

L_JSR_B313_A221:
L_JSR_B313_A2E7:
L_JSR_B313_A348:
L_JSR_B313_A52A:
L_JSR_B313_A6E2:
L_JSR_B313_A761:
L_JSR_B313_A864:
L_JSR_B313_A8DD:
L_JSR_B313_B051:
L_JSR_B313_B0FE:
L_JSR_B313_B1B4:

	stx $08
	asl
	tay
	ldx #$00
	cmp #$05
	bcc L_BRS_B31F_B31B
	ldx #$02

L_BRS_B31F_B31B:

	lda #$00
	sta $BD,X
	lda $B394,Y
	sta $C1,X
	lda $B395,Y
	sta $C2,X
	ldy #$07

L_BRS_B32F_B334:

	jsr L_JSR_8A9F_B32F
	pha
	dey
	bne L_BRS_B32F_B334
	ldy #$00
	cpx #$00
	beq L_BRS_B33E_B33A
	ldy #$07

L_BRS_B33E_B33A:

	lda #$FF
	sta $EC
	lda #$08
	sta $D404,Y                          // Voice 1: Control Register
	pla
	sta $D2,X
	sta $D401,Y                          // Voice 1: Frequency Control - High-Byte
	pla
	sta $D1,X
	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	pla
	sta $C9,X
	pla
	sta $C5,X
	and #$0F
	sta $C6,X
	pla
	sta $D406,Y                          // Voice 1: Sustain / Release Cycle Control
	pla
	sta $D405,Y                          // Voice 1: Attack / Decay Cycle Control
	lda #$01
	sta $CA,X
	lda $C5,X
	bpl L_BRS_B38D_B36B
	jsr L_JSR_8A9F_B36D
	sta $CD,X
	jsr L_JSR_8A9F_B372
	sta $CE,X
	lda #$01
	sta $BD,X
	tya
	pha
	ldx #$08
	ldy #$00

L_BRS_B381_B382:
L_BRS_B381_B385:

	dey
	bne L_BRS_B381_B382
	dex
	bne L_BRS_B381_B385
	pla
	tay
	pla
	sta $D404,Y                          // Voice 1: Control Register

L_BRS_B38D_B36B:

	ldx $08
	lda #$00
	sta $EC
	rts
	.byte $AA,$B3,$B3,$B3,$BC,$B3,$C5,$B3
	.byte $CE,$B3,$D7,$B3,$E0,$B3,$E9,$B3
	.byte $F2,$B3,$FB,$B3,$04,$B4,$81,$04
	.byte $F0,$81,$14,$00,$40,$00,$FD,$81
	.byte $0B,$00,$86,$14,$00,$50,$00,$FF
	.byte $81,$00,$F0,$81,$3C,$00,$50,$00
	.byte $01,$81,$0B,$00,$82,$0F,$00,$30
	.byte $00,$FD,$11,$00,$F0,$83,$02,$00
	.byte $A0,$00,$F0,$81,$C0,$FA,$8A,$0A
	.byte $00,$0F,$00,$00,$81,$00,$FC,$86
	.byte $12,$00,$40,$00,$FD,$81,$00,$F9
	.byte $84,$10,$00,$80,$00,$04,$81,$00
	.byte $FD,$84,$24,$00,$C0,$00,$FC,$11
	.byte $27,$FF,$83,$18,$00,$60,$00,$FC
	.byte $11,$27,$FF,$83,$18,$00,$10,$A0
	.byte $00

L_JSR_B40D_AE06:
L_JSR_B40D_AE3E:

	sec
	sbc #$1C
	sta $02
	txa
	sbc #$00
	bcc L_BRS_B473_B415
	beq L_BRS_B41F_B417
	ldx $02
	cpx #$40
	bcs L_BRS_B473_B41D

L_BRS_B41F_B417:

	lsr
	ror $02
	lsr
	ror $02
	lsr
	ror $02
	sta $03
	tya
	sec
	sbc #$32
	bcc L_BRS_B473_B42E
	cmp #$CE
	bcs L_BRS_B473_B432
	and #$F8
	sta $04
	sta $06
	lda #$00
	sta $05
	sta $07
	asl $04
	rol $05
	asl $04
	rol $05
	clc
	lda $06
	adc $04
	sta $04
	lda $07
	adc $05
	sta $05
	lda $04
	adc $02
	sta $02
	lda $05
	adc $03
	sta $03
	lda $12
	and #$10
	lsr
	lsr
	ora #$50
	clc
	adc $03
	sta $03
	ldy #$00
	lda ($02),Y
	rts

L_BRS_B473_B415:
L_BRS_B473_B41D:
L_BRS_B473_B42E:
L_BRS_B473_B432:

	lda #$00
	sta $02
	lda #$50
	sta $03
	lda #$1F
	rts

L_JSR_B47E_803D:
L_JSR_B47E_903D:

	lda $3420
	cmp $3419
	beq L_BRS_B4D0_B484
	sta $3419
	lsr
	lsr
	lsr
	sta $02
	ldx #$00

L_JMP_B490_B49A:

	cpx $02
	beq L_BRS_B49D_B492
	lda #$19
	sta $534F,X
	inx
	jmp L_JMP_B490_B49A

L_BRS_B49D_B492:

	cpx #$18
	beq L_BRS_B4D0_B49F
	cpx #$17
	beq L_BRS_B4AC_B4A3
	inx
	lda #$00
	sta $534F,X
	dex

L_BRS_B4AC_B4A3:

	asl $02
	asl $02
	asl $02
	lda $3420
	sec
	sbc $02
	tay
	lda $B660,Y
	sta $02
	ldy #$07

L_BRS_B4C0_B4C9:

	lda $40C8,Y
	and $02
	sta $40D0,Y
	dey
	bpl L_BRS_B4C0_B4C9
	lda #$1A
	sta $534F,X

L_BRS_B4D0_B484:
L_BRS_B4D0_B49F:

	ldx #$03

L_BRS_B4D2_B4DB:

	lda $3400,X
	cmp $340C,X
	bne L_BRS_B4E0_B4D8
	dex
	bpl L_BRS_B4D2_B4DB
	jmp L_JMP_B508_B4DD

L_BRS_B4E0_B4D8:
L_BRS_B4E0_B4E7:

	lda $3400,X
	sta $340C,X
	dex
	bpl L_BRS_B4E0_B4E7
	lda #$00
	sta $02
	lda #$34
	sta $03
	lda #$86
	sta $04
	lda #$53
	sta $05
	lda #$04
	sta $06
	lda #$0F
	sta $07
	lda #$00
	sta $0B
	jsr L_JSR_B610_B505

L_JMP_B508_B4DD:

	ldx #$03
	lda $3427
	cmp #$01
	bne L_BRS_B54A_B50F

L_BRS_B511_B51A:

	lda $3404,X
	cmp $3410,X
	bne L_BRS_B51F_B517
	dex
	bpl L_BRS_B511_B51A
	jmp L_JMP_B56C_B51C

L_BRS_B51F_B517:
L_BRS_B51F_B526:

	lda $3404,X
	sta $3410,X
	dex
	bpl L_BRS_B51F_B526
	lda #$04
	sta $02
	lda #$34
	sta $03

L_JMP_B530_B569:

	lda #$AE
	sta $04
	lda #$53
	sta $05
	lda #$04
	sta $06
	lda #$0F
	sta $07
	lda #$00
	sta $0B
	jsr L_JSR_B610_B544
	jmp L_JMP_B56C_B547

L_BRS_B54A_B50F:
L_BRS_B54A_B553:

	lda $3408,X
	cmp $3414,X
	bne L_BRS_B558_B550
	dex
	bpl L_BRS_B54A_B553
	jmp L_JMP_B56C_B555

L_BRS_B558_B550:
L_BRS_B558_B55F:

	lda $3408,X
	sta $3414,X
	dex
	bpl L_BRS_B558_B55F
	lda #$08
	sta $02
	lda #$34
	sta $03
	jmp L_JMP_B530_B569

L_JMP_B56C_B51C:
L_JMP_B56C_B547:
L_JMP_B56C_B555:

	lda $341F
	cmp $3418
	beq L_BRS_B596_B572
	sta $3418
	lda #$1F
	sta $02
	lda #$34
	sta $03
	lda #$BB
	sta $04
	lda #$53
	sta $05
	lda #$01
	sta $06
	lda #$0F
	sta $07
	lda #$00
	sta $0B
	jsr L_JSR_B610_B593

L_BRS_B596_B572:
L_BRS_B596_B5E5:

	lda $202F
	clc
	adc #$0C
	sta $02
	lda $E6
	cmp $02
	bne L_BRS_B5A5_B5A2
	rts

L_BRS_B5A5_B5A2:

	bcs L_BRS_B5AE_B5A5
	inc $E6
	lda $E6
	jmp L_JMP_B5B0_B5AB

L_BRS_B5AE_B5A5:

	dec $E6

L_JMP_B5B0_B5AB:

	ldx #$FF
	sec

L_BRS_B5B3_B5B6:

	inx
	sbc #$15
	bcs L_BRS_B5B3_B5B6
	adc #$15
	sta $02
	asl
	adc $02
	eor #$FF
	adc #$3E
	sta $02
	txa
	ror
	ror
	ror
	and #$C0
	eor #$FF
	clc
	adc #$01
	sta $03
	lda #$59
	sbc #$00
	sta $04
	ldx #$00
	ldy $02

L_JMP_B5DC_B600:

	lda ($03),Y
	eor $B603,X
	sta ($03),Y
	cpx #$06
	beq L_BRS_B596_B5E5
	tya
	sec
	sbc $B60A,X
	tay
	bcs L_BRS_B5FF_B5ED
	adc #$3F
	tay
	lda $03
	sec
	sbc #$40
	sta $03
	lda $04
	sbc #$00
	sta $04

L_BRS_B5FF_B5ED:

	inx
	jmp L_JMP_B5DC_B600
	.byte $0C,$30,$C0,$03,$0C,$30,$C0,$03
	.byte $03,$04,$03,$03,$03

L_JSR_B610_B505:
L_JSR_B610_B544:
L_JSR_B610_B593:
L_JSR_B610_B6A8:
L_JSR_B610_B6B3:
L_JSR_B610_B6C0:

	lda #$00
	sta $08
	sta $09
	sta $0A
	ldx $06

L_BRS_B61A_B631:

	ldy $0A
	lda ($02),Y
	lsr
	lsr
	lsr
	lsr
	jsr L_JSR_B647_B622
	ldy $0A
	lda ($02),Y
	and #$0F
	jsr L_JSR_B647_B62B
	inc $0A
	dex
	bne L_BRS_B61A_B631
	lda $06
	asl
	sta $08
	ldy $09

L_JMP_B63A_B643:

	cpy $08
	beq L_BRS_B646_B63C
	lda $0B
	sta ($04),Y
	iny
	jmp L_JMP_B63A_B643

L_BRS_B646_B63C:

	rts

L_JSR_B647_B622:
L_JSR_B647_B62B:

	cmp #$00
	beq L_BRS_B657_B649
	inc $08

L_BRS_B64D_B659:
L_BRS_B64D_B65D:

	clc
	adc $07
	ldy $09
	sta ($04),Y
	inc $09
	rts

L_BRS_B657_B649:

	cpx #$01
	beq L_BRS_B64D_B659
	ldy $08
	bne L_BRS_B64D_B65D
	rts
	.byte $00,$80,$C0,$E0,$F0,$F8,$FC,$FE

L_JSR_B668_8030:
L_JSR_B668_9030:

	lda #$00
	sta $D418                          // Select Filter Mode and Volume
	lda $3427
	and #$01
	sta $3427
	jsr L_JSR_820A_B675
	lda #$02
	jsr L_JSR_8246_B67A
	lda #$05
	jsr L_JSR_8246_B67F
	lda #$06
	jsr L_JSR_8246_B684
	lda #$07
	jsr L_JSR_8246_B689
	lda #$A0
	sta $0B
	lda #$8C
	sta $04
	lda #$04
	sta $05
	lda #$00
	sta $02
	lda #$34
	sta $03
	lda #$04
	sta $06
	lda #$B0
	sta $07
	jsr L_JSR_B610_B6A8
	lda #$B4
	sta $04
	lda #$04
	sta $02
	jsr L_JSR_B610_B6B3
	lda #$04
	sta $04
	inc $05
	lda #$08
	sta $02
	jsr L_JSR_B610_B6C0
	lda #$1E
	jsr L_JSR_829B_B6C5
	bcs L_BRS_B6D2_B6C8
	lda $3427
	ora #$80
	jmp L_JMP_B6E4_B6CF

L_BRS_B6D2_B6C8:

	asl
	bpl L_BRS_B6E2_B6D3
	asl
	bpl L_BRS_B6DD_B6D6
	lda $3427
	bpl L_BRS_B6E4_B6DB

L_BRS_B6DD_B6D6:

	lda #$00
	jmp L_JMP_B6E4_B6DF

L_BRS_B6E2_B6D3:

	lda #$01

L_JMP_B6E4_B6CF:
L_BRS_B6E4_B6DB:
L_JMP_B6E4_B6DF:

	sta $3427
	ldx #$07
	lda $3427
	bmi L_BRS_B6FA_B6EC
	bne L_BRS_B6F2_B6EE
	ldx #$03

L_BRS_B6F2_B6EE:
L_BRS_B6F2_B6F8:

	lda #$00
	sta $3400,X
	dex
	bpl L_BRS_B6F2_B6F8

L_BRS_B6FA_B6EC:

	ldx #$03

L_BRS_B6FC_B709:

	lda $B711,X
	sta $3431,X
	sta $3435,X
	sta $341C,X
	dex
	bpl L_BRS_B6FC_B709
	lda #$00
	sta $341A
	rts
	.byte $00,$00,$05,$18

L_JSR_B715_8B1C:
L_JSR_B715_9B1C:
L_JSR_B715_A4C6:
L_JSR_B715_A514:
L_JSR_B715_A5B7:
L_JSR_B715_A5D8:
L_JSR_B715_A606:
L_JSR_B715_A643:

	lda $3427
	bpl L_BRS_B71D_B718
	jmp L_JMP_B7A1_B71A

L_BRS_B71D_B718:

	stx $02
	lda $341A
	asl
	asl
	tax
	clc
	sed
	lda $02
	adc $3403,X
	sta $3403,X
	tya
	adc $3402,X
	sta $3402,X
	lda $3401,X
	sta $02
	adc #$00
	sta $3401,X
	lda #$00
	adc $3400,X
	sta $3400,X
	sec
	lda $340B
	sbc $3403,X
	lda $340A
	sbc $3402,X
	lda $3409
	sbc $3401,X
	lda $3408
	sbc $3400,X
	bcs L_BRS_B77B_B761
	lda $3400,X
	sta $3408
	lda $3401,X
	sta $3409
	lda $3402,X
	sta $340A
	lda $3403,X
	sta $340B

L_BRS_B77B_B761:

	cld
	ldy #$00
	lda $02

L_BRS_B780_B788:

	cmp $B7A2,Y
	bcc L_BRS_B78D_B783
	iny
	cpy #$05
	bne L_BRS_B780_B788
	jmp L_JMP_B79E_B78A

L_BRS_B78D_B783:

	lda $3401,X
	cmp $B7A2,Y
	bcc L_BRS_B79E_B793
	inc $341E
	bne L_BRS_B79E_B798
	dec $341E
	rts

L_JMP_B79E_B78A:
L_BRS_B79E_B793:
L_BRS_B79E_B798:

	jsr L_JSR_8142_B79E

L_JMP_B7A1_B71A:

	rts
	.byte $03,$07,$15,$30,$50

L_JSR_B7A7_8B7E:
L_JSR_B7A7_9B7E:

	lda $3427
	bmi L_BRS_B7FD_B7AA
	jsr L_JSR_B7E6_B7AC
	bne L_BRS_B7C8_B7AF
	lda $3427
	cmp #$01
	beq L_BRS_B7BB_B7B6

L_BRS_B7B8_B7C6:
L_BRS_B7B8_B7E3:

	jmp L_JMP_8029_B7B8

L_BRS_B7BB_B7B6:

	lda $341A
	eor #$01
	sta $341A
	jsr L_JSR_B7E6_B7C3
	beq L_BRS_B7B8_B7C6

L_BRS_B7C8_B7AF:

	lda $3427
	beq L_BRS_B7E5_B7CB
	jsr L_JSR_820A_B7CD
	lda #$01
	jsr L_JSR_8246_B7D2
	lda $341A
	clc
	adc #$B1
	sta $061E
	lda #$3C
	jsr L_JSR_829B_B7E0
	bcc L_BRS_B7B8_B7E3

L_BRS_B7E5_B7CB:

	rts

L_JSR_B7E6_B7AC:
L_JSR_B7E6_B7C3:

	ldx #$00
	lda $341A
	asl
	asl
	tay

L_BRS_B7EE_B7F8:

	lda $3431,Y
	sta $341C,X
	iny
	inx
	cpx #$04
	bne L_BRS_B7EE_B7F8
	lda $341E

L_BRS_B7FD_B7AA:

	rts
	.byte $00,$00,$01,$11,$11,$11,$11,$11
	.byte $11,$11,$11,$11,$11,$11,$12,$21
	.byte $11,$18,$EE,$EE,$EE,$EE,$FB,$BB
	.byte $BB,$BB,$B8,$8B,$88,$88,$88,$EB
	.byte $B8,$99,$99,$99,$AA,$AA,$AA,$AA
	.byte $AA,$AA,$99,$99,$99,$99,$99,$99
	.byte $99,$99,$99,$99,$99,$98,$88,$88
	.byte $88,$88,$88,$88,$88,$88,$88,$88
	.byte $88,$88,$88,$88,$88,$88,$88,$89
	.byte $99,$88,$EE,$EE,$88,$88,$88,$88
	.byte $88,$88,$BB,$BB,$BB,$BB,$BB,$BB
	.byte $BB,$BB,$BB,$BB,$BA,$AA,$AA,$AA
	.byte $AA,$22,$22,$22,$2D,$DD,$DD,$DB
	.byte $BB,$FF,$FF,$FF,$AA,$AA,$AA,$FF
	.byte $FF,$FF,$FF,$FF,$99,$98,$F8,$8F
	.byte $FF,$F8,$88,$88,$88,$88,$88,$88
	.byte $88,$8B,$80,$89,$00,$FE,$C0,$C0
	.byte $FC,$83,$C0,$00,$86,$C6,$7C,$00
	.byte $FE,$C0,$C0,$FC,$C0,$C0,$FE,$00
	.byte $86,$C0,$FE,$00,$C6,$C6,$E6,$D6
	.byte $CE,$C6,$C6,$00,$C6,$C6,$EE,$D6
	.byte $83,$C6,$00,$C6,$C6,$6C,$84,$38
	.byte $00,$FC,$C6,$C6,$FC,$83,$C0,$00
	.byte $38,$6C,$C6,$FE,$83,$C6,$00,$FC
	.byte $C6,$C6,$FC,$D8,$CC,$C6,$00,$7C
	.byte $C6,$C0,$7C,$06,$C6,$7C,$00,$83
	.byte $C6,$FE,$83,$C6,$00,$FC,$85,$30
	.byte $FC,$00,$7C,$C6,$83,$C0,$C6,$7C
	.byte $00,$7C,$85,$C6,$7C,$00,$70,$85
	.byte $30,$FC,$00,$7C,$C6,$0C,$30,$60
	.byte $C0,$FE,$00,$FE,$06,$18,$7C,$06
	.byte $C6,$7C,$00,$0C,$1C,$3C,$6C,$FE
	.byte $0C,$0C,$00,$FE,$C0,$FC,$06,$06
	.byte $C6,$7C,$00,$7C,$C6,$C0,$FC,$C6
	.byte $C6,$7C,$00,$FE,$81,$86,$0C,$84
	.byte $18,$00,$7C,$C6,$C6,$7C,$C6,$C6
	.byte $7C,$00,$7C,$C6,$C6,$7E,$06,$C6
	.byte $7C,$C0,$F0,$FC,$FF,$FF,$FC,$F0
	.byte $C0,$8F,$00,$03,$00,$03,$07,$0E
	.byte $1C,$78,$F4,$EC,$3F,$1F,$5F,$EE
	.byte $35,$83,$00,$DC,$BC,$7C,$83,$FC
	.byte $3C,$08,$8F,$FF,$FF,$84,$00,$03
	.byte $0F,$3F,$FF,$03,$0F,$3F,$89,$FF
	.byte $FD,$F5,$D4,$53,$FD,$F5,$D4,$53
	.byte $4F,$3F,$FF,$FF,$4F,$3F,$8A,$FF
	.byte $FC,$F0,$C0,$00,$FC,$F0,$C0,$87
	.byte $00,$30,$FC,$3F,$0C,$86,$00,$02
	.byte $0A,$2A,$AB,$02,$0A,$2A,$AB,$AF
	.byte $83,$BF,$AF,$BF,$84,$FF,$FE,$FA
	.byte $BF,$BF,$BE,$BA,$AA,$A9,$A5,$95
	.byte $EA,$A8,$A0,$81,$80,$84,$00,$BF
	.byte $BF,$BE,$BA,$AA,$A8,$A0,$81,$80
	.byte $A9,$A5,$8F,$95,$83,$95,$55,$56
	.byte $5A,$6A,$01,$09,$29,$A9,$84,$A5
	.byte $84,$5F,$7F,$7F,$7E,$7A,$88,$AA
	.byte $85,$55,$15,$05,$01,$95,$15,$05
	.byte $01,$84,$00,$84,$AA,$84,$6A,$83
	.byte $5A,$56,$56,$16,$06,$02,$84,$00
	.byte $84,$80,$A0,$A0,$A8,$A8,$AB,$AF
	.byte $BF,$FF,$84,$AA,$EA,$FA,$FE,$FF
	.byte $84,$00,$02,$06,$16,$57,$88,$55
	.byte $83,$00,$03,$0F,$0E,$0F,$1B,$00
	.byte $00,$FF,$EB,$83,$AA,$EB,$83,$00
	.byte $C0,$F0,$B0,$F0,$E4,$16,$15,$15
	.byte $83,$95,$A5,$0A,$FF,$AA,$86,$55
	.byte $B4,$85,$74,$70,$00,$14,$15,$11
	.byte $10,$14,$83,$04,$00,$00,$40,$53
	.byte $11,$17,$05,$35,$0F,$37,$DF,$77
	.byte $DF,$7F,$DF,$6F,$04,$05,$01,$04
	.byte $01,$0D,$07,$0D,$1D,$75,$DD,$76
	.byte $DE,$7B,$6B,$6F,$7F,$7C,$7C,$FC
	.byte $FC,$F0,$F0,$C0,$37,$1D,$76,$DB
	.byte $FF,$FF,$3F,$00,$7F,$7F,$FF,$FE
	.byte $FA,$EB,$2F,$2F,$C0,$82,$80,$85
	.byte $C0,$00,$03,$0F,$0F,$27,$29,$AA
	.byte $2A,$DF,$F5,$7F,$DF,$F5,$FF,$7F
	.byte $95,$70,$FC,$DF,$7F,$FD,$F4,$D0
	.byte $40,$01,$05,$35,$F5,$7F,$7F,$FF
	.byte $FF,$5D,$57,$83,$55,$FF,$FF,$55
	.byte $40,$50,$D4,$DD,$FD,$DD,$5D,$5D
	.byte $03,$0F,$3D,$F5,$94,$90,$00,$00
	.byte $FD,$D5,$56,$69,$05,$00,$00,$0A
	.byte $86,$55,$AA,$69,$84,$5D,$50,$00
	.byte $00,$A0,$83,$00,$0A,$2A,$AA,$AA
	.byte $A0,$2A,$85,$AA,$0A,$00,$83,$5D
	.byte $9E,$84,$AA,$A8,$85,$AA,$A0,$00
	.byte $01,$05,$15,$75,$7F,$77,$75,$75
	.byte $40,$50,$DC,$DF,$FD,$FD,$FF,$FF
	.byte $84,$75,$0F,$00,$00,$0A,$7F,$57
	.byte $95,$69,$50,$00,$00,$A0,$C0,$F0
	.byte $7C,$5F,$16,$06,$85,$00,$A0,$A8
	.byte $AA,$AA,$0A,$84,$00,$30,$FC,$7F
	.byte $5F,$86,$00,$C0,$F0,$17,$05,$01
	.byte $01,$84,$00,$FD,$F5,$F5,$7D,$5F
	.byte $9F,$55,$55,$83,$00,$20,$A8,$2A
	.byte $0A,$02,$84,$55,$05,$81,$80,$AA
	.byte $AA,$FE,$FA,$EA,$85,$AA,$84,$FF
	.byte $FE,$FA,$EA,$AA,$FD,$F5,$D5,$85
	.byte $55,$84,$FF,$FD,$F5,$D5,$55,$C0
	.byte $70,$5C,$57,$84,$55,$84,$00,$C0
	.byte $70,$5C,$57,$AB,$AF,$BF,$85,$FF
	.byte $84,$AA,$AB,$AF,$BF,$FF,$D5,$B5
	.byte $AD,$AB,$84,$AA,$84,$55,$D5,$B5
	.byte $AD,$AB,$85,$00,$03,$0D,$35,$00
	.byte $03,$0D,$35,$D5,$83,$55,$84,$AA
	.byte $84,$A9,$EA,$BA,$AE,$AB,$88,$AA
	.byte $EA,$BA,$AE,$AB,$5D,$7F,$FF,$7F
	.byte $5F,$77,$D7,$57,$5D,$75,$86,$D5
	.byte $84,$55,$57,$5F,$7F,$FF,$84,$FE
	.byte $84,$FA,$84,$A5,$84,$95,$84,$00
	.byte $03,$0F,$3F,$FF,$03,$0F,$3F,$85
	.byte $FF,$88,$57,$88,$D5,$84,$55,$D7
	.byte $BF,$BF,$FF,$84,$EA,$84,$AA,$2A
	.byte $0A,$02,$85,$00,$84,$AA,$29,$09
	.byte $01,$00,$84,$55,$54,$50,$40,$00
	.byte $54,$50,$40,$85,$00,$85,$55,$57
	.byte $5D,$75,$84,$AA,$EB,$BF,$BF,$FF
	.byte $AB,$2F,$3F,$86,$FF,$FC,$F0,$C0
	.byte $C0,$70,$5C,$57,$84,$AA,$2A,$0A
	.byte $02,$00,$FC,$F0,$C0,$00,$C0,$70
	.byte $5C,$57,$C0,$F0,$BC,$2F,$0B,$02
	.byte $86,$00,$C0,$F0,$BC,$2F,$0B,$02
	.byte $86,$00,$83,$6A,$85,$AA,$84,$56
	.byte $83,$5A,$6A,$85,$00,$C0,$F0,$FC
	.byte $00,$C0,$F0,$FC,$85,$FF,$3F,$0F
	.byte $03,$84,$00,$85,$FF,$3F,$0F,$03
	.byte $84,$95,$84,$A5,$84,$40,$84,$50
	.byte $84,$15,$84,$05,$84,$7F,$84,$5F
	.byte $57,$5F,$7F,$85,$FF,$84,$D5,$84
	.byte $F5,$84,$A9,$84,$AA,$84,$54,$84
	.byte $55,$84,$01,$84,$00,$84,$FD,$88
	.byte $FF,$FC,$F0,$C0,$00,$FC,$F0,$C0
	.byte $85,$00,$FF,$FF,$FD,$83,$EA,$5A
	.byte $56,$FF,$D7,$55,$69,$95,$A6,$A9
	.byte $AA,$FF,$FF,$7F,$57,$57,$97,$55
	.byte $69,$69,$55,$D6,$D5,$D5,$FD,$FF
	.byte $FF,$AA,$6A,$9A,$56,$69,$55,$D7
	.byte $FF,$95,$A5,$83,$AB,$7F,$86,$FF
	.byte $83,$FC,$FD,$0D,$01,$05,$05,$14
	.byte $00,$00,$01,$83,$7F,$3F,$3F,$13
	.byte $40,$00,$F5,$D5,$D4,$00,$00,$1A
	.byte $EA,$EA,$44,$10,$00,$2A,$AA,$AF
	.byte $BF,$FF,$03,$2B,$AA,$AF,$BF,$8B
	.byte $FF,$84,$00,$03,$0F,$3F,$FF,$03
	.byte $0F,$3F,$85,$FF,$00,$C0,$F0,$FC
	.byte $84,$FF,$85,$00,$C0,$F0,$FC,$3F
	.byte $0F,$03,$85,$00,$84,$FF,$3F,$0F
	.byte $03,$00,$85,$FF,$FC,$F0,$C0,$FF
	.byte $FC,$F0,$C0,$86,$00,$04,$00,$3C
	.byte $0F,$03,$33,$83,$30,$FC,$F7,$7C
	.byte $D3,$F7,$00,$00,$43,$0C,$3C,$30
	.byte $F0,$F0,$0D,$0F,$41,$0F,$33,$3F
	.byte $3F,$03,$D5,$41,$D0,$40,$41,$10
	.byte $55,$DD,$C4,$F0,$7C,$5F,$3C,$50
	.byte $FC,$C0,$0F,$0F,$3C,$C0,$03,$83
	.byte $00,$7F,$FD,$CF,$CC,$0C,$00,$C4
	.byte $00,$C4,$C0,$F0,$3C,$03,$40,$0C
	.byte $00,$FE,$FC,$F9,$F3,$E7,$CF,$9F
	.byte $3F,$00,$00,$86,$FF,$7F,$3F,$1F
	.byte $0F,$07,$03,$01,$00,$7F,$3F,$9F
	.byte $CF,$E7,$F3,$F9,$FC,$88,$FF,$FE
	.byte $FC,$F8,$F0,$E0,$C0,$81,$80,$83
	.byte $00,$01,$03,$07,$0F,$1F,$3F,$83
	.byte $00,$32,$00,$0E,$3F,$D7,$83,$00
	.byte $03,$10,$E7,$67,$A6,$85,$00,$40
	.byte $9C,$9F,$9E,$FA,$EB,$FA,$FE,$3A
	.byte $03,$30,$A7,$AB,$FA,$AA,$AF,$FE
	.byte $FF,$FF,$9F,$9F,$AF,$BC,$9F,$AC
	.byte $C0,$00,$3F,$F8,$C0,$C0,$F2,$CC
	.byte $FC,$FF,$16,$A4,$26,$A8,$81,$82
	.byte $02,$20,$00,$F3,$3F,$81,$8F,$03
	.byte $4F,$0F,$3F,$FF,$00,$03,$0F,$0F
	.byte $3B,$3E,$83,$FF,$F7,$FD,$FD,$FF
	.byte $FF,$AA,$FF,$00,$C0,$F0,$70,$6C
	.byte $9C,$5F,$5F,$83,$FF,$7F,$9F,$A5
	.byte $6A,$5A,$86,$FF,$55,$AA,$83,$D7
	.byte $D5,$D6,$5A,$A9,$A5,$D5,$3F,$3F
	.byte $0F,$0B,$0B,$FA,$7A,$AA,$55,$84
	.byte $FF,$A9,$A9,$57,$F4,$F4,$D0,$E0
	.byte $60,$6C,$67,$9E,$3F,$FF,$D5,$5A
	.byte $6A,$02,$00,$A9,$EB,$FF,$FF,$55
	.byte $AA,$AA,$00,$76,$FC,$FF,$57,$A5
	.byte $A9,$81,$80,$00,$D5,$FF,$3F,$0F
	.byte $0F,$03,$00,$00,$6A,$95,$ED,$FB
	.byte $FE,$FF,$BE,$EB,$97,$B5,$6D,$5B
	.byte $E2,$81,$80,$00,$00,$86,$F7,$B6
	.byte $EB,$00,$0A,$2A,$AA,$5A,$D5,$F5
	.byte $FF,$84,$F7,$B5,$83,$55,$00,$50
	.byte $54,$55,$55,$57,$5F,$DF,$FF,$FF
	.byte $3F,$0F,$84,$00,$85,$FF,$83,$00
	.byte $DF,$DF,$DC,$D0,$84,$00,$E0,$81
	.byte $80,$8A,$00,$03,$0F,$3E,$F8,$03
	.byte $0F,$3E,$F8,$E0,$81,$80,$00,$00
	.byte $84,$57,$84,$55,$57,$D7,$DE,$DA
	.byte $DA,$6A,$AA,$AA,$EA,$FA,$FE,$85
	.byte $FF,$84,$AA,$EA,$FA,$FE,$FF,$A9
	.byte $56,$7B,$EF,$BF,$FF,$BE,$AA,$AA
	.byte $AB,$AF,$AF,$BB,$BE,$FF,$FF,$AA
	.byte $EA,$FA,$7A,$6E,$9E,$5F,$5F,$D6
	.byte $5E,$79,$E5,$AB,$83,$AA,$88,$FF
	.byte $84,$55,$57,$5D,$75,$D5,$57,$5D
	.byte $75,$D5,$84,$55,$88,$00,$84,$02
	.byte $84,$0A,$EA,$7A,$5E,$57,$D5,$B5
	.byte $AD,$AB,$57,$5D,$75,$D5,$57,$5D
	.byte $75,$D5,$84,$AA,$EA,$7A,$5E,$57
	.byte $C0,$70,$5C,$57,$5D,$75,$D5,$55
	.byte $D5,$75,$5D,$57,$88,$55,$D5,$75
	.byte $5D,$57,$84,$2A,$85,$AA,$2A,$0A
	.byte $02,$84,$0A,$FD,$F5,$D5,$55,$D5
	.byte $75,$5D,$57,$FE,$FA,$EA,$AA,$EA
	.byte $BA,$AE,$AB,$EA,$FA,$FE,$FF,$FC
	.byte $F0,$C0,$00,$EA,$FA,$FE,$85,$FF
	.byte $D4,$BE,$DF,$BE,$E9,$BE,$F2,$BE
	.byte $FB,$BE,$04,$BF,$0C,$BF,$15,$BF
	.byte $1C,$BF,$1C,$BF,$1C,$BF,$1C,$BF
	.byte $1C,$BF,$1F,$BF,$25,$BF,$1C,$BF
	.byte $1C,$BF,$1C,$BF,$1C,$BF,$2B,$BF
	.byte $34,$BF,$1C,$BF,$1C,$BF,$1C,$BF
	.byte $1C,$BF,$1C,$BF,$3C,$BF,$06,$29
	.byte $2A,$29,$32,$3C,$2A,$82,$29,$2A
	.byte $00,$03,$2B,$31,$33,$83,$2E,$2B
	.byte $01,$2C,$00,$83,$2D,$1F,$04,$2D
	.byte $3D,$2F,$34,$00,$45,$1F,$05,$3D
	.byte $30,$34,$1F,$1F,$00,$43,$1F,$03
	.byte $35,$30,$34,$44,$1F,$00,$04,$1F
	.byte $1F,$30,$37,$46,$1F,$00,$04,$36
	.byte $38,$39,$28,$83,$1F,$28,$00,$02
	.byte $3A,$22,$84,$21,$22,$00,$4A,$20
	.byte $00,$83,$23,$24,$44,$20,$00,$83
	.byte $25,$20,$44,$20,$00,$02,$23,$24
	.byte $44,$20,$82,$23,$24,$00,$01,$25
	.byte $45,$20,$82,$25,$20,$00,$85,$26
	.byte $27,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00
