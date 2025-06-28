



ActionIdentifier:

$03 = after action
$04 = enter home castle?

$09 = visit village
$0A = talk

$11 = ?

$14 = attack

$17 = someone got killed?
$18 = ?

$20 = start player phase?

$21 = before enemy action?




































      rlUnknown9599E7 ; 95/99E7

        .al
        .autsiz
        .databank ?

        ldx #$2940
        jsr $9594F8

        lda #$2940
        jsr $959537

        ldx #2
        
          -
          lda $E00060,x
          sta $0100,b,x
          inc x
          inc x
          cpx #32
          bcc -

        lda wBattleType
        and #$00FF
        cmp #$00FF
        bne +

        lda aActionStructUnit1.UnitRAMPointer
        bra ++
        
        +
        lda aActionStructUnit1.UnitRAMPointer
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionBattleHUDColorID

        +
        jsr $959B84

        lda wBattleType
        and #$00FF
        cmp #$00FF
        bne +

        lda aActionStructUnit2.UnitRAMPointer
        bra ++
        
        +
        lda aActionStructUnit2.UnitRAMPointer
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionBattleHUDColorID
        
        +
        jsr $959BC1
        rtl

        .databank 0

      rsUnknown959A4D ; 95/9A4D

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #$EAEE
        stx DecompressionVariables.lSource
        lda #$9C
        sta DecompressionVariables.lSource+2
        ldx #<>aDecompressionBuffer
        sta $CB
        lda #`aDecompressionBuffer
        sta $CD
        jsl rlDecompressor
        rep #$30

        lda wBattleType
        and #$00FF
        cmp #$00FF
        bne +

        lda aActionStructUnit1.XPosition
        bra ++
        
        +
        lda aActionStructUnit1.UnitRAMPointer
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionBattleBannerID
        
        +
        asl a
        pha
        asl a
        clc
        adc #1,s
        tax
        pla

        lda $998D84+1,x
        sta lR45+1
        lda $998D84,x
        sta lR45
        lda #(`$7FC200)<<8
        sta lR47+1
        lda #<>$7FC200
        sta lR47
        phx
        jsl rlDecompressSingle
        plx

        lda $998D84+3+1,x
        sta lR18+1
        lda $998D84+3,x
        sta lR18
        ldx #0
        ldy #0
        
        -
        lda [lR18],y
        sta $01D2,b,x
        sta $7FC1F0,x
        inc y
        inc y
        inc x
        inc x
        cpx #14
        bcc -

        lda wBattleType
        and #$00FF
        cmp #$00FF
        bne +

        lda aActionStructUnit2.XPosition
        bra ++
        
        +
        lda aActionStructUnit2.UnitRAMPointer
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionBattleBannerID
        
        +
        asl a
        pha
        asl a
        clc
        adc #1,s
        tax
        pla

        lda $998D84+1,x
        sta lR45+1
        lda $998D84,x
        sta lR45
        lda #(`$7FC000)<<8
        sta lR47+1
        lda #<>$7FC000
        sta lR47
        phx
        jsl rlDecompressSingle
        plx

        lda $998D84+3+1,x
        sta lR18+1
        lda $998D84+3,x
        sta lR18

        ldx #0
        ldy #0
        
        -
        lda [lR18],y
        sta $01F2,b,x
        sta $7FC3F0,x
        inc y
        inc y
        inc x
        inc x
        cpx #14
        bcc -

        jsl rlDMAByStruct

          .structDMAToVRAM $7FC000, $0400, $80, $F000

        rts

        .databank 0

        ; 95/9B49





; 998D84

      g4bppcBattleBannerLeonster .text ROM[$1CD95E:$1CDA67]
      g4bppcBattleBannerDozel .text ROM[$1CDA67:$1CDBB8]
      g4bppcBattleBannerYngvi .text ROM[$1CDBB8:$1CDCEF]
      g4bppcBattleBannerChalphy .text ROM[$1CDCEF:$1CDE2B]
      g4bppcBattleBannerNordion .text ROM[$1CDE2B:$1CDF6F]
      g4bppcBattleBannerIsaach .text ROM[$1CDF6F:$1CE0C0]
      g4bppcBattleBannerThracia .text ROM[$1CE0C0:$1CE20F]
      g4bppcBattleBannerVelthomer .text ROM[$1CE20F:$1CE367]
      g4bppcBattleBannerFreege .text ROM[$1CE367:$1CE494]
      g4bppcBattleBannerSilesse .text ROM[$1CE494:$1CE5D0]
      g4bppcBattleBannerEdda .text ROM[$1CE5D0:$1CE706]
      g4bppcBattleBannerBelhalla .text ROM[$1CE706:$1CE845]
      g4bppcBattleBannerLoptr .text ROM[$1CE845:$1CE98C]
      g4bppcBattleBannerDefault .text ROM[$1CE98C:$1CEAEE]

      ; tilemaps
      .text ROM[$1CEAEE:$1CEBED]
      .text ROM[$1CEBED:$1CECA6]

      .fill $DC8000 + $8000 - *, 0

;bank end








        .long $9CD95E, $7E8B9A
        .long $9CDA67, $7E8BBA
        .long $9CDBB8, $7E8BDA
        .long $9CDCEF, $7E8BFA
        .long $9CDE2B, $7E8C1A
        .long $9CDF6F, $7E8C3A
        .long $9CE0C0, $7E8C5A
        .long $9CE20F, $7E8C7A
        .long $9CE367, $7E8C9A
        .long $9CE494, $7E8CBA
        .long $9CE5D0, $7E8CDA
        .long $9CE706, $7E8CFA
        .long $9CE845, $7E8D1A
        .long $9CE98C, $7E8D3A

; 998DD8





      rlDecompressSingle ; 95/A3FB

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR45 = graphics pointer
        ; lR47 = destination

        lda lR45
        sta DecompressionVariables.lSource
        lda lR47
        sta DecompressionVariables.lDest

        sep #$20
        lda lR45+2
        sta DecompressionVariables.lSource+2
        lda lR47+2
        sta DecompressionVariables.lDest+2
        rep #$20

        jsl rlDecompressor
        rtl

        .databank 0

        ; 95/A414


















      rsUnknown959B84 ; 95/9B84

        .al
        .autsiz
        .databank ?

        phx
        phy
        and #$00FF
        asl a
        pha
        asl a
        pha
        asl a
        asl a
        clc
        adc #1,s
        clc
        adc #3,s
        tax
        pla
        pla

        ldy #0

          -
          lda $998944,x
          sta $01C2,b,y
          inc x
          inc x
          inc y
          inc y
          cpy #16
          bcc -

        ldy #0
        
          -
          lda $998944,x
          sta $011A,b,y
          inc x
          inc x
          inc y
          inc y
          cpy #6
          bcc -

        ply
        plx
        rts

        .databank 0

        ; 95/9BC1











      rsUnknown818A4A ; 81/8A4A

        .al
        .autsiz
        .databank ?

        lda aActiveSpriteSystem.aUnknown001300,b,y
        cmp #9
        bne +

          lda #8
          bra _End

        +
        lda aMovingMapSprites.wSpeed,b,x
        cmp #8
        bcc _End

          lda #4
          bra _End

            lda #6

        _End
        rts

        .databank 0

      rsUnknown818A68 ; 81/8A68

        .al
        .autsiz
        .databank ?

        ; Reads scripted movement paths

        lda aActiveSpriteSystem.aUnknown0012E0,b,y
        bit #$0010
        beq +

          ; If set, unload unit as soon as they are offscreen
          jsr rsUnknown818C98
          bcc +

            ; Character is not visible
            jsl rlUnknown818B76
            sec
            rts

        +
        jsr rsUnknown818CBF

        lda aActiveSpriteSystem.aUnknown001320,b,y
        beq +

          clc
          rts

        +
        sty lR19

        lda aMovingMapSprites.wPathScriptAddress,b,x
        sta lR18
        lda aMovingMapSprites.wPathScriptBank,b,x
        sta lR18+1
        lda aMovingMapSprites.wPathScriptOffset,b,x
        tay
        
          _Loop
          lda [lR18],y
          and #$00FF
          cmp #$0080
          bne +

            jsl rlUnknown818B76
            sec
            rts

          +
          bit #$0080
          beq rsUnknown818AD8

          phy
          and #$007F
          asl a
          tay
          lda aScriptedMovementPointers,b,y
          sta lR20
          lda aScriptedMovementPointers+1,b,y
          sta lR20+1
          ply
          inc y
          jsl +
          bcc _Loop

        rts

        +
        jmp (lR20)

        .databank 0

      aScriptedMovementPointers ; 81/8AC6

        .word <>rlUnknown818B76
        .word <>rlUnknown818B5D
        .word <>rlUnknown818BF0
        .word <>rlUnknown818BF9
        .word <>rlUnknown818C13
        .word <>rlUnknown818C5D
        .word <>rlUnknown818C62
        .word <>rlUnknown818C67
        .word <>rlUnknown818C6C

      rsUnknown818AD8 ; 81/8AD8

        .al
        .autsiz
        .databank ?

        ldy #1
        sty wR0

        ldy lR19
        cmp #10
        bcc +

          sbc #9
          pha
          phy
          inc y
          lda aMovingMapSprites.wPathScriptOffset,b,x
          inc a
          sta aMovingMapSprites.wPathScriptOffset,b,x
          tay
          lda [lR18],y
          and #$00FF
          sta wR0
          ply
          pla

        +
        cmp #9
        beq +

          cmp aActiveSpriteSystem.aUnknown001300,b,y
          beq +

            pha
            dec a
            asl a
            asl a
            asl a
            sta wUnknown000911,x
            lda #0
            sta wUnknown0008F1,x
            lda #0
            sta wUnknown000901,x
            pla

        +
        sta aActiveSpriteSystem.aUnknown001300,b,y

        lda aMovingMapSprites.wPathScriptOffset,b,x
        inc a
        sta aMovingMapSprites.wPathScriptOffset,b,x

        phx
        jsr rsUnknown818A4A
        tax
        lda aUnknown818B54,x
        and #$00FF
        xba
        ora wR0
        jsl rlUnsignedMultiply8By8
        sta aActiveSpriteSystem.aUnknown001320,b,y
        plx

        lda aActiveSpriteSystem.aUnknown001300,b,y
        cmp #4
        beq +

          lda #1
          sta aActiveSpriteSystem.aFrameTimer,b,y

        +
        lda #0
        sta aActiveSpriteSystem.aUnknown001340,b,y
        clc
        rts

        .databank 0

      aUnknown818B54 ; 81/8B54

        .byte $80
        .byte $80
        .byte $40
        .byte $20
        .byte $10
        .byte $08
        .byte $04
        .byte $02
        .byte $01

      rlUnknown818B5D ; 81/8B5D

        .al
        .autsiz
        .databank ?

        phy
        tya
        sta aMovingMapSprites.wPathScriptOffset,b,x

        lda aMovingMapSprites.wActiveSpriteOffset,b,x
        tay

        lda aActiveSpriteSystem.aUnknown0012E0,b,y
        and #~$8000
        sta aActiveSpriteSystem.aUnknown0012E0,b,y

        jsl rlUnknown818D58
        ply
        sec
        rtl

        .databank 0

      rlUnknown818B76 ; 81/8B76

        .al
        .autsiz
        .databank ?

        phy
        lda aMovingMapSprites.wActiveSpriteOffset,b,x
        tay

        jsr rsUnknown818B91

        lda #$FFFF
        sta aMovingMapSprites.wActiveSpriteOffset,b,x
        lda #0
        sta aActiveSpriteSystem.aTypeOffset,b,y

        jsl rlUnknown818D58
        ply
        sec
        rtl

        .databank 0

      rsUnknown818B91 ; 81/8B91

        .al
        .autsiz
        .databank ?

        lda aActiveSpriteSystem.aUnknown0012E0,b,y
        bit #$000E
        beq _8BEF

          phx
          phy
          bit #$0008
          bne +

            lda aMovingMapSprites.wUnknown0017CC,b,x
            tax
            jsl rlDeployedUnitUnsetHiddenIfAlive
            bra _End

          +
          lda aMovingMapSprites.wUnknown001814,b,x
          sta wR1
          lda aMovingMapSprites.wXPixelPosition,b,x
          sta wR2
          lda aMovingMapSprites.wYPixelPosition,b,x
          sta wR3
          phx
          lda aMovingMapSprites.wUnknown0017CC,b,x
          tax
          lda wR2
          sta aDeploymentTable._XPixelPosition,x
          lda wR3
          sta aDeploymentTable._YPixelPosition,x
          phx
          jsl rlAddDeployedMapSprite
          plx
          sta aDeploymentTable._DeploymentOffsets,x
          plx
          lda aMovingMapSprites.wUnknown001804,b,x
          xba
          lsr a
          dec a
          ora #$0080
          and #$FFBF
          sta wR0
          lda aMovingMapSprites.wUnknown0017CC,b,x
          tax
          lda wR0
          sta aDeploymentTable._State,x

          _End
          ply
          plx

        _8BEF
        rts

        .databank 0

      rlUnknown818BF0 ; 81/8BF0

        .al
        .autsiz
        .databank ?

        lda #0
        sta aMovingMapSprites.wPathScriptOffset,b,x
        tay
        clc
        rtl

        .databank 0

      rlUnknown818BF9 ; 81/8BF9

        .al
        .autsiz
        .databank ?

        lda [lR18],y
        sta aMovingMapSprites.wPathScriptAddress,b,x
        pha
        inc y
        lda [lR18],y
        sta aMovingMapSprites.wPathScriptBank,b,x
        sta lR18+1
        pla
        sta lR18
        lda #0
        sta aMovingMapSprites.wPathScriptOffset,b,x
        tay
        clc
        rtl

        .databank 0

      rlUnknown818C13 ; 81/8C13

        .al
        .autsiz
        .databank ?

        phx
        lda [lR18],y
        and #$00FF
        sta aMovingMapSprites.wSpeed,b,x
        asl a
        sta wR0
        inc y
        tya
        sta aMovingMapSprites.wPathScriptOffset,b,x

        lda aMovingMapSprites.wActiveSpriteOffset,b,x
        tay
        ldx wR0
        lda aUnknown818C45,x
        sta aActiveSpriteSystem.aUnknown001380,b,y
        lda aUnknown818C51,x
        sta aActiveSpriteSystem.aUnknown0013A0,b,y
        lda #9
        sta aActiveSpriteSystem.aUnknown001300,b,y
        plx
        lda aMovingMapSprites.wPathScriptOffset,b,x
        tay
        clc
        rtl

        .databank 0

      aUnknown818C45 ; 81/8C45

        .word $0000
        .word $2000
        .word $4000
        .word $8000
        .word $0000
        .word $0000

      aUnknown818C51 ; 81/8C51

        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0001
        .word $0002

      rlUnknown818C5D ; 81/8C5D

        .al
        .autsiz
        .databank ?

        lda #1
        bra +

      rlUnknown818C62 ; 81/8C62

        .al
        .autsiz
        .databank ?

        lda #2
        bra +

      rlUnknown818C67 ; 81/8C67

        .al
        .autsiz
        .databank ?

        lda #3
        bra +

      rlUnknown818C6C ; 81/8C6C

        .al
        .autsiz
        .databank ?

        lda #4

        +
        sta wR0

        tya
        sta aMovingMapSprites.wPathScriptOffset,b,x

        lda aMovingMapSprites.wActiveSpriteOffset,b,x
        tay

        lda wR0
        pha

        dec a
        asl a
        asl a
        asl a
        sta wUnknown000911,x
        lda #0
        sta wUnknown0008F1,x
        lda #0
        sta wUnknown000901,x

        pla
        sta aActiveSpriteSystem.aUnknown001300,b,x
        sec
        rtl

        .databank 0

      rsUnknown818C98 ; 81/8C98

        .al
        .autsiz
        .databank ?

        ; Check if moving character is not visible
        ; SEC if yes, CLC if no

        lda aMovingMapSprites.wXPixelPosition,b,x
        sec
        sbc wMapScrollXPixels,b
        cmp #$FFF0
        bcs +

        cmp #$0100
        bcs _SEC

        +
        lda aMovingMapSprites.wYPixelPosition,b,x
        sec
        sbc wMapScrollYPixels,b
        cmp #$FFF0
        bcs +

        cmp #$0100
        bcs _SEC

        +
        clc
        bra +

        _SEC
        sec
        
        +
        rts

        .databank 0

      rsUnknown818CBF ; 81/8CBF

        .al
        .autsiz
        .databank ?

        ; Guess: X panned moving sound effects

        php
        phx
        phy
        lda aMovingMapSprites.wXPixelPosition,b,x
        sec
        sbc wMapScrollXPixels,b
        bmi +

        cmp #16 * 16
        bcc _Continue

        lda #$00FF
        bra _Continue

        +
        lda #0
        bra _Continue

        _Continue
        jsl rlUnknown818CE2
        ply
        plx
        plp
        rts

        .databank 0

      rlUnknown818CE2 ; 81/8CE2

        .al
        .autsiz
        .databank ?

        php
        phx
        phy

        tay
        lda aMovingMapSprites.wMovingSound,b,x
        and #$FF00
        bne +

          jsr $818D23
          bra _End

        +
        xba
        dec a
        bne +

        sep #$20
        sty $04CB,b
        lda #0
        sta $04CC,b
        rep #$20
        ldx #0
        jsl rlUnknown809933
        bra _End

        +
        sep #$20
        sty $04CE,b
        lda #0
        sta $04CF,b
        rep #$20
        ldx #3
        jsl rlUnknown809933

        _End
        ply
        plx
        plp
        rtl

        .databank 0

        ; 81/8D23








      rlUnknown818D58 ; 81/8D58

        .al
        .autsiz
        .databank ?

        ; Sound stuff

        php
        phx
        phy
        lda aMovingMapSprites.wMovingSound,b,x
        pha
        and #$00FF
        sta aMovingMapSprites.wMovingSound,b,x
        pla
        and #$FF00
        beq _End

          xba
          dec a
          bne +

          jsr rsUnknown818D82
          bra _End

          +
          jsr rsUnknown818D95

        _End
        ply
        plx
        plp
        rtl

        .databank 0

      rlUnknown818D7B ; 81/8D7B

        .al
        .autsiz
        .databank ?

        jsr rsUnknown818D82
        jsr rsUnknown818D95
        rtl

        .databank 0

      rsUnknown818D82 ; 81/8D82

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda #$10
        sta $04CA,b
        rep #$20
        ldx #0
        jsl rlUnknown809933
        plp
        rts

        .databank 0

      rsUnknown818D95 ; 81/8D95

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda #$10
        sta $04CD,b
        rep #$20
        ldx #3
        jsl rlUnknown809933
        plp
        rts

        .databank 0

      rsUnknown818DA8 ; 81/8DA8

        .al
        .autsiz
        .databank ?

        lda aActiveSpriteSystem.aUnknown001320,b,y
        dec a
        sta aActiveSpriteSystem.aUnknown001320,b,y

        lda aActiveSpriteSystem.aUnknown001380,b,y
        ora aActiveSpriteSystem.aUnknown0013A0,b,y
        beq _End2

          phx
          lda aActiveSpriteSystem.aUnknown001340,b,y
          clc
          adc aActiveSpriteSystem.aUnknown001380,b,y
          sta aActiveSpriteSystem.aUnknown001340,b,y
          rol a
          and #$0001
          sta wR5
          ror a
          clc
          lda aActiveSpriteSystem.aUnknown0013A0,b,y
          adc wR5
          sta wR5

          lda aActiveSpriteSystem.aUnknown001300,b,y
          bit #$0080
          bne _End

            dec a
            sta wR4

            lda wR4
            cmp #10
            bmi +

              -
              bra -

            +
            asl a
            tax
            jsr (aMovingMapSpritePositionRoutines,x)

            lda aActiveSpriteSystem.aUnknown0012E0,b,y
            bit #$0001
            beq _End

              jsr rsUnknown818E40

          _End
          plx

        _End2
        rts

        .databank 0

      aMovingMapSpritePositionRoutines ; 81/8DF7

        .word <>rsMovingMapSpritePositionLeftwards
        .word <>rsMovingMapSpritePositionRightwards
        .word <>rsMovingMapSpritePositionUpwards
        .word <>rsMovingMapSpritePositionDownwards
        .word <>rsMovingMapSpritePositionDummy
        .word <>rsMovingMapSpritePositionDummy
        .word <>rsMovingMapSpritePositionDummy
        .word <>rsMovingMapSpritePositionDummy
        .word <>rsMovingMapSpritePositionDummy
        .word <>rsMovingMapSpritePositionDummy

      rsMovingMapSpritePositionLeftwards ; 81/8E0B

        .al
        .autsiz
        .databank ?

        ldx aMovingMapSprites.wOffset,b
        lda aMovingMapSprites.wXPixelPosition,b,x
        sec
        sbc wR5
        sta aMovingMapSprites.wXPixelPosition,b,x
        rts

        .databank 0

      rsMovingMapSpritePositionRightwards ; 81/8E18

        .al
        .autsiz
        .databank ?

        ldx aMovingMapSprites.wOffset,b
        lda aMovingMapSprites.wXPixelPosition,b,x
        clc
        adc wR5
        sta aMovingMapSprites.wXPixelPosition,b,x
        rts

        .databank 0

      rsMovingMapSpritePositionUpwards ; 81/8E25

        .al
        .autsiz
        .databank ?

        ldx aMovingMapSprites.wOffset,b
        lda aMovingMapSprites.wYPixelPosition,b,x
        sec
        sbc wR5
        sta aMovingMapSprites.wYPixelPosition,b,x
        rts

        .databank 0

      rsMovingMapSpritePositionDownwards ; 81/8E32

        .al
        .autsiz
        .databank ?

        ldx aMovingMapSprites.wOffset,b
        lda aMovingMapSprites.wYPixelPosition,b,x
        clc
        adc wR5
        sta aMovingMapSprites.wYPixelPosition,b,x
        rts

        .databank 0

      rsMovingMapSpritePositionDummy ; 81/8E3F

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsUnknown818E40 ; 81/8E40

        .al
        .autsiz
        .databank ?

        lda wR5
        sta wMapPixelScrollDistance,b
        sta wMapScrollSpeed,b
        lda aActiveSpriteSystem.aUnknown001300,b,y
        jsr rsGetMapScrollDirectionIdentifierFromCommand
        jsr rsUnknown818E58
        bcs +

          jsl rlUnknown819305
        
        +
        rts

        .databank 0

      rsUnknown818E58 ; 81/8E58

        .al
        .autsiz
        .databank ?

        pha
        lda aActiveSpriteSystem.aUnknown0012C0,b,y
        tax
        lda aMovingMapSprites.wXPixelPosition,b,x
        sec
        sbc wMapScrollXPixels,b
        sta wR0
        lda aMovingMapSprites.wYPixelPosition,b,x
        sec
        sbc wMapScrollYPixels,b
        sta wR1
        pla

        ldx wR0
        cpx #$0100
        bcs _SEC

        ldx wR1
        cpx #$0100
        bcs _SEC

        bit #$0200
        beq +

          jsr $818EAB
          bcs _SEC

        +
        bit #$0100
        beq +

          jsr $818EB3
          bcs _SEC

        +
        bit #$0800
        beq +

          jsr $818EBB
          bcs _SEC

        +
        bit #$0400
        beq +

          jsr $818EC3
          bcs _SEC

        +
        clc
        bra +

        _SEC
        sec

        +
        rts

        .databank 0

        ; 81/8EAB





      rlUnknown809933 ; 80/9933

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb
        sep #$20
        lda $04CA,b,x
        beq _End

        cmp $04D0,b,x
        beq _995D

        cmp #$10
        bne +

        stz $04CA,b,x
        bra _9976

        +
        sta $04D0,b,x
        xba
        lda $04CB,b,x
        lsr a
        lsr a
        lsr a
        cmp #$10
        bcs _9975

        inc a
        bra _9975
        
        _995D
        cpx $04F7,b
        bne _End

        lda #1
        xba
        lda $04CB,b,x
        lsr a
        lsr a
        lsr a
        cmp #$10
        bcs +

        inc a
        
        +
        ora #$80
        ora $04CC,b,x

        _9975
        xba
        
        _9976
        rep #$20
        cpx #0
        beq +

          clc
          adc #$0010

        +
        jsl rlUnknown808FDD
        
        _End
        plb
        plp
        rtl

        .databank 0

        ; 80/9988










      asMapSprite ; 81/88B0

        .word <>rlASMapSpriteInit
        .word <>rlASMapSpriteCycle1
        .word <>aASMapSpriteCode

      rlASMapSpriteInit ; 81/88B6

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = active sprite offset

        txy
        lda aMovingMapSprites.wOffset,b
        tax
        sta aActiveSpriteSystem.aUnknown0012C0,b,y
        tya
        sta aMovingMapSprites.wActiveSpriteOffset,b,x

        lda aMovingMapSprites.wUnknown0017C2,b
        ora #$8000
        sta aActiveSpriteSystem.aUnknown0012E0,b,y

        lda #0
        sta aActiveSpriteSystem.aUnknown001320,b,y
        sta aActiveSpriteSystem.aUnknown001340,b,y
        sta aActiveSpriteSystem.aUnknown001300,b,y

        phx
        jsr rsUnknown818A4A
        asl a
        tax
        lda aUnknown81890B,x
        sta aActiveSpriteSystem.aUnknown001380,b,y
        lda aUnknown81891B,x
        sta aActiveSpriteSystem.aUnknown0013A0,b,y
        plx

        lda #0
        sta wUnknown000911,x
        lda #0
        sta wUnknown0008F1,x
        lda #0
        sta wUnknown000901,x

        lda aActiveSpriteSystem.aUnknown0012E0,b,y
        and #~$4000
        sta aActiveSpriteSystem.aUnknown0012E0,b,y
        rtl

        .databank 0

      aUnknown81890B ; 81/890B

        ; Indexed by the lowest byte of the bitfield in the event movement command

        .word $0000
        .word $2000
        .word $4000
        .word $8000
        .word $0000
        .word $0000
        .word $0000
        .word $0000

      aUnknown81891B ; 81/891B

        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0001
        .word $0002
        .word $0004
        .word $0008

      rlASMapSpriteCycle1 ; 81/892B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = active sprite offset

        txy

        lda bDecompressionArrayFlag,b
        beq +

          jml _End

        +
        lda aMovingMapSprites.wState,b
        cmp #0
        beq _89A8

          lda aActiveSpriteSystem.aUnknown0012C0,b,y
          lsr a
          cmp aMovingMapSprites.wEntryIndex,b
          bne _89A8

            lda aMovingMapSprites.wState,b
            cmp #2
            bne _End

              phx
              lda aMovingMapSprites.wEntryIndex,b
              asl a
              tax
              lda aMovingMapSprites.wActiveSpriteOffset,x
              tax
              lda aActiveSpriteSystem.aUnknown0012E0,x
              bit #$0004
              beq _89A7

                lda aMovingMapSprites.wEntryIndex,b
                asl a
                tax
                lda aEventMovement.aScriptEndXCoordinate,x
                sta wR0
                lda aEventMovement.aScriptEndYCoordinate,x
                xba
                ora wR0
                sta wRoutineVariable1,b
                lda aMovingMapSprites.wCharacterID,b
                ldx aMovingMapSprites.wUnknown001822,b
                jsl rlUnknown84C87A
                bcc +

                  brk

                +
                pha
                lda aMovingMapSprites.wUnknown001824,b
                and #$000F
                jsl rlSetSelectedUnitAI

                lda aMovingMapSprites.wUnknown001824,b
                bit #$0080
                beq +

                  lda #UnitStateGroupLeader
                  jsl rlSetSelectedUnitStates

                +
                lda aMovingMapSprites.wEntryIndex,b
                asl a
                tax
                pla
                sta $17CC,b,x

              _89A7
              plx

        _89A8
        lda #$0008
        tsb $4C07,b

        lda aActiveSpriteSystem.aUnknown0012E0,b,y
        ora #$4000
        sta aActiveSpriteSystem.aUnknown0012E0,b,y

        lda #<>rlASMapSpriteCycle2
        sta aActiveSpriteSystem.aOnCycle,b,x
        
        _End
        rtl

        .databank 0

      rlASMapSpriteCycle2 ; 81/89BE

        .al
        .autsiz
        .databank ?

        txy
        lda aActiveSpriteSystem.aUnknown0012C0,b,y
        tax
        stx aMovingMapSprites.wOffset,b
        cpx #$FFFF
        beq _End

          lda aActiveSpriteSystem.aUnknown0012E0,b,y
          bit #$8000
          beq _End

            phx
            phy
            jsr rsUnknown818A68
            ply
            plx
            bcs _End

              jsr rsUnknown818DA8

        _End
        rtl

        .databank 0

      aASMapSpriteCode ; 81/89E0


0F rsActiveSpriteCommand0F

88 88 98 9D A0 11 A9 01 00 9D 80 11 22 F3 89 81 68 60 8B BD E0 12 89 00 40 F0 44 AE BE 17 BD C4 17 C9 FF FF F0 39 22 FE D7 88 BD D4 17 38 ED 98 05 C9 C0 FF B0 05 C9 40 01 B0 24 18 65 00 85 00 BD DC 17 38 ED 9A 05 C9 F0 FF B0 05 C9 00 01 B0 0E 18 65 02 85 02 BD 04 18 85 0A 22 C7 87 80 AB 6B 00 00 00 00 00 00 00 00 B9 00 13 C9 09 00 D0 05 A9 08 00 80 10 BD FC 17 C9 08 00 90 08 A9 04 00 80 03 A9 06 00 60 B9 E0 12 89 10 00 F0 0B 20 98 8C 90 06 22 76 8B 81 38 60 20 BF 8C B9 20 13 F0 02 18 60 84 27 BD E4 17 85 24 BD EC 17 85 25 BD F4 17 A8 B7 24 29 FF 00 C9 80 00 D0 06 22 76 8B 81 38 60 89 80 00 F0 2E 5A 29 7F 00 0A A8 B9 C6 8A 85 2A B9 C7 8A 85 2B 7A C8 22 C3 8A 81 90 D3 60 6C 2A 00 76 8B 5D 8B F0 8B F9 8B 13 8C 5D 8C 62 8C 67 8C 6C 8C A0 01 00 84 00 A4 27 C9 0A 00 90 17 E9 09 00 48 5A C8 BD F4 17 1A 9D F4 17 A8 B7 24 29 FF 00 85 00 7A 68 C9 09 00 F0 1D D9 00 13 F0 18 48 3A 0A 0A 0A 9F 11 09 00 A9 00 00 9F F1 08 00 A9 00 00 9F 01 09 00 68 99 00 13 BD F4 17 1A 9D F4 17 DA 20 4A 8A AA BF 54 8B 81 29 FF 00 EB 05 00 22 43 99 91 99 20 13 FA B9 00 13 C9 04 00 F0 06 A9 01 00 99 80 11 A9 00 00 99 40 13 18 60 80 80 40 20 10 08 04 02 01 5A 98 9D F4 17 BD C4 17 A8 B9 E0 12 29 FF 7F 99 E0 12 22 58 8D 81 7A 38 6B 5A BD C4 17 A8 20 91 8B A9 FF FF 9D C4 17 A9 00 00 99 00 11 22 58 8D 81 7A 38 6B B9 E0 12 89 0E 00 F0 56 DA 5A 89 08 00 D0 0A BD CC 17 AA 22 83 CB 84 80 43 BD 14 18 85 02 BD D4 17 85 04 BD DC 17 85 06 DA BD CC 17 AA A5 04 9F 3B 45 7E A5 06 9F CB 45 7E DA 22 6E C7 84 FA 9F 5B 46 7E FA BD 04 18 EB 4A 3A 09 80 00 29 BF FF 85 00 BD CC 17 AA A5 00 9F 8B 43 7E 7A FA 60 A9 00 00 9D F4 17 A8 18 6B B7 24 9D E4 17 48 C8 B7 24 9D EC 17 85 25 68 85 24 A9 00 00 9D F4 17 A8 18 6B DA B7 24 29 FF 00 9D FC 17 0A 85 00 C8 98 9D F4 17 BD C4 17 A8 A6 00 BF 45 8C 81 99 80 13 BF 51 8C 81 99 A0 13 A9 09 00 99 00 13 FA BD F4 17 A8 18 6B 00 00 00 20 00 40 00 80 00 00 00 00 00 00 00 00 00 00 00 00 01 00 02 00 A9 01 00 80 0D A9 02 00 80 08 A9 03 00 80 03 A9 04 00 85 00 98 9D F4 17 BD C4 17 A8 A5 00 48 3A 0A 0A 0A 9F 11 09 00 A9 00 00 9F F1 08 00 A9 00 00 9F 01





      rlUnknown8189F3 ; 81/89F3

        .al
        .autsiz
        .databank ?

        phb
        lda aActiveSpriteSystem.aUnknown0012E0,b,x
        bit #$4000
        beq _End

          ldx aMovingMapSprites.wOffset,b
          lda aMovingMapSprites.wActiveSpriteOffset,b,x
          cmp #$FFFF
          beq _End

            jsl rlUnknown88D7FE

            lda aMovingMapSprites.wXPixelPosition,b,x
            sec
            sbc wMapScrollXPixels,b
            cmp #$FFC0
            bcs +

              cmp #$0140
              bcs _End

            +
            clc
            adc wR0
            sta wR0

            lda aMovingMapSprites.wYPixelPosition,b,x
            sec
            sbc wMapScrollYPixels,b
            cmp #$FFF0
            bcs +

              cmp #$0100
              bcs _End

            +
            clc
            adc wR1
            sta wR1
            lda aMovingMapSprites.wUnknown001804,b,x
            sta wR5
            jsl rlPushToOAMBuffer

        _End
        plb
        rtl

        .databank 0

        ; 81/8A42






      aOAMUpperXBitTable ; 80/83C7

        .for i=0, i<16, i+=1

          .for n=0, n<16, n+=1

            .word 1 << n

          .endfor

        .endfor

      aOAMSizeBitTable ; 80/85C7

        .for i=0, i<16, i+=1

          .for n=0, n<16, n+=2

            .word <>aSpriteExtBuffer + (i*2)
            .word 3 << n

          .endfor

        .endfor

      rlPushToOAMBuffer ; 80/87C7

        .al
        .autsiz
        .databank ?

        ; Inputs:
        ; Y: Pointer to sprite array
        ; DB: Bank of sprite array
        ; wR0: X Coordinate base in pixels
        ; wR1: Y Coordinate base in pixels
        ; wR4: Sprite base
        ; wR5: Attribute base

        lda structSpriteArray.SpriteCount,b,y
        bne +

          rtl

        +
        sta wR2
        inc y
        inc y

        ldx wNextFreeSpriteOffset,b
        clc
        
        _Loop
        lda structSpriteEntry.X,b,y
        bpl _SmallSprite

        ; Large Sprite
        adc wR0
        sta aSpriteBuffer,b,x
        bit #$0100
        bne _LargeSpriteXNegative

        lda aOAMSizeBitTable,x
        sta wR3
        lda (wR3)
        ora aOAMUpperXBitTable+2,x
        bra _8808

        _SmallSprite
        adc wR0
        sta aSpriteBuffer,b,x
        bit #$0100
        beq _SmallSpriteXPositive

        lda aOAMSizeBitTable,x
        sta wR3
        lda (wR3)
        ora aOAMUpperXBitTable,x
        
        _8808
        sta (wR3)

        _SmallSpriteXPositive
        lda structSpriteEntry.Y,b,y
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80

        +
        clc
        adc wR1
        sta aSpriteBuffer+1,b,x
        adc #$0010
        cmp #$0100
        bcs _8849

        lda structSpriteEntry.Attr,b,y
        clc
        adc wR4
        ora wR5
        sta aSpriteBuffer+2,b,x

        -
        txa
        clc
        adc #size(structPPUOAMEntry)
        and #$01FF
        tax

        tya
        adc #size(structSpriteEntry)
        tay

        dec wR2
        bne _Loop

        stx wNextFreeSpriteOffset,b
        rtl

        _8849
        lda #240
        sta aSpriteBuffer+1,b,x
        bra -

        _LargeSpriteXNegative
        lda aOAMSizeBitTable,x
        sta wR3
        lda (wR3)
        ora aOAMSizeBitTable+2,x
        bra _8808

        .databank 0

        ; 80/885F













      rlUnknown88D7FE ; 88/D7FE

        .al
        .autsiz
        .databank ?

        ; X = active mover offset

        phk
        plb
        lda aUnknown88D837,x
        trb wUnknown000921,b
        lda aUnknown88D83F,x
        trb wUnknown000921,b

        lda aMovingMapSpritesMapSprites,b,x
        and #$8000
        bne +

        ; Short
        jsr rsUnknown88D847
        lda wUnknown000901,x
        sec
        sbc #1
        sta wUnknown000901,x
        bra ++

        ; Tall
        +
        jsr rsUnknown88D963
        lda wUnknown000901,x
        sec
        sbc #1
        sta wUnknown000901,x

        +
        rtl

        .databank 0

      aUnknown88D837 ; 88/D837

        .word $0001
        .word $0002
        .word $0004
        .word $0008

      aUnknown88D83F ; 88/D83F

        .word $8000
        .word $4000
        .word $2000
        .word $1000

      rsUnknown88D847 ; 88/D847

        .al
        .autsiz
        .databank ?

        ; X = active mover offset

        ; For short map sprites

        lda wUnknown000901,x
        beq +

          jml _End

        +
        lda wUnknown000921,b
        beq ++

          and #$FF00
          beq +

            inc wUnknown000901,b,x
            jml _End

          +
          lda aUnknown88D95B,x
          tsb wUnknown000921,b

        +
        lda aUnknown88D953,x
        tsb wUnknown000921,b

        lda aMovingMapSpritesMapSprites,b,x
        and #$7FFF
        tay
        lda aUnknown88CBE8,b,y
        and #$00FF
        sta wUnknown000901,x

        lda wUnknown0008F1,x
        clc
        adc #1
        and #$0003
        sta wUnknown0008F1,x

        lda wUnknown0008F1,x
        cmp #0
        beq _D8A8

        cmp #1
        beq _D8AD

        cmp #2
        beq _D8B2

        cmp #3
        beq _D8B7

        _D8A8
        lda #size(Tile4bpp) * 0
        bra +

        _D8AD
        lda #size(Tile4bpp) * 5
        bra +

        _D8B2
        lda #size(Tile4bpp) * 10
        bra +

        _D8B7
        lda #size(Tile4bpp) * 15
        bra +

        +
        sta $07E6,b

        ; Check for direction of movement
        lda wUnknown000911,x
        cmp #0
        beq _D8D7

        cmp #8
        beq _D8DC

        cmp #$0010
        beq _D8E1

        cmp #$0018
        beq _D8E6

        _D8D7
        lda #0
        bra +

        _D8DC
        lda #$0500
        bra +

        _D8E1
        lda #$0A00
        bra +

        _D8E6
        lda #$0F00
        bra +

        +
        clc
        adc $07E6,b
        sta $07E6,b

        jsr (aUnknown88D94B,x)

        lda $07EA,b
        clc
        adc $07E6,b
        sta lR18

        lda #$00A0
        sta wR0

        lda #$C400 >> 1
        clc
        adc aUnknown88DB04,x
        sta wR1
        phx
        jsl rlDMAByPointer
        plx

        lda $07EA,b
        clc
        adc #$00A0
        clc
        adc $07E6,b
        sta lR18

        lda #$00A0
        sta wR0

        lda #$C600 >> 1
        clc
        adc aUnknown88DB04,x
        sta wR1
        phx
        jsl rlDMAByPointer
        plx

        _End
        sep #$20
        lda #$88
        pha
        plb
        rep #$20

        stz wR0
        stz wR1
        lda aUnknown88DAFC,x
        sta wR4
        ldy #$CC5F
        rts

        .databank 0

      aUnknown88D94B ; 88/D94B

        .word <>rsUnknown88DA82
        .word <>rsUnknown88DA99
        .word <>rsUnknown88DABA
        .word <>rsUnknown88DADB

      aUnknown88D953 ; 88/D953

        .word $0001
        .word $0002
        .word $0004
        .word $0008

      aUnknown88D95B ; 88/D95B

        .word $8000
        .word $4000
        .word $2000
        .word $1000

      rsUnknown88D963 ; 88/D963

        .al
        .autsiz
        .databank ?

        lda wUnknown000901,x
        beq +

          jml _End

        +
        lda wUnknown000921,b
        beq ++

          and #$FF00
          beq +

            inc wUnknown000901,b,x
            jml _End

          +
          lda $88DA7A,x
          tsb wUnknown000921,b

        +
        lda aUnknown88DA72,x
        tsb wUnknown000921,b

        lda $0867,b,x
        and #$7FFFF
        tay
        lda aUnknown88CBE8,b,y
        and #$00FF
        sta wUnknown000901,x

        lda wUnknown0008F1,x
        clc
        adc #1
        and #$0003
        sta wUnknown0008F1,x

        lda wUnknown0008F1,x
        cmp #0
        beq _D9C4

        cmp #1
        beq _D9C9

        cmp #2
        beq _D9CE

        cmp #3
        beq _D9D3
        
        _D9C4
        lda #0
        bra +

        _D9C9
        lda #$0200
        bra +

        _D9CE
        lda #$0400
        bra +

        _D9D3
        lda #$0600
        bra +

        +
        sta $07E6,b

        lda wUnknown000911,x
        xba
        clc
        adc $07E6,b
        sta $07E6,b

        jsr (aUnknown88DA6A,x)

        lda $07EA,b
        clc
        adc $07E6,b
        sta lR18

        lda #size(Tile4bpp) * 4
        sta wR0

        lda #$C400 >> 1
        clc
        adc aUnknown88DB04,x
        sta wR1
        phx
        jsl rlDMAByPointer
        plx

        lda $07EA,b
        clc
        adc #$0100
        clc
        adc $07E6,b
        sta lR18

        lda #size(Tile4bpp) * 4
        sta wR0

        lda #$C600 >> 1
        clc
        adc aUnknown88DB04,x
        sta wR1
        phx
        jsl rlDMAByPointer
        plx

        _End
        sep #$20
        lda #$88
        pha
        plb
        rep #$20

        phx
        lda $0867,b,x
        and #$7FFF
        asl a
        tax
        lda $88D488,x
        sta wR3
        plx

        lda wUnknown0008F1,x
        asl a
        clc
        adc wUnknown000911,x
        clc
        adc wR3
        tay
        lda $D4C6,b,y
        and #$00FF
        sta wR0
        lda $D4C7,b,y
        and #$00FF
        sta wR1
        lda aUnknown88DAFC,x
        sta wR4
        ldy #$CC49
        rts

        .databank 0

      aUnknown88DA6A ; 88/DA6A

        .word <>rsUnknown88DA82
        .word <>rsUnknown88DA99
        .word <>rsUnknown88DABA
        .word <>rsUnknown88DADB

      aUnknown88DA72 ; 88/DA72

        .word $0001
        .word $0002
        .word $0004
        .word $0008

      aUnknown88DA7A ; 88/DA7A

        .word $8000
        .word $4000
        .word $2000
        .word $1000

      rsUnknown88DA82 ; 88/DA82

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers)<<8
        sta lR18+1
        lda #<>aMovingMapSpriteBuffers
        sta lR18
        lda #(`aMovingMapSpriteBuffers)<<8
        sta $07EA+1,b
        lda #<>aMovingMapSpriteBuffers
        sta $07EA,b
        rts

        .databank 0

      rsUnknown88DA99 ; 88/DA99

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers)<<8
        sta lR18+1
        lda #<>aMovingMapSpriteBuffers
        sta lR18
        lda #(`aMovingMapSpriteBuffers)<<8
        sta $07EA,b
        lda #<>aMovingMapSpriteBuffers
        sta $07EA,b

        lda $07EA,b
        clc
        adc #$2000
        sta $07EA,b
        rts

        .databank 0

      rsUnknown88DABA ; 88/DABA

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers)<<8
        sta lR18+1
        lda #<>aMovingMapSpriteBuffers
        sta lR18
        lda #(`aMovingMapSpriteBuffers)<<8
        sta $07EB,b
        lda #<>aMovingMapSpriteBuffers
        sta $07EA,b

        lda $07EA,b
        clc
        adc #$4000
        sta $07EA,b
        rts

        .databank 0

      rsUnknown88DADB ; 88/DADB

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers)<<8
        sta lR18+1
        lda #<>aMovingMapSpriteBuffers
        sta lR18
        lda #(`aMovingMapSpriteBuffers)<<8
        sta $07EB,b
        lda #<>aMovingMapSpriteBuffers
        sta $07EA,b

        lda $07EA,b
        clc
        adc #$6000
        sta $07EA,b
        rts

        .databank 0

      aUnknown88DAFC ; 88/DAFC

        .word $0000
        .word $0008
        .word $0020
        .word $0028

      aUnknown88DB04 ; 88/DB04

        .word $0000 >> 1
        .word $0100 >> 1
        .word $0400 >> 1
        .word $0500 >> 1

        ; 88/DB0C









      rsUnknown91BF17 ; 91/BF17

        .al
        .autsiz
        .databank ?

        phy

        lda [$30],y
        and #$00FF
        sta $04BA,b
        lda #(`$828AF2)<<8
        sta $62+1
        lda #<>$828AF2
        sta $62
        jsl rlEventEngineCreateProc

        ply
        inc y
        sty wActiveEventOffset,b

        sec
        rts

        .databank 0

        ; 91/BF35







































      rlFindCharacterByGenerationID ; 84/8726

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = GenerationID

        ; Output:
        ; CLC if successful
        ; Filled wSelectedUnitDataRAMPointer

        phb
        phx
        phy
        ldx wR34
        phx
        ldx wR35
        phx

        sta wR34

        sep #$20
        lda #`aUnitRAMPointers
        pha
        rep #$20
        plb

        lda aUnitRAMPointers._Entry[0],b,x
        and #$00FF
        asl a
        sta wR35

        ldx #0

          -
          lda aUnitRAMPointers._Entry[0],b,x
          sta wSelectedUnitDataRAMPointer,b
          tay
          lda structCharacterDataRAM.Type,b,y
          and #$00FF
          cmp #UnitTypeHoly
          bcs +

            jsl rlGetSelectedUnitGenerationID
            cmp wR34
            beq _CLC

          +
          inc x
          inc x
          cpx wR35
          bcc -

        stz wSelectedUnitDataRAMPointer,b
        sec

        -
        pla
        sta wR35
        pla
        sta wR34
        ply
        plx
        plb
        rtl

        _CLC
        clc
        bra -

        .databank 0

      rlUnknown848776 ; 84/8776

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx
        lda wR2
        pha

        stz wR2
        ldx #len(aDeploymentTable._State)-2

          _Loop
          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq +

            inc wR2
            lda aDeploymentTable._XTilePosition,x
            cmp wR0
            bne +

              lda aDeploymentTable._YTilePosition,x
              cmp wR1
              beq _CLC

          +
          lda wR2
          cmp wDeployedUnitsCount,b
          bcs _SEC

          dec x
          dec x
          bpl _Loop

        _SEC
        sec
        bra +

        _CLC
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        txa
        clc

        +
        pla
        sta wR2
        plx
        plb
        rtl

        .databank 0

      rlLoadUnitGroup ; 84/87BA

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR18 = UNITGroupPointer entry
        ; lR19 = Pointer to child replacement data

        phb
        php
        phk
        plb
        phx
        phy
        lda #1
        sta wR0

        ldy lR18
        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        _Loop
        lda structUNITEntry.CharacterID,b,y
        bne +

          jml _Next

        +
        cmp #$FFFF
        bne +

          jml _End

        +
        jsr rsLoadUnitGroupTryReplaceCharacterIDWithChild
        sta wRoutineVariable1,b

        lda structUNITEntry.FactionSlot,b,y
        and #$00FF
        tax

        lda wRoutineVariable1,b
        jsl rlGetUnitRAMDataPointerByID
        bcs +

          jsl rlGetSelectedUnitStates
          bit #UnitStateFielded
          beq ++

        +
        cpx #0
        beq _Next

        lda wRoutineVariable1,b
        jsl rlLoadUnit

        +
        txa
        jsl rlAssignUnitToFactionSlot
        jsr rsUnknown8488AE
        bcs +

        lda structUNITEntry.DestinationCoords,b,y
        sta wRoutineVariable1,b
        jsl rlUnknown84AEC0

        +
        lda structUNITEntry.AI,b,y
        and #$00FF
        jsl rlSetSelectedUnitAI

        jsl rlGetSelectedUnitClassID
        cmp #Civilian
        beq +

          cmp #Child
          beq +

            lda structUNITEntry.GroupLeaderFlag,b,y
            bit #$0001
            beq +

              lda #UnitStateGroupLeader
              jsl rlSetSelectedUnitStates

        +
        lda wRoutineVariable1,b
        tax
        jsl rlGetTerrainTypeByDeploymentOffset
        cmp #TerrainCastle
        bne +

          jsl rlUnknown84CFBF

        +
        lda structUNITEntry.FormationID,b,y
        and #$00FF
        jsl rlSetFormationIDByDeploymentOffset

        _Next
        inc wR0
        tya
        clc
        adc #size(structUNITEntry)
        tay
        jml _Loop

        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsLoadUnitGroupTryReplaceCharacterIDWithChild ; 84/8873

        .al
        .autsiz
        .databank ?

        lda lR19
        ora lR19+1
        beq _End

          lda structUNITEntry.CharacterID,b,y
          sta wR10
          phb
          phy

          ldy lR19
          sep #$20
          lda lR19+2
          pha
          rep #$20
          plb

          lda $0000,b,y
          and #$00FF
          jsl rlCheckPermanentEventFlagSet
          bcc +

          lda $0001,b,y
          cmp wR10
          bne +

          lda $0003,b,y
          bra ++

          +
          ply
          plb
          bra _End

          +
          ply
          plb
          bra +

        _End
        lda structUNITEntry.CharacterID,b,y

        +
        rts

        .databank 0

      rsUnknown8488AE ; 84/88AE

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = ?

        ; Output:
        ; SEC if a new unit was deployed

        ldx #size(aDeploymentTable._UnitRAMPointer)

        _Loop
        lda aDeploymentTable._UnitRAMPointer,x
        beq _Next

          cmp #$2000
          bge _Next

            cmp wR0
            bne _Next

              lda wSelectedUnitDataRAMPointer,b
              sta aDeploymentTable._UnitRAMPointer,x
              jsl rlDeployedUnitUnsetHiddenIfAlive
              bra +

        _Next
        dec x
        dec x
        bpl _Loop

        clc
        rts

        +
        txa
        jsl rlSetSelectedUnitDeploymentOffset
        lda #UnitStateFielded
        jsl rlSetSelectedUnitStates
        jsl rlGetSelectedUnitFactionSlot
        sta aDeploymentTable._FactionSlot,x
        stx wRoutineVariable1,b
        sec
        rts

        .databank 0

        ; 84/88EC

























Ishtore Death Quote $8EEA40


07 
00 3D OpenBox
00 3F LoadPortrait
52 02 
09 StartText

86 
61 
92 
BF 
BF 
BF 

0A 
AA 
09 
29 
BF 
BF 
BF 

02 NewLine

00 1D C8  PauseText $C8

01 EndText 



; EA5A
07 
00 3D OpenBox
00 3F LoadPortrait
52 02 
09 

86 
61 
92 
BF 
BF 
BF 

02 NewLine

10 23 29 
1F 28 3D 0A 18 09 48 47 BF BF BF 


02 NewLine
00 1D C8 PauseText $C8
01 EndText









































      aUnknown809B01 ; 80/9B01

        .long $809B00
        .long $868010
        .long $868011
        .long $86803E
        .long $91D616
        .long $91D617
        .long $91D61B
        .long $898000
        .long $898004
        .long $8980E0
        .long $8A8000
        .long $8A800E
        .long $8A8061
        .long $8B96CF
        .long $8B96E5
        .long $8B9717
        .long $81A800
        .long $81A813
        .long $81A89D ; event main loop routine?
        .long $8BA7CB
        .long $8BA7CC
        .long $8BA7CD
        .long $80C1A0
        .long $80C1CA
        .long $95E5C9
        .long $95E5DB
        .long $9BDC24
        .long $9BDCBB
        .long $9FFACC
        .long $9FFACC
        .long $9FFACC
        .long $9FFACC
        .long $8BA851
        .long $8BA7F2
        .long $8BA81F
        .long $89B883
        .long $89B3D7
        .long $89B3E7
        .long $89E7EA
        .long $89E7BD
        .long $89E7CC
        .long $89ECC7
        .long $89EB26
        .long $89EB40
        .long $8BD8FE
        .long $8BD794
        .long $8BD7AA
        .long $8BD13D
        .long $8BCF0A
        .long $8BCF20
        .long $89B0AA
        .long $89ACCE
        .long $89ACE7
        .long $8DA06A
        .long $8DA06B
        .long $8DA0B7

      rlUnknown809BA9 ; 80/9BA9

        .al
        .autsiz
        .databank ?

        phb

        lda $0302,b
        asl a
        adc $0302,b
        jsr rsUnknown809BC0

        lda $0300,b
        asl a
        adc $0300,b
        jsr rsUnknown809BC0

        plb
        rtl

        .databank 0

      rsUnknown809BC0 ; 80/9BC0

        .al
        .autsiz
        .databank ?

        tax
        sep #$20
        lda aUnknown809B01+2,x
        cmp #$7D
        beq +

          sta $24+2

          pha
          plb

          rep #$20
          lda aUnknown809B01,x
          sta $24
          jsl rlUnknown809BEB
          rep #$30
          rts

        +
        rep #$20
        lda aUnknown809B01,x
        sta $0302,b
        jml $809BDB

        .databank 0

      rlUnknown809BEB ; 80/9BEB

        .al
        .autsiz
        .databank ?

        jml [$24]

        .databank 0

        ; 80/9BEE








      rlUnknown81A89D ; 81/A89D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsl rlUnknown81B15A
        jsl rlUnknown81B088
        bcc +

          jsl rlUnknown81AB3F
          bra _End

        +
        lda wUnknown00171A,b
        bne +

          jsl rlUnknown81ADD8
          bcs _End

            jsr rsUnknown81AF38
            bcs _End

              jsr rsUnknown81AFD4
              bcs _End

                jsr rsUnknown81AF16
                bcs _End

                  jsr rsUnknown81B0E5
                  bcs _End

                    jsr rsUnknown81B116

        +
        lda $0304,b
        cmp #$000D
        bmi +

          -
          bra -

        +
        asl a
        tax
        jsr (aUnknown81A8F8,x)

        lda $0304,b
        sta $0D7B,b

        lda wUnknown00171A,b
        beq _End

          jsl rlUnknown88A12B
          jsl rlUnknown888560

        _End
        plp
        plb
        rtl

        .databank 0

      aUnknown81A8F8 ; 81/A8F8

        .word <>rsUnknown81A912 ; 0
        .word <>rsUnknown81A93B ; 1
        .word <>rsUnknown81A968 ; 2
        .word <>rsUnknown81A9A6 ; 3
        .word <>rlUnknown81AB6B ; 4
        .word <>rsUnknown81AB90 ; 5
        .word <>rsUnknown81AC4E ; 6
        .word <>rsUnknown81AC9C ; 7

        .word <>rsUnknown81ACD4 ; 8
        .word <>rsUnknown81ACFE ; 9
        .word <>rsUnknown81AD1C ; 10
        .word <>rsUnknown81AD28 ; 11
        .word <>rsUnknown81AD6A ; 12

      rsUnknown81A912 ; 81/A912

        .al
        .autsiz
        .databank ?

        ; Update status and miracle for all units in all factions

        lda wUnknown00171A,b
        bne _End

        lda wCurrentTurn,b
        inc a
        cmp #1000
        bcc +

          lda #999

        +
        sta wCurrentTurn,b

        lda #0
        sta wActiveFactionSlot,b

        ldy #6
        
          -
          tya
          jsl rlUnknown84C104
          dec y
          bpl -

        inc $0304,b
        
        _End
        rts

        .databank 0

      rsUnknown81A93B ; 81/A93B

        .al
        .autsiz
        .databank ?

        lda $0DAD,b
        beq _INC
        bpl _DEC

          lda wActiveFactionSlot,b
          jsl rlUnknown84C5D7
          bcc _INC

            jsr rsGetActiveFactionSongID
            bcc _INC

              lda #$00E0
              jsl rlUnknown808FA3
              lda #$0020
              sta $0DAD,b
              bra +

                _DEC
                dec $0DAD,b
                bra + 

        _INC
        inc $0304,b

        +
        rts

        .databank 0

      rsUnknown81A968 ; 81/A968

        .al
        .autsiz
        .databank ?

        ; does phase transition banner?

        lda wUnknown00171A,b
        bne _End

          lda #$1000
          trb wUnknown000D79,b

          lda wActiveFactionSlot,b
          jsl rlUnknown84C5D7
          bcc +

            lda #1
            sta $0508,b
            lda #1
            sta $0500,b
            jsl rlUnknown81A9D4

            lda #(`$85ABF6)<<8
            sta $62+1
            lda #<>$85ABF6
            sta $62
            jsl rlProcEngineCreateProc

            lda #$0040
            trb $0788,b
            bra +

          +
          inc $0304,b
        
        _End
        rts

        .databank 0

      rsUnknown81A9A6 ; 81/A9A6

        .al
        .autsiz
        .databank ?

        ; sets up turn events

        lda #0
        sta $0508,b
        lda #$0021
        sta bEventActionIdentifier,b

        lda wCurrentTurn,b
        sta wEventEngineArgument1,b

        lda wActiveFactionSlot,b
        sta wEventEngineArgument2,b
        lda #0
        sta wEventEngineArgument3,b
        lda #0
        sta wEventEngineArgument4,b
        jsl rlGetAndRunChapterMapEventConditions
        bcc +

        +
        inc $0304,b

        rts

        .databank 0

      rlUnknown81A9D4 ; 81/A9D4

        .al
        .autsiz
        .databank ?

        lda wUnknown000D79,b
        bit #$4000
        beq +

          jsr rsGetActiveFactionSongID
          bcc _End

            sta $0DAB,b
            jsl rlUnknown81AB26
            bra _End

        +
        ora #$4000
        sta wUnknown000D79,b

        jsr rsUnknown81AAFB
        jsr rsGetActiveFactionSongID
        sta $0DAB,b
        
        _End
        lda #$FFFF
        sta $0DAD,b
        rtl

        .databank 0

      rsGetActiveFactionSongID ; 81/AA00

        .al
        .autsiz
        .databank ?

        ; Returns CLC if faction name out of bounds or phase has no faction name assigned
        ; Returns SEC if phase song found

        lda wActiveFactionSlot,b
        bne +

          jsl rlGetVictoryThemeIfAllEnemiesDead
          bcs _SEC

            lda wCurrentChapter,b
            asl a
            tax
            lda aPlayerPhaseChapterSongIDs,b
            bra _SEC

        +
        ldx #0
        jsl rlGetFactionRelation
        cmp #AllegianceNeutral
        beq _NPC

          cmp #AllegianceOther
          beq _Yellow

            lda wActiveFactionSlot,b
            jsl rlGetFactionSlotNameID
            bit #$0080
            bne _CLC

              asl a
              cmp #53 * size(word)
              bcs _CLC

                tax
                lda aNonPlayerFactionPhaseSongIDs,x
                bra _SEC

          _NPC
          lda #$001D
          bra _SEC

        _Yellow
        lda #$002A

        _SEC
        sec

        -
        rts

        _CLC
        clc
        bra -

        .databank 0

      aPlayerPhaseChapterSongIDs ; 81/AA4D

        .word $0011
        .word $0013
        .word $002C
        .word $001C
        .word $0014
        .word $002B
        .word $0012
        .word $0018
        .word $001E
        .word $0024
        .word $001B
        .word $002D

      aNonPlayerFactionPhaseSongIDs ; 81/AA65

        .word $0022
        .word $0022
        .word $0022
        .word $0022
        .word $0022
        .word $0022
        .word $0022
        .word $0019
        .word $0019
        .word $0019
        .word $0019
        .word $0019
        .word $0019
        .word $0019
        .word $0027
        .word $0027
        .word $0027
        .word $0027
        .word $0027
        .word $0023
        .word $001F
        .word $001F
        .word $001F
        .word $001F
        .word $0019
        .word $0026
        .word $0026
        .word $0026
        .word $0026
        .word $0026
        .word $0025
        .word $0025
        .word $0025
        .word $0021
        .word $0021
        .word $0021
        .word $0021
        .word $0029
        .word $0029
        .word $0029
        .word $0029
        .word $0028
        .word $0028
        .word $0028
        .word $0028
        .word $0028
        .word $0017
        .word $0017
        .word $0017
        .word $0017
        .word $0017
        .word $0017
        .word $0017

      rlGetVictoryThemeIfAllEnemiesDead ; 81/AACF

        .al
        .autsiz
        .databank ?

        ; Returns SongID $20 and SEC aka victory theme if all enemies are dead.
        ; Returns CLC otherwise

        phx
        lda wActiveFactionSlot,b
        bne _CLC

          ldx #(72 -1) * size(word)
          
            -
            lda aDeploymentTable._StateBuffer,x
            bit #DeploymentStateAlive
            beq _Next

              bit #DeploymentStateHidden
              bne _Next

                and #DeploymentAllegianceMask
                cmp #AllegianceEnemy
                beq _CLC

            _Next
            dec x
            dec x
            bpl -

          lda #$0020
          sec

          -
          plx
          rtl
        
        _CLC
        clc
        bra -

        .databank 0

      rsUnknown81AAFB ; 81/AAFB

        .al
        .autsiz
        .databank ?

        ; Loads enemy music?

        jsl rlGetVictoryThemeIfAllEnemiesDead
        bcs +

          lda wCurrentChapter,b
          asl a
          tax
          lda aUnknown81AB0E,x

        +
        sta $04BA,b
        rts

        .databank 0

      aUnknown81AB0E ; 81/AB0E

        ; Song IDs?

        .word $0011
        .word $0013
        .word $002C
        .word $001C
        .word $0014
        .word $002B
        .word $0012
        .word $0018
        .word $001E
        .word $0024
        .word $001B
        .word $002E

      rlUnknown81AB26 ; 81/AB26

        .al
        .autsiz
        .databank ?

        lda $04F6,b
        bit #$0002
        beq +

        lda $0DAB,b
        cmp $0510,b
        beq _End

        +
        lda $0DAB,b
        beq _End

        sta $04BA,b
        
        _End
        rtl

        .databank 0

      rlUnknown81AB3F ; 81/AB3F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsl rlGetVictoryThemeIfAllEnemiesDead
        bcc _End

          sta $0DAB,b
          sta aProcSystem.wInput0,b

          lda wUnknown00171A,b
          bne _End

            lda #$00E1
            sta aProcSystem.wInput1,b

            lda #(`$8283E3)<<8
            sta lR44+1
            lda #<>$8283E3
            sta lR44
            jsl rlProcEngineCreateProc

        _End
        plp
        plb
        rtl

        .databank 0

      rlUnknown81AB6B ; 81/AB6B

        .al
        .autsiz
        .databank ?

        lda wUnknown00171A,b
        bne _End

          jsl $84C33D

          lda wActiveFactionSlot,b
          jsl rlRunTurnStartEffectsForAllUnitsInFaction
          jsl rlUnknown869CE4

          lda wActiveFactionSlot,b
          jsl rlUnknown84C5D7
          bcc +

            jsl rlUnknown81A9D4

          +
          inc $0304,b
        
        _End
        rts

        .databank 0

      rsUnknown81AB90 ; 81/AB90

        .al
        .autsiz
        .databank ?

        ; Handle turn start healing animations?

        lda $7E2002,b
        beq _ABF1

          lda $7E2000
          tax
          clc
          adc #5
          lda $7E2000

          lda $7E2006,x
          and #$00FF
          sta $0ECF,b

          lda $7E2007,x
          and #$00FF
          xba
          ora $0ECF,b
          sta $0ECF,b

          lda $7E2008,b
          and #$00FF
          sta $0ED1,b

          lda $7E2005,b
          and #$00FF
          sta $0ED3,b

          lda $7E2004,b
          and #$00FF
          sta $0ED5,b

          lda #(`$85CA85)<<8
          sta $62+1
          lda #<>$85CA85
          sta $62
          jsl rlProcEngineCreateProc

          lda $7E2002
          dec a
          sta $7E2002
          rts

        _ABF1
        jsl $85C0D5

        lda #$0004
        tsb $0788,b

        jsr rsUnknown81AC02
        inc $0304,b
        rts

        .databank 0

      rsUnknown81AC02 ; 81/AC02

        .al
        .autsiz
        .databank ?

        lda wActiveFactionSlot,b
        bne _End

          lda wCurrentTurn,b
          cmp #1
          beq +

            jsl $87C02F
            cmp #0
            beq +

              lda $0D75,b
              and #$00FF
              sta $14
              lda $0D76,b
              and #$00FF
              sta $16
              jsl $848E5D
              bra _End
          
          +
          lda #1
          sta wRoutineVariable1,b
          lda #0
          jsl rlFindGenerationIDInFactionSlotData

          lda wSelectedUnitDataRAMPointer,b
          beq _End

            jsl rlGetSelectedUnitDeploymentOffset
            ora #0
            bmi _End

              jsl rlUnknown88B4DB
        
        _End
        rts

        .databank 0

      rsUnknown81AC4E ; 81/AC4E

        .al
        .autsiz
        .databank ?

        lda wCurrentTurn,b
        cmp #1
        beq _INC

          lda wActiveFactionSlot,b
          bne _INC

            jsl $87BFB0
            ora #0
            beq _INC

              lda #(`$85CA85)<<8
              sta $62+1
              lda #<>$85CA85
              sta $62
              jsl rlProcEngineFindProc
              bcs _End

                jsl rlUnknown88A12B
                jsl rlUnknown888560

                lda wUnknown0007D8,b
                bne _End

                  lda #1
                  sta $0ECF,b
                  lda #(`$85A47F)<<8
                  sta $62+1
                  lda #<>$85A47F
                  sta $62
                  jsl rlProcEngineCreateProc
                  bra _INC
              
              _End
              rts
        
        _INC
        inc $0304,b
        rts

        .databank 0

      rsUnknown81AC9C ; 81/AC9C

        .al
        .autsiz
        .databank ?

        ; Routine waits for some kind of input?

        lda wUnknown00171A,b
        bne +

          jsr rsUnknown81AD8E
          lda wUnknown0007D8,b
          bne +
        
        +
        lda $0D87,b
        bit #$0020
        bne +

          lda wUnknown000D79,b
          bit #$0200
          bne +

            jsl rlUnknown88A12B
            jsl rlUnknown888560
        
        +
        lda $0D87,b
        bit #$0020
        bne +

          rts
        
        +
        lda #$0020
        trb $0D87,b
        inc $0304
        rts

        .databank 0

      rsUnknown81ACD4 ; 81/ACD4

        .al
        .autsiz
        .databank ?

        lda wActiveFactionSlot,b
        jsl rlUnknown84C12E

          -
          lda wActiveFactionSlot,b
          inc a
          cmp wLoadedFactionCount,b
          bcs +

            sta wActiveFactionSlot,b
            jsl rlGetFactionSlotNameID
            cmp #$0080
            beq -

        lda #1
        sta $0304,b
        rts
        
        +
        stz wActiveFactionSlot,b
        inc $0304,b
        rts

        .databank 0

      rsUnknown81ACFE ; 81/ACFE

        .al
        .autsiz
        .databank ?

        jsl rlUnknown869D0E

        lda #$0040
        tsb $0788,b

        lda #$0020
        sta bEventActionIdentifier,b
        lda wCurrentTurn,b
        sta wEventEngineArgument1,b
        jsl rlGetAndRunChapterMapEventConditions
        stz $0304,b
        rts

        .databank 0

      rsUnknown81AD1C ; 81/AD1C

        .al
        .autsiz
        .databank ?

        lda #$BBD9
        sta wMainLoopPointer
        lda #7
        sta $0304,b
        rts

        .databank 0

      rsUnknown81AD28 ; 81/AD28

        .al
        .autsiz
        .databank ?

        jsl rlCreateUnitWindowAndTerrainWindowProcs

        lda $0D77,b
        cmp #3
        beq ++

          cmp #1
          beq +

            lda #(`procFadeIn)<<8
            sta lR44+1
            lda #<>procFadeIn
            sta lR44
            lda #0
            jsl rlProcEngineCreateProcByIndex
            bra ++

          +
          sep #$20
          lda bBufferINIDISP
          ora #15
          sta bBufferINIDISP
          rep #$20

        +
        jsl rlUnknown81B189
        bcc +

          ldx $0772,b
          jsl rlDeployedUnitUnsetHiddenIfAlive

        +
        lda $0D7B,b
        inc $0304,b
        rts

        .databank 0

      rsUnknown81AD6A ; 81/AD6A

        .al
        .autsiz
        .databank ?

        lda wUnknown00171A,b
        bne +

          lda #$00E0
          jsl rlUnknown808FA3

          stz $0302,b

          lda #$B1E1
          sta $0ECF,b

          lda #(`$8282D3)<<8
          sta $62+1
          lda #<>$8282D3
          sta $62
          jsl rlProcEngineCreateProc

        +
        rts

        .databank 0

      rsUnknown81AD8E ; 81/AD8E

        .al
        .autsiz
        .databank ?

        lda $0E7B,b
        bit #$0040
        beq _End

          bit #$0020
          bne _End

            lda wUnknown000D79,b
            bit #$0080
            beq _End

              lda #$0080
              trb wUnknown000D79,b

              ldx $0E82,b
              lda aAIUnitList.UnitRAMPointer,x
              sta wSelectedUnitDataRAMPointer,b

              lda #$0021
              sta bEventActionIdentifier,b
              lda wCurrentTurn,b
              sta wEventEngineArgument1,b
              lda wActiveFactionSlot,b
              sta wEventEngineArgument2,b
              jsl rlGetSelectedUnitAI
              sta wEventEngineArgument3,b
              jsl rlGetSelectedUnitCharacterID
              sta wEventEngineArgument4,b
              jsl rlGetAndRunChapterMapEventConditions

        _End
        rts

        .databank 0

      rlUnknown81ADD8 ; 81/ADD8

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb

        lda wUnknown00171A,b
        bmi _CLC

          lda wUnknownDeploymentOffset000D7F,b
          bmi _CLC

            tax
            lda aDeploymentTable._UnitRAMPointer,x
            sta wSelectedUnitDataRAMPointer,b

            lda $0D81,b
            bmi _CLC

              asl a
              tax
              jsr (aUnknown81AE02,x)

              lda #$FFFF
              sta wUnknownDeploymentOffset000D7F,b
              bra +

        _CLC
        clc
        
        +
        plb
        rtl

        .databank 0

      aUnknown81AE02 ; 81/AE02

        .word <>rsUnknown81AE46
        .word <>rsUnknown81AE68
        .word <>rsUnknown81AE96
        .word <>rsUnknown81AEAA
        .word <>rsUnknown81AF03
        .word <>rsUnknown81AFB7
        .word <>$AFF8
        .word <>$AFFE
        .word <>$B016
        .word <>$B030

      rlUnknown81AE16 ; 81/AE16

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb

        lda wUnknown00171A,b
        bne _CLC

          lda wUnknownDeploymentOffset000D7F,b
          bmi _CLC

            lda $0D81,b
            cmp #0
            beq +

              cmp #9
              beq _SEC

                cmp #3
                bne _CLC

                  lda wUnknown000D79,b
                  bit #$0040
                  beq _SEC

        _CLC
        clc
        
        -
        plb
        rtl
        
        +
        jsr rsUnknown81AE46
        
        _SEC
        sec
        bra -

        .databank 0

      rsUnknown81AE46 ; 81/AE46

        .al
        .autsiz
        .databank ?

        ldx wUnknownDeploymentOffset000D7F,b

        ; packed coords?
        lda $0D83,b
        sta wRoutineVariable1,b
        jsl rlUnknown84C996

        stz $0580,b

        jsl rlDeployedUnitUnsetHiddenIfAlive

        lda wUnknown000D79,b
        bit #$0020
        beq +

          jsl $8A9342
        
        +
        sec
        rts

        .databank 0

      rsUnknown81AE68 ; 81/AE68

        .al
        .autsiz
        .databank ?

        lda #7
        jsl rlSetSelectedUnitFaction
        jsl rlGetSelectedUnitDeploymentOffset
        cmp #$00FF
        beq _SEC

          jsl rlClearUnitDeploymentData

          lda #$00FF
          jsl rlSetSelectedUnitDeploymentOffset

          lda #$0017
          sta bEventActionIdentifier,b

          jsl rlGetSelectedUnitCharacterID
          sta wEventEngineArgument1,b
          jsl rlGetAndRunChapterMapEventConditions

        _SEC
        sec
        rts

        .databank 0

      rsUnknown81AE96 ; 81/AE96

        .al
        .autsiz
        .databank ?

        lda $0580,b
        pha

        lda wUnknownDeploymentOffset000D7F,b
        sta $0D83,b
        jsl rlSetUnitResidingInCastle

        pla
        sta $0580,b

        sec
        rts

        .databank 0

      rsUnknown81AEAA ; 81/AEAA

        .al
        .autsiz
        .databank ?

        ; entering castle?

        ldx wUnknownDeploymentOffset000D7F,b
        lda $0D83,b
        jsl rlSetUnitResidingInCastle

        stz $0580,b

        jsl rlUnknown85CA4B

        lda wUnknown000D79,b
        bit #$0040
        beq +

          and #~($40)
          sta wUnknown000D79,b

          stz $0302,b

          lda #0
          jsl $88B30D
          bra _End
        
        +
        lda wUnknown000D79,b
        bit #$0020
        beq +

          jsl $8A9342
          bra _End
        
        +
        lda #4
        sta bEventActionIdentifier,b
        jsl rlGetSelectedUnitCharacterID
        sta wEventEngineArgument1,b

        jsl rlGetSelectedUnitHomeCastle
        sta wEventEngineArgument2,b

        jsl rlGetAndRunChapterMapEventConditions
        bcs _End

          jsl $8CEDD0

        _End
        sec
        rts

        .databank 0

      rsUnknown81AF03 ; 81/AF03

        .al
        .autsiz
        .databank ?

        lda $0D83,b
        sta wSelectedUnitDataRAMPointer,b
        jsl $84AF17
        lda #$001A
        jsl $80900D
        sec
        rts

        .databank 0

      rsUnknown81AF16 ; 81/AF16

        .al
        .autsiz
        .databank ?

        lda $70
        and #$00FF
        beq _CLC

          lda $0D89,b
          bmi _CLC

            tax
            lda aDeploymentTable._UnitRAMPointer,x
            sta $0ECF,b

            jsl $85B14F

            lda #$FFFF
            sta $0D89,b
            sec
            rts
        
        _CLC
        clc
        rts

        .databank 0

      rsUnknown81AF38 ; 81/AF38

        .al
        .autsiz
        .databank ?

        lda $0D87,b
        bpl _CLC

          lda wUnknown00171A,b
          bne _CLC

            lda wUnknown0007D8,b
            cmp #4
            beq _CLC

              ldx $0772,b
              jsl rsUnknown88AF4C

              ldx $0772,b
              lda aDeploymentTable._UnitRAMPointer,x
              sta wSelectedUnitDataRAMPointer,b

              jsl rlGetSelectedUnitStates
              bit #UnitStateFielded
              bne +

                lda #UnitStateFielded
                jsl rlSetSelectedUnitStates
              
              +
              lda #$0008
              tsb $0788,b

              lda $0D87,b
              and #$0003
              sta $00

              phb
              jsl _AF81
              plb
              bra +
              
                _AF81
                lda $00
                asl a
                adc $00
                tax
                lda aUnknown81AFAE,x
                sta $33
                sep #$20
                lda aUnknown81AFAE+2,x
                sta $33+2
                pha
                plb
                rep #$20
                jml [$0033]

              +
              lda #$8000
              trb $0D87,b

              lda $0304,b
              cmp #11
              beq _CLC

                sec
                rts

        _CLC
        clc
        rts

        .databank 0

      aUnknown81AFAE ; 81/AFAE

        .long $85E85D
        .long $85E8A8
        .long $85E8C9

      rsUnknown81AFB7 ; 81/AFB7

        .al
        .autsiz
        .databank ?

        lda wUnknown000D79,b
        bit #$0400
        bne +

          ldx wUnknownDeploymentOffset000D7F,b
          lda #1
          sta wEventEngineParameter3+1,b
          lda $0D83,b
          sta wEventEngineParameter4+1,b
          jsl $85BB2E

        +
        sec
        rts

        .databank 0

      rsUnknown81AFD4 ; 81/AFD4

        .al
        .autsiz
        .databank ?

        lda $0D8D,b
        bmi _CLC

          jsl rlUnknown888410

          lda $0D8D,b
          sta wEventEngineParameter3+1,b
          lda #$0D00
          sta wEventEngineParameter4+1,b
          jsl $85B8D6

          lda #$FFFF
          sta $0D8D,b
          sec
          bra +

        _CLC
        clc
        
        +
        rts

        .databank 0

        ; 81/AFF8





      rlUnknown81B088 ; 81/B088

        .al
        .autsiz
        .databank ?

        lda wUnknown00171A,b
        bne _CLC

          lda wDefeatedUnitDeploymentOffset,b
          bmi _CLC

            tax
            lda aDeploymentTable._UnitRAMPointer,x
            sta wSelectedUnitDataRAMPointer,b

            lda aDeploymentTable._FactionSlot,x
            bne +

              jsl rlGetSelectedUnitGenerationID
              cmp #1
              bne +

                lda #0
                jsl rlUnknown81B32C

            +
            lda $7E4ED9
            ora $7E4F39
            bit #$0001
            bne +

              txa
              jsl rlDeployedUnitSetHiddenUnsetAlive

            +
            lda #$0017
            sta bEventActionIdentifier,b
            jsl rlGetSelectedUnitCharacterID
            sta wEventEngineArgument1,b

            jsl rlGetSelectedUnitFactionSlot
            sta wEventEngineArgument2,b

            jsl rlGetAndRunChapterMapEventConditions

            lda #$FFFF
            sta wDefeatedUnitDeploymentOffset,b
            sec
            bra +
        
        _CLC
        clc
        
        +
        rtl

        .databank 0

      rsUnknown81B0E5 ; 81/B0E5

        .al
        .autsiz
        .databank ?

        lda wUnknown000D79,b
        bit #$2000
        beq _CLC

          jsl $88B6FD

          ldx $0772,b
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b

          jsl rlGetSelectedUnitStates
          bit #UnitStateFielded
          bne +

            lda #UnitStateFielded
            jsl rlSetSelectedUnitStates
          
          +
          lda #$2000
          trb wUnknown000D79,b
          sec
          bra +
        
        _CLC
        clc
        
        +
        rts

        .databank 0

      rsUnknown81B116 ; 81/B116

        .al
        .autsiz
        .databank ?

        ; Prepares after action location based events

        lda $0D8B,b
        bmi _CLC

          tax
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b

          lda #3
          sta bEventActionIdentifier,b
          jsl rlGetSelectedUnitCharacterID
          sta wEventEngineArgument1,b

          lda aDeploymentTable._XTilePosition,x
          sta wEventEngineArgument2,b
          lda aDeploymentTable._YTilePosition,x
          sta wEventEngineArgument3,b
          lda aDeploymentTable._FactionSlot,x
          sta wEventEngineArgument4,b
          jsl rlGetAndRunChapterMapEventConditions

          lda #$FFFF
          sta $0D8B,b

          lda #$8000
          trb wUnknown000D79,b
          sec
          bra +

        _CLC
        clc
        
        +
        rts

        .databank 0

      rlUnknown81B15A ; 81/B15A

        .al
        .autsiz
        .databank ?

        ; Updates the Deployment state with buffered values

        lda wUnknown00171A,b
        bne _CLC

          lda $0304,b
          cmp #11
          beq _CLC

            lda wUnknown000D79,b
            bit #$0004
            beq _CLC

              ldx #(72-1) * size(word)

                -
                lda aDeploymentTable._StateBuffer,x
                sta aDeploymentTable._State,x
                dec x
                dec x
                bpl -

              lda #4
              trb wUnknown000D79,b
              sec
              bra +

        _CLC
        clc
        
        +
        rtl

        .databank 0

      rlUnknown81B189 ; 81/B189

        .al
        .autsiz
        .databank ?

        phx
        lda $0E7B,b
        bit #$0040
        bne _CLC

        ldx $0772,b
        lda wUnknown000D79,b
        bit #$0004
        beq +

          lda aDeploymentTable._StateBuffer,x
          and #~DeploymentStateGrayed
          sta aDeploymentTable._State,x

        +
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        beq _CLC

        bit #DeploymentStateDefeated
        bne _CLC

        bit #DeploymentStateCanto
        beq _CLC

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        lda aDeploymentTable._XTilePosition,x
        sta wR10
        lda aDeploymentTable._YTilePosition,x
        sta wR11
        jsl rlUnknown87B541
        bcc +

          jsl rlUnknown84D4A2
          bcc _SEC

        +
        lda #$2000
        tsb wUnknown000D79,b
        lda #$8000
        tsb wUnknown000D79,b
        
        _SEC
        plx
        sec
        bra +
        
        _CLC
        plx
        clc
        
        +
        rtl

        .databank 0

      rlUnknown81B1ED ; 81/B1ED

        .al
        .autsiz
        .databank ?

        lda wUnknownDeploymentOffset000D7F,b
        bmi _End

          lda $0D81,b
          cmp #5
          bne _End

            lda wUnknown000D79,b
            bit #$0400
            bne _End

              lda #1
              sta aProcSystem.wInput2,b
              lda $0D83,b
              sta aProcSystem.wInput3,b

              lda #(`$85BA41)<<8
              sta lR44+1
              lda #<>$85BA41
              sta lR44
              jsl rlEventEngineCreateProc
              lda #$FFFF
              sta wUnknownDeploymentOffset000D7F,b

        _End
        rtl

        .databank 0

      rlUnknown81B223 ; 81/B223

        .al
        .autsiz
        .databank ?

        lda wUnknownDeploymentOffset000D7F,b
        bmi _End

          lda $0D81,b
          cmp #8
          bne _End

            lda $0D83,b
            jsl rlGetItemRAMStructEntryByPlayerItemIndex
            jsl rlGetEffectiveItemIDByItemRAMStructEntry
            sta aProcSystem.wInput2,b

            lda #$0D00
            sta aProcSystem.wInput3,b
            lda #(`procUnknown85BC0F)<<8
            sta lR44+1
            lda #<>procUnknown85BC0F
            sta lR44
            jsl rlEventEngineCreateProc

            lda #$FFFF
            sta wUnknownDeploymentOffset000D7F,b

        _End
        rtl

        .databank 0

      rlUnknown81B259 ; 81/B259

        .al
        .autsiz
        .databank ?

        lda $0D89,b
        bmi +

          tax
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          jsr rsUnknown81B270
          lda #$FFFF
          sta $0D89,b

        +
        rtl

        .databank 0

      rsUnknown81B270 ; 81/B270

        .al
        .autsiz
        .databank ?

        lda #8
        jsl rlGetItemIDByInventorySlot
        jsl rlGetItemDataROMPointer
        lda wCurrentItemDataROMPointer,b
        sta aProcSystem.wInput0,b
        lda aProcSystem.wSelectedUnitDataRAMPointer,b
        sta aProcSystem.wInput3,b
        jsl $85B52F
        jsl $85B520
        lda aProcSystem.wSelectedUnitDataRAMPointer,b
        sta aProcSystem.wInput0,b
        lda wCurrentItemDataROMPointer,b
        sta aProcSystem.wInput1,b
        lda #(`procUnknown85B18F)<<8
        sta lR44+1
        lda #<>procUnknown85B18F
        sta lR44
        jsl rlEventEngineCreateProc
        rts

        .databank 0

      rlSaveChapterTurncount ; 81/B2AA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wCurrentChapter,b
        cmp #5
        beq +

        cmp #11
        bne ++

        +
        lda #FS_Player
        jsl rlCountUnitsInFactionSlotAlive
        clc
        adc wTotalAlivePlayerUnitCount
        sta wTotalAlivePlayerUnitCount

        +
        lda wCurrentChapter,b
        asl a
        tax
        lda wCurrentTurn,b
        sta aChapterTurncounts,b,x
        lda #$FFFF
        sta wCurrentTurn,b
        lda #$0400
        tsb wUnknown000D79,b
        jsl rlClearUnitWindowAndTerrainWindowProcs

        lda wCurrentChapter,b
        cmp #11
        beq +

          lda $0772,b
          sta wUnknownDeploymentOffset000D7F,b
          lda #6
          sta $0D81,b
          bra +

        +
        plx
        plp
        plb
        rtl

        .databank 0

        ; 81/B301
























      rlUnknown84D4A2 ; 84/D4A2

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda aDeploymentTable._FactionSlot,x
        bne +

        lda $0D87,b
        and #~(1 | 2)
        ora #$8001
        sta $0D87,b

        lda #$8000
        tsb wUnknown000D79,b

        plp
        plb
        clc
        
        -
        rtl
        
        +
        plp
        plb
        sec
        bra -

        .databank 0

        ; 84/D4C7












      rlUnknown87B541 ; 87/B541

        .al
        .autsiz
        .databank ?

        phx
        phy
        jsl rlGetSelectedUnitFactionSlot
        sta $7F442A

        jsl rlGetSelectedUnitStates
        bit #UnitStateCanto
        beq +

          lda #0
          tay
          bra ++

          +
          jsl $84F521

        +
        sta $1A
        sty $08
        cmp #4
        bcc +

          jsl $87BA0B
          sec
          bra _End

        +
        jsl rlGetSelectedUnitMovementCostPointer
        sta $7F442C

        jsl rlGetSelectedUnitTotalFieldMovement
        sta $18

        jsl rlUnknown87B59D

        lda wActiveFactionSlot,b
        bne +

          lda $7F442A
          beq +

            lda $08
            bit #$0004
            beq +

              jsl $87BA82

        +
        jsl $87BB27

        _End
        ply
        plx
        rtl

        .databank 0

      rlUnknown87B59D ; 87/B59D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        jsr rsUnknown87B786
        jsr rsUnknown87B7A2
        jsr rsUnknown87B7B0
        jsr rsUnknown87B7BE
        jsr rsUnknown87B833
        stz $22
        jsr rsUnknown87B5DD

        lda $1A
        beq _End

        sep #$20
        ldx #$0100

          -
          cpx $06
          beq +

          ldy $894C,b,x
          jsr $87B91C

          inc x
          inc x
          inc x
          inc x
          cpx $06
          bra -

        +
        rep #$20
        
        _End
        plp
        plb
        rtl

        .databank 0

      rsUnknown87B5DD ; 87/B5DD

        .al
        .autsiz
        .databank ?

        ldx #64 - 2
        lda #$FFFF
        
          -
          sta $894A,b,x
          sta $899A,b,x + 64
          sta $899A,b,x + (64 * 2)
          sta $899A,b,x + (64 * 3)
          dec x
          dec x
          bpl -

        lda #32
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        clc
        adc #32
        tay

        lda $18
        sep #$20
        sta aMovementMap,b,y
        rep #$20
        sta $04
        asl a
        tax
        lda #$0100
        sta $894A,b,x

        lda #$FFFF
        sta $894A,b + $100
        tya
        sta $894A,b + $102

        lda #$0104
        sta $06
        
          -
          lda $04
          cmp #7
          bcc _End

            asl 
            tax
            
              -
              lda $894A,b,x
              bmi +

                tax
                ldy $894A+2,b,x
                jsr $87B63F
                bra -

          +
          dec $04
          bra --
        
        _End
        rts

        .databank 0

        ; 87/B63F













      rsUnknown87B786 ; 87/B786

        .al
        .autsiz
        .databank ?

        ; $14 = X pos
        ; $16 = Y pos

        lda $14
        sec
        sbc #$0020
        sta $1C

        lda $16
        sec
        sbc #$0020
        sta $1E
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        clc
        adc $1C
        sta $20
        rts

        .databank 0

      rsUnknown87B7A2 ; 87/B7A2

        .al
        .autsiz
        .databank ?

        lda #`aMovementMap
        ldx #<>aMovementMap
        ldy #0
        jsl rlFillMapBuffer
        rts

        .databank 0

      rsUnknown87B7B0 ; 87/B7B0

        .al
        .autsiz
        .databank ?

        lda #`aRangeMap
        ldx #<>aRangeMap
        ldy #0
        jsl rlFillMapBuffer
        rts

        .databank 0

      rsUnknown87B7BE ; 87/B7BE

        .al
        .autsiz
        .databank ?

        ; fills map buffer with enemy and ally values?

        ldx #(72 - 1) * size(word)
        
        -
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        beq _Next

          bit #DeploymentStateHidden
          bne _Next

            bit #DeploymentStateDefeated
            bne _Next

              lda aDeploymentTable._XTilePosition,x
              sec
              sbc $1C
              sta aAIAction.wTargetXPosition,b
              cmp #$0040
              bcs _Next

                lda aDeploymentTable._YTilePosition,x
                sec
                sbc $1E
                sta aAIAction.wTargetYPosition,b
                cmp #$0040
                bcs _Next

                  jsr rsUnknown87B811

                  pha
                  lda aAIAction.wTargetYPosition,b
                  asl a
                  asl a
                  asl a
                  asl a
                  asl a
                  asl a
                  clc
                  adc aAIAction.wTargetXPosition,b
                  tay
                  pla
                  sep #$20
                  sta aRangeMap,b,y
                  rep #$20

        _Next
        dec x
        dec x
        bpl -

        rts

        .databank 0

      rsUnknown87B811 ; 87/B811

        .al
        .autsiz
        .databank ?

        phx
        lda aDeploymentTable._FactionSlot,x
        tax

        lda $442A,b
        bmi ++

          jsl rlGetFactionRelation
          plx
          cmp #AllegianceOther
          beq +

            cmp #AllegianceEnemy
            bne ++

          ; other, enemy
          +
          lda #$00FF
          rts

        ; player, npc 
        +
        lda #1
        rts

        .databank 0

      rsUnknown87B833 ; 87/B833

        .al
        .autsiz
        .databank ?

        ; write map boundaries?

        lda wR14
        bmi +

          lda #$003F
          sec
          sbc wR14
          jsr rsUnknown87B877

          lda wR14
          bne ++

        +
        eor #$FFFF
        inc a
        jsr rsUnknown87B877
        
        +
        lda wCurrentChapter
        beq +

          lda wR15
          bmi _B86D

            lda #$003F
            bne ++

        +
        lda #$001F

        +
        sec
        sbc wR15
        jsr rsUnknown87B88F

        lda wCurrentChapter
        beq _B86D

          lda wR15
          bne +

            _B86D
            lda wR15
            eor #$FFFF
            inc a
            jsr rsUnknown87B88F
        
        +
        rts

        .databank 0

      rsUnknown87B877 ; 87/B877

        .al
        .autsiz
        .databank ?

        ; write vertical boundaries?

        tay
        ldx #64
        
          -
          lda #$00FE
          sep #$20
          sta $65A4,b,y
          rep #$20
          tya
          clc
          adc #64
          tay
          dec x
          bne -

        rts

        .databank 0

      rsUnknown87B88F ; 87/B88F

        .al
        .autsiz
        .databank ?

        ; write horizonal boundaries?

        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        tay

        sep #$20
        lda #64
        
          -
          lda #$FE
          sta aRangeMap,b,y
          inc y
          dec x
          bne -

        rep #$20
        rts

        .databank 0

        ; 87/B8A7











      rlFillMapBuffer ; 86/AE3E

        .al
        .autsiz
        .databank ?

        ; A = bank of buffer
        ; X = lower word of buffer
        ; Y = fill value

        phb

        sep #$20
        pha
        rep #$20
        plb

        tya
        ldy #256 >> 1
        
          -
          sta $0000,b,x
          sta $0100,b,x
          sta $0200,b,x
          sta $0300,b,x
          sta $0400,b,x
          sta $0500,b,x
          sta $0600,b,x
          sta $0700,b,x
          sta $0800,b,x
          sta $0900,b,x
          sta $0A00,b,x
          sta $0B00,b,x
          sta $0C00,b,x
          sta $0D00,b,x
          sta $0E00,b,x
          sta $0F00,b,x

          inc x
          inc x
          dec y
          bne -

        plb
        rtl

        .databank 0

      rlClearMapBufferAddBorders ; 86/AE80

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = map pointer bank
        ; X = map pointer lower word

        phb
        sep #$20
        pha
        rep #$20
        plb

        phx

        txa
        clc
        adc #64
        tax
        ldy #64 -2
        
        _Loop
        lda #$00FF
        sta $0000,b,x

        lda #0
        sta $0002,b,x
        sta $0004,b,x
        sta $0006,b,x
        sta $0008,b,x
        sta $000A,b,x
        sta $000C,b,x
        sta $000E,b,x
        sta $0010,b,x
        sta $0012,b,x
        sta $0014,b,x
        sta $0016,b,x
        sta $0018,b,x
        sta $001A,b,x
        sta $001C,b,x
        sta $001E,b,x
        sta $0020,b,x
        sta $0022,b,x
        sta $0024,b,x
        sta $0026,b,x
        sta $0028,b,x
        sta $002A,b,x
        sta $002C,b,x
        sta $002E,b,x
        sta $0030,b,x
        sta $0032,b,x
        sta $0034,b,x
        sta $0036,b,x
        sta $0038,b,x
        sta $003A,b,x
        sta $003C,b,x

        lda #$FF00
        sta $003E,b,x

        txa
        clc
        adc #64
        tax
        dec y
        bne _Loop

        plx
        ldy #64 >> 2

        lda wCurrentChapter
        beq +

          ; Prologue only gets half the buffer
          lda #$FFFF

          -
          sta $0000 +  0 * 64 + (0 * 64 / size(word)),b,x
          sta $0000 +  0 * 64 + (1 * 64 / size(word)),b,x
          sta $0000 + 63 * 64 + (0 * 64 / size(word)),b,x
          sta $0000 + 63 * 64 + (1 * 64 / size(word)),b,x
          inc x
          inc x
          dec y
          bne -
          bra _End

        +
        lda #$FFFF

        -
        sta $0000 +  0 * 64 + (0 * 64 / size(word)),b,x
        sta $0000 +  0 * 64 + (1 * 64 / size(word)),b,x
        sta $0000 + 31 * 64 + (0 * 64 / size(word)),b,x
        sta $0000 + 31 * 64 + (1 * 64 / size(word)),b,x
        inc x
        inc x
        dec y
        bne -
        
        _End
        plb
        rtl

        .databank 0

        ; 86/AF39













      rlUnknown81B32C ; 81/B32C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        asl a
        tax

        lda wCurrentChapter,b
        cmp #6
        bcc +

          txa
          clc
          adc #4
          tax

        +
        lda aUnknown81B353,x
        jsl rlUnknown80C1CB
        lda #12
        sta $0304,b

        plx
        plp
        plb
        rtl

        .databank 0

      aUnknown81B353 ; 81/B353

        ; some event IDs

        .word $022E
        .word $022F
        .word $0230
        .word $0231

      rlUnknown81B35B ; 81/B35B

        .al
        .autsiz
        .databank ?

        jsl rlUnknown869CF9
        jsl rlUnknown88AF7B
        jsl $9E800C
        rtl

        .databank 0

      rlUnknown81B368 ; 81/B368

        .al
        .autsiz
        .databank ?

        lda #$00E0
        jsl rlUnknown808FA3

        stz $07E0,b
        stz $0302,b

        lda wBattleType
        and #$00FF
        cmp #0
        beq +

        lda #<>$80BFFB
        sta aProcSystem.wInput0,b
        lda #(`procUnknown8282D3)<<8
        sta lR44+1
        lda #<>procUnknown8282D3
        sta lR44
        jsl rlProcEngineCreateProc
        bra ++

        +
        lda #(`$87C38C)<<8
        sta lR44+1
        lda #<>$87C38C
        sta lR44
        jsl rlHDMAEngineCreateEntry
        
        +
        rtl

        .databank 0

        ; 81/B3A6








      rlUnknown84C104 ; 84/C104

        .al
        .autsiz
        .databank ?

        ; Ran for every unit in a faction, decrements status and unsets miracle.

        ; A = FactionSlot

        phb
        php
        phk
        plb
        phx
        phy
        tay

        ldx #1
        
          -
          stx wRoutineVariable1,b
          tya
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID

          lda $056F,b
          beq +

            jsl rlDecreaseStatusDuration

            lda #UnitStateMiracleActive
            jsl rlUnsetSelectedUnitStates
            inc x
            bra -

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C12E









      rlUnknown84C5D7 ; 84/C5D7

        .al
        .autsiz
        .databank ?

        phb
        phx
        phy

        tax
        ora #0
        beq _SEC

          jsl rlGetFactionSlotNameID
          cmp #$00FF
          beq _CLC

          txa
          jsl $84BEB7
          ora #0
          beq _CLC

            jsl $81B503

            lda $24
            beq _SEC

              txa
              asl a
              clc
              adc $24
              tay

              sep #$20
              lda $24+2
              pha
              rep #$20
              plb

              lda $0000,b,y
              cmp #$FFFF
              beq _SEC

                lda $0001,b,y
                and #$00FF
                sta $0EAE,b
                lda $0000,b,y
                and #$00FF
                jsl rlCheckIfEventFlagOfSpecifiedChapterSet
                bcc _CLC
        
        _SEC
        sec
        bra +
        
        _CLC
        clc
        
        +
        ply
        plx
        plb
        rtl

        .databank 0

        ; 84/C62E








      rlCreateUnitWindowAndTerrainWindowProcs ; 85/9B59

        .al
        .autsiz
        .databank ?

        jsl rlCheckIfUnitWindowSettingOff
        ora #0
        bne +

          lda #(`$85C652)<<8
          sta lR44+1
          lda #<>$85C652
          sta lR44
          jsl rlProcEngineFindProc
          bcs +

            jsl rlProcEngineCreateProc
        
        +
        jsl rlCheckIfTerrainWindowSettingOff
        ora #0
        bne +

          lda #(`$85C33F)<<8
          sta lR44+1
          lda #<>$85C33F
          sta lR44
          jsl rlProcEngineFindProc
          bcs +

            jsl rlProcEngineCreateProc

        +
        rtl

        .databank 0

      rlClearUnitWindowAndTerrainWindowProcs ; 85/9B94

        .al
        .autsiz
        .databank ?

        lda #(`$85C652)<<8
        sta lR44+1
        lda #<>$85C652
        sta lR44
        jsl rlProcEngineFindProc
        bcc +

          jsl rlProcEngineFreeProc

        +
        lda #(`$85C33F)<<8
        sta lR44+1
        lda #<>$85C33F
        sta lR44
        jsl rlProcEngineFindProc
        bcc +

          jsl rlProcEngineFreeProc

        +
        rtl

        .databank 0

        ; 85/9BBD

















      rlCheckIfTerrainWindowSettingOff ; 87/BE98

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda wOptionSettings,b
        bit #$0002

        _BEA2
        bne +

        lda #0
        bra ++

        +
        lda #1

        +
        plp
        plb
        rtl

        .databank 0

      rlSetTerrainWindowSetting ; 87/BEAF

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        ora #0
        bne +

        lda #$0002
        trb wOptionSettings,b
        bra ++

        +
        lda #$0002
        tsb wOptionSettings,b

        +
        plp
        plb
        rtl

        .databank 0

      rlCheckIfUnitWindowSettingOff ; 87/BEC9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda wOptionSettings,b
        bit #$0004
        jml rlCheckIfTerrainWindowSettingOff._BEA2

        .databank 0

        ; 87/BED7






      procUnknown85ABF6 ; 85/ABF6

        .structProcInfo "PS", $85AC02, $85AC40, $85AEAC

      aUnknown85ABFE ; 85/ABFE

        .word 0
        .word 1

      rlUnknown85AC02 ; 85/AC02

        .al
        .autsiz
        .databank ?

        phx
        lda #$0008
        tsb $0788,b

        lda $0302,b
        sta $1077,b,x
        stz $0302

        lda #$0078
        sta aProcSystem.aBody6,b,x

        lda #2
        sta $7FEAAC

        stz $89
        stz $87
        stz $85
        stz $83

        jsl $85A227
        jsr $85B009
        jsr $85B07C

        plx
        phx
        lda wActiveFactionSlot,b
        jsl rlGetFactionBattleBannerID
        jsl rlUnknown91AFC2

        plx
        rtl

        .databank 0

        ; 85/AC40






      rlUnknown84C412 ; 84/C412

        .al
        .autsiz
        .databank ?

        ; A = FactionSlot?

        phb
        php
        phk
        plb
        phx
        phy

        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wRoutineVariable1,b
        phx

        tay
        ldx #(24 - 1) * size(word)
        lda #0
        
          -
          sta $7E2000,x
          dec x
          dec x
          bpl -

        ldx #1
        
          -
          stx wRoutineVariable1,b
          tya
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID

          lda wSelectedUnitDataRAMPointer,b
          beq _End

            jsl rlGetSelectedUnitGenerationID
            bcs +

              phx
              dec a
              asl a
              tax
              lda wSelectedUnitDataRAMPointer,b
              sta $7E2000,x
              plx

          +
          inc x
          bra -
        
        _End
        plx
        stx wRoutineVariable1,b
        plx
        stx $056F,b

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C461





      rlRunTurnStartEffectsForAllUnitsInFaction ; 84/C0D6

        .al
        .autsiz
        .databank ?

        ; A = FactionSlot

        phb
        php
        phk
        plb
        phx

        sta $04
        lda #0
        sta $7E2000
        sta $7E2002

        ldx #1

          -
          stx wRoutineVariable1,b
          lda $04
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
          lda wSelectedUnitDataRAMPointer,b
          beq +

            jsl rlGetTurnStartEffectsByStatus
            inc x
            bra -

        +
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C104




      rlGetTurnStartEffectsByStatus ; 84/AF9E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        jsl rlGetSelectedUnitStates
        bit #UnitStateDead
        bne +

          jsl rlGetSelectedUnitStatus
          asl a
          tax
          jsr (aTurnStartEffectsByStatus,x)
        
        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aTurnStartEffectsByStatus ; 84/AFBB

        .word <>rlGetTurnStartNormalEffect
        .word <>rsGetTurnStartCuredEffect
        .word <>rsGetTurnStartFreelancerEffect
        .word <>rsGetTurnStartCaptiveEffect
        .word <>rlGetTurnStartNormalEffect
        .word <>rlGetTurnStartNormalEffect
        .word <>rlGetTurnStartNormalEffect

      rlGetTurnStartNormalEffect ; 84/AFC9

        .al
        .autsiz
        .databank ?

        ; For healthy, silence, sleep and berserk

        jsl rlGetSelectedUnitMaxHP
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitCurrentHP
        cmp wRoutineVariable1,b
        bcs _End

          jsr rsGetChurchHealing
          bcs +

            jsr rsGetRecoverHealing
            bcs +

              jsr rsGetInsideCastleHealing
              bcs +

                jsr rsGetGuardingCastleHealing
                bcs +

                  jsr rsGetRenewalHealing
                  bcs +
                  bra _End

          +
          jsl rlHealSelectedUnitsHP
        
        _End
        rts

        .databank 0

      rsGetRenewalHealing ; 84/AFF9

        .al
        .autsiz
        .databank ?

        lda #SkillIDRenewal
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

          lda #SkillIDRenewal
          jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
          bcs +

            rts
        
        +
        lda #6
        jsl rlGetRandomNumber100
        clc
        adc #5
        sta wRoutineVariable1,b

        ldy #3
        jsr rsUnknown84B148
        sec
        rts

        .databank 0

      rsGetRecoverHealing ; 84/B022

        .al
        .autsiz
        .databank ?

        lda #SkillIDRecover
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

          lda #SkillIDRecover
          jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
          bcs +

            rts
        
        +
        jsl rlGetSelectedUnitMaxHP
        sta wRoutineVariable1,b

        ldy #3
        jsr rsUnknown84B148
        sec
        rts

        .databank 0

      rsGetInsideCastleHealing ; 84/B044

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitStates
        bit #UnitStateFielded
        beq +
        
          _CLC
          clc
          rts

        ; Inside a castle
        +
        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne +

          jsr rsGetCastleHealingAmount
          jsr rsGetCastleHealingCost
          bcs _CLC

            jsl rlSubtractSelectedCharacterMoney
            stx wRoutineVariable1,b
            sec
            rts
        
        +
        jsl rlGetSelectedUnitMaxHP
        sta wRoutineVariable1,b
        sec
        rts

        .databank 0

      rsGetGuardingCastleHealing ; 84/B072

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        bne +
        
          _CLC
          clc
          rts
        
        +
        jsr rsGetCastleHealingAmount
        jsr rsGetCastleHealingCost
        bcs _CLC

        jsl rlSubtractSelectedCharacterMoney
        stx wRoutineVariable1,b

        ldy #1
        jsr rsUnknown84B148
        sec
        rts

        .databank 0

      rsGetChurchHealing ; 84/B094

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitDeploymentOffset
        jsl rlGetTerrainTypeByDeploymentOffset
        cmp #TerrainChurch
        beq +
        
          _CLC
          clc
          rts

        +
        jsl rlGetSelectedUnitCurrentHP
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitMaxHP
        sec
        sbc wRoutineVariable1,b
        sta wRoutineVariable1,b
        jsr $84B0F0
        bcs _CLC

        jsl rlSubtractSelectedCharacterMoney
        sta wRoutineVariable1,b

        ldy #2
        jsr rsUnknown84B148
        sec
        rts

        .databank 0

      rsGetCastleHealingAmount ; 84/B0C9

        .al
        .autsiz
        .databank ?

        ; Castle healing is 20% of max hp

        jsl rlGetSelectedUnitMaxHP
        xba
        sta $1A
        lda #100
        sta $1C
        jsl rlUnsignedDivide16By8

        lda $1A
        sta $14
        lda #20
        sta $16
        jsl rlUnsignedMultiply16By16

        lda $18
        xba
        and #$00FF
        sta wRoutineVariable1,b
        rts

        .databank 0

      rsGetCastleHealingCost ; 84/B0F0

        .al
        .autsiz
        .databank ?

        ldx wRoutineVariable1,b
        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne _End

          jsl rlGetSelectedUnitMoney
          cmp #5
          bcc _SEC

            sta $4204,b
            sep #$20
            lda #5
            sta $4206,b
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            rep #$20

            lda $4214,b
            sta $00
            lda $4216,b
            sta $02

            lda wRoutineVariable1,b
            asl a
            asl a
            clc
            adc wRoutineVariable1,b
            sta wRoutineVariable1,b

            jsl rlGetSelectedUnitMoney
            cmp wRoutineVariable1,b
            bcs _CLC

              sec
              sbc $02
              sta wRoutineVariable1,b
              ldx $00
              bra _CLC

        _End
        stz wRoutineVariable1,b
        
        _CLC
        clc
        rts
        
        _SEC
        sec
        rts

        .databank 0

      rsUnknown84B148 ; 84/B148

        .al
        .autsiz
        .databank ?

        phx
        lda $7E2002
        asl a
        asl a
        clc
        adc $7E2002
        tax
        cpx #$00FF
        bcs _End

          tya
          sta $7E2004,x

          jsl rlGetSelectedUnitDeploymentOffset
          sta $7E2005,x

          jsl rlGetSelectedUnitCurrentHP
          sta $7E2006,x

          jsl rlGetSelectedUnitMaxHP
          sep #$20
          sta $7E2008,x
          rep #$20

          cmp $7E2006,x
          beq _End

            lda wRoutineVariable1,b
            sep #$20
            sta $7E2007,x
            rep #$20

            lda $7E2002
            inc a
            sta $7E2002
        
        _End
        plx
        rts

        .databank 0

      rsGetTurnStartCuredEffect ; 84/B197

        .al
        .autsiz
        .databank ?

        jsl rlDecreaseStatusDuration
        bcc +

          ; status ran out
          jsl rlGetSelectedUnitMaxHP
          jsl rlSetSelectedUnitCurrentHP

        +
        rts

        .databank 0

      rsGetTurnStartFreelancerEffect ; 84/B1A6

        .al
        .autsiz
        .databank ?

        jsl rlDecreaseStatusDuration
        bcc +

          ; Status ran out
          lda #3000
          sta wRoutineVariable1,b
          jsl rlAddSelectedCharacterMoney

        +
        rts

        .databank 0

      rsGetTurnStartCaptiveEffect ; 84/B1B7

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

        ; 84/B1B8









      rlUnknown869CE4 ; 86/9CE4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda wActiveFactionSlot,b
        beq +

          lda #$0040
          tsb bUnknown000E7B,b
          stz wAIEngineCycleType,b

        +
        plp
        plb
        rtl

        .databank 0

      rlUnknown869CF9 ; 86/9CF9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda bUnknown000E7B,b
        bit #$0001
        beq +

          lda #$0001
          trb bUnknown000E7B,b

        +
        plp
        plb
        rtl

        .databank 0

      rlUnknown869D0E ; 86/9D0E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda #$0040
        trb bUnknown000E7B,b

        plp
        plb
        rtl

        .databank 0

        ; 86/9D1B








      rlUnknown888560 ; 88/8560

        .al
        .autsiz
        .databank ?

        lda wUnknown00073A,b
        beq +

          jsl $88864F

          lda $0788,b
          bit #$0020
          bne +

            lda wMapScrollXPixels,b
            sta wMapXOffset,b
            lda wMapScrollYPixels,b
            sta wMapYOffset,b

        +
        rtl

        .databank 0

        ; 88/857E









      rlUnknown88A12B ; 88/A12B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsl rlUnknown88A136

        plp
        plb
        rtl

        .databank 0

      rlUnknown88A136 ; 88/A136

        .al
        .autsiz
        .databank ?

        stz wUnknown000758,b
        jsr rsUnknown88A32D

        stz wUnknown00073A,b
        stz wMapEnableXScrollFlag,b
        stz wMapEnableYScrollFlag,b

        sep #$20
        lda $70
        rep #$20
        and #$000F
        cmp #$000F
        beq +
        
          -
          jml _End

        +
        lda #(`procFadeIn)<<8
        sta $62+1
        lda #<>procFadeIn
        sta $62
        jsl rlProcEngineFindProc
        bcs -

        lda #(`procFadeInByScreenFadingTimer)<<8
        sta $62+1
        lda #<>procFadeInByScreenFadingTimer
        sta $62
        jsl rlProcEngineFindProc
        bcs -

        lda $0E7B,b
        and #$00FF
        bit #$0041
        beq ++

          lda $086F,b
          bpl +

            jsr $88C71C
          
          +
          jml $88C4D9

        +
        lda wUnknown00171A,b
        beq +

          jml _End
        
        +
        lda $0788,b
        bit #$0020
        beq +

          jml $88973F

        +
        lda $07E0,b
        bpl +

          lda $0772,b
          jsl $88B42C
          jml _End
        
        +
        lda $0786,b
        bit #$0002
        beq _A234

          ldx $0772,b
          lda $7E46EB,x
          sta $056F,b

          ldx $0772,b
          lda wCursorXOffset,b
          clc
          adc wMapScrollXPixels,b
          sta $0780,b

          lda $7E44AB,x
          asl a
          asl a
          asl a
          asl a
          sta $0782,b

          lda wCursorXOffset,b
          clc
          adc wMapScrollXPixels,b
          lsr a
          lsr a
          lsr a
          lsr a
          sta $0778,b

          lda wCursorYOffset,b
          clc
          adc wMapScrollYPixels,b
          lsr a
          lsr a
          lsr a
          lsr a
          sta $077A,b

          lda #3
          sta $07DA,b

          stz $07DC,b
          stz $07DE,b
          jsl rlDeployedUnitSetHidden

          stz wUnknown0007E2

          jsl $88C9A6

          lda $0786,b
          bit #$0008
          bne +

            jsl $84B32B

            lda #$0002
            trb $0786,b

            lda #$0004
            tsb $0786,b
            bra _A234

          +
          lda #$0002
          trb $0786,b

          jsl $88A2F5

        _A234
        lda wUnknown0007D8,b
        beq _A24F

          cmp #$FFFF
          beq ++

            cmp #$0003
            beq +

              jml $88A754
            
            +
            jml $88A81D
          
          +
          jml _A2BD

        _A24F
        lda wUnknown000766,b
        bne _A28D

          lda wJoy1New
          bit #~(JOY_Y | JOY_Directions | JOY_ID)
          beq +

            jsr rsMapInputHandler
            stz wMapScrollDirectionIdentifier,b
            bra _A2BD
          
          +
          jsr $88A551
          bcc _A2BD

            stz wMapScrollCurrentPixelDistance,b
            lda #1
            sta wUnknown000766,b
            stz wUnknown00073A,b
            stz wMapEnableXScrollFlag,b
            stz wMapEnableYScrollFlag,b
            lda #4
            sta wMapScrollSpeed,b

            lda wJoy1Input
            bit #JOY_Y
            beq _A28D

              lda #8
              sta wMapScrollSpeed,b
        
        _A28D
        lda wMapScrollCurrentPixelDistance,b
        clc
        adc wMapScrollSpeed,b
        sta wMapScrollCurrentPixelDistance,b
        cmp #16
        bcc +

          stz wUnknown000766,b
          stz wUnknown00073A,b
          stz wMapEnableXScrollFlag,b
          stz wMapEnableYScrollFlag,b
          lda #1
          sta wUnknown000758,b

        +
        jsl rlUnknown88BC05

        lda wMapScrollCurrentPixelDistance,b
        cmp wMapScrollSpeed,b
        bne _A2BD

          jsr $88BEEF

        _A2BD
        sep #$20
        lda #$88
        pha
        plb
        rep #$20

        ldy #$EE52
        lda wCursorXOffset,b
        sta $00
        lda wCursorYOffset,b
        sta $02
        lda #$2000
        sta $0A
        lda #0
        sta $08

        lda wUnknown000770,b
        beq +

          lda #4
          sta $08
        
        +
        lda $DB
        and #$0018
        beq +

          ldy #$EE3C

        +
        jsl rlPushToOAMBuffer

        _End
        rtl

        .databank 0

        ; 88/A2F5








      rsUnknown88A32D ; 88/A32D

        .al
        .autsiz
        .databank ?

        lda $0788,b
        bit #$8000
        beq +

          lda #1
          sta wUnknown000758,b
          lda #$8000
          trb $0788,b
        
        +
        lda $0788,b
        and #$FFE0
        sta $0788,b

        lda wJoy1Input
        bit #$4000 ; JOY_Y
        beq +

          lda #$0001
          tsb $0788,b
        
        +
        lda wUnknown000770,b
        bne +

          lda $0786,b
          bne +

            lda $07E0,b
            beq ++
        
        +
        lda #$0002
        tsb $0788,b

        +
        lda wUnknown0007D8,b
        beq +

          lda #$0004
          tsb $0788,b
        
        +
        lda wUnknown00171A,b
        beq +

          lda #$0010
          tsb $0788,b

        +
        rts

        .databank 0

        ; 88/A383








      rlUnknown88A754 ; 88/A754

        .al
        .autsiz
        .databank ?

        lda wUnknown000766,b
        bne _A7BA

          lda wUnknown0007D8,b
          cmp #2
          beq _A788

            cmp #4
            beq _A795

              cmp #5
              beq _A795

                cmp #6
                beq _A795

                  cmp #7
                  beq _A795

                    lda #16
                    sta wMapPixelScrollDistance,b
                    jsr $88A9B4
                    beq _End

                      lda #8
                      sta wMapScrollSpeed,b
                      bra +
          
          _A788
          stz wMapPixelScrollDistance,b
          jsr $88AA1E
          beq _End

            jsr $88A7F5
            bra +

          _A795
          lda #16
          sta wMapPixelScrollDistance,b
          jsr rsUnknown88B64F
          beq _End

            lda #8
            sta wMapScrollSpeed
            bra +

          +
          stz wMapScrollCurrentPixelDistance,b
          lda #1
          sta wUnknown000766,b
          stz wUnknown00073A,b
          stz wMapEnableXScrollFlag,b
          stz wMapEnableYScrollFlag,b

        _A7BA
        stz wMapScrollCurrentPixelDistance,b
        clc
        adc wMapScrollSpeed,b
        sta wMapScrollCurrentPixelDistance,b
        cmp wMapPixelScrollDistance,b
        bcc +

          sec
          sbc wMapPixelScrollDistance,b
          sta wR0
          sta wMapScrollSpeed,b
          sec
          sbc wR0
          sta wMapScrollSpeed,b

          stz wUnknown000766,b
          stz wUnknown00073A,b
          stz wMapEnableXScrollFlag,b
          stz wMapEnableYScrollFlag,b
        
        +
        jsl rlUnknown88BC05

        lda wUnknown0007D8,b
        cmp #2
        bne _End

          jsl $88C0B3

        _End
        rtl

        .databank 0

        ; 88/A7F5








      rsUnknown88AF4C ; 88/AF4C

        .al
        .autsiz
        .databank ?

        ; X = deployment offset

        stx $0772,b

        lda wCursorXOffset,b
        clc
        adc wMapScrollXPixels,b
        sta wUnknown00076C,b

        lda wCursorYOffset,b
        clc
        adc wMapScrollYPixels,b
        sta wUnknown00076E,b

        lda #1
        sta $07DA,b
        stz $07DC,b
        stz $07DE,b

        jsl rlDeployedUnitSetHidden

        stz wUnknown0007E2,b
        jsl rlUnknown88C9A6
        rtl

        .databank 0

      rlUnknown88AF7B ; 88/AF7B

        .al
        .autsiz
        .databank ?

        phx
        stz $07DA,b
        stz $07E0,b

        ldx $0772,b
        lda aDeploymentTable._UnitRAMPointer,x
        beq +

          sta $00089B
        
        +
        ldx $0772,b
        jsl rlDeployedUnitUnsetHiddenIfAlive

        ldx $0772,b
        lda aDeploymentTable._State,x
        bit #DeploymentStateCanto
        bne +

          lda bUnknown000E7B,b
          and #$00FF
          bit #$0041
          bne +

            ldx $0772,b
            jsl rlUnknown88B4DB

        +
        plx
        rtl

        .databank 0

      rsMapInputHandler ; 88/AFB6

        .al
        .autsiz
        .databank ?

        lda $04BA,b
        bne _End

        lda wJoy1New
        bit #JOY_A
        bne _APressed

        bit #JOY_B
        bne _BPressed

        bit #JOY_Select
        bne _SelectPressed

        bit #JOY_X
        bne _XPressed

        bit #JOY_Start
        bne _StartPressed

        bit #JOY_R
        bne _RPressed

        bit #JOY_L
        bne _LPressed
        
        _End
        rts
        
        _APressed
        jsr $88B028
        rts
        
        _SelectPressed
        lda wUnknown000770,b
        beq +

          rts

        +
        jsr $88B10B
        rts
        
        _BPressed
        lda wUnknown000770,b
        beq +

          jsr $88B133

        +
        rts
        
        _XPressed
        jsr $88B1C2
        rts
        
        _StartPressed
        jsr $88B20C
        rts
        
        _RPressed
        lda wUnknown000770,b
        beq +

          rts

        +
        lda wJoy1Input
        cmp #(JOY_L | JOY_R)
        beq +

        lda #5
        jsl $808FAD

        lda #0
        sta $0790,b
        jsr $88B51A
        rts
        
        _LPressed
        lda wUnknown000770,b
        beq +

          rts

        +
        jsr $88C1BF
        rts

        .databank 0

        ; 88/B028


















      rlUnknown88B4DB ; 88/B4DB

        .al
        .autsiz
        .databank ?

        sta $0784,b

        lda wCursorXOffset,b
        clc
        adc wMapScrollXPixels,b
        lsr a
        lsr a
        lsr a
        lsr a
        sta $078C,b

        lda wCursorYOffset,b
        clc
        adc wMapScrollYPixels,b
        lsr a
        lsr a
        lsr a
        lsr a
        sta $078E,b

        ldx $0784,b
        lda aDeploymentTable._XTilePosition,x
        sec
        sbc $078C,b
        sta $0778,b

        lda aDeploymentTable._YTilePosition,x
        sec
        sbc $078E,b
        sta $077A,b

        lda #$0004
        sta wUnknown0007D8,b
        rtl

        .databank 0

        ; 88/B51A






      rsUnknown88B64F ; 88/B64F

        .al
        .autsiz
        .databank ?

        lda $0778,b
        beq ++
        bpl +

          inc $0778,b
          lda #$0200
          bra _End
          
            +
            dec $0778,b
            lda #$0100
            bra _End

        +
        lda $077A,b
        beq _B681
        beq +

          inc $077A,b
          lda #$0800
          bra _End

        +
        dec $077A,b
        lda #$0400
        bra _End
        
        _End
        sta wMapScrollDirectionIdentifier,b
        rts

        _B681
        lda wUnknown0007D8,b
        cmp #5
        beq _B6A6

          cmp #6
          beq _B6B6

            cmp #7
            beq _B6D4

              stz wUnknown00073A,b
              stz wMapScrollScriptOffset
              stz wUnknown0007D8,b
              lda #$0004
              trb $0788,b
              lda #0
              rts
        
        _B6A6
        stz wUnknown00073A,b
        stz wMapScrollScriptOffset,b
        stz wUnknown0007D8,b
        jsr $88B701
        lda #0
        rts

        _B6B6
        stz wUnknown00073A,b
        stz wMapScrollScriptOffset,b
        lda #3
        sta wUnknown0007D8,b
        lda $0772,b
        sta $00
        lda $0774,b
        sta $02
        jsl $8591B2
        lda #0
        rts

        _B6D4
        stz wUnknown00073A,b
        stz wMapScrollScriptOffset,b
        stz wUnknown0007D8,b
        lda $0D87,b
        bit #$0008
        bne +

          jsr $88B701
          lda #0
          rts

        +
        ldx $0772,b
        jsl rlUnknown84D4A2
        lda #$0008
        tsb $0788,b
        lda #0
        rts

        .databank 0

        ; 88/B6FD








      rlUnknown88BC05 ; 88/BC05

        .al
        .autsiz
        .databank ?

        lda #$0001
        trb $0764,b

        lda wMapScrollDirectionIdentifier,b
        cmp #$0200
        beq _0200

        cmp #$0100
        beq _0100

        cmp #$0800
        beq _0800

        cmp #$0400
        beq _0400

        cmp #$0A00
        beq _0A00

        cmp #$0600
        beq _0600

        cmp #$0900
        beq _0900

        cmp #$0500
        beq _0500

        rtl

        _0200
        jsr rsUnknown88BC63
        rtl
        
        _0100
        jsr rsUnknown88BD09
        rtl
        
        _0800
        jsr $88BDA1
        rtl
        
        _0400
        jsr $88BE57
        rtl
        
        _0A00
        jsr rsUnknown88BC63
        jsr $88BDA1
        rtl
        
        _0600
        jsr rsUnknown88BC63
        jsr $88BE57
        rtl
        
        _0900
        jsr rsUnknown88BD09
        jsr $88BDA1
        rtl
        
        _0500
        jsr rsUnknown88BD09
        jsr $88BE57
        rtl

        .databank 0

      rsUnknown88BC63 ; 88/BC63

        .al
        .autsiz
        .databank ?

        lda wMapScrollXPixels,b
        cmp wMapMinXScroll,b
        beq +

        lda wCursorXOffset,b
        sec
        sbc wMapScrollSpeed,b
        cmp #$0030
        bcc ++

        sta wCursorXOffset,b
        lda #$0001
        tsb $0764,b
        rts
        
        +
        lda wCursorXOffset,b
        sec
        sbc wMapScrollSpeed,b
        cmp #$0010
        bcc _BCF4

        sta wCursorXOffset,b
        lda #$0001
        tsb $0764,b
        rts
        
        +
        lda wMapScrollXPixels,b
        sec
        sbc wMapScrollSpeed,b
        sec
        sbc #1
        cmp wMapMinXScroll,b
        bmi +
        bcs ++
        
        +
        clc
        adc #1
        sta $00

        lda wMapMinXScroll,b
        sec
        sbc $00
        sta $00

        lda wCursorXOffset,b
        sec
        sbc #$0030
        clc
        adc wMapScrollCurrentPixelDistance,b
        sta wMapScrollCurrentPixelDistance,b

        lda #$0030
        sec
        sbc $00
        sta wCursorXOffset,b
        bra ++
        
        +
        lda wCursorXOffset,b
        sec
        sbc #$0030
        clc
        adc wMapScrollCurrentPixelDistance,b
        sta wMapScrollCurrentPixelDistance,b

        lda #$0030
        sta wCursorXOffset,b
        
        +
        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        lda #$0001
        tsb $0764,b
        rts

        _BCF4
        lda wCursorXOffset,b
        sec
        sbc #$0010
        clc
        adc wMapScrollCurrentPixelDistance,b
        sta wMapScrollCurrentPixelDistance,b
        lda #$0010
        sta wCursorXOffset,b
        rts

        .databank 0

      rsUnknown88BD09 ; 88/BD09

        .al
        .autsiz
        .databank ?

        lda wMapScrollXPixels,b
        cmp wMapMaxXScroll,b
        bcs +

          lda wCursorXOffset,b
          clc
          adc wMapScrollSpeed,b
          cmp #$00C1
          bcs ++

            sta wCursorXOffset,b
            lda #$0001
            tsb $0764,b
            rts

        +
        lda wCursorXOffset,b
        clc
        adc wMapScrollSpeed,b
        cmp #$00E1
        bcs _BD8C

          sta wCursorXOffset,b
          lda #$0001
          tsb $0764,b
          rts

        +
        lda wMapScrollXPixels,b
        clc
        adc wMapScrollSpeed,b
        cmp wMapMaxXScroll,b
        bcc +

          sec
          sbc wMapMaxXScroll,b
          sta $00
          lda #$00C0
          sec
          sbc wCursorXOffset,b
          clc
          adc wMapScrollCurrentPixelDistance,b
          sta wMapScrollCurrentPixelDistance,b

          lda $00
          clc
          adc #$00C0
          sta wCursorXOffset,b
          bra ++
        
        +
        lda #$00C0
        sec
        sbc wCursorXOffset,b
        clc
        adc wMapScrollCurrentPixelDistance,b
        sta wMapScrollCurrentPixelDistance,b
        lda #$00C0
        sta wCursorXOffset,b
        
        +
        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        lda #$0001
        tsb $0764,b
        rts

        _BD8C
        lda #$00E0
        sec
        sbc wCursorXOffset,b
        clc
        adc wMapScrollCurrentPixelDistance,b
        sta wMapScrollCurrentPixelDistance,b
        lda #$00E0
        sta wCursorXOffset,b
        rts

        .databank 0

        ; 88/BDA1






















      rlUnknown85CA4B ; 85/CA4B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda #(`$85C652)<<8
        sta $62+1
        lda #<>$85C652
        sta $62
        jsl rlProcEngineFindProc
        bcc +

          lda #$C6C6
          sta $0F77,b,x
          lda #1
          sta $0F97,b,x

        +
        plx
        plp
        plb
        rtl

        .databank 0

        ; 85/CA70







      rlUnknown88C9A6 ; 88/C9A6

        .al
        .autsiz
        .databank ?

        phx
        phk
        plb

        lda #$FFFF
        sta $0865,b

        ldx $0772,b
        lda aDeploymentTable._DeploymentOffsets,x
        tax
        lda aDeploymentTable._MapSpriteID,x
        and #$8000
        bne _Tall

          ldx $0772,b
          lda aDeploymentTable._DeploymentOffsets,x
          tax
          lda aDeploymentTable._MapSpriteID,x
          and #~$8000
          sta wR0
          clc
          adc wR0
          clc
          adc wR0
          tax
          lda aMapMovementShortSpritePointers,x
          sta lR45
          lda aMapMovementShortSpritePointers+1,x
          sta lR45+1
          lda #(`$7EAB88)<<8
          sta lR47+1
          lda #<>$7EAB88
          sta lR47
          jsl rlDecompressSingle

          plx
          rtl
        
        _Tall
        ldy $0772,b
        lda aDeploymentTable._DeploymentOffsets,x
        tax
        lda aDeploymentTable._MapSpriteID,x
        and #~$8000
        sta wR0
        clc
        adc wR0
        clc
        adc wR0
        tax
        lda aMapMovementTallSpritePointers,x
        sta lR45
        lda aMapMovementTallSpritePointers+1,x
        sta lR45+1
        lda #(`$7EAB88)<<8
        sta lR47+1
        lda #<>$7EAB88
        sta lR47
        jsl rlDecompressSingle

        plx
        rtl

        .databank 0

        ; 88/CA28












      aUnknown88CBE8 ; 88/CBE8

        ; Indexed with map sprite ID

09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E 0E











      rlUnknown84C12E ; 84/C12E

        .al
        .autsiz
        .databank ?

        ; Unset grayed and moved status of all units in a faction?

        ; Input:
        ; A = FactionSlot

        phb
        php
        phk
        plb
        phx
        phy

        tay
        ldx #1
        
          -
          stx wRoutineVariable1,b
          tya
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID

          lda wSelectedUnitDataRAMPointer,b
          beq +

            phx
            jsl rlGetSelectedUnitDeploymentOffset
            tax
            jsl rlUnknown84CA97
            plx

            lda #UnitStateMoved
            jsl rlUnsetSelectedUnitStates
            inc x
            bra -

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C15F
















































      rlCheckTalkEventEntryAvailable ; 87/9E42

        .al
        .autsiz
        .databank ?

        ; Returns SEC if a talk entry is possible
        ; Returns the CostsMoneyFlag in A

        phb
        phk 
        plb
        phx
        phy

        lda wR0
        pha
        lda wR1
        pha
        lda lR18
        pha
        lda lR18+1
        pha

        jsl rlGetChapterTalkEventsPointer

        lda lR18
        beq _End

          ldy wSelectedUnitDataRAMPointer,b

          lda wRoutineVariable1,b
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitCharacterID
          sta wR1

          sty wSelectedUnitDataRAMPointer,b

          jsl rlGetSelectedUnitCharacterID
          sta wR0

          ldy lR18
          sep #$20
          lda lR18+2
          pha
          rep #$20
          plb
          
          _Loop
          lda structChapterTalkEventEntry.Chapter,b,y
          cmp #$FFFF
          beq _CLC

            pha

            lda structChapterTalkEventEntry.Flag,b,y
            and #$00FF
            sta wEventEngineParameter1,b

            pla

            jsl rlCheckIfEventFlagOfSpecifiedChapterSet
            bcs _Next

              lda structChapterTalkEventEntry.ActiveUnit,b,y
              cmp #$FFFF
              beq +

                cmp wR0
                bne _Next
              
              +
              lda structChapterTalkEventEntry.TargetUnit,b,y
              cmp wR1
              bne _Next

                ; This is a routine index and not a flag, but a flag simplifies things.
                lda structChapterTalkEventEntry.CostsMoneyFlag,b,y
                and #$00FF
                asl a
                tax
                jsr (aTalkEventRoutinePointers,x)
                bcs _SEC

            _Next
            tya
            clc
            adc #size(structChapterTalkEventEntry)
            tay
            bra _Loop

          _CLC
          clc
        
        _End
        plx
        stx lR18+1
        plx
        stx lR18
        plx
        stx wR1
        plx
        stx wR0

        ply
        plx
        plb
        rtl

        _SEC
        txa
        lsr a
        sec
        bra _End

        .databank 0

      aTalkEventRoutinePointers ; 87/9ED4

        .word <>rsTalkEventRoutineAlways
        .word <>rsTalkEventRoutineCheckMoney

      rsTalkEventRoutineAlways ; 87/9ED8

        .al
        .autsiz
        .databank ?

        sec
        rts

        .databank 0

      rsTalkEventRoutineNever ; 87/9EDA

        .al
        .autsiz
        .databank ?

        clc
        rts

        .databank 0

      rsTalkEventRoutineCheckMoney ; 87/9EDC

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitMoney
        cmp #10000
        bcc rsTalkEventRoutineNever
        bra rsTalkEventRoutineAlways

        .databank 0

        ; 87/9EE7






      rlUnknown848924 ; 84/8924

        .al
        .autsiz
        .databank ?

        ; check if in range?

        ; wR10 = item min range
        ; wR11 = item max range

        php
        phx
        ldx wR0
        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx

        phb
        phk
        plb

        asl a
        tax
        lda aUnknown848A0D,b,x
        sta wR0

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        stz $442A,b

        lda wR11
        cmp wR10
        bcs +

          ; Min range = Max range
          jml _End

        +
        lda wR10
        bne +

          ; Min range = 0?
          jml _End

        +
        sta $4420,b

        lda wR11
        bne +

          ; Max range = 0?
          jml _End

        +
        sta $4422,b

        lda wR12
        beq _Loop

          ldx #$03FE
          lda #$FFFF

          -
          sta $854A,b,x
          dec x
          dec x
          bpl -

        _Loop
        lda $4420,b
        clc
        adc #16
        asl a
        asl a
        asl a
        asl a
        asl a
        clc
        adc #16
        sta aAIAction.wAttackMapTileIndex,b

        lda #3
        sta $4428,b

          -
          lda $4420,b
          dec a
          sta aAIAction.wAttackDirection,b

          lda $4428,b
          asl a
          tax
          lda aUnknown8489F5,x
          sta aAIAction.wAttackMapTileIndexModifier,b

            -
            ldx aAIAction.wAttackMapTileIndex,b
            lda aRangeMap,b,x
            and #$00FF
            cmp #$00FF
            beq +

              ; A = deployment offset
              jsr rsUnknown8489F2
              bcc +

                inc $442A,b
                lda wR12
                beq +

                  sep #$20
                  lda aRangeMap,b,x
                  sta $854A,b,x
                  rep #$20
            
            +
            lda aAIAction.wAttackMapTileIndex,b
            clc
            adc aAIAction.wAttackMapTileIndexModifier,b
            sta aAIAction.wAttackMapTileIndex,b

            dec aAIAction.wAttackDirection,b
            bpl -

          dec $4428,b
          bpl --

        inc $4420,b
        lda $4420,b
        cmp $4422,b
        bcc _Loop
        beq _Loop
        
        _End
        lda $442A,b

        plb
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        stx wR0

        plx
        plp
        rtl

        .databank 0

      rsUnknown8489F2 ; 84/89F2

        .al
        .autsiz
        .databank ?

        jmp (wR0)

        .databank 0

      aUnknown8489F5 ; 84/89F5

        .word 31
        .word 33
        .word -31
        .word -33

        .word $FFFF
        .word $0001
        .word $0001
        .word $0001
        .word $0001
        .word $FFFF
        .word $FFFF
        .word $FFFF

      aUnknown848A0D ; 84/8A0D

        .word <>rsUnknown848A29
        .word <>rsUnknown848A2E
        .word <>rsUnknown848A33
        .word <>rsUnknown848A38
        .word <>rsUnknown848A4E
        .word <>rsUnknown848A70
        .word <>rsUnknown848A8E
        .word <>rsUnknown848A9E
        .word <>rsUnknown848AB8
        .word <>$848AED
        .word <>$848B1B
        .word <>$848B49
        .word <>$848B88
        .word <>$848BC9

      rsUnknown848A29 ; 84/8A29

        .al
        .autsiz
        .databank ?

        jsl $84D52E
        rts

        .databank 0

      rsUnknown848A2E ; 84/8A2E

        .al
        .autsiz
        .databank ?

        jsl rlCheckIfTargetFoeOfOwnFaction
        rts

        .databank 0

      rsUnknown848A33 ; 84/8A33

        .al
        .autsiz
        .databank ?

        jsl rlCheckIfTargetBelongsToOwnFaction
        rts

        .databank 0

      rsUnknown848A38 ; 84/8A38

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda aDeploymentTable._UnitRAMPointer,x
        sta wRoutineVariable1
        jsl rlCheckTalkEventEntryAvailable
        bcs +

          jsl $879EE7
        
        +
        plx
        rts

        .databank 0

      rsUnknown848A4E ; 84/8A4E

        .al
        .autsiz
        .databank ?

        phx
        tax
        txa
        jsl $84D52E
        bcc _CLC

        txa
        jsl rlGetTerrainTypeByDeploymentOffset
        cmp #TerrainCastleGate
        beq _SEC

        lda aDeploymentTable._State,x
        bit #DeploymentStateGuardingCastle
        beq _CLC
        
        _SEC
        plx
        sec
        rts
        
        _CLC
        plx
        clc
        rts

        .databank 0

      rsUnknown848A70 ; 84/8A70

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer
        jsl rlGetSelectedUnitClassID
        cmp #Civilian
        beq _SEC

        cmp #Child
        bne _CLC

        _SEC
        plx
        sec
        rts

        _CLC
        plx
        clc
        rts

        .databank 0

      rsUnknown848A8E ; 84/8A8E

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda aDeploymentTable._UnitRAMPointer,x
        sta wRoutineVariable1
        jsl rlCheckTalkEventEntryAvailable
        plx
        rts

        .databank 0

      rsUnknown848A9E ; 84/8A9E

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda aDeploymentTable._State,x
        bit #DeploymentStateAsleep
        bne _CLC

        bit #DeploymentStateGrayed
        bne +

        _CLC
        clc
        bra _End
        
        +
        txa
        jsl rlCheckIfTargetBelongsToOwnFaction
        
        _End
        plx
        rts

        .databank 0

      rsUnknown848AB8 ; 84/8AB8

        .al
        .autsiz
        .databank ?

        phx
        phy
        tax
        lda wSelectedUnitDataRAMPointer
        tay

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer
        jsl rlGetSelectedUnitMaxHP
        sta $442C,b
        jsl rlGetSelectedUnitCurrentHP
        cmp $442C,b
        bne +

          tya
          sta wSelectedUnitDataRAMPointer
          clc
          bra _End

        +
        tya
        sta wSelectedUnitDataRAMPointer
        txa
        jsl rlCheckIfTargetFoeOfOwnFaction
        
        _End
        ply
        plx
        rts

        .databank 0

        ; 84/8AED























      aFormationPatternOffsets ; 87/DCD8

        .word aFormationPatternNone           - aFormationPatternOffsets
        .word aFormationPatternBlockAhead     - aFormationPatternOffsets
        .word aFormationPatternCheckerboard   - aFormationPatternOffsets
        .word aFormationPatternArrowShaft     - aFormationPatternOffsets
        .word aFormationPatternArrowTip       - aFormationPatternOffsets
        .word aFormationPatternWall1Wide      - aFormationPatternOffsets
        .word aFormationPatternWall2Wide      - aFormationPatternOffsets
        .word aFormationPatternLine1Wide      - aFormationPatternOffsets
        .word aFormationPatternLine2Wide      - aFormationPatternOffsets
        .word aFormationPatternLine3Wide      - aFormationPatternOffsets
        .word aFormationPatternUForm          - aFormationPatternOffsets
        .word aFormationPatternZipper         - aFormationPatternOffsets
        .word aFormationPatternCircle         - aFormationPatternOffsets
        .word aFormationPatternCastleDefense  - aFormationPatternOffsets
        .word aFormationPatternJulius         - aFormationPatternOffsets

      aFormationPatternNone ; 87/DCF6

        ; No formation

        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0
        .char  0,  0

      aFormationPatternBlockAhead ; 87/DD1A

        ; Formation:
        ; X X X X X
        ; X X X X X
        ; X X X X X
        ; - X L X -

        .char  0,  0 ; 0
        .char  0, -1 ; 1
        .char -1,  0 ; 2
        .char  1,  0 ; 3
        .char  0, -2 ; 4
        .char -1, -1 ; 5
        .char  1, -1 ; 6
        .char -2, -1 ; 7
        .char  2, -1 ; 8
        .char -2, -2 ; 9
        .char  2, -2 ; 10
        .char -1, -2 ; 11
        .char  1, -2 ; 12
        .char  0, -3 ; 13
        .char -1, -3 ; 14
        .char  1, -3 ; 15
        .char -2, -3 ; 16
        .char  2, -3 ; 17

      aFormationPatternCheckerboard ; 87/DD3E

        ; Formation:
        ; X - X - X - X - X
        ; - X - X - X - X -
        ; X - X - L - X - X
        ; - X - X - X - X -

        .char  0,  0
        .char -1,  1
        .char  1,  1
        .char -2,  0
        .char  2,  0
        .char  0, -2
        .char -2, -2
        .char  2, -2
        .char -1, -1
        .char  1, -1
        .char -4,  0
        .char  4,  0
        .char -3,  1
        .char  3,  1
        .char -3, -1
        .char  3, -1
        .char -4, -2
        .char  4, -2

      aFormationPatternArrowShaft ; 87/DD62

        ; Formation:
        ; - - - X - - -
        ; - - - X - - -
        ; - - X X X - -
        ; - X X X X X -
        ; X X X X X X X
        ; - - - L - - -

        .char  0,  0
        .char  0, -1
        .char -1, -1
        .char  1, -1
        .char  0, -2
        .char -2, -1
        .char  2, -1
        .char -1, -2
        .char  1, -2
        .char  0, -3
        .char -3, -1
        .char  3, -1
        .char -2, -2
        .char  2, -2
        .char -1, -3
        .char  1, -3
        .char  0, -4
        .char  0, -5

      aFormationPatternArrowTip ; 87/DD86

        ; Formation: (with a small error)
        ; - - X - X - - -
        ; X X X X X X - X
        ; - X X X X X - -
        ; - - X X X - - -
        ; - - - L - - - -

        .char  0,  0
        .char  0, -1
        .char -1, -1
        .char  1, -1
        .char  0, -2
        .char -1, -2
        .char  1, -2
        .char -2, -2
        .char  2, -2
        .char  0, -3
        .char -1, -3
        .char  1, -3
        .char -2, -3
        .char  2, -3
        .char -3, -3
        .char  4, -3
        .char -1, -4
        .char  1, -4

      aFormationPatternWall1Wide ; 87/DDAA

        ; Formation:
        ; X X X X X X X X X X X X X X X X X
        ; - - - - - - - - L - - - - - - - -

        .char  0,  0
        .char  0, -1
        .char -1, -1
        .char  1, -1
        .char -2, -1
        .char  2, -1
        .char -3, -1
        .char  3, -1
        .char -4, -1
        .char  4, -1
        .char -5, -1
        .char  5, -1
        .char -6, -1
        .char  6, -1
        .char -7, -1
        .char  7, -1
        .char -8, -1
        .char  8, -1

      aFormationPatternWall2Wide ; 87/DDCE

        ; Formation:
        ; X X X X X X X X X
        ; X X X X L X X X X

        .char  0,  0
        .char -1,  0
        .char  1,  0
        .char  0, -1
        .char -1, -1
        .char  1, -1
        .char -2,  0
        .char  2,  0
        .char -2, -1
        .char  2, -1
        .char -3,  0
        .char  3,  0
        .char -3, -1
        .char  3, -1
        .char -4,  0
        .char  4,  0
        .char -4, -1
        .char  4, -1

      aFormationPatternLine1Wide ; 87/DDF2

        ; Formation:
        ; just 17 units straight above leader

        .char  0, -1
        .char  0, -2
        .char  0, -3
        .char  0, -4
        .char  0, -5
        .char  0, -6
        .char  0, -7
        .char  0, -8
        .char  0, -9
        .char  0, -10
        .char  0, -11
        .char  0, -12
        .char  0, -13
        .char  0, -14
        .char  0, -15
        .char  0, -16
        .char  0, -17
        .char  0, -18

      aFormationPatternLine2Wide ; 87/DE16

        ; Formation:
        ; X X
        ; X X
        ; X X
        ; X X
        ; X X
        ; X X
        ; X X
        ; X X
        ; L X

        .char  0,  0
        .char  1,  0
        .char  0, -1
        .char  1, -1
        .char  0, -2
        .char  1, -2
        .char  0, -3
        .char  1, -3
        .char  0, -4
        .char  1, -4
        .char  0, -5
        .char  1, -5
        .char  0, -6
        .char  1, -6
        .char  0, -7
        .char  1, -7
        .char  0, -8
        .char  1, -8

      aFormationPatternLine3Wide ; 87/DE3A

        ; Formation:
        ; X X X
        ; X X X
        ; X X X
        ; X X X
        ; X X X
        ; X L X

        .char  0,  0
        .char -1,  0
        .char  1,  0
        .char  0, -1
        .char -1, -1
        .char  1, -1
        .char  0, -2
        .char -1, -2
        .char  1, -2
        .char  0, -3
        .char -1, -3
        .char  1, -3
        .char  0, -4
        .char -1, -4
        .char  1, -4
        .char  0, -5
        .char -1, -5
        .char  1, -5

      aFormationPatternUForm ; 87/DE5E

        ; Formation:
        ; X X - - - - - - - X X
        ; X X - - - - - - - X X
        ; - - X X X X X X X - -
        ; - - - - X L X - - - -

        .char  0,  0
        .char  0, -1
        .char -1,  0
        .char  1,  0
        .char -2, -1
        .char  2, -1
        .char -4, -2
        .char  4, -2
        .char -4, -3
        .char  4, -3
        .char -3, -1
        .char  3, -1
        .char -5, -2
        .char  5, -2
        .char -5, -3
        .char  5, -3
        .char -1, -1
        .char  1, -1

      aFormationPatternZipper ; 87/DE82

        ; Formation:
        ; X X -
        ; - X X
        ; X X -
        ; - X X
        ; X X -
        ; - X X
        ; X X -
        ; - X X
        ; X L -

        .char  0,  0
        .char -1,  0
        .char  0, -1
        .char  1, -1
        .char  0, -2
        .char -1, -2
        .char  0, -3
        .char  1, -3
        .char  0, -4
        .char -1, -4
        .char  0, -5
        .char  1, -5
        .char  0, -6
        .char -1, -6
        .char  0, -7
        .char  1, -7
        .char  0, -8
        .char -1, -8

      aFormationPatternCircle ; 87/DEA6

        ; Formation:
        ; - - X X X - -
        ; - X - - - X -
        ; X - - X - - X
        ; X - - L - - X
        ; X - - - - - X
        ; - - X - - X -
        ; - - X X X - -

        .char  0,  0
        .char  0, -1
        .char -3,  1
        .char  3,  1
        .char  0,  3
        .char -2, -2
        .char  2,  2
        .char  2, -2
        .char -1,  2
        .char -1, -3
        .char  1,  3
        .char -3,  0
        .char  3,  0
        .char  1, -3
        .char -1,  3
        .char -3, -1
        .char  3, -1
        .char  0, -3

      aFormationPatternCastleDefense ; 87/DECA

        ; Formation:
        ; X - L - X
        ; X - - - X
        ; X 2 S 3 X
        ; - X 1 X -
        ; - - X - -

        .char  0, -2
        .char  0,  1
        .char -1,  0
        .char  1,  0
        .char  0,  2
        .char -1,  1
        .char  1,  1
        .char -2,  0
        .char  2,  0
        .char -2,  1
        .char  2,  1
        .char -2, -1
        .char  2, -1
        .char -2, -2
        .char  2, -2
        .char  0,  3
        .char -1,  2
        .char  1,  2

      aFormationPatternJulius ; 87/DEEE

        ; Formation:
        ; - - - L - - -
        ; - - - - - - -
        ; - X X S X - -
        ; - X X X X - X
        ; X - - X - - -
        ; - - X - X - -

        .char  0, -2
        .char  0,  1
        .char -1,  0
        .char  1,  0
        .char  0,  2
        .char -1,  1
        .char  1,  1
        .char -1,  3
        .char  1,  3
        .char -2,  1
        .char  3,  1
        .char -3,  2
        .char -2,  0
        .char -3, -2
        .char -3, -2
        .char -3, -2
        .char -3, -2
        .char -3, -2

; 87/DF12
















      procUnknown9EC70B ; 9E/C70B

        .structProcInfo "ON", rlProcUnknown9EC70BInit, rlProcUnknown9EC70BCycle, $9ECAD2

      rlProcUnknown9EC70BInit ; 9E/C713
      
        .al
        .autsiz
        .databank ?

        lda $0302,b
        sta aProcSystem.aBody7,b,x

        stz $0302,b
        jsl $88CD53
        jsl $88CD61

        lda #1
        sta aProcSystem.aBody4,b,x
        sta $7F4C2D

        lda #0
        sta $7F459E
        sta $7F4BE7
        sta $7F4BE9
        sta $7F4C05
        sta $7F4C07
        sta $7F50CB

        lda #$FFFF
        sta $7F4BED
        sta $7F4BEF
        sta $7F4BF1
        sta $7F4BF3
        sta $7F4C1F

        jsl $9E811F

        lda $10F7,b
        sta $7F4BD9

        lda $10F7,b
        ora #$4000
        sta $10F7,b

        rtl

        .databank 0

      rlProcUnknown9EC70BCycle ; 9E/C775
      
        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

        ; 9E/C776























      rlFadeInByTimer ; 80/A21C
      
        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = Timer

        ; Output:
        ; SEC if screen bright, else CLC

        phb
        php
        phk
        plb
        sep #$20
        sta wScreenFadingTimeIncrement,b

        lda wScreenFadingFlag,b
        bpl +

          lda wScreenFadingTimeIncrement,b
          sta wScreenFadingTimer,b
          stz wScreenFadingFlag,b

        +
        lda bBufferINIDISP
        and #INIDISP_Brightness
        cmp #INIDISP_Setting(false, 15)
        beq _SEC

          dec wScreenFadingTimer,b
          bne +

            lda wScreenFadingTimeIncrement,b
            sta wScreenFadingTimer,b

            lda bBufferINIDISP
            inc a
            and #INIDISP_Brightness
            sta bBufferINIDISP

          +
          plp
          plb
          clc
          rtl

        _SEC
        lda #$FF
        sta wScreenFadingFlag,b
        plp
        plb
        sec
        rtl

        .databank 0

      rlFadeOutByTimer ; 80/A25A
      
        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = Timer

        ; Output:
        ; SEC if screen dark, else CLC

        phb
        php
        phk
        plb
        sep #$20
        sta wScreenFadingTimeIncrement,b

        lda wScreenFadingFlag,b
        bpl +

          lda wScreenFadingTimeIncrement,b
          sta wScreenFadingTimer,b
          stz wScreenFadingFlag,b

        +
        lda bBufferINIDISP
        and #INIDISP_Brightness
        beq _SEC

        dec wScreenFadingTimer,b
        bne +

          lda wScreenFadingTimeIncrement,b
          sta wScreenFadingTimer,b

          lda bBufferINIDISP
          dec a
          and #INIDISP_Brightness
          sta bBufferINIDISP

        +
        plp
        plb
        clc
        rtl

        _SEC
        lda #$FF
        sta wScreenFadingFlag,b
        lda #INIDISP_Setting(true, 0)
        sta bBufferINIDISP
        plp
        plb
        sec
        rtl

        .databank 0

        ; 80/A29A


















      rlUnknown8885EF ; 88/85EF

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b

        jsl rlUnknown8886A3
        rtl

        .databank 0

      rlUnknown8885FD ; 88/85FD
      
        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b

        jsl rlUnknown8886AB
        rtl

        .databank 0

      rlUnknown88860B ; 88/860B

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        lda wMapEnableYScrollFlag,b

        jsl rlUnknown8886C3
        rtl

        .databank 0

      rlUnknown88861C ; 88/861C

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b

        jsl rlUnknown8886E1
        rtl

        .databank 0

      rlUnknown88862D ; 88/862D

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b

        jsl rlUnknown8886D2
        rtl

        .databank 0

      rlUnknown88863E ; 88/863E

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b

        jsl rlUnknown8886F0
        rtl

        .databank 0

      rlUnknown88864F ; 88/864F
      
        .al
        .autsiz
        .databank ?

        lda wMapScrollDirectionIdentifier,b
        cmp #$0200
        beq _867B

        cmp #$0100
        beq _8680

        cmp #$0800
        beq _8685

        cmp #$0400
        beq _868A

        cmp #$0A00
        beq _868F

        cmp #$0600
        beq _8694

        cmp #$0900
        beq _8699

        cmp #$0500
        beq _869E

        rtl

        _867B
        jsl rlUnknown8886A3
        rtl
        
        _8680
        jsl rlUnknown8886AB
        rtl
        
        _8685
        jsl rlUnknown8886B3
        rtl
        
        _868A
        jsl rlUnknown8886BB
        rtl
        
        _868F
        jsl rlUnknown8886C3
        rtl
        
        _8694
        jsl rlUnknown8886E1
        rtl
        
        _8699
        jsl rlUnknown8886D2
        rtl
        
        _869E
        jsl $8886F0
        rtl

        .databank 0

      rlUnknown8886A3 ; 88/86A3

        .al
        .autsiz
        .databank ?

        jsr rsMapScrollLeftSetBGOFS
        jsl rlUnknown8887D6
        rtl

        .databank 0

      rlUnknown8886AB ; 88/86AB

        .al
        .autsiz
        .databank ?

        jsr rsMapScrollRightSetBGOFS
        jsl $8887BC
        rtl

        .databank 0

      rlUnknown8886B3 ; 88/86B3

        .al
        .autsiz
        .databank ?

        jsr rsMapScrollUpSetBGOFS
        jsl $888798
        rtl

        .databank 0

      rlUnknown8886BB ; 88/86BB

        .al
        .autsiz
        .databank ?

        jsr rsMapScrollDownSetBGOFS
        jsl rlUnknown88877F
        rtl

        .databank 0

      rlUnknown8886C3 ; 88/86C3

        .al
        .autsiz
        .databank ?

        jsr rsMapScrollLeftSetBGOFS
        jsr rsMapScrollUpSetBGOFS
        jsl rlUnknown8887D6
        jsl $888798
        rtl

        .databank 0

      rlUnknown8886D2 ; 88/86D2

        .al
        .autsiz
        .databank ?

        jsr rsMapScrollRightSetBGOFS
        jsr rsMapScrollUpSetBGOFS
        jsl $8887BC
        jsl $888798
        rtl

        .databank 0

      rlUnknown8886E1 ; 88/86E1

        .al
        .autsiz
        .databank ?

        jsr rsMapScrollLeftSetBGOFS
        jsr rsMapScrollDownSetBGOFS
        jsl rlUnknown8887D6
        jsl rlUnknown88877F
        rtl

        .databank 0

      rlUnknown8886F0 ; 88/86F0
      
        .al
        .autsiz
        .databank ?

        jsr rsMapScrollRightSetBGOFS
        jsr rsMapScrollDownSetBGOFS
        jsl rlUnknown8887BC
        jsl rlUnknown88877F
        rtl

        .databank 0

      rsMapScrollRightSetBGOFS ; 88/86FF

        .al
        .autsiz
        .databank ?

        lda wMapEnableXScrollFlag,b
        beq +

          lda wMapScrollXPixels,b
          clc
          adc wMapScrollSpeed,b
          sta wMapScrollXPixels,b
          sta wBufferBG1HOFS
          cmp wMapMaxXScroll,b
          bcc +

            lda wMapMaxXScroll,b
            sta wMapScrollXPixels,b
            sta wBufferBG1HOFS

        +
        rts

        .databank 0

      rsMapScrollLeftSetBGOFS ; 88/871E

        .al
        .autsiz
        .databank ?

        lda wMapEnableXScrollFlag,b
        beq _End

          lda wMapScrollXPixels,b
          sec
          sbc wMapScrollSpeed,b
          sta wMapScrollXPixels,b
          sta wBufferBG1HOFS
          bmi +

            cmp wMapMinXScroll,b
            bcs _End

          +
          lda wMapMinXScroll,b
          sta wMapScrollXPixels,b
          sta wBufferBG1HOFS

        _End
        rts

        .databank 0

      rsMapScrollDownSetBGOFS ; 88/873F

        .al
        .autsiz
        .databank ?

        lda wMapEnableYScrollFlag,b
        beq _End

          lda wMapScrollYPixels,b
          clc
          adc wMapScrollSpeed,b
          sta wMapScrollYPixels,b
          sta wBufferBG1VOFS

          cmp wMapMaxYScroll,b
          bcc _End

            lda wMapMaxYScroll,b
            sta wMapScrollYPixels,b
            sta wBufferBG1VOFS

        _End
        rts

        .databank 0

      rsMapScrollUpSetBGOFS ; 88/875E

        .al
        .autsiz
        .databank ?

        lda wMapEnableYScrollFlag,b
        beq _End

          lda wMapScrollYPixels,b
          sec
          sbc wMapScrollSpeed,b
          sta wMapScrollYPixels,b
          sta wBufferBG1VOFS
          bmi +

            cmp wMapMinYScroll,b
            bcs _End

          +
          lda wMapMinYScroll,b
          sta wMapScrollYPixels,b
          sta wBufferBG1VOFS
        
        _End
        rts

        .databank 0

      rlUnknown88877F ; 88/877F

        .al
        .autsiz
        .databank ?

        jsr rsUnknown88891C

        lda wMapScrollYPixels,b
        sec
        sbc #$0020
        and #$00F8
        asl a
        asl a
        sta wUnknown000732,b

        lda #1
        sta wUnknown00072E,b
        rtl

        .databank 0

      rlUnknown888798 ; 88/8798

        .al
        .autsiz
        .databank ?

        jsr rsUnknown88895C

        lda wMapScrollYPixels,b
        and #$00F8
        asl a
        asl a
        sta wUnknown000732,b

        lda #1
        sta wUnknown00072E,b
        rtl

        .databank 0

      rlUnknown8887AD ; 88/87AD

        .al
        .autsiz
        .databank ?

        jsr rsUnknown88895C

        lda wMapScrollYPixels,b
        and #$00F8
        asl a
        asl a
        sta wUnknown000732,b
        rtl

        .databank 0

      rlUnknown8887BC ; 88/87BC

        .al
        .autsiz
        .databank ?

        jsr rsUnknown888DB8

        lda wMapScrollXPixels,b
        sec
        sbc #7
        and #$00F8
        lsr a
        lsr a
        lsr a
        sta wUnknown000730,b

        lda #1
        sta wUnknown00072C,b
        rtl

        .databank 0

      rlUnknown8887D6 ; 88/87D6

        .al
        .autsiz
        .databank ?

        jsr rsUnknown888E14

        lda wMapScrollXPixels,b
        and #$00F8
        lsr a
        lsr a
        lsr a
        sta wUnknown000730,b

        lda #1
        sta wUnknown00072C,b
        rtl

        .databank 0

        ; 88/87EC







      rsUnknown888901 ; 88/8901

        .al
        .autsiz
        .databank ?

        lda wUnknown00075C,b
        cmp #4
        beq ++

          cmp #8
          beq +

          +
          lda wR3
          clc
          adc #$0E00
          rts

        +
        lda wR3
        clc
        adc #$0700
        rts

        .databank 0

      rsUnknown88891C ; 88/891C

        .al
        .autsiz
        .databank ?

        stz wR2
        lda wMapScrollYPixels,b
        and #$0008
        beq +

          lda #2
          sta wR2

        +
        jsr rsUnknown888D57
        jsr rsUnknown888901
        tax
        stz wUnknown00072A,b
        
        lda wMapScrollXPixels,b
        and #$0008
        bne +

          jsr rsUnknown88899F

          lda wUnknown000770,b
          beq _End

            lda #$00E0
            jsr $888A14
            bra _End

        +
        jsr rsUnknown888BB3

        lda wUnknown000770,b
        beq _End

          lda #$00E0
          jsr $888C5F

        _End
        rts

        .databank 0

      rsUnknown88895C ; 88/895C

        .al
        .autsiz
        .databank ?

        stz $04
        lda $059A,b
        and #$0008
        beq +

          lda #2
          sta $04

        +
        jsr rsUnknown888D57

        lda $06
        sec
        sbc #0
        tax

        stz wUnknown00072A,b

        lda $0598,b
        and #$0008
        bne +

          jsr rsUnknown88899F

          lda wUnknown000770,b
          beq _End

            lda #0
            jsr $888A14
            bra _End

        +
        jsr rsUnknown888BB3

        lda wUnknown000770,b
        beq _End

          lda #0
          jsr $888C5F

        _End
        rts

        .databank 0

      rsUnknown88899F ; 88/899F

        .al
        .autsiz
        .databank ?

        _Loop
        lda aMapData,x
        and wUnknown000596,b
        asl a
        asl a
        asl a
        clc
        adc wR2
        phx
        tax

        lda $7F0000,x
        and #$DFFF
        sta $05DC,b,y
        lda $7F0004,x
        and #$DFFF
        sta $05DE,b,y

        plx
        lda wUnknown00075A,b
        bit #$0002
        beq +

          lda $7F6400,x
          and #$03FF
          asl a
          asl a
          asl a
          clc
          adc wR2
          phx
          tax

          lda $7F0000,x
          and #$DFFF
          ora #$2000
          sta $065C,b,y
          lda $7F0004,x
          and #$DFFF
          ora #$2000
          sta $065E,b,y

          plx
        
        +
        inc y
        inc y
        inc y
        inc y
        inx x
        inc x
        
        -
        lda wUnknown00072A,b
        beq +

          cpy wR8
          bcs _End
          bra _Loop

        +
        cpy #64
        bcc _Loop

          inc wUnknown00072A,b
          ldy #0
          bra -

        _End
        rts

        .databank 0

        ; 88/8A14








      rsUnknown888BB3 ; 88/8BB3

        .al
        .autsiz
        .databank ?

        ; Grabs the next row of map tiles when scrolling down?

        _Loop
        lda aMapData,x
        and wUnknown000596,b
        asl a
        asl a
        asl a
        clc
        adc wR2
        phx
        tax
        lda $7F0004,x
        and #$DFFF
        sta $05DC,b,y
        plx

        lda wUnknown00075A,b
        bit #$0002
        beq +

          lda $7F6400,x
          and #$03FF
          asl a
          asl a
          asl a
          clc
          adc wR2
          phx
          tax
          lda $7F0004,x
          and #$DFFF
          ora #$2000
          sta $065C,b,x
          plx

        +
        inc x
        inc x
        inc y
        inc y
        cpy #64
        bcc +

          inc wUnknown00072A,b
          ldy #0

        +
        lda aMapData,x
        and wUnknown000596,b
        asl a
        asl a
        asl a
        clc
        adc wR2
        phx
        tax
        lda $7F0000,x
        and #$DFFF
        sta $05DC,b,y
        plx

        lda $075A,b
        bit #$0002
        beq +

          lda $7F6400,x
          and #$03FF
          asl a
          asl a
          asl a
          clc
          adc wR2
          phx
          tax
          lda $7F0000,x
          and #$DFFF
          ora #$2000
          sta $065C,b,y
          plx

        +
        inc y
        inc y
        
        -
        lda wUnknown00072A,b
        beq +

          cpy wR8
          bcs _End
          bra _8C5B

        +
        cpy #64
        bcc _8C5B

          inc wUnknown00072A,b
          ldy #0
          bra -

        _End
        rts
        
        _8C5B
        jml _Loop

        .databank 0

        ; 88/8C5F





























      rsUnknown888D57 ; 88/8D57

        .al
        .autsiz
        .databank ?

        lda wUnknown00075C,b
        cmp #4
        beq ++

          cmp #8
          beq +
          
          +
          lda wMapScrollYPixels,b
          and #$FFF0
          asl a
          asl a
          asl a
          asl a
          sta wR3
          bra _8D7F

        +
        lda wMapScrollYPixels,b
        and #$FFF0
        asl a
        asl a
        asl a
        sta wR3
        bra _8D7F

        _8D7F
        lda wMapScrollXPixels,b
        and #$FFF0
        lsr a
        lsr a
        lsr a
        clc
        adc wR3
        sta wR3
        tax

        lda wMapScrollXPixels,b
        and #$00F8
        lsr a
        lsr a
        and #$003E
        sta wR8
        tay
        rts

        .databank 0

      rsUnknown888D9D ; 88/8D9D

        .al
        .autsiz
        .databank ?

        lda wUnknown00075C,b
        cmp #4
        beq ++

          cmp #8
          beq +

          +
          lda wR0
          clc
          adc #$1000
          rts

        +
        lda wR0
        clc
        adc #$0800
        rts

        .databank 0

      rsUnknown888DB8 ; 88/8DB8

        .al
        .autsiz
        .databank ?

        jsr rsUnknown888E73
        clc
        adc #32
        sta wR0

        jsr rsUnknown888D9D
        sta wR8
        stz wR2

        lda wMapScrollXPixels,b
        and #$0008
        bne +

        lda wR0
        sec
        sbc #2
        sta wR0

        lda wR8
        sec
        sbc #2
        sta wR8
        bra ++

        +
        lda #$FFFC
        sta wR2

        +
        lda wMapScrollYPixels,b
        and #$0008
        bne +

          lda #4
          jsr rsUnknown888EB5

          lda wUnknown000770,b
          beq _End

            lda #$00F8
            jsr $888F32
            bra _End

        +
        lda #4
        jsr $889108

        lda wUnknown000770,b
        beq _End

          lda #$00F8
          jsr $8891BC

        _End
        rts

        .databank 0

      rsUnknown888E14 ; 88/8E14

        .al
        .autsiz
        .databank ?

        ; Gets map tile index from camera position?
        jsr rsUnknown888E73
        sta wR0

        jsr rsUnknown888D9D
        sta wR8

        stz wR2

        lda wMapScrollXPixels,b
        and #$0008
        beq +

          lda #4
          sta wR2

        +
        lda wMapScrollYPixels,b
        and #$0008
        bne +

          lda #0
          jsr rsUnknown888EB5

          lda wUnknown000770,b
          beq _End

            lda #0
            jsr $888F32
            bra _End

        +
        lda #0
        jsr $889108

        lda wUnknown000770,b
        beq _End

          lda #0
          jsr $8891BC

        _End
        rts

        .databank 0

      rsUnknown888E5A ; 88/8E5A

        .al
        .autsiz
        .databank ?

        lda wUnknown00075C,b
        cmp #4
        beq ++

        cmp #8
        beq +
        
        +
        txa
        clc
        adc #$0100
        rts
        
        +
        txa
        clc
        adc #$0080
        rts

        .databank 0

      rsUnknown888E73 ; 88/8E73

        .al
        .autsiz
        .databank ?

        lda wMapScrollYPixels,b
        and #$00F8
        lsr a
        lsr a
        and #62
        sta wR3

        lda wUnknown00075C,b
        cmp #4
        beq ++

          cmp #8
          beq +

          +
          lda wMapScrollYPixels,b
          and #$FFF0
          asl a
          asl a
          asl a
          asl a
          sta wR0
          bra ++
        
        +
        lda wMapScrollYPixels,b
        and #$FFF0
        asl a
        asl a
        asl a
        sta wR0
        bra +
        
        +
        lda wMapScrollXPixels,b
        and #$FFF0
        lsr a
        lsr a
        lsr a
        clc
        adc wR0
        rts

        .databank 0

      rsUnknown888EB5 ; 88/8EB5

        .al
        .autsiz
        .databank ?

        sta wR1
        ldy wR3
        ldx wR0

          _Loop
          lda aMapData,x
          and wUnknown000596,b
          asl a
          asl a
          asl a
          clc
          adc wR2
          phx
          clc
          adc wR1
          tax
          lda $7F0000,x
          and #$DFFF
          sta $059C,b,y
          lda $7F0002,x
          and #$DFFF
          sta $059E,b,y
          plx

          lda wUnknown00075A,b
          bit #$0002
          beq +

            lda $7F6400,x
            and #$03FF
            asl a
            asl a
            asl a
            clc
            adc wR2
            phx
            clc
            adc wR1
            tax
            lda $7F0000,x
            and #$DFFF
            ora #$2000
            sta $061C,b,y
            lda $7F0002,x
            and #$DFFF
            ora #$2000
            sta $061E,b,y
            plx

          +
          inc y
          inc y
          inc y
          inc y
          cpy #64
          bcc +

            ldy #0

          +
          jsr rsUnknown888E5A
          cmp wR8
          bmi +
          bcs _End

          +
          tax
          jml _Loop
        
        _End
        rts

        .databank 0

        ; 88/8F32
























































































      rlGetTextSpeedOption ; 87/BEF1

        .al
        .autsiz
        .databank ?

        phb 
        php
        phk
        plb

        lda wOptionSettings,b
        and #$0038
        lsr a
        lsr a
        lsr a

        plp
        plb
        rtl

        .databank 0

        ; 87/BF01













      rlUnknown8B91F6 ; 8B/91F6

        .al
        .autsiz
        .databank ?

        lda #DialogueStatusPreventASpeedUp
        tsb aDialogue.wStatus,b

        lda #3
        sta aDialogue.wTextSpeed,b
        lda #2
        sta aDialogue.wTextSound,b

        lda wCurrentChapter,b
        cmp #-1
        bne +

          lda #4
          sta aDialogue.wUnknown00188C,b
          lda #6
          sta aDialogue.wTextSpeed,b
          lda #0
          sta aDialogue.wTextSound,b

        +
        lda #2
        sta aDialogue.wUnknown0018D0,b
        lda #(4 << 8 | 30)
        sta aDialogue._Slot[0].wDisplayArea,b,x
        lda #$9000 >> 1
        sta aDialogue._Slot[0].wVRAMAddress,b,x
        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[0].lBGBufferPosition+1,b,x
        lda #<>aBG3TilemapBuffer
        sta aDialogue._Slot[0].lBGBufferPosition,b,x

        ; Is this supposed to be X indexed?
        lda #TilemapEntry($100, 0, true, false, false)
        sta aDialogue.wBaseTile,b,x
        lda #$1604
        sta wR1

        sep #$20
        lda #0
        sta wR0+1
        xba
        sta wR1
        lda wR0
        lda wR1+1
        xba
        rep #$20

        lsr a
        lsr a
        clc
        adc wR0
        sta wR0

        ldx aDialogue.wSlotOffset,b
        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[0].lBGBufferPosition+1,b,x
        lda #<>aBG3TilemapBuffer
        clc
        adc wR0
        sta aDialogue._Slot[0].lBGBufferPosition,b,x
        rtl

        .databank 0

      rlUnknown8B9275 ; 8B/9275

        .al
        .autsiz
        .databank ?

        php
        lda #$7E00
        sta $24+1
        ldy #$FF00

        lda $18A1,b
        and #$0001
        bne +

        ldy #$FF80
        
        +
        sty $24

        ldy #0
        lda $18D4,b
        sec
        sbc #$8388
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        pha

        asl a
        asl a
        asl a
        cmp #$007F
        bcc +
        beq +

        pha
        lda $87
        sta $00
        lda $89
        sta $02
        lda #$007F
        jsl $919677
        pla
        sec
        sbc #$007F
        
        +
        pha
        lda $87
        sta $00
        lda $89
        sta $02
        pla
        jsl $919677
        jsl $919688
        sta $27
        sec
        sbc #$0010
        cmp $18E1,b
        bcs _9352

        sta $2D
        lda #$0100
        clc
        adc #0
        sta $00

        lda $27
        tax
        lda $18E1,b
        sec
        sbc $2D
        jsl $91969C
        txa
        beq _9352

        sta $2A
        clc
        adc #0
        sta $02
        lda $27
        sec
        sbc $2A
        jsl $919677
        lda $2A
        cmp #$0010
        bcc +

        lda #$0100
        clc
        adc #0
        sta $00
        lda $2A
        sec
        sbc $27
        clc
        adc #0
        sta $02
        
        +
        lda $2A
        and #$FFF0
        jsl $919677

        lda $2A
        and #$000F
        sta $2A
        beq _9366
        
        -
        lda #$0100
        clc
        adc #0
        sta $00
        lda $2A
        sec
        sbc $27
        clc
        adc #0
        sta $02
        lda #1
        jsl $919677
        dec $2A
        bne -
        bra _9366
        
        _9352
        lda #$0100
        clc
        adc #0
        sta $00
        lda #0
        sta $02
        lda $27
        jsl $919677
        
        _9366
        pla
        clc
        adc $18DC,b
        sta $00

        lda $1882,b
        bit #$1000
        bne +

        jml $8B942F
        
        +
        lda $18ED,b
        sec
        sbc #$8388
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sec
        sbc $00
        asl a
        asl a
        asl a
        pha
        lda $87
        sta $00
        lda $89
        sta $02
        pla
        jsl $919677
        jsl $919692
        sta $27
        sec
        sbc #$0010
        cmp $18FA,b
        bcs _941D

        sta $2D
        lda $87
        clc
        adc #0
        sta $00
        lda $27
        tax
        lda $18FA,b
        sec
        sbc $2D
        jsl $91969C
        txa
        beq _941D

        sta $2A
        clc
        adc $89
        sta $02
        lda $27
        sec
        sbc $2A
        jsl $919677

        lda $2A
        cmp #$0010
        bcs +

        lda $87
        clc
        adc #0
        sta $00
        lda $2A
        sec
        sbc $27
        clc
        adc $89
        sta $02
        lda $2A
        and #$FFF0
        jsl $919677
        
        +
        lda $2A
        and #$000F
        sta $2A
        beq _942F
        
        -
        lda $87
        clc
        adc #0
        sta $00
        lda $2A
        sec
        sbc $27
        clc
        adc $89
        sta $02
        lda #1
        jsl $919677
        dec $2A
        bne -
        bra _942F
        
        _941D
        lda $87
        clc
        adc #0
        sta $00
        lda $89
        sta $02
        lda $27
        jsl $919677
        
        _942F
        lda #1
        pha
        lda #$0100
        sta $00
        lda #0
        sta $02
        pla
        jsl $919677
        lda #0
        sta [$24],y
        plp
        rtl

        .databank 0

        ; 8B/9449



























      rlClearHighlightWorldMapPart ; 8B/8A84

        .al
        .autsiz
        .databank ?

        ldx #$07FE
        lda #$00FF

          -
          sta $7E7B88,x
          dec x
          dec x
          bpl -

        lda #0
        sta wBufferBG2HOFS
        lda #0
        sta wBufferBG2VOFS

        lda #(`procUnknown8B90D9)<<8
        sta lR44+1
        lda #<>procUnknown8B90D9
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

        ; 8B/8AAB






      rlUnknown8B84E5 ; 8B/84E5

        .al
        .autsiz
        .databank ?

        lda wR0
        sta $7F5420,x
        lda wR1
        sta $7F5430,x
        tya
        sta $7F5440,x
        lda #$FFFF
        sta $7F5400,x

        sep #$20
        lda #$16
        sta bBufferTS
        rep #$20

        phx
        tyx
        phy
        jsr (aUnknown8B8538,x)

        jsl rlDMAByStruct

          .structDMAToVRAM $7E7B88, 32 * 21 * size(word), $80, $A800

        ply
        tyx
        lda $8B85FF,x
        sta wBufferBG2HOFS
        lda $8B865F,x
        sta wBufferBG2VOFS
        plx

        ldx #14
        lda #0

          -
          sta aBGPaletteBuffer.aPalette1+$10,b,x
          sta aBGPaletteBuffer.aPalette5+$10,b,x
          dec x
          dec x
          bpl -

        rtl

        .databank 0

      aUnknown8B8538 ; 8B/8538

        .word <>rsUnknown8B85C4 ; $00
        .word <>rsUnknown8B85C4 ; $01
        .word <>rsUnknown8B8598 ; $02
        .word <>rsUnknown8B85C4 ; $03
        .word <>rsUnknown8B85C4 ; $04
        .word <>rsUnknown8B8598 ; $05
        .word <>rsUnknown8B8598 ; $06
        .word $85F0             ; $07
        .word <>rsUnknown8B8598 ; $08
        .word <>rsUnknown8B8598 ; $09
        .word <>rsUnknown8B8598 ; $0A
        .word <>rsUnknown8B8598 ; $0B
        .word <>rsUnknown8B8598 ; $0C
        .word <>rsUnknown8B8598 ; $0D
        .word <>rsUnknown8B8598 ; $0E
        .word <>rsUnknown8B8598 ; $0F
        .word <>rsUnknown8B8598 ; $10
        .word <>rsUnknown8B8598 ; $11
        .word <>rsUnknown8B8598 ; $12
        .word <>rsUnknown8B8598 ; $13
        .word <>rsUnknown8B8598 ; $14
        .word <>rsUnknown8B8598 ; $15
        .word <>rsUnknown8B8598 ; $16
        .word <>rsUnknown8B8598 ; $17
        .word <>rsUnknown8B8598 ; $18
        .word <>rsUnknown8B8598 ; $19
        .word <>rsUnknown8B8598 ; $1A
        .word <>rsUnknown8B8598 ; $1B
        .word <>rsUnknown8B8598 ; $1C
        .word <>rsUnknown8B8598 ; $1D
        .word <>rsUnknown8B8598 ; $1E
        .word <>rsUnknown8B8598 ; $1F
        .word <>rsUnknown8B8598 ; $20
        .word <>rsUnknown8B8598 ; $21
        .word <>rsUnknown8B8598 ; $22
        .word <>rsUnknown8B8598 ; $23
        .word <>rsUnknown8B8598 ; $24
        .word <>rsUnknown8B8598 ; $25
        .word <>rsUnknown8B8598 ; $26
        .word <>rsUnknown8B8598 ; $27
        .word <>rsUnknown8B8598 ; $28
        .word <>rsUnknown8B8598 ; $29
        .word <>rsUnknown8B8598 ; $2A
        .word <>rsUnknown8B8598 ; $2B
        .word <>rsUnknown8B8598 ; $2C
        .word <>rsUnknown8B8598 ; $2D
        .word <>rsUnknown8B8598 ; $2E
        .word <>rsUnknown8B8598 ; $2F

      rsUnknown8B8598 ; 8B/8598

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>$D13C85
        stx DecompressionVariables.lSource
        lda #`$D13C85
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor

        ; Red palette

        ldx #14
        
          -
          lda $8CDCB0,x
          sta $7ECB88,x
          dec x
          dec x
          bpl -

        rts

        .databank 0

      rsUnknown8B85C4 ; 8B/85C4

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>$D13C85
        stx DecompressionVariables.lSource
        lda #`$D13C85
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor

        ldx #14

        ; Blue palette

          -
          lda $8CDC30,x
          sta $7ECB88,x
          dec x
          dec x
          bpl -

        rts

        .databank 0

        ; 8B/85F0







      rsUnknown8B86CB ; 8B/86CB

        .al
        .autsiz
        .databank ?

        lda #14
        
          _Loop
          lda $7F5400,x
          beq _Next

            lda $7F5420,x
            sta wR0
            lda $7F5430,x
            sta wR1
            lda $7F5440,x
            tay

            phx
            jsr rsUnknown8B86EF
            plx

          _Next
          dec x
          dec x
          bpl _Loop

        rts

        .databank 0

      rsUnknown8B86EF ; 8B/86EF

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #$8B
        pha
        plb
        rep #$20

        lda $7F5410,x
        sta wR2
        lda $8740,b,y
        tay

        lda #0
        sta wR5
        sta wR4

        phy
        phx
        jsl $80885F
        plx
        ply

        lda wVBlankEnabledFramecount
        and #$0007
        bne _End

          lda $7F5410,x
          clc
          adc #1
          cmp #48
          bcs _End

            sta $7F5410,x
            lda $0000,b,y
            cmp $7F5410,x
            bne _End

              lda #(`$8B8B59)<<8
              sta lR44+1
              lda #<>$8B8B59
              sta lR44
              jsl rlProcEngineCreateProc

        _End
        rts

        .databank 0

        ; 8B/8740






      rsUnknown8B8000 ; 8B/8000

        .al
        .autsiz
        .databank ?

        lda #(`procUnknown828364)<<8
        sta lR44+1
        lda #<>procUnknown828364
        sta lR44
        jsl rlProcEngineFindProc
        bcs +

          lda wCurrentChapter,b
          cmp #$FFFF
          beq +

            lda wJoy1New
            cmp #JOY_Start
            bne +

              lda #2
              sta wScreenFadingProcInput,b

              lda #<>$80F2BE
              sta aProcSystem.wInput0,b

              lda #(`procUnknown828364)<<8
              sta lR44+1
              lda #<>procUnknown828364
              sta lR44
              jsl rlProcEngineCreateProc

              lda #2
              sta wUnknown00171C,b
              jsl rlUnknown9180BC
        
        +
        jsr $8B8275
        jsr rsUnknown8B86CB

        lda aDialogue.wStatus,b
        beq +

          lda #$00E2
          sta wR0
          lda #$00C4
          sta wR1
          jsl rlDisplayDialogueAPressArrows

          jsl rlDMAByStruct

            .structDMAToVRAM $7E8908, $0140, $80, $BD80

        +
        jsr $8B8114
        rtl

        .databank 0

        ; 8B/806D
















      rlUnknown8B86BF ; 8B/86BF

        .al
        .autsiz
        .databank ?

        lda #0
        sta $7F5400,x
        sta $7F5410,x
        rtl

        .databank 0

        ; 8B/86CA












      rlGetDecompressedPortraitDataPointers ; 8A/B452

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = PortraitID

        ; Output:
        ; wR18 = graphics pointer
        ; wR19 = palette pointer

        phk
        plb
        sta $078C,b
        jsl rlGetCharacterPortraitDataID
        jsr rlTryGetClassPortraitDataID
        sta wR0
        clc
        adc wR0
        clc
        adc wR0
        tax
        lda aPortraitGraphicPointers,x
        sta lR45
        lda aPortraitGraphicPointers+1,x
        sta lR45+1
        lda #(`aDecompressionBuffer)<<8
        sta lR47+1
        lda #<>aDecompressionBuffer
        sta lR47
        phx
        jsl rlDecompressSingle
        plx

        lda #(`aDecompressionBuffer)<<8
        sta lR18+1
        lda #<>aDecompressionBuffer
        sta lR18
        lda aPortraitPalettePointers+1,x
        sta lR19+1
        lda aPortraitPalettePointers,x
        sta lR19
        rtl

        .databank 0

      rlDecompressPortraitToSlot ; 8A/B49A

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID / also PortraitDialogue
        ; X = portrait slot offset

        ; Output:
        ; lR18 = Decompression buffer pointer
        ; lR19 = Portrait palette

        phk
        plb

        phy
        sta $078C,b

        jsl rlGetCharacterPortraitDataID
        jsr rlTryGetClassPortraitDataID
        pla

        sta wR0
        clc
        adc wR0
        clc
        adc wR0
        tax

        lda aPortraitGraphicPointers,x
        sta lR45
        lda aPortraitGraphicPointers+1,x
        sta lR45+1
        lda #(`aDecompressionBuffer)<<8
        sta lR47+1
        lda aPortraitSlotDecompressionPointers,b,y
        sta lR47

        phx
        phy
        jsl rlDecompressSingle
        ply
        plx

        lda #(`aDecompressionBuffer)<<8
        sta lR18+1
        lda #<>aDecompressionBuffer
        sta lR18

        lda aPortraitSlotDecompressionPointers,b,y
        sta lR18
        lda aPortraitPalettePointers+1,x
        sta lR19+1
        lda aPortraitPalettePointers,x
        sta lR19
        rtl

        .databank 0

      aPortraitSlotDecompressionPointers ; 8A/B4EB

        .word <>aDecompressionBuffer
        .word <>aDecompressionBuffer + $800
        .word <>aDecompressionBuffer + ($800 * 2)
        .word <>aDecompressionBuffer + ($800 * 3)
        .word <>aDecompressionBuffer + ($800 * 4)
        .word <>aDecompressionBuffer + ($800 * 5)
        .word <>aDecompressionBuffer + ($800 * 6)

      ; 8A/B4F9











      rlDMAByPointer ; 80/A58C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = Size
        ; wR1 = destination
        ; lR18 = source

        phb
        php
        phk
        plb

        ldx wDMAArrayPosition,b
        sep #$20
        lda #2
        sta aDMAArray + structDMAToVRAM.TransferType,b,x
        rep #$20

        lda lR18
        sta aDMAArray + structDMAToVRAM.Source,b,x
        lda lR18+1
        sta aDMAArray + structDMAToVRAM.Source + 1,b,x
        lda wR0
        sta aDMAArray + structDMAToVRAM.Count,b,x

        sep #$20
        lda #$80
        sta aDMAArray + structDMAToVRAM.Mode,b,x
        rep #$20

        lda wR1
        sta aDMAArray + structDMAToVRAM.Destination,b,x
        lda #0
        sta aDMAArray + size(structDMAToVRAM),b,x
        txa
        clc
        adc #size(structDMAToVRAM)
        sta wDMAArrayPosition,b

        sep #$20
        lda #1
        sta bDMAArrayFlag,b

        lda bBufferINIDISP
        bpl +

          jsl $80A34F

        +
        plp
        plb
        rtl

        .databank 0

        ; 80/A5D9









      rlFadeInPortraitSlot ; 8B/821F

        .al
        .autsiz
        .databank ?

        lda wR0
        sta aPortraitSlotXCoodinate,x
        lda wR1
        sta aPortraitSlotYCoodinate,x
        lda #$FFFF
        sta aPortraitSlotEnabledFlag,x

        txa
        sta $078C,b

        lda #(`procFadeInPortraitSlot)<<8
        sta lR44+1
        lda #<>procFadeInPortraitSlot
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

      rlFadeOutPortraitSlot ; 8B/8245

        .al
        .autsiz
        .databank ?

        lda $0302,b
        bne +

          jml $88E377

        +
        txa
        sta $078C,b

        lda #(`procFadeOutPortraitSlot)<<8
        sta lR44+1
        lda #<>procFadeOutPortraitSlot
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

      rlUnknown8B8261 ; 8B/8261

        .al
        .autsiz
        .databank ?

        lda wR0
        sta aPortraitSlotXCoodinate,x
        lda wR1
        sta aPortraitSlotYCoodinate,x
        lda #$FFFF
        sta aPortraitSlotEnabledFlag,x
        rtl

        .databank 0

        ; 8B/8275









      procFadeInPortraitSlot ; 8B/8C83

        .structProcInfo "FN", rlProcFadeInPortraitSlotInit, rlProcFadeInPortraitSlotCycle, aProcFadeInPortraitSlotCode

      rlProcFadeInPortraitSlotInit ; 8B/8C8B

        .al
        .autsiz
        .databank ?

        ; Color bightness
        lda #$001E
        sta aProcSystem.aBody0,b,x

        ; Portrait slot
        lda $078C,b
        sta aProcSystem.aBody1,b,x
        rtl

        .databank 0

      rlProcFadeInPortraitSlotCycle ; 8B/8C98

        .al
        .autsiz
        .databank ?

        .for i in range(15)

          lda #(i+1) * $200
          sta lR18
          lda #aOAMPaletteBuffer.aPalette0 + ((i+1) * size(word))
          lda #(i+1) * $200 + $7F
          sta lR19+1
          lda #aPortraitSlotsPaletteBuffer + ((i+1) * size(word))
          sta lR19
          jsl rlIncreaseColorBightnessOfPortraitSlot

        .endfor

        lda wVBlankEnabledFramecount
        and #$0003
        bne _End

          lda aProcSystem.aBody0,b,x
          dec a
          dec a
          sta aProcSystem.aBody0,b,x
          bmi +

        _End
        rtl

        +
        jsl rlProcEngineFreeProc
        rtl

        .databank 0

      aProcFadeInPortraitSlotCode ; 8B/8E17
        
        PROC_HALT

      procFadeOutPortraitSlot ; 8B/8E19

        .structProcInfo "FF", rlProcFadeOutPortraitSlotInit, rlProcFadeOutPortraitSlotCycle, aProcFadeOutPortraitSlotCode

      rlProcFadeOutPortraitSlotInit ; 8B/8E21

        .al
        .autsiz
        .databank ?

        lda #0
        sta aProcSystem.aBody0,b,x
        lda $078C,b
        sta aProcSystem.aBody1,b,x
        rtl

        .databank 0

      rlProcFadeOutPortraitSlotCycle ; 8B/8E2E

        .al
        .autsiz
        .databank ?

        .for i in range(15)

          lda #(i+1) * $200
          sta lR18+1
          lda #aOAMPaletteBuffer.aPalette0 + ((i+1) * size(word))
          sta lR18
          jsl rlDecreaseColorBightnessOfPortraitSlot

        .endfor

        lda wVBlankEnabledFramecount
        and #$0001
        bne _End

          lda aProcSystem.aBody0,b,x
          inc a
          inc a
          sta aProcSystem.aBody0,b,x
          cmp #32
          beq +

        _End
        rtl
        
        +
        lda aProcSystem.aBody1,b,x
        phx

        tax
        lda #0
        sta aPortraitSlotEnabledFlag,x
        plx

        jsl rlProcEngineFreeProc
        rtl

        .databank 0

      aProcFadeOutPortraitSlotCode ; 8B/8F27

        PROC_HALT

      rlDecreaseColorBightnessOfPortraitSlot ; 8B/8F29

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody1,b,x
        tay
        lda _PalettePointers,b,y
        tay
        lda [lR18],y
        sta wR0

        lda aProcSystem.aBody0,b,x
        phx

        tax
        jsl rlModifyPortraitColorBightness
        sta [lR18],y

        plx
        rtl

        _PalettePointers ; 8B/8F42
        .word size(Palette) * 2
        .word size(Palette) * 3
        .word size(Palette) * 4
        .word size(Palette) * 5
        .word size(Palette) * 6
        .word size(Palette) * 7

        .databank 0

      rlIncreaseColorBightnessOfPortraitSlot ; 8B/8F4E

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR19 = pointer to color
        ; aProcSystem.aBody0 = brightness value
        ; aProcSystem.aBody1 = potrait slot

        phk
        plb

        lda aProcSystem.aBody1,b,x
        tay
        lda _PalettePointers,b,y
        tay

        sep #$20
        lda #`aPortraitSlotsPaletteBuffer
        pha
        plb
        rep #$20

        ; Get the target color
        lda (lR19),y
        sta wR0

        phk
        plb

        lda aProcSystem.aBody0,b,x
        phx

        tax
        jsl rlModifyPortraitColorBightness
        sta [lR18],y

        plx
        rtl

        _PalettePointers ; 8B/8F73
        .word size(Palette) * 2
        .word size(Palette) * 3
        .word size(Palette) * 4
        .word size(Palette) * 5
        .word size(Palette) * 6
        .word size(Palette) * 7

        .databank 0

      rlModifyPortraitColorBightness ; 8B/8F7F

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = brightness value
        ; wR0 = color

        ; Output:
        ; wR0 = adjusted color

        phk
        plb
        lda wR0
        and #Color_Red
        cmp aModifyColorBrightnessRed,x
        bcs +

          lda aModifyColorBrightnessRed,x

        +
        sta wR1

        lda wR0
        and #Color_Green
        cmp aModifyColorBrightnessGreen,x
        bcs +

          lda aModifyColorBrightnessGreen,x

        +
        sta wR2

        lda wR0
        and #Color_Blue
        cmp aModifyColorBrightnessBlue,x
        bcs +

          lda aModifyColorBrightnessBlue,x

        +
        sta wR3

        lda wR1
        ora wR2
        ora wR3
        sta wR0
        rtl

        .databank 0

      aModifyColorBrightnessRed ; 8B/8FBD

        .word $0000
        .word $0001
        .word $0002
        .word $0003
        .word $0004
        .word $0005
        .word $0006
        .word $0007
        .word $0008
        .word $0009
        .word $000A
        .word $000C
        .word $000E
        .word $0010
        .word $0012
        .word $0014

      aModifyColorBrightnessGreen ; 8B/8FDD

        .word $0000
        .word $0020
        .word $0040
        .word $0060
        .word $0080
        .word $00A0
        .word $00C0
        .word $00E0
        .word $0100
        .word $0120
        .word $0140
        .word $0180
        .word $01C0
        .word $0200
        .word $0240
        .word $0280

      aModifyColorBrightnessBlue ; 8B/8FFD

        .word $0000
        .word $0400
        .word $0800
        .word $0C00
        .word $1000
        .word $1400
        .word $1800
        .word $1C00
        .word $2000
        .word $2400
        .word $2800
        .word $3000
        .word $3800
        .word $4000
        .word $4800
        .word $5000

      procUnknown8B901D ; 8B/901D

        .structProcInfo "GC", rlProcUnknown8B901DInit, rlProcUnknown8B901DCycle, aProcUnknown8B901DCode

      rlProcUnknown8B901DInit ; 8B/9025

        .al
        .autsiz
        .databank ?

        lda #0
        sta $7F548C
        rtl

        .databank 0

      rlProcUnknown8B901DCycle ; 8B/902D

        .al
        .autsiz
        .databank ?

        lda $7F548C
        asl a
        tay
        lda aUnknown8B9057,b,y
        sta aBGPaletteBuffer.aPalette1+2,b

        lda $DB
        and #$0001
        bne _End

          lda $7F548C
          clc
          adc #1
          cmp #48
          beq +

            sta $7F548C

        _End
        rtl

        +
        jsl rlProcEngineFreeProc
        rtl

        .databank 0

      aUnknown8B9057 ; 8B/9057

        .word $0000, $0001, $0001, $0001, $0001, $0002, $0002, $0002
        .word $0002, $0003, $0003, $0003, $0003, $0004, $0004, $0004
        .word $0004, $0005, $0005, $0005, $0005, $0006, $0006, $0006
        .word $0007, $0007, $0007, $0008, $0008, $0008, $0009, $0009
        .word $0009, $000A, $000A, $000A, $000B, $000B, $000B, $000C
        .word $000C, $000C, $000D, $000D, $000E, $000E, $000F, $000F
        .word $0010, $0011, $0012, $0013, $0014, $0015, $0416, $0417
        .word $0418, $0419, $041A, $041B, $041C, $041D, $041E, $041F

      aProcUnknown8B901DCode ; 8B/90D7

        PROC_HALT

      procUnknown8B90D9 ; 8B/90D9

        .structProcInfo "GL", rlProcUnknown8B90D9Init, rlProcUnknown8B90D9Cycle, aProcUnknown8B90D9Code

      rlProcUnknown8B90D9Init ; 8B/90E1

        .al
        .autsiz
        .databank ?

        lda #47
        sta $7F548C
        rtl

        .databank 0

      rlProcUnknown8B90D9Cycle ; 8B/90E9

        .al
        .autsiz
        .databank ?

        lda $7F548C
        asl a
        tay
        lda aUnknown8B9057,b,y
        sta aBGPaletteBuffer.aPalette1+2,b

        lda $DB
        and #$0001
        bne _End

          lda $7F548C
          sec
          sbc #1
          bmi +

            sta $7F548C

        _End
        rtl
        
        +
        jsl rlProcEngineFreeProc

        jsl rlDMAByStruct

          .structDMAToVRAM $7E7B88, 32 * 21 * size(word), $80, $A800

        rtl

        .databank 0

      aProcUnknown8B90D9Code ; 8B/911D

        PROC_HALT

      ; 8B/911F






      rlUnknown8B87C5 ; 8B/87C5

        .al
        .autsiz
        .databank ?

        jsl rlDialogueFreeHDMA

        ldx #(32 * 32) * size(word) - 2
        lda #$00FF

          -
          sta aBG2TilemapBuffer.Page1,x
          dec x
          dec x
          bpl -

        jsl rlDMAByStruct

          .structDMAToVRAM aBG2TilemapBuffer.Page1, 32 * 21 * size(word), $80, $A800

        rtl

        .databank 0

        ; 8B/87E5





      rlUnknown808FA3 ; 80/8FA3

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb
        rep #$30
        phx
        pha
        bra +

      rlUnknown808FAD ; 80/8FAD

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb
        rep #$30
        phy
        tax
        lda $04F4,b
        and #$00FF
        bne _End

          lda $04EA,b
          and #$0001
          bne _End

            phx

            +
            ldx #0

              -
              lda $04D8,b,x
              beq +

                inc x
                inc x
                cpx #6
                bcc -

            +
            pla
            sta $04D8,b,x
        
        _End
        plx
        plb
        plp
        rtl

        .databank 0

      rlUnknown808FDD ; 80/8FDD

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb
        rep #$30
        phx

        tax
        lda $04F4,b
        and #$00FF
        beq rlUnknown80900D._901D

        cpx #$0010
        beq +

        cpx #$0020
        bne rlUnknown80900D._End
        
        +
        cpx $04E2,b
        beq rlUnknown80900D._End

        cpx $04E4,b
        beq rlUnknown80900D._End

        cpx $04E6,b
        beq rlUnknown80900D._End

        cpx $04E8,b
        beq rlUnknown80900D._End
        bra rlUnknown80900D._901D

      rlUnknown80900D ; 80/900D

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb
        rep #$30
        phx
        tax
        lda $04F4,b
        and #$00FF
        bne _End

          _901D
          lda $04EA,b
          and #$0004
          bne _End

          phx
          ldx #0

          -
          lda $04E2,b,x
          beq +

            inc x
            inc x
            cpx #6
            bcc -

          +
          pla
          sta $04E2,b,x

        _End
        plx
        plb
        plp
        rtl

        .databank 0

        ; 80/903D















      rsUnknown80F2BE ; 80/F2BE

        .al
        .autsiz
        .databank ?

        ; Transition from WM to map?

        php
        sep #$20
        lda #$80
        sta bBufferINIDISP
        rep #$20

        lda #$BB9B
        sta wVBlankPointer
        jsl $80823F
        jsl rlDisableVBlank
        jsl rlHardwareResetScreenPosMathHDMA
        jsl rlHardwareResetScreenRegisters

        lda #0
        sta wR1
        lda #$4000
        sta wR2
        lda #$5000
        sta wR6
        lda #$6000
        sta wR7
        jsl rlSetLayerPositionsAndSizes

        jsl rlProcEngineResetProcEngine
        jsl rlActiveSpriteEngineReset
        jsl rlResetHDMAEngine
        jsl rlUnknown82E073
        jsl rlUnknown82E400
        jsl rlUnknown8780AA
        jsl rlUnknown82F211

        jsr $80F340
        jsr $80F392
        jsr $80F4EB

        lda #$0024
        sta $0304,b
        lda #5
        sta $0302,b
        lda #4
        sta $0300,b

        lda #<>$809D4F
        sta wMainLoopPointer

        jsl rlEnableVBlank

        plp
        cli
        rts

        .databank 0

        ; 80/F337










      rlLoadUNITGroupMapSprites ; 84/88EC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda #1
        sta wR0
        ldy lR18

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

          _Loop
          lda structUNITEntry.CharacterID,b,y
          beq _Next

            cmp #$FFFF
            beq _End

              jsl rlGetCharacterMapSprite
              sta wR1

              jsl rlAddDeployedMapSprite

          _Next
          inc wR0
          tya
          clc
          adc #size(structUNITEntry)
          tay
          bra _Loop

        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/8924


















































      rlUnknown818FA1 ; 81/8FA1

        .al
        .autsiz
        .databank ?

        ; wR0 = CharacterID
        ; wR1 = movement speed
        ; wR2 = spawn X coord
        ; wR3 = spawn y coord
        ; wR4 = dest X coordinate
        ; wR5 = dest Y coordinate
        ; wR6 = sprite color
        ; wR7 = 0 or 1 ?

        phx
        phx
        jsr rsCapSpawnDestinationCoordinates100

        lda wR0
        pha
        lda wR1
        pha
        lda wR2
        pha
        lda wR3
        pha
        lda wR4
        pha
        lda wR5
        pha
        lda wR6
        pha

        lda wR7
        sta wR6

        lda wR0
        sta wRoutineVariable1,b
        txa
        lsr a
        sta aMovingMapSprites.wEntryIndex,b

        lda wR0
        sta aMovingMapSprites.wCharacterID,b
        lda wR2
        sta aMovingMapSprites.wSpawnXCoordinate,b
        lda wR3
        sta aMovingMapSprites.wSpawnYCoordinate,b
        lda wR4
        sta aMovingMapSprites.wDestinationXCoordinate,b
        lda wR5
        sta aMovingMapSprites.wDestinationYCoordinate,b
        lda wR6
        sta aMovingMapSprites.wUnknown001830,b
        lda #1
        sta aMovingMapSprites.wState,b

        pla
        sta wR6
        pla
        sta wR5
        pla
        sta wR4
        pla
        sta wR3
        pla
        sta wR2
        pla
        sta wR1
        pla
        sta wR0
        plx

        phx
        lda #(`aMovingMapSpriteData)<<8
        sta lR18+1

        txa
        lsr a
        ora #len(aMovingMapSpriteData[0]) << 8
        jsl rlUnsignedMultiply8By8
        clc
        adc #<>aMovingMapSpriteData
        sta lR18
        jsr rsFillMovingMapSpriteData
        plx

        phx
        lda #(`aEventMovement.aMovementScriptBuffer1)<<8
        sta lR19+1
        pla
        lsr a
        xba
        asl a
        clc
        adc #<>aEventMovement.aMovementScriptBuffer1
        sta lR19
        jsr rsFillMovingMapSpriteDataPathScriptPointer
        plx
        rtl

        .databank 0

      rsCapSpawnDestinationCoordinates100 ; 81/9031

        .al
        .autsiz
        .databank ?

        ; Caps units spawn and destination coordinates at 99?
        ; How big were the maps supposed to be?

        lda wR2
        cmp #100
        bcc +

          lda #99
          sta wR2

        +
        lda wR3
        cmp #100
        bcc +

          lda #99
          sta wR3

        +
        lda wR4
        cmp #100
        bcc +

          lda #99
          sta wR4

        +
        lda wR5
        cmp #100
        bcc +

          lda #99
          sta wR5

        +
        rts

        .databank 0

        ; 81/9062













      rsFillMovingMapSpriteData ; 81/9092

        .al
        .autsiz
        .databank ?

        ldy #0
        lda wR0
        sta [lR18],y
        inc y
        inc y

        lda wR2
        sta [lR18],y
        inc y

        lda wR3
        sta [lR18],y
        inc y

        lda wR1
        sta [lR18],y
        inc y

        lda wR6
        sta [lR18],y
        inc y

        lda lR18
        clc
        adc #9
        sta [lR18],y
        inc y
        inc y

        lda lR18+2
        sta [lR18],y
        inc y

        rts

        .databank 0

      rsFillMovingMapSpriteDataPathScriptPointer ; 81/90BF

        .al
        .autsiz
        .databank ?

        ldy #6
        lda lR19
        sta [lR18],y
        inc y
        lda lR19+1
        lda [lR18],y
        rts

        .databank 0

        ; 81/90CC


























      rsMovingMapSpriteAppendDecomp ; 88/D67C

        .al
        .autsiz
        .databank ?

        lda lR18
        pha
        lda lR18+1
        pha
        phx
        phk
        plb

        lda aMovingMapSpritesMapSprites,b,x
        and #$8000
        bne +

          ; Short map sprites
          lda aMovingMapSpritesMapSprites,b,x
          phx
          and #$7FFF
          sta wR0
          clc
          adc wR0
          clc
          adc wR0
          tax

          lda aMapMovementShortSpritePointers,x
          sta lR18
          lda aMapMovementShortSpritePointers+1,x
          sta lR18+1
          plx

          jsr (aSetMovingMapSpriteBufferPointers,x)
          jsl rlAppendDecompList

          plx
          pla
          sta lR18+1
          pla
          sta lR18
          rtl

        ; Tall map sprite
        +
        lda aMovingMapSpritesMapSprites,b,x
        phx
        and #$7FFF
        sta wR0
        clc
        adc wR0
        clc
        adc wR0
        tax

        lda aMapMovementTallSpritePointers,x
        sta lR18
        lda aMapMovementTallSpritePointers+1,x
        sta lR18+1
        plx

        jsr (aSetMovingMapSpriteBufferPointers,x)
        jsl rlAppendDecompList

        plx
        pla
        sta lR18+1
        pla
        sta lR18
        rtl

        .databank 0

      aSetMovingMapSpriteBufferPointers ; 88/D6E5

        .word <>rsSetMovingMapSpriteBuffer0
        .word <>rsSetMovingMapSpriteBuffer1
        .word <>rsSetMovingMapSpriteBuffer2
        .word <>rsSetMovingMapSpriteBuffer3

      rsSetMovingMapSpriteBuffer0 ; 88/D6ED

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers[0])<<8
        sta lR19+1
        lda #<>aMovingMapSpriteBuffers[0]
        sta lR19
        rts

        .databank 0

      rsSetMovingMapSpriteBuffer1 ; 88/D6F8

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers[0])<<8
        sta lR19+1
        lda #<>aMovingMapSpriteBuffers[0]
        sta lR19

        lda lR19
        clc
        adc #size(aMovingMapSpriteBuffers[0])
        sta lR19
        rts

        .databank 0

      rsSetMovingMapSpriteBuffer2 ; 88/D70B

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers[0])<<8
        sta lR19+1
        lda #<>aMovingMapSpriteBuffers[0]
        sta lR19

        lda lR19
        clc
        adc #size(aMovingMapSpriteBuffers[0]) * 2
        sta lR19
        rts

        .databank 0

      rsSetMovingMapSpriteBuffer3 ; 88/D71E

        .al
        .autsiz
        .databank ?

        lda #(`aMovingMapSpriteBuffers[0])<<8
        sta lR19+1
        lda #<>aMovingMapSpriteBuffers[0]
        sta lR19

        lda lR19
        clc
        adc #size(aMovingMapSpriteBuffers[0]) * 3
        sta lR19
        rts

        .databank 0

        ; 88/D731





















      rlGetMapSpriteMovementSound ; 88/C13E

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = MapSpriteID

        ; Output:
        ; A = movement sound

        phb
        php
        phk
        plb
        phk
        plb
        bit #$8000
        beq _Short

        ; Tall
        and #$7FFF
        tax
        lda aTallMapSpriteMovementSounds,x
        bra _End

        _Short
        tax
        lda aShortMapSpriteMovementSounds,x
        bra _End
        
        _End
        and #$00FF
        plp
        plb
        rtl

        .databank 0

      aShortMapSpriteMovementSounds ; 88/C160

        .byte 1 ; MageFemale
        .byte 1 ; Mage
        .byte 1 ; PriestFemale
        .byte 1 ; JuniorLord
        .byte 1 ; Myrmidon
        .byte 2 ; LanceArmor
        .byte 1 ; Barbarian
        .byte 1 ; Archer
        .byte 2 ; Soldier
        .byte 1 ; ArcherFemale
        .byte 2 ; AxeArmor
        .byte 1 ; BowSoldier
        .byte 1 ; Dancer
        .byte 1 ; MyrmidonFemale
        .byte 1 ; Princess
        .byte 1 ; Thief
        .byte 2 ; General
        .byte 1 ; Priestess
        .byte 1 ; Fighter
        .byte 1 ; WindMage
        .byte 1 ; WindMageFemale
        .byte 1 ; Priest
        .byte 1 ; Hunter
        .byte 1 ; Swordmaster
        .byte 1 ; Hero
        .byte 1 ; Warrior
        .byte 1 ; Brigang
        .byte 1 ; Pirate
        .byte 1 ; HeroFemale
        .byte 2 ; Baron
        .byte 1 ; HighPriestFemale
        .byte 1 ; SwordmasterFemale
        .byte 1 ; SniperFemale
        .byte 1 ; Sniper
        .byte 2 ; Emperor
        .byte 1 ; SwordSoldier
        .byte 1 ; AxeSoldier
        .byte 2 ; SpearSoldier
        .byte 2 ; SwordArmor
        .byte 2 ; BowArmor
        .byte 1 ; FireMageFemale
        .byte 1 ; FireMage
        .byte 1 ; ThunderMageFemale
        .byte 1 ; ThunderMage
        .byte 1 ; HighPriest
        .byte 1 ; WarMageFemale
        .byte 1 ; DarkBishop
        .byte 1 ; DarkMage
        .byte 1 ; Prince
        .byte 1 ; WarMage
        .byte 1 ; ChildFemale
        .byte 1 ; Child
        .byte 1 ; Queen
        .byte 1 ; Bishop
        .byte 1 ; Civilian
        .byte 1 ; CivilianFemale
        .byte 1 ; RogueFemale
        .byte 1 ; Bard
        .byte 1 ; ThiefFemale
        .byte 1 ; Rogue
        .byte 1 ; Sage
        .byte 1 ; SageFemale
        .byte 1 ; DarkPrince
        .byte 1 ; SmallOifey

      aTallMapSpriteMovementSounds ; 88/C1A0

        .byte 5 ; DragonRider
        .byte 3 ; Cavalier
        .byte 5 ; DukeKnight
        .byte 4 ; PegasusRider
        .byte 3 ; AxeKnight
        .byte 3 ; FreeKnight
        .byte 3 ; LanceKnight
        .byte 3 ; BowKnight
        .byte 4 ; KnightLordSeliph
        .byte 3 ; Troubadour
        .byte 4 ; KnightLordSigurd
        .byte 4 ; Paladin
        .byte 5 ; DragonMaster
        .byte 4 ; ArchKnight
        .byte 4 ; GreatKnight
        .byte 4 ; MageKnight
        .byte 5 ; DragonKnight
        .byte 5 ; PegasusKnight
        .byte 5 ; FalconKnight
        .byte 4 ; MasterKnight
        .byte 4 ; Ranger
        .byte 0 ; Ballistician
        .byte 0 ; IronBallistician
        .byte 0 ; KillerBallistician
        .byte 0 ; GreatBallistician
        .byte 5 ; DragonRiderFemale
        .byte 5 ; DragonKnightFemale
        .byte 5 ; DragonMasterFemale
        .byte 4 ; PaladinFemale
        .byte 4 ; MageKnightFemale
        .byte 4 ; MasterKnightFemale

        ; 88/C1BF







      procCastleNamePopUp ; 82/86B6

        .structProcInfo "TT", rlProcCastleNamePopUpInit, rlProcCastleNamePopUpCycle1, aProcCastleNamePopUpCode
        .word 0

      rlProcCastleNamePopUpInit ; 82/86C0

        .al
        .autsiz
        .databank ?

        ldy wActiveEventOffset,b
        lda lActiveEventPointer,b
        sta @l lR22
        lda lActiveEventPointer+1,b
        sta @l lR22+1

        ; Load the dialogue pointer
        lda [lR22],y
        sta aProcSystem.aBody4,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody5,b,x
        inc y
        inc y

        ; Load the box color
        lda [lR22],y
        and #$00FF
        cmp #$00FF
        bne +

          lda #$FFFF

        +
        sta aProcSystem.aBody2,b,x
        inc y

        ; Load the display duration
        lda [lR22],y
        and #$00FF
        sta aProcSystem.aBody3,b,x

        ; Load the text are size
        lda #(4 << 8 | 10)
        sta aDialogue._Slot[0].wDisplayArea,b
        sta aProcSystem.aBody1,b,x

        ; Load the text position
        lda #(7 << 8 | 11)
        sta aProcSystem.aBody0,b,x
        jsl rlUnknown8287C1

        lda #(DialogueStatusPreventBSkipping | DialogueStatusPreventASpeedUp)
        tsb aDialogue.wStatus,b

        lda #T_Setting(false, true, true, false, false)
        trb bBufferTM

        rtl

        .databank 0

      rlProcCastleNamePopUpCycle1 ; 82/8716

        .al
        .autsiz
        .databank ?

        lda #T_Setting(false, true, true, false, false)
        trb bBufferTM

        phx
        jsl rlUnknown9181F6
        plx

        ; Wait until the dialogue string is completed
        lda aDialogue.wStatus,b
        bit #DialogueStatusEnabled
        bne _End

          ; Update the box size in aProcSystem.aBody1 with the string tile count + 4

          lda aDialogue.wStringPixelLength,b
          lsr a
          lsr a
          lsr a
          clc
          adc #4
          sta wR0

          lda aProcSystem.aBody1,b,x
          and #$FF00
          ora wR0
          sta aProcSystem.aBody1,b,x

          ; Update the Y position of the box

          lda wR0
          lsr a
          sta wR0

          lda #16
          sec
          sbc wR0
          sta wR0

          lda aProcSystem.aBody0,b,x
          and #$FF00
          ora wR0
          sec
          sbc #1
          sta aProcSystem.aBody0,b,x

          lda #<>rlProcCastleNamePopUpCycle2
          sta aProcSystem.aHeaderOnCycle,b,x
          jsl rlUnknown8287C1

          lda #(DialogueStatusPreventBSkipping | DialogueStatusPreventASpeedUp)
          tsb aDialogue.wStatus,b

          lda #$00FF
          jsl $809F01

        _End
        rtl

        .databank 0

      rlProcCastleNamePopUpCycle2 ; 82/8774

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown9181F6
        plx

        lda aDialogue.wStatus,b
        bit #DialogueStatusEnabled
        bne _End

          phx
          plx
          lda #T_Setting(false, true, true, false, false)
          tsb bBufferTM

          lda #<>rlProcCastleNamePopUpCycle3
          sta aProcSystem.aHeaderOnCycle,b,x

          lda aProcSystem.aBody1,b,x
          sta wR0

          lda aProcSystem.aBody2,b,x
          tay
          lda aProcSystem.aBody0,b,x
          ldx wR0
          jsl $85BBA5

        _End
        rtl

        .databank 0

      rlProcCastleNamePopUpCycle3 ; 82/87A2

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody3,b,x
        dec a
        sta aProcSystem.aBody3,b,x
        bne _End

          lda #T_Setting(false, true, true, false, false)
          trb bBufferTM

          phx
          jsl $85BBE0
          jsl rlFreeHDMAEntry0
          plx

          lda #$8576
          sta aProcSystem.aHeaderOnCycle,b,x

        _End
        rtl

        .databank 0

      rlUnknown8287C1 ; 82/87C1

        .al
        .autsiz
        .databank ?

        phx
        jsl rlResetDialogueEngine
        plx

        phx
        lda aProcSystem.aBody4,b,x
        sta lR18
        lda aProcSystem.aBody5,b,x
        sta lR18+1
        lda #0
        jsl rlUnknown91811C
        jsl rlDialogueFreeHDMA
        plx

        phx

        ; Load box size
        lda aProcSystem.aBody1,b,x
        sta aDialogue._Slot[0].wDisplayArea,b

        ; Load box position
        lda aProcSystem.aBody0,b,x
        clc
        adc #$0101
        jsl rlUnknown9180F0
        tay

        lda #$8000 >> 1
        sta aDialogue._Slot[0].wVRAMAddress,b

        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[0].lUnknown0018D4+1,b
        tya
        clc
        adc #2
        adc #<>aBG3TilemapBuffer
        sta aDialogue._Slot[0].lUnknown0018D4,b

        jsl rlUnknown91A984

        lda #$FFFF
        sta aDialogue.wTextSpeed,b
        plx
        rtl

        .databank 0

      aProcCastleNamePopUpCode ; 82/8814

        PROC_HALT

        ; 82/8816











      rlUnknown878459 ; 87/8459

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda #0
        sta wUnknown00052A,b
        lda #$001F
        sta wUnknown00052C,b
        lda #$0002
        tsb bUnknown000521,b
        plp
        plb
        rtl

        .databank 0

        ; 87/8472




      procUnknown828431 ; 82/8431

        .structProcInfo "UA", rlProcUnknown828431Init, rlProcUnknown828431Cycle, aProcUnknown828431Code

      rlProcUnknown828431Init ; 82/8439

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlProcUnknown828431Cycle ; 82/843A

        .al
        .autsiz
        .databank ?

        stz wR7
        ldx #6

          -
          lda aMovingMapSprites.wActiveSpriteOffset,b,x
          cmp #$FFFF
          beq +

            tay
            lda aActiveSpriteSystem.aUnknown0012E0,b,y
            tsb wR7

          +
          dec x
          dec x
          bpl -

        lda wR7
        bit #$8000
        bne +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcUnknown828431Code ; 82/845D

        PROC_HALT

      procDialogue ; 82/845F

        .structProcInfo "TT", rlProcDialogueInit, rlProcDialogueCycle1, $828694
        .word 0

      rlProcDialogueInit ; 82/8469

        .al
        .autsiz
        .databank ?

        lda #8
        sta aProcSystem.aBody0,b,x

        jsl rlResetDialogueEngine

        ldy wActiveEventOffset,b
        lda lActiveEventPointer,b
        sta lR22
        lda lActiveEventPointer+1,b
        sta lR22+1

        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1
        jsl rlUnknown828653

        lda wEventUnit1Pointer,b
        jsl rlUnknown828A1C
        sta aDialogue.wUnit1,b

        lda wEventUnit2Pointer,b
        jsl rlUnknown828A1C
        sta aDialogue.wUnit2,b

        lda #5
        sta $7FC54A
        lda #11
        sta $7FC54C
        lda #21
        sta $7FC5AE
        lda #11
        sta $7FC5B0

        lda bBufferINIDISP
        and #$000F
        cmp #$000F
        bne _End

          lda #(`procFadeIn)<<8
          sta lR44+1
          lda #<>procFadeIn
          sta lR44
          jsl rlProcEngineFindProc
          bcs _End

            lda #(`procFadeIn)<<8
            sta lR44+1
            lda #<>procFadeIn
            sta lR44
            jsl rlProcEngineCreateProc

        _End
        rtl

        .databank 0

      rlProcDialogueCycle1 ; 82/84EA

        .al
        .autsiz
        .databank ?

        ; Waits a cycle.

        lda #<>rlProcDialogueCycle2
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueCycle2 ; 82/84F1

        .al
        .autsiz
        .databank ?

        ; Grabs graphics and palette

        lda #<>rlProcDialogueCycle3
        sta aProcSystem.aHeaderOnCycle,b,x

        jsl rlGetDialogueBoxGraphicsAndPalette
        rtl

        .databank 0

      rlProcDialogueCycle3 ; 82/84FC

        .al
        .autsiz
        .databank ?

        ; Darkens the background

        lda aProcSystem.aBody0,b,x
        beq +

          dec a
          sta aProcSystem.aBody0,b,x
          bra _End

        +
        lda wVBlankEnabledFramecount
        and #$0001
        bne _End

          sep #$20
          lda bBufferCOLDATA_0
          inc a
          sta bBufferCOLDATA_0
          rep #$20

          jsl rlApplyCOLDATA0Intensity

          lda bBufferCOLDATA_0
          and #$00FF
          cmp #5
          bcc _End

            lda #<>rlProcDialogueCycle4
            sta aProcSystem.aHeaderOnCycle,b,x

        _End
        rtl

        .databank 0

      rlProcDialogueCycle4 ; 82/852C

        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        and #INIDISP_Brightness
        cmp #15
        bne _End

          phx
          lda #4
          sta wBufferBG3HOFS
          jsl rlUnknown8285E1
          plx

          lda aDialogue.wStatus,b
          bit #DialogueStatusEnabled
          bne _End

            jsl rlDialogueFreeHDMA
            lda #<>rlProcDialogueCycle5
            sta aProcSystem.aHeaderOnCycle,b,x

        _End
        rtl

        .databank 0

      rlProcDialogueCycle5 ; 82/8554

        .al
        .autsiz
        .databank ?

        lda wVBlankEnabledFramecount
        and #$0001
        bne _End

          sep #$20
          lda bBufferCOLDATA_0
          dec a
          sta bBufferCOLDATA_0
          rep #$20

          jsl rlApplyCOLDATA0Intensity

          lda bBufferCOLDATA_0
          and #$00FF
          bne _End

            lda #<>rlProcDialogueCycle6
            sta aProcSystem.aHeaderOnCycle,b,x

        _End
        rtl

        .databank 0

      rlProcDialogueCycle6 ; 82/8576

        .al
        .autsiz
        .databank ?

        jsl $80B0D3
        lda #<>rlProcDialogueCycle7
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueCycle7 ; 82/8581

        .al
        .autsiz
        .databank ?

        lda $0448,b
        bne _End

          lda #<>rlProcDialogueCycle8
          sta aProcSystem.aHeaderOnCycle,b,x

        _End
        rtl

        .databank 0

      rlProcDialogueCycle8 ; 82/858D

        .al
        .autsiz
        .databank ?

        phx
        jsl rlDMAByStruct

          .structDMAToVRAM, aDecompressionBuffer, $0800, $80, $8000

        plx
        lda #<>rlProcDialogueCycle9
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueCycle9 ; 82/85A3

        .al
        .autsiz
        .databank ?

        phx
        jsl rlDMAByStruct

          .structDMAToVRAM, aDecompressionBuffer+$800, $0800, $80, $8800

        plx
        lda #<>rlProcDialogueCycle10
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueCycle10 ; 82/85B9

        .al
        .autsiz
        .databank ?

        phx
        jsl rlDMAByStruct

          .structDMAToVRAM, aDecompressionBuffer+$1000, $0800, $80, $9000

        plx
        lda #<>rlProcDialogueCycle11
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueCycle11 ; 82/85CF

        .al
        .autsiz
        .databank ?

        phx
        jsl $80B0EE
        plx
        bcs _End

          lda #0
          sta wBufferBG3HOFS
          jsl rlEventEngineFreeProc

        _End
        rtl

        .databank 0

      rlUnknown8285E1 ; 82/85E1

        .al
        .autsiz
        .databank ?

        jsl rlUnknown9181F6
        jsr rsUnknown8285EC
        jsr rsUnknown82862E
        rtl

        .databank 0

      rsUnknown8285EC ; 82/85EC

        .al
        .autsiz
        .databank ?

        lda aDialogue._Slot[0].wPortraitID
        cmp #$FFFF
        beq +

          lda aDialogue.wUnknown0018A3,b
          ldy #0
          jsl $85BD12

        +
        lda aDialogue._Slot[1].wPortraitID
        cmp #$FFFF
        beq +

          lda aDialogue.wUnknown0018A5,b
          ldy #1
          jsl $85BD12

        +
        lda aDialogue._Slot[0].wPortraitID
        cmp #$FFFF
        bne +

          lda aDialogue._Slot[1].wPortraitID
          cmp #$FFFF
          beq _End

        +
        lda aDialogue.wUnknown0018A7,b
        beq _End

          jsl $85BD93

        _End
        rts

        .databank 0

      rsUnknown82862E ; 82/862E

        .al
        .autsiz
        .databank ?

        ; Sets the position of the A press arrow based on the currently active slot

        ldx #$00E8
        ldy #$0038

        lda aDialogue.wSlotOffset,b
        beq +

          ldx #$00E0
          ldy #$00C8

        +
        stx wR0
        sty wR1
        jsl rlDisplayDialogueAPressArrows
        rts

        .databank 0

        ; 82/8648







      rlUnknown828653 ; 82/8653

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR18 = dialogue pointer

        php
        jsl rlFreeHDMAEntry0

        lda #1
        jsl rlUnknown91811C

        lda #1
        sta aDialogue.wTextSound,b
        jsl rlUnknown91A928

        ldx #0
        jsl rlUnknown919420._944B

        lda #$0019
        jsl rlUnknown919420._944B

        lda #4
        sta wBufferBG3HOFS
        sep #$20
        lda #$06
        tsb bBufferTM
        lda #0
        sta bBufferCGWSEL
        lda #$91
        sta bBufferCGADSUB
        lda #0
        sta bBufferCOLDATA_0
        jsl rlApplyCOLDATA0Intensity
        plp
        rtl

        .databank 0

      aProcDialogueCode ; 82/8694
        
        PROC_HALT

      rlApplyCOLDATA0Intensity ; 82/8696

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda bBufferCOLDATA_0
        ora #COLDATA_ApplyRed
        sta bBufferCOLDATA_1
        sta COLDATA,b

        lda bBufferCOLDATA_0
        ora #COLDATA_ApplyGreen
        sta bBufferCOLDATA_2
        sta COLDATA,b

        lda bBufferCOLDATA_0
        ora #COLDATA_ApplyBlue
        sta bBufferCOLDATA_3
        sta COLDATA,b
        plp
        rtl

        .databank 0

        ; 82/86B6















      rlFreeHDMAEntry0 ; 85/9FC5

        .al
        .autsiz
        .databank ?

        lda #0
        jsl rlHDMAEngineFreeEntryByIndex
        rtl

        .databank 0

        ; 85/9FCD





      rlUnknown91A928 ; 91/A928

        .al
        .autsiz
        .databank ?

        jsl rlUnknown91A956
        jsl rlUnknown91A931
        rtl

        .databank 0

      rlUnknown91A931 ; 91/A931

        .al
        .autsiz
        .databank ?

        lda #0
        jsl rlDialogueUpdateSlotOffset

        lda #pack([28, 6])
        sta aDialogue._Slot[0].wDisplayArea,b,x
        lda #$8000 >> 1
        sta aDialogue._Slot[0].wVRAMAddress,b,x
        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[0].lBGBufferPosition+1,b,x
        lda #$0086
        clc
        adc #<>aBG3TilemapBuffer
        sta aDialogue._Slot[0].lBGBufferPosition,b,x
        bra +

      rlUnknown91A956 ; 91/A956

        .al
        .autsiz
        .databank ?

        lda #1
        jsl rlDialogueUpdateSlotOffset

        lda #pack([28, 6])
        sta aDialogue._Slot[0].wDisplayArea,b,x
        lda #$9000 >> 1
        sta aDialogue._Slot[0].wVRAMAddress,b,x
        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[0].lBGBufferPosition+1,b,x
        lda #$0506
        clc
        adc #<>aBG3TilemapBuffer
        sta aDialogue._Slot[0].lBGBufferPosition,b,x

        +
        jsl rlUnknown91A984
        lda #$2000
        tsb aDialogue.wStatus,b
        rtl

        .databank 0

        ; 91/A984







      procDialogueWithBG ; 82/8906

        .structProcInfo "TT", rlProcDialogueWithBGInit, rlProcDialogueWithBGCycle1, aProcDialogueWithBGCode
        .word 0

      rlProcDialogueWithBGInit ; 82/8910

        .al
        .autsiz
        .databank ?

        ldy wActiveEventOffset,b
        lda lActiveEventPointer,b
        sta @l lR22
        lda lActiveEventPointer+1,b
        sta @l lR22+1

        lda [lR22],y
        sta $08AF,b
        inc y
        lda [lR22],y
        sta $08AF+1,b
        inc y
        inc y

        lda [lR22],y
        and #$00FF
        sta $08B6,b
        inc y

        lda [lR22],y
        and #$00FF
        sta aProcSystem.aBody0,b,x
        cmp #$00FF
        bne +

          lda #3

        +
        sta $08B8,b
        inc y

        lda [lR22],y
        and #$00FF
        sta wScreenFadingProcInput,b

        stz $08AD,b
        lda wEventUnit1Pointer,b
        cmp #$FFFE
        beq +

          lda wEventUnit1Pointer,b
          jsl rlUnknown828A1C
          sta aDialogue.wUnit1,b
          lda wEventUnit2Pointer,b
          jsl rlUnknown828A1C
          sta aDialogue.wUnit2,b

        +
        lda $0302,b
        cmp #$0012
        bne +

          jsl $88B3AF

        +
        lda #2
        sta $088B,b
        lda #<>$80B6B6
        sta aProcSystem.wInput0,b
        lda #(`procUnknown828364)<<8
        sta lR44+1
        lda #<>procUnknown828364
        sta lR44
        jsl rlProcEngineCreateProc
        jsl rlUnknown91C611
        bra +

        +
        rtl

        .databank 0

      rlProcDialogueWithBGCycle1 ; 82/899F

        .al
        .autsiz
        .databank ?

        lda #1
        sta aDialogue.wTextSound,b

        lda aDialogue.wStatus,b
        bit #1
        beq +

          lda #<>rlProcDialogueWithBGCycle2
          sta aProcSystem.aHeaderOnCycle,b,x

        +
        rtl

        .databank 0

      rlProcDialogueWithBGCycle2 ; 82/89B4

        .al
        .autsiz
        .databank ?

        lda aDialogue.wStatus,b
        bit #1
        bne +

          lda #<>rlProcDialogueWithBGCycle3
          sta aProcSystem.aHeaderOnCycle,b,x
          jsl rlClearAllFadeInProcs
          jsl $8AE29F

        +
        rtl

        .databank 0

      rlProcDialogueWithBGCycle3 ; 82/89CB

        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        and #$000F
        bne _End

          lda aProcSystem.aBody0,b,x
          cmp #5
          beq +

          cmp #$00FF
          bne ++

          +
          lda #<>rlProcDialogueWithBGCycle5
          sta aProcSystem.aHeaderOnCycle,b,x
          bra _End

          +
          lda #<>rlProcDialogueWithBGCycle4
          sta aProcSystem.aHeaderOnCycle,b,x

        _End
        rtl

        .databank 0

      rlProcDialogueWithBGCycle4 ; 82/89EE

        .al
        .autsiz
        .databank ?

        lda bBufferINIDISP
        and #$000F
        cmp #$000F
        bne +

          lda #<>rlProcDialogueWithBGCycle5
          sta aProcSystem.aHeaderOnCycle,b,x

        +
        rtl

        .databank 0

      rlProcDialogueWithBGCycle5 ; 82/89FF

        .al
        .autsiz
        .databank ?

        lda #2
        sta aProcSystem.aBody0,b,x
        lda #<>rlProcDialogueWithBGCycle6
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueWithBGCycle6 ; 82/8A0C

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        dec a
        sta aProcSystem.aBody0,b,x
        bne +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcDialogueWithBGCode ; 82/8A1A

        PROC_HALT

      rlUnknown828A1C ; 82/8A1C

        .al
        .autsiz
        .databank ?

        php
        and #$FFFF
        beq +

        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        bra ++

        +
        lda #1

        +
        plp
        rtl

        .databank 0

        ; 82/8A30
























      rlUnknown819166 ; 81/9166

        .al
        .autsiz
        .databank ?

        lda wMapCurrentlyScrollingFlag,b
        bne +

          stz wMapPixelScrollDistance,b
          jsr rsGetMapPixelScrollDistance
          bcs _End

            lda wEventMapScrollSpeed,b
            sta wMapScrollSpeed,b
            stz wMapScrollCurrentPixelDistance,b

            lda #1
            sta wMapCurrentlyScrollingFlag,b

            stz wUnknown00073A,b
            stz wMapEnableXScrollFlag,b
            stz wMapEnableYScrollFlag,b

        +
        lda wMapScrollCurrentPixelDistance,b
        clc
        adc wMapScrollSpeed,b
        sta wMapScrollCurrentPixelDistance,b
        cmp wMapPixelScrollDistance,b
        bcc +

          ; Scrolled up to the wanted pixel distance, clear scrolling flags.
          sec
          sbc wMapPixelScrollDistance,b
          sta wR0

          lda wMapScrollSpeed,b
          sec
          sbc wR0
          sta wMapScrollSpeed,b

          stz wMapCurrentlyScrollingFlag,b
          stz wUnknown00073A,b
          stz wMapEnableXScrollFlag,b
          stz wMapEnableYScrollFlag,b

        +
        lda wMapScrollDirectionIdentifier,b
        jsl rlUnknown819305
        clc

        _End
        rtl

        .databank 0

      rsGetMapPixelScrollDistance ; 81/91BE

        .al
        .autsiz
        .databank ?

        ; Evaluates a map scroll code: if $80, end the scolling
        ; If $84, change the map scrolling speed
        ; Values 1-8 control the direction of the scrolling
        ; Prior values +9 make a command scroll multiple tiles, 
        ; with the tile count being a byte argument that comes afterwards.

        ; Output: 
        ; wMapPixelScrollDistance
        ; CLC if scrolling, SEC if finished

        ldy wMapScrollScriptOffset,b
        bmi _EndScroll

          lda wEventMapScrollScript,b
          sta lR18
          lda wEventMapScrollScript+1,b
          sta lR18+1
          
            -
            lda [lR18],y
            and #$00FF
            cmp #$0080
            sta wR0
            beq _EndScroll

            cmp #$0084
            bne _KeepSpeed

              inc y
              lda [lR18],y
              and #$00FF
              sta wEventMapScrollSpeed,b
              inc wMapScrollScriptOffset,b
              inc wMapScrollScriptOffset,b
              ldy wMapScrollScriptOffset,b
              bra -

            _KeepSpeed
            cmp #10
            bcc +

              sbc #9

            +
            jsr rsGetMapScrollDirectionIdentifierFromCommand
            sta wMapScrollDirectionIdentifier,b

            lda [lR18],y
            and #$00FF
            cmp #10
            bcc _SingleTileScroll

            ; Multiple tiles
            jsr rsGetMapPixelScrollDistanceMultipleTiles
            bra +

            _SingleTileScroll
            jsr rsGetMapPixelScrollDistanceSingleTile

            +
            clc
            rts

        _EndScroll
        lda #16
        sta wMapPixelScrollDistance,b
        stz wUnknown0007D8,b
        stz wMapScrollScriptOffset,b
        stz wUnknown00073A,b
        sec
        rts

        .databank 0

      rsGetMapPixelScrollDistanceSingleTile ; 81/9225

        .al
        .autsiz
        .databank ?

        ; Adds 16 pixels to the scroll distance for a single tile command.
        ; If similar commands occur sequentially, continue to add 16 pixels 
        ; to the distance for each command.

        ; Input:
        ; wR0 = Scrolling command

        ; Output:
        ; wMapPixelScrollDistance

        _OuterLoop
        lda wMapPixelScrollDistance,b
        clc
        adc #16
        sta wMapPixelScrollDistance,b
        
          _InnerLoop
          inc y
          sty wMapScrollScriptOffset,b
          bmi _End

            lda [lR18],y
            and #$00FF
            cmp #$0080
            beq _End

              bit #$0080
              beq +

                cmp #$0084
                bne _InnerLoop

                  inc y
                  lda [lR18],y
                  and #$00FF
                  sta wEventMapScrollSpeed,b
                  bra _InnerLoop

              +
              cmp wR0
              beq _OuterLoop

        _End
        rts

        .databank 0

      rsGetMapPixelScrollDistanceMultipleTiles ; 81/9259

        .al
        .autsiz
        .databank ?

        phx
        lda [lR18],y
        and #$00FF
        tax
        inc y
        lda [lR18],y
        and #$00FF

        ; Check for pause command
        cpx #$12
        beq +

          ora #16 << 8
          jsl rlUnsignedMultiply8By8

        +
        clc
        adc wMapPixelScrollDistance,b
        sta wMapPixelScrollDistance,b

        inc y
        sty wMapScrollScriptOffset,b
        plx
        rts

        .databank 0

      rsGetMapScrollDirectionIdentifierFromCommand ; 81/927F

        .al
        .autsiz
        .databank ?

        cmp #4
        beq _Down

        cmp #3
        beq _Up

        cmp #2
        beq _Right

        cmp #1
        beq _Left

        cmp #5
        beq _TopLeft

        cmp #6
        beq _BottomLeft

        cmp #7
        beq _TopRight

        cmp #8
        beq _BottomRight

        lda #0
        bra _End
        
        _Down
        lda #$0018
        sta wUnknown0007E2,b
        lda #$0400
        bra _End
        
        _Up
        lda #$0010
        sta wUnknown0007E2,b
        lda #$0800
        bra _End
        
        _Right
        lda #$0008
        sta wUnknown0007E2,b
        lda #$0100
        bra _End
        
        _Left
        lda #0
        sta wUnknown0007E2,b
        lda #$0200
        bra _End
        
        _TopLeft
        lda #0
        sta wUnknown0007E2,b
        lda #$0A00
        bra _End
        
        _BottomLeft
        lda #0
        sta wUnknown0007E2,b
        lda #$0600
        bra _End
        
        _TopRight
        lda #$0008
        sta wUnknown0007E2,b
        lda #$0900
        bra _End
        
        _BottomRight
        lda #$0008
        sta wUnknown0007E2,b
        lda #$0500
        bra _End
        
        _End
        rts

        .databank 0

      rlUnknown819305 ; 81/9305

        .al
        .autsiz
        .databank ?

        and #$FFFFF
        beq _End

        cmp #$0200
        beq _Left

        cmp #$0100
        beq _Right

        cmp #$0800
        beq _Up

        cmp #$0400
        beq _Down

        cmp #$0A00
        beq _UpLeft

        cmp #$0600
        beq _DownLeft

        cmp #$0900
        beq _UpRight

        cmp #$0500
        beq _DownRight

        _End
        rtl

        _Left
        jsr rsMapScrollLeft
        rtl

        _Right
        jsr rsMapScrollRight
        rtl

        _Up
        jsr rsMapScrollUp
        rtl

        _Down
        jsr rsMapScrollDown
        rtl

        _UpLeft
        jsr rsMapScrollUpLeft
        rtl

        _DownLeft
        jsr rsMapScrollDownLeft
        rtl

        _UpRight
        jsr rsMapScrollUpRight
        rtl

        _DownRight
        jsr rsMapScrollDownRight
        rtl

        .databank 0

      rsMapScrollUp ; 81/9353

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableYScrollFlag,b
        jsl rlUnknown8886B3
        rts

        .databank 0

      rsMapScrollDown ; 81/9361

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableYScrollFlag,b
        jsl rlUnknown8886BB
        rts

        .databank 0

      rsMapScrollLeft ; 81/936F

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        jsl rlUnknown8886A3
        rts

        .databank 0

      rsMapScrollRight ; 81/937D

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        jsl rlUnknown8886AB
        rts

        .databank 0

      rsMapScrollUpLeft ; 81/938B

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b
        jsl rlUnknown8886C3
        rts

        .databank 0

      rsMapScrollDownLeft ; 81/939C

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b
        jsl $8886E1
        rts

        .databank 0

      rsMapScrollUpRight ; 81/93AD

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b
        jsl $8886D2
        rts

        .databank 0

      rsMapScrollDownRight ; 81/93BE

        .al
        .autsiz
        .databank ?

        lda #1
        sta wUnknown00073A,b
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b
        jsl $8886F0
        rts

        .databank 0

        ; 81/93CF











      procUnknown8AE199 ; 8A/E199

        .structProcInfo "F2", rlProcUnknown8AE199Init, rlProcUnknown8AE199Cycle, $8AE1E9

      rlProcUnknown8AE199Init ; 8A/E1A1

        .al
        .autsiz
        .databank ?

        jsl rlSavePaletteBufferColorsToRAM

          .long $7E9BA8
          .word len(Palette)
          .word aOAMPaletteBuffer.aPalette4 - aBGPaletteBuffer

        ldx #size(Palette)-2
        lda #0

          -
          sta aOAMPaletteBuffer.aPalette4,b,x
          dec x
          dec x
          bpl -

        lda #0
        sta $7F808B
        rtl

        .databank 0

      rlProcUnknown8AE199Cycle ; 8A/E1C1

        .al
        .autsiz
        .databank ?

        lda $7F808B
        sta wPortraitFadingCurrentStep,b
        lda #16
        sta wPortraitFadingMaxSteps,b
        clc
        jsl rlUnknown9F8EE1

          .word $9BA8
          .word $0010
          .word $0180

        bcs +

          -
          lda wPortraitFadingCurrentStep,b
          sta $7F808B
          rtl

        +
        jsl rlProcEngineFreeProc
        bra -

        .databank 0

      aProcUnknown8AE199Code ; 8A/E1E9

        PROC_HALT

      procUnknown8AE1EB ; 8A/E1EB

        .structProcInfo rlProcUnknown8AE1EBInit, rlProcUnknown8AE1EBCycle, $8AE243

      rlProcUnknown8AE1EBInit ; 8A/E1F3

        .al
        .autsiz
        .databank ?

        lda #0
        sta $7F808D
        rtl

        .databank 0

      rlProcUnknown8AE1EBCycle ; 8A/E1FB

        .al
        .autsiz
        .databank ?

        lda $7F808D
        sta wPortraitFadingCurrentStep,b
        lda #0
        sta wPortraitFadingDesiredColor,b
        lda #8
        sta wPortraitFadingMaxSteps,b
        clc
        jsl rlUnknown9F8F4F
          .word $E23D

        bcs +

        -
        lda wPortraitFadingCurrentStep,b
        sta $7F808D
        rtl

        +
        lda #(`$8AE147)<<8
        sta lR44+1
        lda #<>$8AE147
        sta lR44
        phx
        jsl rlProcEngineFindProc
        plx
        bcs +

          lda #$0001
          trb $08AD,b

        +
        jsl rlProcEngineFreeProc
        bra -

        .databank 0

        ; 8A/E23D












      procUnknown8AE245 ; 8A/E245

        .structProcInfo "FF", rlProcUnknown8AE245Init, rlProcUnknown8AE245Cycle, $8AE29D

      rlProcUnknown8AE245Init ; 8A/E24D

        .al
        .autsiz
        .databank ?

        lda #0
        sta $7F808F
        rtl

        .databank 0

      rlProcUnknown8AE245Cycle ; 8A/E255

        .al
        .autsiz
        .databank ?

        lda $7F808F
        sta wPortraitFadingCurrentStep,b
        lda #0
        sta wPortraitFadingDesiredColor,b
        lda #8
        sta wPortraitFadingMaxSteps,b
        clc
        jsl rlUnknown9F8F4F
          .word <>aUnknown8AE297

        bcs +

          -
          lda wPortraitFadingCurrentStep,b
          sta $7F808F
          rtl

        +
        lda #(`procUnknown8AE199)<<8
        sta lR44+1
        lda #<>procUnknown8AE199
        sta lR44
        phx
        jsl rlProcEngineFindProc
        plx
        bcs +

          lda #$0002
          trb $08AD,b

        +
        jsl rlProcEngineFreeProc
        bra -

        .databank 0

      aUnknown8AE297 ; 8A/E297

        .word $0182
        .word $000F
        .word $FFFF

      aProcUnknown8AE245Code ; 8A/E29D

        PROC_HALT

        ; 8A/E29F








      rlSavePaletteBufferColorsToRAM ; 9F/8E6C

        .al
        .autsiz
        .databank ?

        ; Takes 7 bytes of arguments after call.
        ; - a long pointer to a RAM address
        ; - a word color count
        ; - a word palette offset

        phx
        phy
        lda #5,s
        tay
        lda $0001,b,y
        sta lR18
        lda $0002,b,y
        sta lR18+1
        lda $0004,b,y
        sta wR0
        lda $0006,b,y
        tax
        tya
        clc
        adc #7
        sta #5,s

        ldy #0

          -
          lda aBGPaletteBuffer,b,x
          sta [lR18],y
          inc x
          inc x
          inc y
          inc y
          dec wR0
          bne -

        ply
        plx
        rtl

        .databank 0

      rlUnknown9F8E9E ; 9F/8E9E

        .al
        .autsiz
        .databank ?

        ; A = color count

        sta wR2

        -
        lda wPortraitFadingDesiredColor,b
        cmp aBGPaletteBuffer,b,x
        beq +

          phx
          tay
          lda aBGPaletteBuffer,b,x
          tax
          lda wPortraitFadingCurrentStep,b
          jsl rlUnknown9F8FE3
          plx
          sta aBGPaletteBuffer,b,x

        +
        inc x
        inc x
        dec wR2
        bne -

        rtl

        .databank 0

        ; 9F/8EC0





      rlUnknown9F8EE1 ; 9F/8EE1

        .al
        .autsiz
        .databank ?

        lda wPortraitFadingMaxSteps,b
        bcc +

          lsr a
        
        +
        inc a
        cmp wPortraitFadingCurrentStep,b
        bcs +

          lda #1,s
          adc #6
          sta #1,s
          stz wPortraitFadingCurrentStep,b
          sec
          rtl

        +
        phx
        phy
        lda #5,s
        tay
        lda $0001,b,y
        sta wR3
        lda $0003,b,y
        sta wR5
        lda $0005,b,y
        tax
        tya
        clc
        adc #6
        sta #5,s

        phb
        pea #$7E7E
        plb
        plb

        ldy #0
        
          -
          stx $1B47,b
          sty wR4
          lda (wR3),y
          cmp aBGPaletteBuffer,b,x
          beq +

            tay
            lda aBGPaletteBuffer,b,x
            tax
            lda wPortraitFadingCurrentStep,b
            jsl rlUnknown9F8FE3
            ldy wR4
            ldx $1B47,b
            sta aBGPaletteBuffer,b,x

          +
          inc y
          inc y
          inc x
          inc x
          dec wR5
          bne -

        inc wPortraitFadingCurrentStep,b
        plb
        ply
        plx
        clc
        rtl

        .databank 0

      rlUnknown9F8F4F ; 9F/8F4F

        .al
        .autsiz
        .databank ?

        lda wPortraitFadingMaxSteps,b
        bcc +

          lsr a

        +
        inc a
        cmp wPortraitFadingCurrentStep,b
        bcs +

          lda #1,s
          adc #2
          sta #1,s
          stz wPortraitFadingCurrentStep,b
          sec
          rtl

        +
        phx
        lda #3,s
        tay
        lda $0001,b,y
        tax
        tya
        clc
        adc #2
        sta #3,s

        txy
        bra +
        
          -
          phy
          tax
          lda $0002,b,y
          jsl rlUnknown9F8E9E
          ply
          inc y
          inc y
          inc y
          inc y

        +
        lda $0000,b,y
        cmp #$FFFF
        bne -

        inc wPortraitFadingCurrentStep,b
        plx
        clc
        rtl

        .databank 0

        ; 9F/8F95








      rlUnknown9F8FE3 ; 9F/8FE3

        .al
        .autsiz
        .databank ?

        ; Adjusts the input colors to the destination color

        ; A = step index
        ; X = current color word
        ; Y = desired color word

        pha
        pha
        phx
        phy
        lda #1,s
        and #$001F
        tay

        ; Desired red value in Y

        lda #3,s
        and #$001F
        tax

        ; Current red value in X

        lda #5,s
        jsr rsUnknown9F903F
        sta #7,s

        lda #1,s
        asl a
        asl a
        asl a
        xba
        and #$001F
        tay

        ; Desired green value in Y

        lda #3,s
        asl a
        asl a
        asl a
        xba
        and #$001F
        tax

        ; Current green value in X

        lda #5,s
        jsr rsUnknown9F903F
        asl a
        asl a
        asl a
        asl a
        asl a
        ora #7,s
        sta #7,s

        lda #1,s
        lsr a
        lsr a
        xba
        and #$001F
        tay

        ; Desired blue value in Y

        lda #3,s
        lsr a
        lsr a
        xba
        and #$001F
        tax

        ; Current blue value in X

        lda #5,s
        jsr rsUnknown9F903F
        asl a
        asl a
        xba
        ora #7,s
        sta #7,s

        ply
        plx
        pla
        pla
        rtl

        .databank 0

      rsUnknown9F903F ; 9F/903F

        .al
        .autsiz
        .databank ?

        cmp #0
        bne +

          txa
          rts

        +
        dec a
        cmp wPortraitFadingMaxSteps,b
        bne +

          tya
          rts

        +
        phx
        inc a
        sta $02
        tya
        sec
        sbc #1,s
        sta $00
        bpl +

          eor #$FFFF
          inc a

        +
        xba
        and #$FF00
        sta WRDIVA
        sep #$21
        lda wPortraitFadingMaxSteps,b
        sbc $02
        inc a
        sta WRDIVB
        rep #$20
        xba
        xba
        nop
        nop
        lda RDDIV
        bit $00
        bpl +

          eor #$FFFF
          inc a

        +
        sta $00
        pla
        xba
        clc
        adc $00
        xba
        and #$00FF
        rts

        .databank 0

        ; 9F/9090









      rlUnknown8A9750 ; 8A/9750

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = PortraitID

        jsl rlGetDecompressedPortraitDataPointers

        ldx #size(Palette)-2
        ldy #size(Palette)-2

          -
          lda [lR19],y
          sta aBGPaletteBuffer.aPalette5,b,y
          dec x
          dec x
          dec y
          dec y
          bpl -

        lda #16 * 4 * size(Tile4bpp)
        sta wR0
        lda #$CE00 >> 1
        sta wR1
        phx
        jsl rlDMAByPointer
        plx
        rtl

        .databank 0

        ; 8A/9776



















      rlUnknown8AD975 ; 8A/D975

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        jsr rsUnknown8AE05E

        lda $7F7670
        bne +

          jsl rlDMAByStruct
            .structDMAToVRAM aBG3TilemapBuffer, $0700, $80, $F000

          bra ++

        +
        lda #0
        sta $7F7670
        jsr rsUnknown8ADA83
        jsr $8ADA24

        sep #$20
        lda bBufferINIDISP
        rep #$20
        and #$000F
        bne +

          lda #(`procFadeInByScreenFadingTimer)<<8
          sta lR44+1
          lda #<>procFadeInByScreenFadingTimer
          sta lR44
          jsl rlProcEngineFindProc
          bcs +

            jsl rlProcEngineCreateProc

        +
        lda $0592,b
        asl a
        tax
        jsr (aUnknown8AD9FE,x)

        lda $08AD,b
        bit #$0001
        beq +

          lda #$0020
          sta wR0
          lda #$0060
          sta wR1
          ldx #0
          jsr $8A950E
          jsr $8ADB04

        +
        lda $08AD,b
        bit #$0002
        beq +

          lda #$00A0
          sta wR0
          lda #$0060
          sta wR1
          ldx #2
          jsr $8A9539
          jsr $8ADB37

        +
        plp
        plb
        rtl

        .databank 0

      aUnknown8AD9FE ; 8A/D9FE

        .word <>rsUnknown8ADBBD
        .word <>rsUnknown8ADBFF
        .word $DC25
        .word $DCDD
        .word $DCDE

      rlUnknown8ADA08 ; 8A/DA08

        .al
        .autsiz
        .databank ?

        lda #$0044
        tsb $08AD,b
        lda #1
        sta $7F7670
        rtl

        .databank 0

        ; 8A/DA16









      rlDisplayDialogueAPressArrows ; 8A/DB63

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = X Pos
        ; wR1 = Y Pos

        phb
        phx
        phy
        lda aDialogue.wStatus,b
        bit #DialogueStatusCaretLight
        bne _Light

        bit #DialogueStatusCaretDark
        bne _Dark
        bra _End

        _Light
        sep #$20
        lda #`$8ADBAF
        pha
        plb
        rep #$20

        ldy #<>$8ADBAF
        bra _Push

        _Dark
        sep #$20
        lda #`$8ADBB6
        pha
        plb
        rep #$20
        ldy #<>$8ADBB6
        
        _Push
        lda #0
        sta wR4
        lda #$2000
        sta wR5
        jsl rlPushToOAMBuffer

        _End
        ply
        plx
        plb
        rtl

        .databank 0

        ; 8A/DB9F





      rsUnknown8ADBBD ; 8A/DBBD

        .al
        .autsiz
        .databank ?

        jsl rlResetDialogueEngine

        lda $08AF+1,b
        sta $24+1
        lda $08AF,b
        sta $24
        lda #2
        jsl rlUnknown91811C

        lda #0
        sta aBGPaletteBuffer,b
        lda #2
        sta aDialogue.wUnknown0018D0,b
        ldx #0
        jsr rsUnknown8ADCF9

        lda $08B8,b
        cmp #4
        bne +

          lda #$081E
          sta aDialogue._Slot[0].wDisplayArea,b

        +
        lda #1
        sta $0592,b
        lda #2
        sta $0594,b
        rts

        .databank 0

      rsUnknown8ADBFF ; 8A/DBFF

        .al
        .autsiz
        .databank ?

        lda aDialogue.wStatus,b
        beq ++

          ldx #$00E0
          ldy #$0038
          lda aDialogue.wSlotOffset,b
          beq +

            ldx #$00E0
            ldy #$00D0

          +
          stx wR0
          sty wR1
          jsl rlDisplayDialogueAPressArrows
          rts

        +
        lda $0594,b
        sta $0592,b
        rts

        .databank 0

        ; 8A/DC25




















      rsUnknown8ADCF9 ; 8A/DCF9

        .al
        .autsiz
        .databank ?

        ; Only ever enter this routine with aDialogue.wSlotOffset = 0

        lda #$2200
        sta aDialogue.wBaseTile,b,x
        stz aDialogue._Slot[0].wUnknown0018D9,b
        stz aDialogue._Slot[1].wUnknown0018D9,b
        lda #1
        sta aDialogue.wTextSound,b
        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[0].lBGBufferPosition+1,b
        sta aDialogue._Slot[1].lBGBufferPosition+1,b
        lda #<>aBG3TilemapBuffer
        sta aDialogue._Slot[0].lBGBufferPosition,b
        sta aDialogue._Slot[1].lBGBufferPosition,b
        lda #$A000 >> 1
        sta aDialogue._Slot[0].wVRAMAddress,b
        lda #$B000 >> 1
        sta aDialogue._Slot[1].wVRAMAddress,b
        lda #pack([30, 6])
        sta aDialogue._Slot[0].wDisplayArea,b
        lda #pack([30, 6])
        sta aDialogue._Slot[1].wDisplayArea,b
        stz aDialogue._Slot[0].wUnknown0018E1,b
        stz aDialogue._Slot[1].wUnknown0018E1,b

        lda #pack([4, 2])
        sta wR1

        sep #$20
        lda #0
        sta wR0+1
        xba
        lda wR1
        sta wR0
        lda wR1+1
        xba
        rep #$20

        lsr a
        lsr a
        clc
        adc wR0
        sta wR0

        ldx aDialogue.wSlotOffset,b
        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[0].lBGBufferPosition+1,b,x
        lda #<>aBG3TilemapBuffer
        clc
        adc wR0
        sta aDialogue._Slot[0].lBGBufferPosition,b,x

        lda #pack([4, 21])
        sta wR1

        sep #$20
        lda #0
        sta wR0+1
        xba
        lda wR1
        sta wR0
        lda wR1+1
        xba
        rep #$20

        lsr a
        lsr a
        clc
        adc wR0
        sta wR0

        ldx aDialogue.wSlotOffset,b
        lda #(`aBG3TilemapBuffer)<<8
        sta aDialogue._Slot[1].lBGBufferPosition+1,b,x
        lda #<>aBG3TilemapBuffer
        clc
        adc wR0
        sta aDialogue._Slot[1].lBGBufferPosition,b,x
        rts

        .databank 0

        ; 8A/DD98








      rsUnknown8AE05E ; 8A/E05E

        .al
        .autsiz
        .databank ?

        lda $08B6,b
        asl a
        tax
        jsr (aUnknown8AE067,x)
        rts

        .databank 0

      aUnknown8AE067 ; 8A/E067

        .word <>rsUnknown8AE076
        .word <>rsUnknown8AE075
        .word <>rsUnknown8AE075
        .word <>rsUnknown8AE075
        .word $E0D7
        .word <>rsUnknown8AE075
        .word <>rsUnknown8AE075

      rsUnknown8AE075 ; 8A/E075

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsUnknown8AE076 ; 8A/E076

        .al
        .autsiz
        .databank ?

        lda $7F80A3
        sec
        sbc #1
        bpl _E0A7

          lda $7F80A5
          clc
          adc #4
          sta $7F80A5
          tax
          lda $8AE0C9,x
          bpl +

            lda #0
            sta $7F80A5
            tax
            lda $8AE0C9,x

          +
          sta $7F80A7
          lda $8AE0C7,x
        
        _E0A7
        sta $7F80A3

        lda $7F80A7
        asl a
        tax
        lda $8CA000,x
        sta $0170,b
        lda $8CA002,x
        sta $0172,b
        lda $8CA004,x
        sta $0174,b
        rts

        .databank 0

        ; 8A/E0C7




      rsUnknown8ADA83 ; 8A/DA83

        .al
        .autsiz
        .databank ?

        lda $08AD,b
        bit #$0010
        beq +

          lda $08B2,b
          jsl rlUnknown8A9750
          lda #$0010
          trb $08AD,b
          lda #(`$8AE147)<<8
          sta lR44+1
          lda #<>$8AE147
          sta lR44
          jsl rlProcEngineCreateProc

        +
        lda $08AD,b
        bit #$0020
        beq +

          lda $08B4,b
          jsl $8A9776
          lda #$0020
          trb $08AD,b
          lda #(`$8AE199)<<8
          sta lR44+1
          lda #<>$8AE199
          sta lR44
          jsl rlProcEngineCreateProc

        +
        rts

        .databank 0

      rlUnknown8ADACA ; 8A/DACA

        .al
        .autsiz
        .databank ?

        lda #$0011
        tsb $08AD,b
        lda #1
        sta $7F7670
        rtl

        .databank 0

      rlUnknown8ADAD8 ; 8A/DAD8

        .al
        .autsiz
        .databank ?

        lda #$0022
        tsb $08AD,b
        lda #1
        sta $7F7670
        rtl

        .databank 0

      rlUnknown8ADAE6 ; 8A/DAE6

        .al
        .autsiz
        .databank ?

        lda #(`procUnknown8AE1EB)<<8
        sta lR44+1
        lda #<>procUnknown8AE1EB
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

      rlUnknown8ADAF5 ; 8A/DAF5

        .al
        .autsiz
        .databank ?

        lda #(`procUnknown8AE245)<<8
        sta lR44+1
        lda #<>procUnknown8AE245
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

        ; 8A/DB04
















































      rlUnknown888410 ; 88/8410

        .al
        .autsiz
        .databank ?

        lda #1
        sta wMapEnableXScrollFlag,b
        sta wMapEnableYScrollFlag,b

        lda wMapScrollXPixels,b
        sta wUnknown000734,b
        lda wMapScrollYPixels,b
        sta wUnknown000736,b
        clc
        adc #$0100
        sta wMapScrollYPixels,b
        lda #8
        sta wMapScrollSpeed,b

        stz wUnknown00072C,b
        stz wUnknown00072E,b

        lda wUnknown000736,b
        and #$00F8
        asl a
        asl a
        asl a
        clc
        adc #$07C0
        and #$07FF
        sta $0724,b
        
          -
          jsr $88875E
          jsl $8887AD
          jsr $88847D

          lda wUnknown000736,b
          cmp wMapScrollYPixels,b
          bcc -

        jsl rlDMAByStruct
          .structDMAToVRAM $7E7388, $0800, $80, $A000

        lda wUnknown000734,b
        sta wMapScrollXPixels,b
        lda wUnknown000736,b
        sta wMapScrollYPixels,b

        stz wMapEnableXScrollFlag,b
        stz wMapEnableYScrollFlag,b
        rtl

        .databank 0

        ; 88/847D














      rlDMAPaletteAndOAMBuffer ; 80/807C

        .al
        .autsiz
        .databank ?

        php
        sep #$10
        rep #$20

        lda #pack([DMAP_DMA_Setting(DMAP_CPUToIO, DMAP_Increment, DMAP_Mode0), narrow(OAMDATA - PPU_REG_BASE, 1)])
        sta DMA_IO[0].DMAP,b

        lda #<>aSpriteBuffer
        sta DMA_IO[0].A1,b
        ldx #`aSpriteBuffer
        stx DMA_IO[0].A1+2,b

        lda #size(aSpriteBuffer)+size(aSpriteExtBuffer)
        sta DMA_IO[0].DAS,b

        stz OAMADD,b

        lda #pack([DMAP_DMA_Setting(DMAP_CPUToIO, DMAP_Increment, DMAP_Mode0), narrow(CGDATA - PPU_REG_BASE, 1)])
        sta DMA_IO[1].DMAP,b

        lda #<>aBGPaletteBuffer
        sta DMA_IO[1].A1,b
        ldx #`aBGPaletteBuffer
        stx DMA_IO[1].A1+2,b

        lda #size(aBGPaletteBuffer)+size(aOAMPaletteBuffer)
        sta DMA_IO[1].DAS,b

        ldx #0
        stx CGADD,b

        ldx #MDMAEN_Setting([0, 1])
        stx MDMAEN,b

        lda wBufferOAMADD
        sta OAMADD,b
        plp
        rtl

        .databank 0

        ; 80/80C3









      rlHideSprites ; 80/826E

        .al
        .autsiz
        .databank ?

        phd
        sep #$30
        lda wNextFreeSpriteOffset+1,b
        and #$03
        asl a
        tax
        jsr (_Table,x)
        rep #$30
        stz wNextFreeSpriteOffset,b
        pld
        rtl

        _Table
          .addr _Under64Sprites
          .addr _Over64Sprites
          .addr _HideNoSprites
          .addr _HideNoSprites

        _Under64Sprites ; 80/8282

        .xs
        rep #$20
        ldx #240
        phd
        lda #<>aSpriteBuffer+(size(structPPUOAMEntry)*64)
        tcd
        jsr _Clearer
        pld
        lda wNextFreeSpriteOffset,b
        lsr a
        clc
        adc #<>_Clearer
        sta wR0
        lda #<>aSpriteBuffer
        tcd
        jmp (wR0)

        _Over64Sprites ; 80/82A8
        .xs

        rep #$20
        ldx #240
        lda wNextFreeSpriteOffset,b
        and #$00FF
        lsr a
        clc
        adc #<>_Clearer
        sta wR0
        lda #<>aSpriteBuffer+(size(structPPUOAMEntry)*64)
        tcd
        jmp (wR0)

        _Clearer ; 80/82C0

        .xs

        .for i in range(0, 64*size(structPPUOAMEntry), size(structPPUOAMEntry))

          stx i+1

        .endfor

        _HideNoSprites ; 80/8340

        .xs

        rts

        .databank 0

      rlClearSpriteExtBuffer ; 80/8341

        .al
        .autsiz
        .databank ?

        .for i in range(0, size(aSpriteExtBuffer), size(word))

          stz aSpriteExtBuffer+i,b

        .endfor

        rtl

        .databank 0

        ; 80/8372

















      rlFillBG2Page0TilemapBuffer ; 80/9ED9

        .al
        .autsiz
        .databank ?

        ; Input
        ; A = Filling tile index

        phb
        php
        phk
        plb
        phx

        ldx #size(aBG2TilemapBuffer.Page0)-2

          -
          sta aBG2TilemapBuffer.Page0,x
          dec x
          dec x
          bpl -

        plx
        plp
        plb
        rtl

        .databank 0

      rlFillBG2Page1TilemapBuffer ; 80/9EED

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx #size(aBG2TilemapBuffer.Page1)-2
        
          -
          sta aBG2TilemapBuffer.Page1,x
          dec x
          dec x
          bpl -

        plx
        plp
        plb
        rtl

        .databank 0

      rlFillBG3Page0TilemapBuffer ; 80/9F01

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx #size(aBG3TilemapBuffer.Page0)-2

          -
          sta aBG3TilemapBuffer.Page0,x
          dec x
          dec x
          bpl -

        plx
        plp
        plb
        rtl

        .databank 0

      rlSetLayerPositionsAndSizes ; 80/9F15

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR1 = BG1Base
        ; wR2 = BG2Base
        ; wR3 = BG3Base
        ; wR4 = BG4Base
        ; wR5 = BG1TilemapPosition
        ; wR6 = BG2TilemapPosition
        ; wR7 = BG3TilemapPosition
        ; wR8 = BG4TilemapPosition

        phb
        php
        phk
        plb
        sep #$20
        lda bBufferINIDISP
        bmi +

          jml _End

        +
        lda wR1+1
        and #BG12NBA_BG1_Address << 4
        lsr a
        lsr a
        lsr a
        lsr a
        sta wR1+1

        lda wR2+1
        and #BG12NBA_BG2_Address
        ora wR1+1
        sta wR1

        lda wR3+1
        and #BG34NBA_BG3_Address << 4
        lsr a
        lsr a
        lsr a
        lsr a
        sta wR3+1

        lda wR4+1
        and #BG34NBA_BG4_Address
        ora wR3+1
        sta wR3

        lda wR5+1
        and #OBSEL_Base << 5
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta wR5

        lda wR6+1
        and #BGSC_Address
        sta wR6
        lda wR7+1
        and #BGSC_Address
        sta wR7
        lda wR8+1
        and #BGSC_Address
        sta wR8
        lda wR9+1
        and #BGSC_Address
        sta wR9

        lda bBufferBG1SC
        and #BGSC_Size
        ora wR6
        sta BG1SC,b
        sta bBufferBG1SC

        lda bBufferBG2SC
        and #BGSC_Size
        ora wR7
        sta BG2SC,b
        sta bBufferBG2SC

        lda bBufferBG3SC
        and #BGSC_Size
        ora wR8
        sta BG3SC,b
        sta bBufferBG3SC

        lda bBufferBG4SC
        and #BGSC_Size
        ora wR9
        sta BG4SC,b
        sta bBufferBG4SC

        lda bBufferOBSEL
        and #~OBSEL_Base
        ora wR5
        sta OBSEL,b
        sta bBufferOBSEL

        lda wR1
        sta BG12NBA,b
        sta bBufferBG12NBA

        lda wR3
        sta BG34NBA,b
        sta bBufferBG34NBA
        
        _End
        plp
        plb
        rtl

        .databank 0

        ; 80/9FB2








      rsUnknown80AF9B ; 80/AF9B

        .al
        .autsiz
        .databank ?

        jsl rlHardwareResetScreenPosMathHDMA
        jsl rlHardwareResetScreenRegisters
        lda #0
        jsl rlFillBG2Page0TilemapBuffer
        lda #$030F
        jsl rlFillBG2Page1TilemapBuffer
        lda #$00FF
        jsl rlFillBG3Page0TilemapBuffer

        ldx #$067E
        lda #0

          -
          sta $7FDD4A,x
          sta $7FE3CA,x
          dec x
          dec x
          bpl -

        lda #$0000 >> 1
        sta wR1
        sta wR2
        lda #$8000 >> 1
        sta wR3
        sta wR4
        lda #$C000 >> 1
        sta wR5
        lda #$A000 >> 1
        sta wR6
        lda #$A800 >> 1
        sta wR7
        lda #$B000 >> 1
        sta wR8
        jsl rlSetLayerPositionsAndSizes

        jsl rlClearSpriteExtBuffer
        jsl rlHideSprites
        jsl rlDMAPaletteAndOAMBuffer
        jsl rlDMAByStruct
          .structDMAToVRAM aBG2TilemapBuffer.Page1, $0800, $80, $A800

        jsl rlDMAByStruct
          .structDMAToVRAM aBG3TilemapBuffer.Page0, $0800, $80, $B000

        jsl rlClearUnitWindowAndTerrainWindowProcs
        jsl rlActiveSpriteEngineReset
        jsl rlEnableActiveSpriteEngine
        jsl rlResetHDMAEngine
        jsl $82E073
        jsl $82E400
        jsl rlUnknown8780AA
        jsl $82F211
        lda #$00FF
        sta $053E,b
        jsl rlUnknown8780DF
        rts

        .databank 0

        ; 80/B041


















      rsUnknown80B122 ; 80/B122

        .al
        .autsiz
        .databank ?

        ; a MainLoop routine

        php
        sei
        sep #$20
        lda #INIDISP_Setting(true, 0)
        sta bBufferINIDISP
        sta INIDISP,b
        rep #$20

        jsl rlDisableVBlank
        jsr rsUnknown80AF9B
        jsr rsUnknown80B16A
        jsl $899FDC
        jsr $80B065
        jsr $80B105
        jsr $80B052
        jsr $80B041

        lda #$0012
        sta $0302,b
        lda $0D7B,b
        sta $0304,b
        jsr $80B195

        sep #$20
        lda #INIDISP_Setting(false, 0)
        sta bBufferINIDISP
        sta INIDISP,b
        rep #$20

        jsl rlEnableVBlank
        plp
        cli
        rts

        .databank 0

      rsUnknown80B16A ; 80/B16A

        .al
        .autsiz
        .databank ?

        lda $0D77,b
        asl a
        tax
        jmp (+,x)

        +
        .addr rsUnknown80B17A
        .addr rsUnknown80B17F
        .addr rsUnknown80B184
        .addr rsUnknown80B184

        .databank 0

      rsUnknown80B17A ; 80/B17A

        .al
        .autsiz
        .databank ?

        jsl $888082
        rts

        .databank 0

      rsUnknown80B17F ; 80/B17F

        .al
        .autsiz
        .databank ?

        jsl $88821A
        rts

        .databank 0

      rsUnknown80B184 ; 80/B184

        .al
        .autsiz
        .databank ?

        jsl $889268
        jsl $87EAF1
        jsl $86C629
        jsl $888082
        rts

        .databank 0

      rsUnknown80B195 ; 80/B195

        .al
        .autsiz
        .databank ?

        lda #$0020
        trb wUnknown000D79,b

        lda #(`aMapMenuRAMArea)<<8
        sta lR18+1
        lda #<>aMapMenuRAMArea
        sta lR18
        lda #1
        sta wStructIndex,b
        lda #size(aMapMenuRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #11
        sta $0304,b
        jsl $858728

        lda $0D77,b
        cmp #2
        bcc _End

          jsl rlUnknown81B088
          bcc +

            jsl rlGetVictoryThemeIfAllEnemiesDead
            bcc +

              sta $0DAB,b

          +
          lda wUnknown00171A,b
          bne _End

            jsl rlUnknown81AB26
            jsl $809654

        _End
        rts

        .databank 0

        ; 80/B1E1






























      rlUnknown82E073 ; 82/E073

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb
        ldx #$008A
        sep #$20
        lda #0
        
          -
          sta $168F,b,x
          dec x
          bpl -

        rep #$20
        jsl rlUnknown82E0AF
        plb
        plp
        rtl

        .databank 0

        ; 82/E08D






      rlUnknown82E0AF ; 82/E0AF

        .al
        .autsiz
        .databank ?

        sei
        sep #$20
        lda bBufferNMITIMEN
        and #$CF
        sta bBufferNMITIMEN
        rep #$20

        lda #$8000
        tsb $168F,b
        lda #$8222
        sta wIRQPointer
        rtl

        .databank 0

        ; 82/E0C6




      rlUnknown82E400 ; 82/E400

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        ldx #$0021
        lda #0
        
          -
          sta lStructPointer1,b,x
          dec x
          dec x
          bpl -

        lda #$0010
        sta wUnknown00056B,b
        plp
        plb
        rtl

        .databank 0

        ; 82/E41A







      rlUnknown8780AA ; 87/80AA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        ldx #$0029
        sep #$20
        lda #0

          -
          sta $0516,b,x
          dec x
          bpl -

        rep #$20

        lda bBufferBG3SC
        and #BGSC_Address
        xba
        sta $0516,b
        lda #(`aBG3TilemapBuffer)<<8
        sta $0519,b
        lda #<>aBG3TilemapBuffer
        sta $0518,b
        lda #0
        sta $053E,b
        jsl $87828D
        plp
        plb
        rtl

        .databank 0

      rlUnknown8780DF ; 87/80DF

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda #$0080
        tsb bUnknown000521,b
        plp
        plb
        rtl

        .databank 0

      rlUnknown8780EC ; 87/80EC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda #$0080
        trb bUnknown000521,b
        plp
        plb
        rtl

        .databank 0

        ; 87/80F9







      rlUnknown82F211 ; 82/F211

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        sep #$20
        ldx #9
        lda #0
        
          -
          sta $0540,b,x
          dec x
          bpl -

        rep #$20
        plp
        plb
        rtl

        .databank 0

        ; 82/F227















      rlUnknown91A80D ; 91/A80D

        .al
        .autsiz
        .databank ?

        php
        lda bDecompressionArrayFlag,b
        bne _End

          lda aMovingMapSprites.wState,b
          cmp #2
          beq _A85B

            cmp #1
            bne _End

              lda aMovingMapSprites.wCharacterID,b
              sta wRoutineVariable1,b
              lda aMovingMapSprites.wSpawnXCoordinate,b
              sta aEventMovement.wUnitXCoordinate
              lda aMovingMapSprites.wSpawnYCoordinate,b
              sta aEventMovement.wUnitYCoordinate
              lda aMovingMapSprites.wDestinationXCoordinate,b
              sta aEventMovement.wDestinationXCoordinate
              lda aMovingMapSprites.wDestinationYCoordinate,b
              sta aEventMovement.wDestinationYCoordinate
              lda aMovingMapSprites.wUnknown001830,b
              sta aEventMovement.wUnknown7EC494,b
              lda aMovingMapSprites.wEntryIndex,b
              jsl rlUnknown87B01D
              bcc +

                brk

              +
              lda #2
              sta aMovingMapSprites.wState,b
              bra _End
              
                _A85B
                lda #0
                sta aMovingMapSprites.wState,b

        _End
        plp
        rtl

        .databank 0

        ; 91/A863







      rlUnknown87B01D ; 87/B01D

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = EntryIndex
        ; wRoutineVariable1 = CharacterID

        phb
        php
        phk
        plb
        phx

        sta aEventMovement.wEntryIndex

        lda aEventMovement.wUnitXCoordinate
        bpl +

          lda wRoutineVariable1,b
          jsl rlGetUnitRAMDataPointerByID
          bcs _SEC

            jsl rlGetSelectedUnitDeploymentOffset
            tax
            lda aDeploymentTable._XTilePosition,x
            sta aEventMovement.wUnitXCoordinate
            lda aDeploymentTable._YTilePosition,x
            sta aEventMovement.wUnitYCoordinate

        +
        lda wRoutineVariable1,b
        jsl rlGetCharacterClass
        jsl rlGetClassDataROMPointer
        jsl rlGetClassMovementType
        asl a
        clc
        adc aMainDataOffsets.MovementCostOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.MovementCostOffsets
        adc #<>aMainDataOffsets
        sta aEventMovement.wMovementCostPointer
        jsl rlUnknown87B080
        bcs _SEC

          plx
          plp
          plb
          clc
          rtl

        _SEC
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      rlUnknown87B080 ; 87/B080

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsl rlFillEventMovementMoveCostMap

        lda aEventMovement.wUnknown7EC494
        bne _B0F7

          lda #`aEventMovement.aTargetMap
          ldx #<>aEventMovement.aTargetMap
          jsl rlClearMapBufferAddBorders

          lda aEventMovement.wDestinationXCoordinate
          sta aEventMovement.wTargetXCoordinate
          lda aEventMovement.wDestinationYCoordinate
          sta aEventMovement.wTargetYCoordinate
          lda #0
          jsl rlSetEventMovementTargetTile

          ldx #len(aDeploymentTable._State)-2

            _Loop
            lda aDeploymentTable._State,x
            bit #DeploymentStateAlive
            beq _Next

              lda aDeploymentTable._XTilePosition,x
              sta aEventMovement.wTargetXCoordinate
              lda aDeploymentTable._YTilePosition,x
              sta aEventMovement.wTargetYCoordinate
              lda #$00FF
              jsl rlSetEventMovementTargetTile

            _Next
            dec x
            dec x
            bpl _Loop

          lda aEventMovement.wDestinationXCoordinate
          sta aEventMovement.wStartingXCoordinate
          lda aEventMovement.wDestinationYCoordinate
          sta aEventMovement.wStartingYCoordinate
          lda #0
          sta aEventMovement.wTargetXCoordinate
          jsl rlEventMovementBuildTargetDistanceMap
          bcc _SEC
          bra +

        _B0F7
        lda aEventMovement.wDestinationXCoordinate
        sta aEventMovement.wTargetXCoordinate
        lda aEventMovement.wDestinationYCoordinate
        sta aEventMovement.wTargetYCoordinate

        +
        lda aEventMovement.wEntryIndex
        asl a
        tax
        lda aEventMovement.wTargetXCoordinate
        sta aEventMovement.wStartingXCoordinate
        sta aEventMovement.aScriptEndXCoordinate,x
        lda aEventMovement.wTargetYCoordinate
        sta aEventMovement.wStartingYCoordinate
        sta aEventMovement.aScriptEndYCoordinate,x

        jsl rlClearEventMovementTargetMap

        lda aEventMovement.wUnitXCoordinate
        sta aEventMovement.wTargetXCoordinate
        sta aEventMovement.aScriptStartXCoordinate,x
        lda aEventMovement.wUnitYCoordinate
        sta aEventMovement.wTargetYCoordinate
        sta aEventMovement.aScriptStartYCoordinate,x
        lda #0
        jsl rlSetEventMovementTargetTile

        lda #1
        sta aEventMovement.wTargetXCoordinate
        jsl rlEventMovementBuildTargetDistanceMap
        bcc _SEC

        lda aEventMovement.wEntryIndex
        jsl rlEventMovementCreateMovementScriptFromTargetDistanceMap

        ply
        plx
        plp
        plb
        clc
        rtl

        _SEC
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      rlClearEventMovementTargetMap ; 87/B169

        .al
        .autsiz
        .databank ?

        phx
        phy
        ldy #$FFFF
        lda #`aEventMovement.aTargetMap
        ldx #<>aEventMovement.aTargetMap
        jsl rlFillMapBuffer
        ply
        plx
        rtl

        .databank 0

      rlSetEventMovementTargetTile ; 87/B17B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = value to write to aEventMovement.aTargetMap to specified tile

        php
        phx
        pha
        lda aEventMovement.wTargetYCoordinate
        xba
        lsr a
        lsr a
        clc
        adc aEventMovement.wTargetXCoordinate
        tax

        pla
        sep #$20
        sta aEventMovement.aTargetMap,x
        rep #$20
        plx
        plp
        rtl

        .databank 0

      rlEventMovementBuildTargetDistanceMap ; 87/B197

        .al
        .autsiz
        .databank ?

        ; Similar to rlGetNearestPossibleTarget of the AI routine but
        ; builds the map traversal list in the decomp buffer.

        phb
        php
        phk
        plb
        phx
        phy
        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        lda #`aEventMovement.aTargetDistanceMap
        ldx #<>aEventMovement.aTargetDistanceMap
        jsl rlClearMapBufferAddBorders

        ; Clear the row of map tile above and below the map buffers

        ldx #(64 >> 1) - 2
        lda #$FFFF

          -
          sta aEventMovement.aTargetDistanceMap - 64,b,x
          sta aEventMovement.aTargetDistanceMap - 32,b,x
          sta aEventMovement.aTargetDistanceMap + size(aTargetDistanceMap),b,x
          sta aEventMovement.aTargetDistanceMap + size(aTargetDistanceMap) + 32,b,x

          sta aEventMovement.aTargetMap - 64,b,x
          sta aEventMovement.aTargetMap - 32,b,x
          sta aEventMovement.aTargetMap + size(aTargetMap),b,x
          sta aEventMovement.aTargetMap + size(aTargetMap) + 32,b,x

          dec x
          dec x
          bpl -

        ; Get map tile index
        lda aEventMovement.wStartingYCoordinate,b
        xba
        lsr a
        lsr a
        clc
        adc aEventMovement.wStartingXCoordinate,b
        tay

        lda aEventMovement.aTargetMap,b,y
        bit #$0080
        bne +

          jml _UnitOnTarget

        +
        sep #$20
        lda #1
        sta aEventMovement.aTargetDistanceMap,b,y
        rep #$20

        sty aEventMovement.aMapTraversalList,b

        stz aEventMovement.wAnalyzeTraversalOffset,b

        lda #2
        sta aEventMovement.wMapTraversalListOffset,b
        lda #1
        sta aEventMovement.wRunningMovementCost,b

        _Loop
        ldx aEventMovement.wAnalyzeTraversalOffset,b

        stz aEventMovement.wFilledMapTraversalListFlag,b
        sep #$20

          -
          ldy aEventMovement.aMapTraversalList,b,x
          lda aEventMovement.aTargetDistanceMap,b,y
          cmp aEventMovement.wRunningMovementCost,b
          bne +
          bra _CheckDirections

            _MarkFinishedMapTileIndex
            lda #$FF
            sta aEventMovement.aMapTraversalList + 1,b,x
            sta aEventMovement.wFilledMapTraversalListFlag,b

          +
          dec x
          dec x
          bpl -

        ; Done handling all previous entries.

        rep #$20
        lda aEventMovement.wFilledMapTraversalListFlag,b
        beq _EmptyList

          ; Overwrite marked entries and shift all following ones forward.

          ldx #0
          ldy #0
          
            -
            lda aEventMovement.aMapTraversalList,b,x
            bmi +

              sta aEventMovement.aMapTraversalList,b,y
              inc y
              inc y

            +
            inc x
            inc x
            cpx aEventMovement.wMapTraversalListOffset,b
            bne -

          sty aEventMovement.wMapTraversalListOffset,b

        _EmptyList
        lda aEventMovement.wMapTraversalListOffset,b
        beq _CLC

          dec a
          dec a
          sta aEventMovement.wAnalyzeTraversalOffset,b
          inc aEventMovement.wRunningMovementCost,b
          lda aEventMovement.wRunningMovementCost,b
          cmp #$00FC
          bne _Loop

        _CLC
        ply
        plx
        plp
        plb
        clc
        rtl

        _CheckDirections
        phx
        ldx aEventMovement.wMapTraversalListOffset,b

        ; Check up
        lda aEventMovement.aMovementCostMap - 64,b,y
        bmi _UpUntraversable

          xba
          lda aEventMovement.aTargetDistanceMap - 64,b,y
          bne +

            xba
            clc
            adc aEventMovement.wRunningMovementCost,b
            sta aEventMovement.aTargetDistanceMap - 64,b,y
            rep #$20
            tya
            clc
            adc #-64
            sta aEventMovement.aMapTraversalList,b,x
            inc x
            inc x
            sep #$20
            bra +

        _UpUntraversable
        lda #$FF
        sta aEventMovement.aTargetDistanceMap - 64,b,y
        lda aEventMovement.wTargetXCoordinate,b
        beq _CheckLeft

        +
        lda aEventMovement.aTargetMap - 64,b,y
        bmi _CheckLeft

          jml _TargetIsUpwards

        _CheckLeft
        lda aEventMovement.aMovementCostMap - 1,b,y
        bmi _LeftUntraversable

          xba
          lda aEventMovement.aTargetDistanceMap - 1,b,y
          bne +

            xba
            clc
            adc aEventMovement.wRunningMovementCost,b
            sta aEventMovement.aTargetDistanceMap - 1,b,y
            rep #$20
            tya
            clc
            adc #$FFFF
            sta aEventMovement.aMapTraversalList,b,x
            inc x
            inc x
            sep #$20
            bra +
        
        _LeftUntraversable
        lda #$FF
        sta aEventMovement.aTargetDistanceMap - 1,b,y
        lda aEventMovement.wTargetXCoordinate,b
        beq _CheckDown
        
        +
        lda aEventMovement.aTargetMap - 1,b,y
        bmi _CheckDown

          jml _TargetIsLeftwards

        _CheckDown
        lda aEventMovement.aMovementCostMap + 64,b,y
        bmi _DownUntraversable

          xba
          lda aEventMovement.aTargetDistanceMap + 64,b,y
          bne +

            xba
            clc
            adc aEventMovement.wRunningMovementCost,b
            sta aEventMovement.aTargetDistanceMap + 64,b,y
            rep #$20
            tya
            clc
            adc #64
            sta aEventMovement.aMapTraversalList,b,x
            inc x
            inc x
            sep #$20
            bra +
        
        _DownUntraversable
        lda #$FF
        sta aEventMovement.aTargetDistanceMap + 64,b,y
        lda aEventMovement.wTargetXCoordinate,b
        beq _CheckRight
        
        +
        lda aEventMovement.aTargetMap + 64,b,y
        bmi _CheckRight

          jml _TargetIsDownwards

        _CheckRight
        lda aEventMovement.aMovementCostMap + 1,b,y
        bmi _RightUntraversable

          xba
          lda aEventMovement.aTargetDistanceMap + 1,b,y
          bne +

            xba
            clc
            adc aEventMovement.wRunningMovementCost,b
            sta aEventMovement.aTargetDistanceMap + 1,b,y
            rep #$20
            tya
            clc
            adc #1
            sta aEventMovement.aMapTraversalList,b,x
            inc x
            inc x
            sep #$20
            bra +

        _RightUntraversable
        lda #$FF
        sta aEventMovement.aTargetDistanceMap + 1,b,y
        lda aEventMovement.wTargetXCoordinate,b
        beq _DoneChecking

        +
        lda aEventMovement.aTargetMap + 1,b,y
        bmi _DoneChecking

          jml _TargetIsRightwards

        _DoneChecking
        stx aEventMovement.wMapTraversalListOffset,b
        plx
        jml _MarkFinishedMapTileIndex

        _TargetIsUpwards
        plx
        ldx #-64
        bra +
        
        _TargetIsLeftwards
        plx
        ldx #-1
        bra +
        
        _TargetIsRightwards
        plx
        ldx #1
        bra +

        _TargetIsDownwards
        plx
        ldx #64
        bra +

        _UnitOnTarget
        ldx #0

        +
        rep #$20
        and #$00FF
        pha

        txa
        sta wUnknown7EC4A4,b
        tya
        clc
        adc wUnknown7EC4A4,b
        tay
        and #$003F
        sta aEventMovement.wTargetXCoordinate,b
        tya
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta aEventMovement.wTargetYCoordinate,b

        pla
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      rlFillEventMovementMoveCostMap ; 87/B386

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aMapData
        pha
        rep #$20
        plb

        phx
        phy
        sep #$20
        ldy #(size(aMapData)-2) >> 1

          -
          rep #$20
          tya
          asl a
          tax
          lda aMapData,x
          and #$03FF
          tax
          lda aTerrainTileset,x
          and #$00FF
          clc
          adc aEventMovement.wMovementCostPointer,b
          tax
          sep #$20
          lda aMainDataOffsets,x
          inc a
          sta aEventMovement.aMovementCostMap,b,y
          dec y
          bpl -

        rep #$20
        ldx #(len(aDeploymentTable._State) - 2)

          -
          lda aDeploymentTable._State,b,x
          bit #DeploymentStateAlive
          beq _Next

            bit #DeploymentStateHidden
            bne _Next

              lda aDeploymentTable._YTilePosition,b,x
              and #$00FF
              xba
              lsr a
              lsr a
              clc
              adc aDeploymentTable._XTilePosition,b,x
              tay
              sep #$20
              lda #8
              clc
              adc aEventMovement.aMovementCostMap,b,y
              sta aEventMovement.aMovementCostMap,b,y
              rep #$20

          _Next
          dec x
          dec x
          bpl -

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlEventMovementCreateMovementScriptFromTargetDistanceMap ; 87/B3F3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        asl a
        tax
        lda aEventMovementMovementScriptBufferAddresses,x
        sta aEventMovement.wMovementScriptBufferAddress

        sep #$20
        lda #`aEventMovement
        pha
        rep #$20
        plb

        ; Get map tile index of the targeted unit thats about to move
        lda aEventMovement.wTargetYCoordinate,b
        xba
        lsr a
        lsr a
        clc
        adc aEventMovement.wTargetXCoordinate,b
        tay

        sty aEventMovement.wMapTileIndex,b
        lda #$01FE
        sta aEventMovement.wMaxScriptCommandsCount,b
        
        _Loop
        sep #$20
        lda aEventMovement.aTargetDistanceMap,b,y
        cmp #1
        bcs +

          jml _End

        +
        sta aEventMovement.wLowestMovementDistance,b
        lda #$FE
        sta aEventMovement.aTargetDistanceMap,b,y
        ldx #8

        lda aEventMovement.wMapTileIndex,b
        lsr a
        bcs _CounterClockwise

        lda aEventMovement.aTargetDistanceMap - 64,b,y
        beq +

          cmp aEventMovement.wLowestMovementDistance,b
          bcs +

            sta aEventMovement.wLowestMovementDistance,b
            ldx #0

        +
        lda aEventMovement.aTargetDistanceMap + 1,b,y
        beq +

          cmp aEventMovement.wLowestMovementDistance,b
          bcs +

            sta aEventMovement.wLowestMovementDistance,b
            ldx #2

        +
        lda aEventMovement.aTargetDistanceMap + 64,b,y 
        beq +

          cmp aEventMovement.wLowestMovementDistance,b
          bcs +

            sta aEventMovement.wLowestMovementDistance,b
            ldx #4

        +
        lda aEventMovement.aTargetDistanceMap - 1,b,y
        beq +

          cmp aEventMovement.wLowestMovementDistance,b
          bcs +

            ldx #6

        +
        bra _Continue
        
        _CounterClockwise
        lda aEventMovement.aTargetDistanceMap - 1,b,y
        beq +

          cmp aEventMovement.wLowestMovementDistance,b
          bcs +

            sta aEventMovement.wLowestMovementDistance,b
            ldx #6

        +
        lda aEventMovement.aTargetDistanceMap + 64,b,y
        beq +

          cmp aEventMovement.wLowestMovementDistance,b
          bcs +

            sta aEventMovement.wLowestMovementDistance,b
            ldx #4

        +
        lda aEventMovement.aTargetDistanceMap + 1,b,y
        beq +

          cmp aEventMovement.wLowestMovementDistance,b
          bcs +

            sta aEventMovement.wLowestMovementDistance,b
            ldx #2

        +
        lda aEventMovement.aTargetDistanceMap - 64,b,y
        beq _Continue

          cmp aEventMovement.wLowestMovementDistance,b
          bcs _Continue

            sta aEventMovement.wLowestMovementDistance,b
            ldx #0

        _Continue
        cpx #8
        beq _End

          rep #$20
          tya
          clc
          adc aEventMovementMapTileDirectionOffsets,x
          tay
          rep #$20
          lda aEventMovementDirectionLookupTable,x
          jsr rsEventMovementWriteToMovementScriptBuffer
          inc aEventMovement.wMapTileIndex,b
          rep #$20
          dec aEventMovement.wMaxScriptCommandsCount,b
          beq _End

            jml _Loop

        _End
        sep #$20
        lda #MAP_END
        jsr rsEventMovementWriteToMovementScriptBuffer
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aEventMovementMovementScriptBufferAddresses ; 87/B4ED

        .addr aEventMovement.aMovementScriptBuffer1
        .addr aEventMovement.aMovementScriptBuffer2
        .addr aEventMovement.aMovementScriptBuffer3
        .addr aEventMovement.aMovementScriptBuffer4

      aEventMovementMapTileDirectionOffsets ; 87/B4F5

        .sint -64
        .sint 1
        .sint 64
        .sint -1

      aEventMovementDirectionLookupTable ; 87/B4FD

        .word MAP_UP
        .word MAP_RIGHT
        .word MAP_DOWN
        .word MAP_LEFT

      rsEventMovementWriteToMovementScriptBuffer ; 87/B505

        .al
        .autsiz
        .databank ?

        phy
        ldy aEventMovement.wMovementScriptBufferAddress,b
        sta $0000,b,y
        inc y
        sty aEventMovement.wMovementScriptBufferAddress,b
        ply
        rts

        .databank 0

        ; 87/B512







      rlUnknown85E33D ; 85/E33D

        .al
        .autsiz
        .databank ?

        jsl $858516
        bne _End

          lda wJoy1New
          bit #JOY_A
          beq +
          bra _End

          +
          lda wJoy1New
          bit #JOY_B
          beq _End

            lda $10B7,b,x
            cmp #1
            beq _E37D

            cmp #2
            bne +

              lda $0D87,b
              and #$FFEF
              sta $0D87,b
              bit #$0008
              beq +

                jsl rlUnknown85C0CE

            +
            phx
            jsl $88ADE9
            plx

        _End
        jsl rlUnknown8583F8
        
        -
        rtl

        _E37D
        jsl rlLoadMapMenuEntryPointerFromProcBody
        lda #1
        sta aProcSystem.aBody6,b,x
        jsr $858542
        bra -

        .databank 0

        ; 85/E38C





      rlUnknown8583F8 ; 85/83F8

        .al
        .autsiz
        .databank ?

        php
        phb
        phy
        jsl rlLoadMapMenuEntryPointerFromProcBody
        jsl $858516
        beq +

          jml _849A

        +
        lda wJoy1New
        bit #JOY_A
        beq +

          lda #$000A
          jsl rlUnknown808FAD
          
          jsl rlUnknown8582BA
          lda #1
          sta $00
          lda aProcSystem.aBody6,b,x
          sta $02
          jsl rlUnknown82F3E5
          jsr $8584A1
          bra _End

        +
        lda wJoy1New
        bit #JOY_B
        beq +

          lda #$0021
          jsl rlUnknown808FAD

          jsl rlUnknown8582BA
          jsr $8584A1
          bra _End
        
        +
        jsl $82F3BE
        asl a
        sta $00

        lda wJoy1Repeated
        bit #JOY_Up
        beq _8472

          lda aProcSystem.aBody6,b,x
          sec
          sbc #2
          bpl +

            lda wJoy1New
            bit #JOY_Up
            beq _8472

              lda $00
              dec a

          +
          sta aProcSystem.aBody6,b,x
          lda #6
          jsl $808FAD
          bra _849A
        
        _8472
        lda wJoy1Repeated
        bit #JOY_Down
        beq _849A

          lda aProcSystem.aBody6,b,x
          clc
          adc #2
          cmp $00
          beq +
          bcc +

            lda wJoy1New
            bit #JOY_Down
            beq _849A

              lda #1

          +
          sta aProcSystem.aBody6,b,x
          lda #6
          jsl $808FAD
        
        _849A
        jsr $858542
        
        _End
        ply
        plb
        plp
        rtl

        .databank 0

        85/84A1



















      rlUnknown82F3E5 ; 82/F3E5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        ldy $0547,b
        sep #$20
        lda $0547+2,b
        pha
        rep #$20
        plb

        sep #$20
        lda $0000,b,y
        sta wR2
        lda $0001,b,y
        sta wR2+1
        rep #$20

        jsl $82F3BE
        ora #$0000
        beq _F463

        sta wR5
        ldx #1
        
        _Loop
        txa
        jsl $82F3C7
        phk
        plb

        ldy $0540,b
        sep #$20
        lda $0542,b
        pha
        rep #$20
        plb

        sep #$20
        lda $0003,b,y
        clc
        adc wR2
        sta wR3

        lda $0004,b,y
        clc
        adc wR2+1
        sta wR4

        lda $0005,b,y
        sta wR3+1
        lda $0006,b,y
        sta wR4+1

        lda wR0
        sec
        sbc wR3
        cmp wR3+1
        bcs +

        lda wR1
        sec
        sbc wR4
        cmp wR4+1
        bcs +

        rep #$20
        jsl rlUnknown82F46D
        bra _F468

        +
        rep #$20
        inc x
        dec wR5
        bne _Loop

        _F463
        ply
        plx
        plp
        plb
        rtl
        
        _F468
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown82F46D ; 82/F46D

        .al
        .autsiz
        .databank ?

        lda lR18
        pha
        lda lR18+1
        pha

        jsl rlUnknown82F488
        ldx #$0024
        lda #0
        jsl $80A861

        pla
        sta lR18+1
        pla
        sta lR18
        rtl

        .databank 0

      rlUnknown82F488 ; 82/F488

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx $0540,b
        sep #$20
        lda $0540+2,b
        pha
        rep #$20
        plb

        lda $0000,b,x
        sta lR18
        lda $0001,b,x
        sta lR18+1

        plx
        plp
        plb
        rtl

        .databank 0

        ; 82/F4A7







      rlUnknown80A861 ; 80/A861

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        clc
        adc $0000,b,x
        tay
        sep #$20
        lda $0002,b,x
        pha
        rep #$20
        plb

        lda $0000,b,y
        ora $0001,b,y
        beq +

          lda $0000,b,y
          sta lR23
          lda $0001,b,y
          sta lR23+1
          jsl rlUnknown80A88E

        +
        ply
        plp
        plb
        rtl

        .databank 0

      rlUnknown80A88E ; 80/A88E

        .al
        .autsiz
        .databank ?

        sep #$20
        lda lR23+2
        pha
        rep #$20
        plb
        jml [lR23]

        ora #0
        beq +

          phx
          dec a
          asl a
          tax
          lda $80A8A8,x
          plx

        +
        rtl

        .databank 0

        ; 80/A8A8















      rlUnknown85DF6F ; 85/DF6F

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown88AF7B
        ldx $0772,b
        jsl rlUnknown84CE21
        plx
        rtl

        .databank 0

        ; 85/DF7D




      rsUnknown86B39D ; 86/B39D

        .al
        .autsiz
        .databank ?

        ldx $0871,b
        jsl rlUnknown84CE21
        lda #1
        trb $0E7B,b
        rts

        .databank 0

        ; 86/B3AB





      rlUnknown84CE21 ; 84/CE21

        .al
        .autsiz
        .databank ?

        ; X = deployment offset

        phb
        php
        phk
        plb
        lda wR0
        pha
        lda wR1
        pha

        lda $0580,b
        bne +

          jml _End

        +
        sta wEventLocationEntry,b
        jsl rlCheckIfCastleGuarded
        bcc +

          jml _End

        +
        jsl rlGetLocationFactionSlotOwner
        sta wR0
        lda aDeploymentTable._FactionSlot,x
        cmp wR0
        bne +

          jml _End

        +
        lda aDeploymentTable._FactionSlot,x
        jsl rlSetLocationFactionSlotOwner
        jsl rlUnknown84CAA9
        jsr rsUnknown84CEA3
        lda aDeploymentTable._FactionSlot,x
        bne +

          jsl rlUnknown87EE81
          jsr rsReviveCapturedPlayerCharacters
          bra _EC96

        +
        jsl rlGetEventLocationEntryID
        cmp #0
        beq _EC96

          lda wR0
          bne _EC96

            lda #$0049
            jsl rlUnknown80900D

            jsl rlSetLocationDestroyed
            inc wDestroyedLocationsCount,b
            jsl rlHandleEventLocationModification
            jsl rlUnknown888410
            bra _End

        _EC96
        jsl rlHandleEventLocationModification

        _End
        pla
        sta wR1
        pla
        sta wR0
        plp
        plb
        rtl

        .databank 0

      rsUnknown84CEA3 ; 84/CEA3

        .al
        .autsiz
        .databank ?

        ; X = deployment offset
        ; wR0 = faction slot owner of location

        jsl rlGetEventLocationEntryID
        and #$00FF
        sta aProcSystem.wInput0,b
        lda wR0
        and #$00FF
        sta aProcSystem.wInput1,b
        lda aDeploymentTable._FactionSlot,x
        sta aProcSystem.wInput2,b

        lda #(`$87C056)<<8
        sta lR44+1
        lda #<>$87C056
        sta lR44
        jsl rlProcEngineCreateProc
        rts

        .databank 0

      rsReviveCapturedPlayerCharacters ; 84/CECB

        .al
        .autsiz
        .databank ?

        phx
        lda wEventLocationEntry,b
        pha

        jsl rlBuildDeadPlayerCharacterList
        ldx #0

          _Loop
          lda aDeadPlayerCharacterList,x
          bmi _End

            phx
            tax
            lda aDeploymentTable._UnitRAMPointer,x
            sta wSelectedUnitDataRAMPointer,b
            plx
            jsl rlGetSelectedUnitStatus
            cmp #StatusCaptive
            bne _Next

              jsl rlReviveSelectedCharacter

              lda #$001B
              sta bEventActionIdentifier,b
              jsl rlGetSelectedUnitCharacterID
              sta wEventEngineArgument1,b
              jsl rlGetAndRunChapterMapEventConditions

            _Next
            inc x
            inc x
            bra _Loop

        _End
        pla
        sta wEventLocationEntry,b
        plx
        rts

        .databank 0

      rlUnknown84CF0F ; 84/CF0F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wR0
        pha

        lda $0580,b
        bne +

          jml _End

        +
        sta wEventLocationEntry,b
        jsl rlGetEventLocationEntryType
        cmp #LocationTypeVillage
        beq +

          jml _End

        +
        jsl rlUnknown84CAA9

        lda #500
        jsl rlSubtractEventLocationMoneyReward
        bcc +

          jsl rlSetLocationDestroyed
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitFactionSlot
          sta wR0
          lda #2
          sta bEventActionIdentifier,b
          lda wR0
          sta wEventEngineArgument1,b
          jsl rlGetEventLocationEntryID
          sta wEventEngineArgument2,b
          jsl rlGetAndRunChapterMapEventConditions

        +
        jsl rlHandleEventLocationModification
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        txa
        sta $7E4EA9

        lda aDeploymentTable._XTilePosition,x
        sta $7E4EAB
        lda aDeploymentTable._YTilePosition,x
        sta $7E4EAD
        jsl rlGetSelectedUnitClassID
        sta $7E4EAF

        jsl rlGetFirstEquippableWeaponInInventory
        jsl rlGetItemIDByInventorySlot
        sta $7E4EB1

        jsl $87F321
        sta $7E4EB3
        lda #5000
        sta $7E4EB5
        jsl rlGetEventLocationMoneyReward
        sta $7E4EB7
        lda #500
        sta $7E4EB9
        jsl $9E9A34
        
        _End
        pla
        sta wR0
        plp
        plb
        rtl

        .databank 0

        ; 84/CFBF
































      procUnknown87C056 ; 87/C056

        .structProcInfo "TF", rlProcUnknown87C056Init, rlProcUnknown87C056Cycle, aProcUnknown87C056Code

      rlProcUnknown87C056Init ; 87/C05E

        .al
        .autsiz
        .databank ?

        ; wInput0 = LocationID
        ; wInput1 = old owner
        ; wInput2 = new owner

        lda aProcSystem.wInput0,b
        sta aProcSystem.aBody0,b,x
        lda aProcSystem.wInput1,b
        sta aProcSystem.aBody1,b,x
        lda aProcSystem.wInput2,b
        sta aProcSystem.aBody2,b,x
        lda #0
        sta aProcSystem.aBody3,b,x
        sta aProcSystem.aBody4,b,x
        jsl rlUnknown87C11D
        bcs +

          lda #<>aProcUnknown87C056Code._C23A
          sta aProcSystem.aHeaderCodeOffset,b,x
          lda #1
          sta aProcSystem.aHeaderSleepTimer,b,x
          bra ++

        +
        lda aProcSystem.aBody1,b,x
        jsl rlUnknown87C141
        cmp #0
        bne +

          lda #<>aProcUnknown87C056Code._C235
          sta aProcSystem.aHeaderCodeOffset,b,x
          lda #1
          sta aProcSystem.aHeaderSleepTimer,b,x

        +
        stz $0302,b
        rtl

        .databank 0

      rlProcUnknown87C056Cycle ; 87/C0A9

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlProcCycleFlickerUnitsOfFactionSlot ; 87/C0AA

        .al
        .autsiz
        .databank ?

        ; Input:
        ; aProcSystem.aBody1 = FactionSlot

        lda aProcSystem.aBody1,b,x
        sta aProcSystem.wInput0,b

        lda wVBlankEnabledFramecount
        bit #$0001
        beq +

        jsl rlRevealUnitsOfFactionSlot
        bra _End

        +
        jsl rlHideUnitsOfFactionSlot

        _End
        rtl

        .databank 0

      rlUnknown87C0C2 ; 87/C0C2

        .al
        .autsiz
        .databank ?

        jsl rlProcEngineFreeProc
        lda #$0012
        sta $0302,b
        jsl rlUnknown87C205
        jsl rlUnknown87C1E1
        rtl

        .databank 0

      rlUnknown87C0D5 ; 87/C0D5

        .al
        .autsiz
        .databank ?

        lda #$0021
        jsl $80900D
        rtl

        .databank 0

      rlHideUnitsOfFactionSlot ; 87/C0DD

        .al
        .autsiz
        .databank ?

        ; Input:
        ; aProcSystem.wInput0 = FactionSlot

        phx
        ldx #(len(aDeploymentTable._State) - 2)
        
          _Loop
          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _Next

            lda aDeploymentTable._FactionSlot,x
            cmp aProcSystem.wInput0,b
            bne _Next

              jsl rlDeployedUnitSetHidden

          _Next
          dec x
          dec x
          bpl _Loop

        plx
        rtl

        .databank 0

      rlRevealUnitsOfFactionSlot ; 87/C0FD

        .al
        .autsiz
        .databank ?

        ; Input:
        ; aProcSystem.wInput0 = FactionSlot

        phx
        ldx #(len(aDeploymentTable._State) - 2)
        
          _Loop
          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _Next

            lda aDeploymentTable._FactionSlot,x
            cmp aProcSystem.wInput0,b
            bne _Next

              jsl rlDeployedUnitUnsetHiddenIfAlive

          _Next
          dec x
          dec x
          bpl _Loop

        plx
        rtl

        .databank 0

      rlUnknown87C11D ; 87/C11D

        .al
        .autsiz
        .databank ?

        ; Checks if the factions home castle was captured?

        lda $0590,b
        pha

        lda aProcSystem.aBody1,b,x
        jsl rlGetFactionSlotLocationID
        jsl rlGetLocationEventDataEntry
        jsl rlGetLocationFactionSlotOwner
        cmp aProcSystem.aBody1,b,x
        bne +

          pla
          sta $0590,b
          clc
          rtl

        +
        pla
        sta $0590,b
        sec
        rtl

        .databank 0

      rlUnknown87C141 ; 87/C141

        .al
        .autsiz
        .databank ?

        ; Returns 1 if after capturing a castle any of their units
        ; that are visible on the screen need to be faded out.
        ; Returns 0 otherwise

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx

        jsl rlGetFactionSlotOffsetWrapper
        bcs _End

          lda wMapScrollXPixels,b
          lsr a
          lsr a
          lsr a
          lsr a
          sta aProcSystem.wInput0,b
          lda wMapScrollYPixels,b
          lsr a
          lsr a
          lsr a
          lsr a
          sta aProcSystem.wInput1,b

          lda $7E0000 + structFactionHeader.UnitCount,x
          and #$00FF
          beq _NoUnits

            tay

              _Loop
              phx
              lda $7E0000 + size(structFactionHeader),x
              sta wSelectedUnitDataRAMPointer,b
              jsl rlGetSelectedUnitDeploymentOffset
              bcs _Next

                tax
                lda aDeploymentTable._State,x
                bit #DeploymentStateAlive
                beq _Next

                  bit #DeploymentStateHidden
                  bne _Next

                    lda aDeploymentTable._XTilePosition,x
                    cmp aProcSystem.wInput0,b
                    bmi _Next

                      lda aDeploymentTable._XTilePosition,x
                      sec
                      sbc #16
                      cmp aProcSystem.wInput0,b
                      bpl _Next

                        lda aDeploymentTable._YTilePosition,x
                        cmp aProcSystem.wInput1,b
                        bmi _Next

                          lda aDeploymentTable._YTilePosition,x
                          sec
                          sbc #16 - 2
                          cmp aProcSystem.wInput1,b
                          bpl _Next

                            plx
                            lda #1
                            bra _End

              _Next
              plx
              inc x
              inc x
              dec y
              bne _Loop

          _NoUnits
          lda #0

        _End
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87C1D0 ; 87/C1D0

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody1,b,x
        jsl rlUnloadFactionSlot
        jsl rlGetVictoryThemeIfAllEnemiesDead
        bcc +

          sta $0DAB,b

        +
        rtl

        .databank 0

      rlUnknown87C1E1 ; 87/C1E1

        .al
        .autsiz
        .databank ?

        ; aProcSystem.aBody0 = LocationID
        ; aProcSystem.aBody2 = New owner

        lda $08,x
        cmp #$01C6
        beq +

          lda #1
          sta bEventActionIdentifier,b
          lda aProcSystem.aBody2,b,x
          sta wEventEngineArgument1,b
          lda aProcSystem.aBody0,b,x
          sta wEventEngineArgument2,b
          jsl rlGetAndRunChapterMapEventConditions
          bcs +

            jsl rlUnknown81AB26

        +
        rtl

        .databank 0

      rlUnknown87C205 ; 87/C205

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody2,b,x
        bne +

          stz wUnknownDeploymentOffset000D7F,b
          lda #5
          sta $0D81,b
          lda aProcSystem.aBody0,b,x
          and #$00FF
          sta $0D83,b

        +
        rtl

        .databank 0

        ; 87/C21D














      aProcUnknown87C056Code ; 87/C21D

        PROC_YIELD 32
        PROC_CALL rlUnknown87C0D5
        PROC_SET_ONCYCLE rlProcCycleFlickerUnitsOfFactionSlot
        PROC_YIELD 64
        PROC_CALL rlHideUnitsOfFactionSlot
        PROC_SET_ONCYCLE rlProcUnknown87C056Cycle
        PROC_YIELD 16

        _C235
        PROC_CALL rlUnknown87C1D0

        _C23A
        PROC_YIELD 16
        PROC_CALL rlUnknown888410
        PROC_YIELD 1
        PROC_SET_ONCYCLE rlUnknown87C0C2
        PROC_HALT

      procFactionSlotUnitDeath ; 87/C249

        .structProcInfo "DU", rlProcUnknown87C249Init, rlProcUnknown87C249Cycle, aProcUnknown87C249Code

      rlProcUnknown87C249Init ; 87/C251

        .al
        .autsiz
        .databank ?

        lda aProcSystem.wInput0,b
        sta aProcSystem.aBody0,b,x
        lda aProcSystem.wInput1,b
        sta aProcSystem.aBody1,b,x
        lda aProcSystem.wInput2,b
        sta aProcSystem.aBody2,b,x
        lda #3
        sta aProcSystem.aBody3,b,x
        lda #0
        sta aProcSystem.aBody4,b,x
        jsl rlUnknown87C2FA

        lda aProcSystem.wInput3,b
        bne +

          jsl rlProcEngineFreeProc
          bra ++

          +
          stz $0302,b

        +
        rtl

        .databank 0

      rlProcUnknown87C249Cycle ; 87/C282

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        sta aProcSystem.wInput0,b
        lda aProcSystem.aBody1,b,x
        sta aProcSystem.wInput1,b
        lda aProcSystem.aBody2,b,x
        sta aProcSystem.wInput2,b
        rtl

        .databank 0

      rlUnknown87C295 ; 87/C295

        .al
        .autsiz
        .databank ?

        jsl rlProcUnknown87C249Cycle

        lda aProcSystem.aBody4,b,x
        beq ++

          cmp aProcSystem.aBody3,b,x
          bcc +

            lda #$FFFF
            sta aProcSystem.aBody4,b,x

          +
          jsl rlUnknown87C2FA
          bra ++

        +
        jsl rlUnknown87C2B7

        +
        inc aProcSystem.aBody4,b,x
        rtl

        .databank 0

      rlUnknown87C2B7 ; 87/C2B7

        .al
        .autsiz
        .databank ?

        ; Input:
        ; aProcSystem.wInput0 = FactionSlot
        ; aProcSystem.wInput1 = AI setting, if $FFFF ignored
        ; aProcSystem.wInput2 = CharacterID, if $FFFF ignored

        phx
        ldx #(len(aDeploymentTable._State) - 2)
        
          _Loop
          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _Next

            lda aDeploymentTable._FactionSlot,x
            cmp aProcSystem.wInput0,b
            bne _Next

              lda aDeploymentTable._UnitRAMPointer,x
              sta wSelectedUnitDataRAMPointer,b

              lda aProcSystem.wInput1,b
              bmi +

                jsl rlGetSelectedUnitAI
                cmp aProcSystem.wInput1,b
                bne _Next

              +
              lda aProcSystem.wInput2,b
              bmi +

                jsl rlGetSelectedUnitCharacterID
                cmp aProcSystem.wInput2,b
                bne _Next

              +
              jsl rlDeployedUnitSetHidden

          _Next
          dec x
          dec x
          bpl _Loop

        plx
        rtl

        .databank 0

      rlUnknown87C2FA ; 87/C2FA

        .al
        .autsiz
        .databank ?

        ; Input:
        ; aProcSystem.wInput0 = FactionSlot
        ; aProcSystem.wInput1 = AI setting, if $FFFF ignored
        ; aProcSystem.wInput2 = CharacterID, if $FFFF ignored

        ; Output:
        ; aProcSystem.wInput3 = count

        phx
        stz aProcSystem.wInput3,b
        ldx #(len(aDeploymentTable._State) - 2)

          _Loop
          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _Next

            lda aDeploymentTable._FactionSlot,x
            cmp aProcSystem.wInput0,b
            bne _Next

              lda aDeploymentTable._UnitRAMPointer,x
              sta wSelectedUnitDataRAMPointer,b

              lda aProcSystem.wInput1,b
              bmi +

                jsl rlGetSelectedUnitAI
                cmp aProcSystem.wInput1,b
                bne _Next

              +
              lda aProcSystem.wInput2,b
              bmi +

                jsl rlGetSelectedUnitCharacterID
                cmp aProcSystem.wInput2,b
                bne _Next

              +
              jsl rlDeployedUnitUnsetHiddenIfAlive
              inc aProcSystem.wInput3,b

          _Next
          dec x
          dec x
          bpl _Loop

        plx
        rtl

        .databank 0

      rlUnknown87C343 ; 87/C343

        .al
        .autsiz
        .databank ?

        jsl rlProcEngineFreeProc
        jsl rlUnknown81AB3F

        lda #$0012
        sta $0302,b
        rtl

        .databank 0

      rlUnknown87C352 ; 87/C352

        .al
        .autsiz
        .databank ?

        lda #2
        sta aProcSystem.aBody3,b,x
        rtl

        .databank 0

      rlUnknown87C359 ; 87/C359

        .al
        .autsiz
        .databank ?

        lda #1
        sta aProcSystem.aBody3,b,x
        rtl

        .databank 0

      aProcUnknown87C249Code ; 87/C360

        PROC_YIELD 4
        PROC_CALL rlUnknown87C0D5
        PROC_SET_ONCYCLE rlUnknown87C295
        PROC_YIELD 16
        PROC_CALL rlUnknown87C352
        PROC_YIELD 8
        PROC_CALL rlUnknown87C359
        PROC_YIELD 8
        PROC_SET_ONCYCLE rlProcUnknown87C249Cycle
        PROC_CALL rlUnknown87C2B7
        PROC_YIELD 8
        PROC_SET_ONCYCLE rlUnknown87C343
        PROC_HALT

        ; 87/C38C







































      rlUnknown85E897 ; 85/E897

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda #$0018
        trb $0D87,b
        jsl $85C0D5
        plp
        plb
        rtl

        .databank 0

        ; 85/E8A8







      rlUnknown84D16B ; 84/D16B

        .al
        .autsiz
        .databank ?

        ; wR0 = initiator deployment offset
        ; wR1 = target deployment offset

        phb
        php
        phk
        plb
        phx
        ldx wR1
        lda aDeploymentTable._UnitRAMPointer,x
        sta wRoutineVariable1,b
        ldx wR0
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlUnknown84CAA9
        jsl rlCheckTalkEventEntryAvailable
        bcc +

          sta wEventEngineArgument3,b

        +
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda #$000A
        sta bEventActionIdentifier,b
        jsl rlGetSelectedUnitCharacterID
        sta wEventEngineArgument1,b
        ldx wR1
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        sta wEventEngineArgument2,b
        jsl rlGetAndRunChapterMapEventConditions

        pla
        sta wSelectedUnitDataRAMPointer,b
        jsl rlUnknown849EA3
        cmp wEventEngineArgument2,b
        bne +

          lda #0
          jsl rlSetSelectedUnitTalkTarget

        +
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/D1CC










      rlGetChapterTalkEventsPointer ; 81/B4E4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        lda $0DD6,b
        sta lR18+1

        ldy lChapterEventDataPointer,b
        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterEventData.TalkEventsPointer,b,y
        sta lR18

        ply
        plp
        plb
        rtl

        .databank 0

        ; 81/B503












      rlUnknown84BB54 ; 84/BB54

        .al
        .autsiz
        .databank ?

        jsl rlCheckIfBattleAnimationOFF
        bcs _Off

        ; On
        jsl rlUnknown81B368
        bra +

        _Off
        jsl rlUnknown81B35B

        +
        rtl

        .databank 0

      rlCheckIfBattleAnimationOFF ; 84/BB65

        .al
        .autsiz
        .databank ?

        ; CLC = on
        ; SEC = off

        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne _SEC

        jsl rlGetSelectedUnitClassID
        cmp #Civilian
        beq _SEC

        cmp #Child
        beq _SEC

        jsl rlGetAnimationOptionSetting
        cmp #0
        beq _CLC

        cmp #1
        beq _SEC

        jsl rlGetSelectedUnitStates
        bit #UnitStateMapAnimation
        bne _SEC
        bra _CLC
        
        _CLC
        clc
        bra +
        
        _SEC
        sec
        
        +
        rtl

        .databank 0

        ; 84/BB9A























      rlUnknown91BD94 ; 91/BD94

        .al
        .autsiz
        .databank ?

        lda wEventUnitSlot1XCoordinate
        sta aActionStructUnit1.XPosition
        lda wEventUnitSlot1YCoordinate
        sta aActionStructUnit1.YPosition
        jsl rlUnknown91BDA9
        rtl

        .databank 0

      rlUnknown91BDA9 ; 91/BDA9

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #0
        sta wBattleType
        rep #$20

        lda #$FFFF
        sta aActionStructUnit1.ObtainedItem
        lda #0
        sta aActionStructUnit1.GainedLevels
        sta aActionStructUnit1.ObtainedStealMoney
        sta aActionStructUnit1.GainedExperience
        jsl rlUnknown9EAC5A
        jsl rlUnknown829478
        rtl

        .databank 0

        ; 91/BDD2









      rlUnknown9EAC5A ; 9E/AC5A

        .al
        .autsiz
        .databank ?

        lda #(`$9EAC69)<<8
        sta lR44+1
        lda #<>$9EAC69
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

        ; 9E/AC69



      procUnknown9EAC69 .structProcInfo "ON", rlProcUnknown9EAC69Init, rlProcUnknown9EAC69Cycle, aProcUnknown9EAC69Code ; 9E/AC69

      rlProcUnknown9EAC69Init ; 9E/AC71

        .al
        .autsiz
        .databank ?

        lda $0302,b
        sta aProcSystem.aBody7,x

        stz $0302,b
        stz aProcSystem.aHeaderBitfield,b,x

        lda $7E4EB7
        tax
        lda $7E4EB9
        tay
        lda $7E4EBB
        jsl rlUnknown9E8D25

        lda wR0
        and #$00FF
        sta $7F4578
        lda wR1
        and #$00FF
        sta $7F457A
        lda #0
        sta $7F4C05
        sta $7F4C07
        rtl

        .databank 0

      rlProcUnknown9EAC69Cycle ; 9E/ACAE

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      aProcUnknown9EAC69Code ; 9E/ACAF

        PROC_YIELD 1
        PROC_SET_ONCYCLE $9ECA45

        PROC_YIELD 48
        PROC_CALL $9EC91A

        PROC_JUMP_IF_BITS_UNSET _ACD1, $0002

            _ACC2
            PROC_YIELD 1
            PROC_CALL $9EC944

            PROC_JUMP_IF_BITS_UNSET _ACC2, $0004

          YIELD 1

        _ACD1
        PROC_CALL $9E9342
        PROC_JUMP_IF_BITS_UNSET _ACFC, $0002

          PROC_CALL $9EB3F3
          PROC_JUMP_IF_BITS_UNSET _ACEE, $0004

            PROC_YIELD 16
            PROC_CALL $9EB4A9

        _ACEE
        PROC_YIELD 1
        PROC_SET_ONCYCLE $9E936B
        PROC_JUMP_IF_BITS_UNSET _ACEE, $0004

        PROC_YIELD 107

        _ACFC
        PROC_CALL $9E952D

        PROC_JUMP_IF_BITS_UNSET _AD22, $0002
        PROC_CALL $9EB3F3

        PROC_JUMP_IF_BITS_UNSET _AD14, $0004

          PROC_YIELD 16

        _AD14
        PROC_SET_ONCYCLE $9E95AB

        _AD18
        PROC_YIELD 1
        PROC_JUMP_IF_BITS_UNSET _AD18, $0004

        PROC_YIELD 8

        _AD22
        PROC_CALL $9E9928

        PROC_JUMP_IF_BITS_UNSET _AD48, $0002

        PROC_CALL $9EB3F3
        PROC_JUMP_IF_BITS_UNSET _AD3A, $0004

          PROC_YIELD 16

        _AD3A
        PROC_CALL $9EB491
        PROC_YIELD 117
        PROC_CALL $85DB91
        PROC_YIELD 8

        _AD48
        PROC_CALL $9E985E

        PROC_JUMP_IF_BITS_UNSET _AD6E, $0002

        PROC_CALL $9EB3F3

        PROC_JUMP_IF_BITS_UNSET _AD60, $0004

          PROC_YIELD 16

        _AD60
        PROC_CALL $9EB49D
        PROC_YIELD 117
        PROC_CALL $85DB91
        PROC_YIELD 8

        _AD6E
        PROC_CALL $9EB41C
        PROC_YIELD 16
        PROC_SET_ONCYCLE $9EAD7B
        PROC_HALT

        ; AD7B







      rlUnknown9E8D25 ; 9E/8D25

        .al
        .autsiz
        .databank ?

        sta wR0
        lda wBattleType
        and #$00FF
        cmp #3
        beq +

          txa
          asl a
          asl a
          asl a
          asl a
          clc
          adc #8
          sec
          sbc wMapScrollXPixels,b
          sta wR0

          tya
          asl a
          asl a
          asl a
          asl a
          clc
          adc #8
          sec
          sbc wMapScrollYPixels,b
          sta wR1
          rtl

        +
        lda wR0
        sta wSelectedUnitDataRAMPointer
        jsl rlGetSelectedUnitGenerationID
        dec a
        asl a
        tax
        lda $7F75DA,x
        sta wR0
        lda $7F760A,x
        sta wR1
        rtl

        .databank 0

        ; 9E/8D6C










      rlUnknown829478 ; 82/9478

        .al
        .autsiz
        .databank ?

        ; Halt until $0002 of $7F4C07 is set

        lda #(`procUnknown828B2B)<<8
        sta lR44+1
        lda #<>procUnknown828B2B
        sta lR44
        jsl rlEventEngineCreateProc
        rtl

        .databank 0

        ; 82/9487








      rlUnknown88C4D9 ; 88/C4D9

        .al
        .autsiz
        .databank ?

AD 66 07      lda $0766,b
F0 04         beq +

5C 1E C6 88   jml _C61E
    
              +
AD D8 07      lda $07D8,b
F0 18         beq +

C9 01 00      cmp #1
F0 1B         beq _C507

C9 02 00      cmp #2
F0 4A         beq _C53B

C9 03 00      cmp #3
F0 0D         beq ++

C9 04 00      cmp #4
D0 04         bne +

5C D2 C5 88   jml _C5D2
    
              +
5C 58 C6 88   jml _End
      
              +
5C AA C5 88 
    
              _C507
A9 10 00 
8D 28 07 
20 4F B6 
F0 0A 

A9 08 00 
8D 26 07 
5C 0C C6 88 

AD 7B 0E 
29 FF 00 
89 02 00 
D0 07 

20 7D C6 
5C 58 C6 88 

A9 00 00 
8D D8 07 
8D 6F 08 
5C 58 C6 88 
    
                _C53B
22 B3 C0 88 
9C 28 07 
20 1E AA 
F0 1D 

22 1B BF 87 
C9 00 00 
D0 0A 

A9 02 00 
8D 26 07 
5C 0C C6 88 

A9 04 00 
8D 26 07 
5C 0C C6 88 

AD 73 08 
C9 FF FF 
F0 26 

22 DB B4 88 
A9 03 00 
8D D8 07 
AD 68 07 
18 
6D 98 05 
8D 6C 07 
AD 6A 07 
18 
6D 9A 05 
8D 6E 07 
A9 01 00 
8D DA 07 
80 18 

A9 00 00 
8D D8 07 
8D 6F 08 
22 7B AF 88 
AD 79 08 
22 07 B3 86 
5C 58 C6 88 

A9 10 00 
8D 28 07 
20 4F B6 
F0 0D 

A9 04 00 
A9 08 00 
8D 26 07 
5C 0C C6 88 

A9 18 00 
8D D4 07 
A9 04 00 
8D D8 07 
5C 58 C6 88 
    
                _C5D2
AD D4 07 
38 
E9 01 00 
8D D4 07 
30 02 
80 79 

A9 00 00 
8D D8 07 
8D 6F 08 
22 7B AF 88 
AD 98 05 
8D 60 07 
AD 9A 05 
8D 62 07 
AD 71 08 
85 00 
AD 73 08 
85 02 
AD 79 08 
22 07 B3 86 
80 4D 

9C 38 07 
A9 01 00 
8D 66 07 
9C 3A 07 
9C 3C 07 
9C 3E 07 
      
              _C61E
AD 38 07 
18 
6D 26 07 
8D 38 07 
CD 28 07 
90 1B 

38 
ED 28 07 
85 00 
AD 26 07 
38 
E5 00 
8D 26 07 
9C 66 07 
9C 3A 07 
9C 3C 07 
9C 3E 07 
22 05 BC 88 
AD D8 07 
C9 02 00 
D0 04         bne _End

22 B3 C0 88 
    
              _End
6B 










      rlUnknown84B57A ; 84/B57A

        .al
        .autsiz
        .databank ?

        ; entering castle menu

        phb
        php
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        lda #$0010
        trb wUnknown000D79,b

        ldx wSelectedUnitDataRAMPointer,b
        lda #$2100
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        sta wRoutineVariable1,b
        jsl rlClearSelectedUnitRAMAreaData
        stx wSelectedUnitDataRAMPointer,b

        lda #UnitStateMiracleActive
        jsl rlUnsetSelectedUnitStates
        jsl rlGetSelectedUnitDeploymentOffset
        tax
        lda aDeploymentTable._StateBuffer,x
        bit #DeploymentStateDefeated
        bne _B5FB

          lda aActionStructUnit1.ObtainedArenaMoney
          beq _B5EE

            jsl rlGetSelectedUnitMaxHP
            jsl rlSetSelectedUnitCurrentHP

            lda #$001C
            sta bEventActionIdentifier,b
            jsl rlGetSelectedUnitCharacterID
            sta wEventEngineArgument1,b
            jsl rlGetEventLocationEntryID
            sta wEventEngineArgument2,b
            lda wRoutineVariable1,b
            sta wEventEngineArgument3,b
            jsl rlGetAndRunChapterMapEventConditions

            lda aActionStructUnit1.ObtainedArenaMoney

            plx
            stx wRoutineVariable1,b
            plx
            plp
            plb
            sec

            -
            rtl

          _B5EE
          lda #0

          plx
          stx wRoutineVariable1,b
          plx
          plp
          plb
          sec
          bra -

        _B5FB
        and #~DeploymentStateDefeated
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x
        lda #0

        plx
        stx wRoutineVariable1,b
        plx
        plp
        plb
        clc
        bra -

        .databank 0

      rlUnknown84B613 ; 84/B613

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy
        ldy lR18
        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        lda $0000,b,y
        jsl rlGetUnitRAMDataPointerByID
        bcs _End

          jsl rlGetSelectedUnitDeploymentOffset
          sta wR0

          lda $0002,b,y
          and #$00FF
          sta wSelectedInventorySlot,b

          lda $0004,b,y
          jsl rlGetUnitRAMDataPointerByID
          bcs _End

            jsl rlGetSelectedUnitDeploymentOffset
            sta wR1

            lda lR18
            clc
            adc #$000D
            sta lR18

            lda lR18
            pha
            lda lR18+1
            pha

            jsl rlActionStructGetBattleStats

            sep #$20
            lda $000D,b,y
            and #$01
            ora wBattleStatus
            sta wBattleStatus
            rep #$20

            lda $0007,b,y
            sta lR18
            lda $0007+1,b,y
            sta lR18+1
            lda #0
            jsl rlSetBattleDeathQuotes

            lda $000A,b,y
            sta lR18
            lda $000A+1,b,y
            sta lR18+1
            lda #1
            jsl rlSetBattleDeathQuotes

            pla
            sta lR18+1
            pla
            sta lR18

            sep #$20
            lda #0
            sta wBattleType
            rep #$20

            jsl rlUnknown84DF87

        _End
        ply
        plp
        plb
        rtl

        .databank 0

        ; 84/B6A6






      rlUnknown8A97C2 ; 8A/97C2

        .al
        .autsiz
        .databank ?

        phk
        plb
        sep #$20
        lda #$80
        sta $2100,b
        sta bBufferINIDISP
        rep #$20

        lda #$0006
        sta bEventActionIdentifier,b
        jsl rlGetSelectedUnitCharacterID
        sta wEventEngineArgument1,b

        ; Holds the LocationID
        lda $089F,b
        sta wEventEngineArgument2,b
        jsl rlGetAndRunChapterMapEventConditions
        bcc +

          lda wSelectedUnitDataRAMPointer,b
          sta $08BA,b
          lda #2
          sta $0304,b
          rtl

        +
        jsl rlDisableVBlank
        jsl rlResetHDMAEngine

        lda #0
        sta wR1
        lda #0
        sta wR2
        lda #$8000 >> 1
        sta wR3
        sta wR4
        lda #$C000 >> 1
        sta wR5
        lda #$A000 >> 1
        sta wR6
        lda #$A800 >> 1
        sta wR7
        lda #$B000 >> 1
        sta wR8
        jsl rlSetLayerPositionsAndSizes

        jsl $80BA52
        jsl rlGetSelectedUnitCharacterID
        jsl $8A9776
        jsl $8A94E2
        lda #1
        sta $7F766A
        lda #$0010
        sta $0304,b
        lda #1
        sta $0594,b
        rep #$20
        jsl rlEnableVBlank

        sep #$20
        lda #0
        sta bBufferINIDISP
        rep #$20
        rtl

        .databank 0

        ; 8A/9858








      rlUnknown81B43F ; 81/B43F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        dec a
        cmp #6
        bcs +

          tax
          sep #$20
          lda wAreaRestrictionBitfield,b
          ora $81B45B,x
          sta wAreaRestrictionBitfield,b
          rep #$20

        +
        plp
        plb
        rtl

        .databank 0

        ; 81/B45B












      rlProcUnknown85B9D4Cycle1 ; 85/B9D4

        .al
        .autsiz
        .databank ?

        lda $04BA,b
        bne +

          jsl $85A234
          lda #$00F7
          jsl $808FA3
          lda aProcSystem.aBody4,b,x
          jsl $808FAD
          lda #$B9F2
          sta aProcSystem.aHeaderOnCycle,b,x

        +
        rtl

        .databank 0

        ; 85/B9F2









      aUnknown85B8EE ; 85/B8EE

        .long 0
        .long 0
        .long $85B8E5

        00 01 01 50 57 06




      procUnknown85BC0F .structProcInfo "PW", rlProcUnknown85BC0FInit, rlProcUnknown85B9D4Cycle1, $858398 ; 85/BC0F

        .long $85B8EE
        .byte 1

      rlProcUnknown85BC0FInit ; 85/BC1B

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown85BC9E
        lda #$0093
        sta aProcSystem.aBody5,b,x
        lda aProcSystem.wInput2,b
        jsl rlGetItemNamePointerByItemID
        lda $0571,b
        sta lR18
        lda $0571+1,b
        sta lR18+1
        lda #(`aItemObtainedText)<<8
        sta lR19+1
        lda #<>aItemObtainedText
        sta lR19
        lda aProcSystem.wInput3,b
        ldx #$0400
        jsl $85B7D1
        pha
        dec a
        jsl rlSetMapMenuPosition
        txa
        inc a
        inc a
        jsl rlSetMapMenuTilemapArea
        pla
        and #$FF00
        lda #$2000
        sta aCurrentTilemapInfo.wBaseTile,b
        ldx #$0102
        jsl rlUnknown85A1E7
        jsl $8587E1
        plx
        lda aProcSystem.wInput2,b
        cmp #$0050
        bne +

        lda aProcSystem.aBody5,b,x
        clc
        adc #$003C
        sta aProcSystem.aBody5,b,x
        lda #$0096
        bra ++
        
        +
        lda #$0092
        
        +
        sta aProcSystem.aBody4,b,x
        rtl

        .databank 0

      aItemObtainedText ; 85/BC8C

        .text "　をてにいれた！  "

      rlUnknown85BC9E ; 85/BC9E

        .al
        .autsiz
        .databank ?

        jsl rlUnknown858341
        lda #0
        sta wBufferBG3VOFS
        sta wBufferBG3HOFS
        lda #$20FF
        sta $053C,b
        jsl rlUnknown8788E5
        jsl $85A234
        rtl

        .databank 0

        ; 85/BCB8





      rlMapMenuSaveMapState ; 85/82A2

        .al
        .autsiz
        .databank ?

        ; At least i think $0302 is the map state...

        lda $0302,b
        sta aProcSystem.aBody3,b,x
        stz $0302,b
        rtl

        .databank 0

      rlLoadMapMenuEntryPointerFromProcBody ; 85/82AC

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody1,b,x
        xba
        sta lMapMenuRAMEntryPointer+1,b
        lda aProcSystem.aBody0,b,x
        sta lMapMenuRAMEntryPointer,b
        rtl

        .databank 0

      rlUnknown8582BA ; 85/82BA

        .al
        .autsiz
        .databank ?

        jsl rlLoadMapMenuEntryPointerFromProcBody
        jsl $858882
        lda $1037,b,x
        beq +

          sta $0302,b

        +
        rtl

        .databank 0

        ; 85/82CB





      rlStallProcUntilMapMenuDataLoaded ; 85/8341

        .al
        .autsiz
        .databank ?

        ; Loads the long and byte after a proc struct that belongs to map menu data,
        ; handles its palette/decomp/dma stuff by changing the proc cycle and writes
        ; the original proc cycle back once this is done.

        jsl rlLoadMapMenuDataFromProc

        lda aProcSystem.aHeaderOnCycle,b,x
        sta aProcSystem.aBody2,b,x

        lda #<>rlProcCycleMapMenuWaitForPaletteGraphicFinish
        sta aProcSystem.aHeaderOnCycle,b,x

        lda $0003 + size(structProcInfo),b,y
        and #$00FF
        beq +

          jsl rlMapMenuSaveMapState
          bra _End

        +
        lda #0
        sta aProcSystem.aBody3,b,x

        _End
        rtl

        .databank 0

      rlProcCycleMapMenuWaitForPaletteGraphicFinish ; 85/8366

        .al
        .autsiz
        .databank ?

        jsl rlLoadMapMenuEntryPointerFromProcBody
        jsl rlHandleMapMenuPaletteGraphicsData
        bcc +

          rtl

        +
        lda aProcSystem.aBody2,b,x
        sta aProcSystem.aHeaderOnCycle,b,x
        sta wR40
        jmp (wR40)

        .databank 0

        ; 85/837C




      aDialogueBoxTilemap .text ROM[$058000:$058250] ; 85/8000

      rlLoadMapMenuDataFromProc ; 85/8280

        .al
        .autsiz
        .databank ?

        jsl rlUnknown8780DF

        lda $0000+size(structProcInfo),b,y
        sta lR18
        lda $0001+size(structProcInfo),b,y
        sta lR18+1
        jsl rlLoadMapMenuData

        lda lMapMenuRAMEntryPointer,b
        sta aProcSystem.aBody0,b,x
        lda lMapMenuRAMEntryPointer+2,b
        and #$00FF
        sta aProcSystem.aBody1,b,x
        rtl

        .databank 0

        ; 85/82A1








      rlUnknown8780F9 ; 87/80F9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy
        lda #$0027
        jsl rlUnknown87819A
        bcs +

          ldy lR19
          sep #$20
          lda lR19+2
          pha
          rep #$20
          plb

          lda lMapMenuRAMEntryPointer
          sta structMapMenu.Unknown3,b,y
          lda lMapMenuRAMEntryPointer+1
          sta structMapMenu.Unknown3+1,b,y
          bra ++

        +
        lda lMapMenuRAMEntryPointer,b
        sta lUnknown000522,b
        lda lMapMenuRAMEntryPointer+1,b
        sta lUnknown000522+1,b

        +
        phk
        plb

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda #0
        sta structMapMenu.Unknown3,b,y
        sta structMapMenu.Unknown4,b,y
        ply
        plp
        plb
        rtl

        .databank 0

        ; 87/8148









      rlUnknown87819A ; 87/819A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        tax
        lda lUnknown000522,b
        ora lUnknown000522+1,b
        beq _SEC

        lda lUnknown000522,b
        sta $000000,x
        lda lUnknown000522+1,b
        sta $000000+1,x
        
          _Loop
          lda $000000,x
          tay
          sep #$20
          lda $000000+2,x
          pha
          rep #$20
          plb

          lda $000C,b,y
          ora $000C+1,b,y
          beq _CLC

          lda $000C,b,y
          sta $000000,x
          lda $000C+1,b,y
          sta $000000+1,x
          bra _Loop

        _CLC
        ply
        plx
        plp
        plb
        clc
        rtl
        
        _SEC
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      rlLoadMapMenuData ; 87/81EA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda #size(structMapMenu) ; 15
        jsl rlAllocateRAMArea

        lda #size(structMapMenu)
        ldx #lR18
        jsl rlCopyDataToRAMArea

        lda lR25
        sta lMapMenuRAMEntryPointer,b
        lda lR25+1
        sta lMapMenuRAMEntryPointer+1,b

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenu.TilemapDataPointer,b,y
        sta lR18
        lda structMapMenu.TilemapDataPointer+1,b,y
        sta lR18+1
        jsl rlLoadMapMenuTilemapData

        jsl rlReplaceMapMenuTilemapROMWithRAMPointer
        jsl rlUnknown8780F9
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlLoadMapMenuTilemapData ; 87/8232

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR18 = map menu tilemap data source

        ; Output:
        ; lR25 = RAM entry pointer

        phb
        php
        phk
        plb
        phx

        lda #size(structMapMenuTilemapData)
        jsl rlAllocateRAMArea

        lda #size(structMapMenuTilemapData)
        ldx #lR18
        jsl rlCopyDataToRAMArea

        lda lR25
        sta lMapMenuTilemapRAMEntryPointer,b
        lda lR25+1
        sta lMapMenuTilemapRAMEntryPointer+1,b
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/8256


















      procUnknown85B18F .structProcInfo "PW", rlProcUnknown85B18FInit, rlProcUnknown85B18FCycle1, $85B2D8 ; 85/B18F

        ; 85/B197


      rlProcUnknown85B18FInit ; 85/B1B0

        .al
        .autsiz
        .databank ?

        phx
        lda aProcSystem.wInput0,b
        sta aProcSystem.aBody4,b,x
        lda aProcSystem.wInput1,b
        sta aProcSystem.aBody5,b,x
        lda #1
        sta aProcSystem.aBody6,b,x
        jsl rlUnknown85BC9E
        plx
        lda aProcSystem.aBody4,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda aProcSystem.aBody5,b,x
        sta wCurrentItemDataROMPointer,b
        jsr $85B45C
        bcs +

          lda #$2000
          sta aCurrentTilemapInfo.wBaseTile,b
          jsr $85B489
          jsl $8587E1
          jsl $85A227
          jsl rlFreeHDMAEntry0

        +
        rtl

        .databank 0

      rlProcUnknown85B18FCycle1 ; 85/B1EF

        .al
        .autsiz
        .databank ?

        lda #<>rlProcUnknown85B18FCycle2
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcUnknown85B18FCycle2 ; 85/B1F6

        .al
        .autsiz
        .databank ?

        jsr $85B2DA
        jsr $85B307
        jsl $85A234
        lda #$B207
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

        ; 85/B207








      rsUnknown91D69B ; 91/D69B

        .al
        .autsiz
        .databank ?

        lda #(`aWorldMapEvents)<<8
        sta lR18+1

        lda wCurrentChapter,b
        cmp #$0012
        bcc +

          lda #0

        +
        asl a
        tax
        lda aWorldMapEvents,x
        sta lR18
        jsl $80C1FC
        inc $0304,b
        rts

        .databank 0

        ; 91/D6BB






      procUnknown85BA41 .structProcInfo "PW", rlProcUnknown85BA41Init, $85BAC7, $858398 ; 85/BA41

        .long $85BA35
        .byte 1

      rlProcUnknown85BA41Init ; 85/BA4D

        .al
        .autsiz
        .databank ?

        jsl rlUnknown85BC9E
        jsl rlUnknown85C0CE

        lda #$016E
        sta aProcSystem.aBody7,b,x
        lda aProcSystem.wInput2,b
        sta aProcSystem.aBody6,b,x
        lda aProcSystem.wInput3,b
        jsl rlGetLocationEventDataEntry
        jsl rlGetEventLocationEntryCastleName
        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        jsl rlGetMenuTextStringLength

        lda wR10
        clc
        adc #12
        sta wR0
        ora #$0400
        jsl rlSetMapMenuTilemapArea

        lda #$0020
        sec
        sbc wR0
        lsr a
        ora #$0C00
        jsl rlSetMapMenuPosition

        lda #(`$85BAB3)<<8
        sta lR19+1
        lda #<>$85BAB3
        sta lR19
        ldx #$0102
        lda #$2000
        sta aCurrentTilemapInfo.wBaseTile,b
        jsl rlUnknown85A1E7
        jsl $85877E
        rtl

        .databank 0

        ; 85/BAB3









      rlUnknown85C0CE ; 85/C0CE

        .al
        .autsiz
        .databank ?

        lda #$0080
        tsb $0788,b
        rtl

        .databank 0

        ; 85/C0D5








      rlGetMapMenuPosition ; 87/8749

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenu.Position,b,y
        ply
        plp
        plb
        rtl

        .databank 0

      rlSetMapMenuPosition ; 87/8761

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy
        pha

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        pla
        sta structMapMenu.Position,b,y

        ply
        plp
        plb
        rtl

        .databank 0

      rlGetMapMenuTilemapArea ; 87/877B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy
        jsl rlGetMapMenuTilemapRAMEntryPointer

        ldy lMapMenuTilemapRAMEntryPointer,b
        sep #$20
        lda lMapMenuTilemapRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenuTilemapData.Area,b,y
        ply
        plp
        plb
        rtl

        .databank 0

      rlSetMapMenuTilemapArea ; 87/8797

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        pha
        jsl rlGetMapMenuTilemapRAMEntryPointer

        ldy lMapMenuTilemapRAMEntryPointer,b
        sep #$20
        lda lMapMenuTilemapRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        pla
        sta structMapMenuTilemapData.Area,b,y

        ply
        plp
        plb
        rtl

        .databank 0

      rlGetMapMenuTilemapRAMEntryPointer ; 87/87B5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenu.TilemapDataPointer,b,y
        sta lMapMenuTilemapRAMEntryPointer
        lda structMapMenu.TilemapDataPointer,b,y
        sta lMapMenuTilemapRAMEntryPointer+1

        ply
        plp
        plb
        rtl

        .databank 0

      rlReplaceMapMenuTilemapROMWithRAMPointer ; 87/87D8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda lMapMenuTilemapRAMEntryPointer,b
        pha
        lda lMapMenuTilemapRAMEntryPointer+1,b
        pha
        lda lR18
        pha
        lda lR18+1
        pha
        phy

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenu.TilemapDataPointer,b,y
        sta lR18
        lda structMapMenu.TilemapDataPointer+1,b,y
        sta lR18+1

        lda lMapMenuTilemapRAMEntryPointer
        sta structMapMenu.TilemapDataPointer,b,y
        lda lMapMenuTilemapRAMEntryPointer+1
        sta structMapMenu.TilemapDataPointer,b,y

        lda lR18
        sta lMapMenuTilemapRAMEntryPointer
        lda lR18+1
        sta lMapMenuTilemapRAMEntryPointer+1
        jsl rlRemoveMapMenuTilemapRAMEntry

        ply
        pla
        sta lR18+1
        pla
        sta lR18
        pla
        sta lMapMenuTilemapRAMEntryPointer+1
        pla
        sta lMapMenuTilemapRAMEntryPointer
        plp
        plb
        rtl

        .databank 0

        ; 87/8833






      rlRemoveMapMenuTilemapRAMEntry ; 87/8B83

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda lMapMenuTilemapRAMEntryPointer,b
        sta lR25
        lda lMapMenuTilemapRAMEntryPointer+1,b
        sta lR25+1
        jsl rlRemoveRAMAreaEntry
        plp
        plb
        rtl

        .databank 0

      rlUnknown878B98 ; 87/8B98

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wUnknown053C,b
        sta wR0

        ldy lMapMenuTilemapRAMEntryPointer,b
        sep #$20
        lda lMapMenuTilemapRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda $0006,b,y
        sta lR20
        lda $0007,b,y
        sta lR20+1

        ; Width * Height
        sep #$20
        lda $0000,b,y
        sta WRMPYA
        lda $0001,b,y
        sta WRMPYB
        nop
        nop
        nop
        rep #$20
        lda RDMPY
        dec a
        tax

        asl a
        clc
        adc lR20
        tay

        sep #$20
        lda lR20+2
        pha
        rep #$20
        plb

        lda wR0

          -
          sta $0000,b,y
          dec y
          dec y
          dec x
          bpl -

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/8BF0












      rlUnknown85A1E7 ; 85/A1E7

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown878921
        jsl rlGetMenuTextStringLength
        plx
        phx
        txa
        clc
        adc wR10
        tax
        lda lR19
        sta lR18
        lda lR19+1
        sta lR18+1
        jsl rlUnknown878921
        plx
        rtl

        .databank 0

      rlGetMenuTextStringLength ; 85/A205

        .al
        .autsiz
        .databank ?

        ; Input:
        ; lR18 = string pointer

        ; Output:
        ; wR10 = length

        pha
        phx
        phb
        php
        phk
        plb

        stz wR10

        ldx lR18
        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb
        
          _Loop
          lda $0000,b,x
          beq _End

            inc x
            inc x
            inc wR10
            bra _Loop

        _End
        plp
        plb
        plx
        pla
        rtl

        .databank 0

        ; 85/A227








      rlUnknown878921 ; 87/8921

        .al
        .autsiz
        .databank ?

        jsl rlGetMapMenuTilemapRAMEntryPointer
        jsl rlDrawMenuTextLine
        rtl

        .databank 0

      rlApplyMapMenuPaletteData ; 87/892A

        .al
        .autsiz
        .databank ?

        php
        phb
        phx
        phy

        ldy lR19
        sep #$20
        lda lR19+2
        pha
        rep #$20
        plb

        lda structMapMenuPaletteData.Size,b,y
        sta wR0
        lda structMapMenuPaletteData.Palette,b,y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        asl a
        sta wR1
        lda structMapMenuPaletteData.Color,b,y
        and #$00FF
        asl a
        clc
        adc wR1
        sta wR1
        tax

        lda structMapMenuPaletteData.Source,b,y
        pha
        sep #$20
        lda structMapMenuPaletteData.Source+2,b,y
        pha
        rep #$20
        plb
        ply

          _Loop
          lda $0000,b,y
          sta aBGPaletteBuffer,x
          inc y
          inc y
          inc x
          inc x
          dec wR0
          bne _Loop

        ply
        plx
        plb
        plp
        rtl

        .databank 0

      rlHandleMapMenuDecompressionDMA ; 87/8979

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda bUnknown0536,b
        and #$00FF
        beq _Free

          lda #7,s
          cmp lUnknown0537,b
          bne +

            lda #7+1,s
            cmp lUnknown0537+1
            bne +

              lda bUnknown0536,b
              bit #$0001
              bne _8A17

              bit #$0002
              beq +

                jml _8A98

          +
          ply
          plx
          plp
          plb
          sec
          rtl

        _Free ; 87/89AC
        lda #7,s
        sta lUnknown0537,b
        lda #7+1,s
        sta lUnknown0537+1,b
        lda bUnknown0536,b
        ora #$0080
        sta bUnknown0536,b

        ldy lR19
        sep #$20
        lda lR19+2
        pha
        rep #$20
        plb

        lda $0004,b,y
        and #$00FF
        beq _CheckDMA

          ldx wDecompressionArrayPosition,b
          lda $0005,b,y
          sta aDecompressionArray + structDecompressionEntry.Source,b,x
          lda $0005+1,b,y
          sta aDecompressionArray + structDecompressionEntry.Source+1,b,x
          lda #<>aDecompressionBuffer
          sta aDecompressionArray + structDecompressionEntry.Dest,b,x
          lda #`>aDecompressionBuffer
          sta aDecompressionArray + structDecompressionEntry.Dest+1,b,x
          lda #0
          sta aDecompressionArray + size(structDecompressionEntry),b,x
          sta aDecompressionArray + size(structDecompressionEntry)+1,b,x
          txa
          clc
          adc #size(structDecompressionEntry)
          sta wDecompressionArrayPosition,b
          sep #$20
          lda #1
          sta bDecompressionArrayFlag,b

          lda bBufferINIDISP
          bpl +

            jsl rlDecompressByList

          +
          rep #$20
          lda bUnknown0536,b
          ora #$0001
          sta bUnknown0536,b

          _8A17
          lda bDecompressionArrayFlag,b
          and #$00FF
          beq _CheckDMA

            ply
            plx
            plp
            plb
            sec
            rtl

        _CheckDMA ; 87/8A25
        sep #$20
        lda lR19+2
        pha
        rep #$20
        plb
        ldy lR19

        ldx wDMAArrayPosition,b
        sep #$20
        lda #DMAToVRAM
        sta aDMAArray + structDMAToVRAM.TransferType,b,x
        rep #$20

        lda $0004,b,y
        bne +

          lda $0005,b,y
          sta aDMAArray + structDMAToVRAM.Source,b,x
          lda $0005+1,b,y
          sta aDMAArray + structDMAToVRAM.Source+1,b,x
          bra ++

        +
        lda #<>aDecompressionBuffer
        sta aDMAArray + structDMAToVRAM.Source,b,x
        lda #`>aDecompressionBuffer
        sta aDMAArray + structDMAToVRAM.Source+1,b,x

        +
        lda $0000,b,y
        sta aDMAArray + structDMAToVRAM.Count,b,x

        sep #$20
        lda #$80
        sta aDMAArray + structDMAToVRAM.Mode,b,x
        rep #$20

        lda $0002,b,y
        sta aDMAArray + structDMAToVRAM.Destination,b,x
        lda #0
        sta aDMAArray + size(structDMAToVRAM),b,x
        txa
        clc
        adc #size(structDMAToVRAM)
        sta wDMAArrayPosition,b
        sep #$20
        lda #1
        sta bDMAArrayFlag,b

        lda bBufferINIDISP
        bpl +

          jsl $80A34F

        +
        lda bUnknown0536,b
        and #~$01
        ora #$02
        sta bUnknown0536,b
        rep #$20

        _8A98
        lda bDMAArrayFlag,b
        and #$00FF
        beq _CLC

          ply
          plx
          plp
          plb
          sec
          rtl

        _CLC
        lda bUnknown0536,b
        and #$FF00
        sta bUnknown0536,b
        ply
        plx
        plp
        plb
        clc
        rtl

        .databank 0

        ; 87/8AB5
























      rlUnknown9E85A4 ; 9E/85A4

        .al
        .autsiz
        .databank ?

        ; wR0 = ClassID
        ; wR1 = Gender
        ; wR2 = CharacterID

        phx
        phy
        lda wR0
        cmp #KnightLord
        bne +

          lda wR2
          cmp #Seliph
          bne +

            lda #$005D
            bra _End

        +
        asl a
        tax
        lda aUnknown9E85DF,x
        cmp #$FFFF
        bne +

          lda wR0
          bra _End

        +
        lda wR1
        dec a
        beq +

          lda wR0
          bra _End

        +
        lda wR0
        asl a
        tax
        lda aUnknown9E85DF+1,x
        and #$00FF

        _End
        ply
        plx
        rtl

        .databank 0

      aUnknown9E85DF ; 9E/85DF

        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte MasterKnight, $48
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte MageKnight, $49
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte Dragonrider, $4A
        .byte Dragonknight, $4B
        .byte Dragonmaster, $4C
        .byte Archer, $4D
        .byte Myrmidon, $4E
        .byte Swordmaster, $4F
        .byte Sniper, $50
        .byte Hero, $51
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte Priest, $52
        .byte Mage, $53
        .byte FireMage, $54
        .byte ThunderMage, $55
        .byte WindMage, $56
        .byte HighPriest, $57
        .byte $FF, $FF
        .byte Sage, $58
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte Thief, $59
        .byte Rogue, $5A
        .byte Civilian, $5B
        .byte Child, $5C
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF
        .byte $FF, $FF

      rlUnknown9E866F ; 9E/866F

        .al
        .autsiz
        .databank ?

        phy
        phx
        cmp #$FFFF
        bne _CLC

        lda wR0
        tax
        lda aUnkown9E8687,x
        and #$00FF
        sec
        bra +

        _CLC
        clc

        +
        plx
        ply
        rtl

        .databank 0

      aUnkown9E8687 ; 9E/8687

01 01 03 02 00 00 00 01 00 01 01 03 00 01 02 00 00 00 01 01 01 03 00 00 03 00 01 01 01 01 01 02 03 00 01 02 03 00 02 02 02 02 03 02 00 00 00 00 04 04 00 04 04 04 04 04 04 04 04 04 04 04 04 00 00 00 00 03 03 03 03 04
  

      ; 9E/86CF











      aUnknown9EB50D ; 9E/B50D

        .long $ADF4CB
        .long $AAA0F6

        ; 9E/B513











      rlUnknown9E9D3B ; 9E/9D3B

        .al
        .autsiz
        .databank ?

        phx
        lda #(`$D676F6)<<8
        sta lR18+1
        lda #<>$D676F6
        sta lR18
        lda #(`aDecompressionBuffer)<<8
        sta lR19+1
        lda #<>aDecompressionBuffer
        clc
        adc #$2000
        sta lR19
        jsl rlAppendDecompList

        lda #(`$D677E9)<<8
        sta lR18+1
        lda #<>$D677E9
        sta lR18
        lda #(`aDecompressionBuffer)<<8
        sta lR19+1
        lda #<>aDecompressionBuffer
        clc
        adc #$3000
        sta lR19
        jsl rlAppendDecompList
        plx
        rtl

        .databank 0

        ; 9E/9D76













      rlUnknown9ED42A ; 9E/D42A

        .al
        .autsiz
        .databank ?

        jsl rlClearBattleData
        jsl rlUnknown9ED5A1

        lda #(`procUnknown9ED441)<<8
        sta lR44+1
        lda #<>procUnknown9ED441
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

      procUnknown9ED441 .structProcInfo "ON", rlProcUnknown9ED441Init, rlProcUnknown9ED441Cycle1, aProcUnknown9ED441Code ; 9E/D441

      rlProcUnknown9ED441Init ; 9E/D449

        .al
        .autsiz
        .databank ?

        phy
        phx
        phb
        pea $7F00
        plb
        plb

        lda #0
        sta $7F4580
        sta $7F4582
        sta $7F4584
        sta $7F455A
        sta $7F4572
        sta $7F4C87
        sta $7F4BE9
        sta $7F4C07
        sta $4C11,b
        sta $4C13,b

        lda #$FFFF
        sta $7F45A4
        sta $7F45A6
        sta $7F45A8
        sta $7F45AA

        lda $7E4EBF
        sta @l wR0
        lda $7E4EC1
        sta @l wR1
        lda $7E4EBD
        sta @l wR2
        jsl rlUnknown9E85A4
        sta $454E,b
        lda $7E4EB7
        sta $4552,b
        lda $7E4EB9
        sta $4554,b

        lda #$FFFF
        jsl rlUnknown9E866F
        sta $45A4,b

        lda #$FFFF
        sta $7E4EDD

        lda #0
        sta $4550,b
        sta $4556,b
        sta $4558,b
        sta $454C,b

        lda #$FFFF
        sta $7E4F15

        lda #6
        sta $455E,b
        sta $4560,b

        lda #0
        sta $508F,b
        sta $459E,b
        sta $7E4F85

        lda #5
        sta $4BF3,b

        plb
        lda #(`rlUnknown81841B)<<8
        sta $0015E4+1
        lda #<>rlUnknown81841B
        sta $0015E4
        plx

        lda $000302
        sta aProcSystem.aBody7,x
        stz $0302,b

        lda #0
        sta aProcSystem.aHeaderBitfield,b,x
        jsl $88CD53
        jsl $88CD61
        ply
        rtl

        .databank 0

        ; 9E/D528











      rlProcUnknown9ED441Cycle2 ; 9E/D535

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      aProcUnknown9ED441Code ; 9E/D536

        -
        PROC_YIELD 1
        PROC_CALL rlUnknown9F86B0
        PROC_JUMP_IF_BITS_UNSET -, $0001

        PROC_SET_ONCYCLE rlProcUnknown9ED441Cycle3
        PROC_YIELD 40
        PROC_CALL rlUnknown9E99F7
        PROC_YIELD 4
        PROC_CALL rlUnknown9E9D3B
        PROC_YIELD 4
        PROC_CALL $9E9D76
        PROC_YIELD 4
        PROC_CALL $9E89F1
        PROC_YIELD 2
        PROC_CALL $9ED6BA
        PROC_YIELD 1
        PROC_CALL $9EA9B5
        PROC_SET_UNK_TIMER 96

        -
        PROC_YIELD 1
        PROC_CALL $96D695
        PROC_JUMP_WHILE_UNK_TIMER -

        PROC_CALL $9EAB21
        PROC_YIELD 16
        PROC_CALL $9ED6D6
        PROC_CALL $888197
        PROC_YIELD 4
        PROC_CALL $8881A7
        PROC_YIELD 1
        PROC_CALL $9ED71E
        PROC_END

      rlUnknown9ED5A1 ; 9E/D5A1

        .al
        .autsiz
        .databank ?

        phx
        lda wEventUnitSlot1ID,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitDeploymentOffset
        sta $7E4EB5
        jsl rlGetSelectedUnitClassID
        sta $7E4EBF
        jsl rlGetSelectedUnitGender
        sta $7E4EC1
        jsl rlGetSelectedUnitCharacterID
        sta $7E4EBD
        jsl rlGetSelectedUnitDeploymentOffset
        tax
        lda aDeploymentTable._XTilePosition,x
        sta $7E4EB7
        lda aDeploymentTable._YTilePosition,x
        sta $7E4EB9
        jsl rlGetFirstEquippableWeaponInInventory

        ldx wCurrentItemDataROMPointer,b
        bne +

        lda #$FFFF
        bra ++

        +
        jsl rlGetItemIDByInventorySlot

        +
        sta $7E4EDD
        jsl rlGetSelectedUnitDeploymentOffset
        sta $7E4EB5
        tax
        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        sta $7F4562
        plx
        rtl

        .databank 0

      rlProcUnknown9ED441Cycle1 ; 9E/D609

        .al
        .autsiz
        .databank ?

        phx
        phy
        phb
        php
        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda $7F455E
        asl a
        clc
        adc $7F455E
        asl a
        sta wR0

        lda $7F454E
        sta wR10
        lda #$0031
        sta wR11
        jsl rlUnsignedMultiply16By16
        lda wR12
        clc
        adc wR0
        and #$0003
        tax
        lda aUnknown9EB50D+1,x
        sta lR18+1
        lda aUnknown9EB50D,x
        sta lR18

        lda #(`aDecompressionBuffer)<<8
        sta lR19+1
        lda #<>aDecompressionBuffer
        clc
        adc #0
        sta lR19
        plp
        plb
        jsl rlAppendDecompList
        phb
        php
        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda #(`$ACCC17)<<8
        sta lR18+1
        lda #<>$ACCC17
        sta lR18
        lda #(`aDecompressionBuffer)<<8
        sta lR19+1
        lda #<>aDecompressionBuffer
        clc
        adc #$4000
        sta lR19
        plp
        plb
        jsl rlAppendDecompList
        ply
        plx
        lda #<>rlProcUnknown9ED441Cycle2
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcUnknown9ED441Cycle3 ; 9E/D68B

        .al
        .autsiz
        .databank ?

        phy
        phx
        lda #0
        sta $7F4584
        sta aProcSystem.aHeaderBitfield,b,x
        lda #$FFFF
        sta $7F45A4
        sta $7F45A6
        jsl rlUnknown9E88CE
        jsl rlUnknown9E87A4
        lda #0
        jsl rlUnknown9E8867
        plx
        lda #<>rlProcUnknown9ED441Cycle2
        sta aProcSystem.aHeaderOnCycle,b,x
        ply
        rtl

        .databank 0

        ; 9E/D6BA






      rlUnknown9E87A4 ; 9E/87A4

        .al
        .autsiz
        .databank ?

        phb
        pea #$7F00
        plb
        plb

        lda $454E,b
        sta $4568,b
        lda $454A,b
        sta $4566,b
        lda $454E,b
        sta $456E,b
        lda $455E,b
        sta $4570,b
        lda #0
        sta $4576,b
        plb
        rtl

        .databank 0

        ; 9E/87CA



      rlUnknown9E8867 ; 9E/8867

        .al
        .autsiz
        .databank ?

        phb
        phy
        phx
        sta $00
        phb
        php
        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda $7F4570
        asl a
        clc
        adc $7F4570
        asl a
        sta wR1
        lda $7F456E
        sta wR10
        lda #$0031
        sta wR11
        jsl rlUnsignedMultiply16By16
        lda wR12
        clc
        adc wR1
        tax
        lda aUnknown9EB50D+1,x
        sta lR18+1
        lda aUnknown9EB50D,x
        sta lR18
        lda #(`aDecompressionBuffer)<<8
        sta lR19+1
        lda #<>aDecompressionBuffer
        clc
        adc #$6000
        sta lR19

        lda wR0
        beq +

          lda #(`aDecompressionBuffer)<<8
          sta lR19+1
          lda #<>aDecompressionBuffer
          clc
          adc #$6880
          sta lR19

        +
        plp
        plb
        jsl rlAppendDecompList
        plx
        ply
        plb
        rtl

        .databank 0

      rlUnknown9E88CE ; 9E/88CE

        .al
        .autsiz
        .databank ?

        phx
        ldx #2

        -
        lda aUnknown9E88F4,x
        sta $7EFC88
        sta $7EFC8E
        sta $7EFC94
        sta $7EFC9A
        dec x
        dec x
        bpl -

        lda aUnknown9E88F4 + 4
        sta $7EFCA0
        plx
        rtl

        .databank 0

      aUnknown9E88F4 ; 9E/88F4

        .word $FCA0
        .word $FCA0

        .word $DA6B







      rlUnknown9E99F7 ; 9E/99F7

        .al
        .autsiz
        .databank ?

        phy
        phx
        lda #(`$ADFF80)<<8
        sta lR18+1
        lda #<>$ADFF80
        sta lR18
        lda #$0040
        sta wR0

        lda bBufferOBSEL
        and #$0003
        asl a
        asl a
        asl a
        asl a
        asl a
        xba
        clc
        adc #$00E0
        sta wR1
        jsl rlDMAByPointer

        lda lR18
        clc
        adc #$0040
        sta lR18
        lda wR1
        clc
        adc #$0100
        sta wR1
        jsl rlDMAByPointer
        plx
        ply
        rtl

        .databank 0

        ; 9E/9A34




















      rlUnknown9F86B0 ; 9F/86B0

        .al
        .autsiz
        .databank ?

        lda bDecompressionArrayFlag,b
        bne +

          lda aProcSystem.aHeaderBitfield,b,x
          ora #1
          sta aProcSystem.aHeaderBitfield,b,x

        +
        rtl

        .databank 0

        ; 9F/86BF



      procUnknown828B2B .structProcInfo "ME", rlProcUnknown828B2BInit, rlProcUnknown828B2BCycle, aProcUnknown828B2BCode ; 82/8B2B

        .word 0

      rlProcUnknown828B2BInit ; 82/8B35

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlProcUnknown828B2BCycle ; 82/8B36

        .al
        .autsiz
        .databank ?

        lda $7F4C07
        bit #$0002
        beq +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcUnknown828B2BCode ; 82/8B44

        PROC_HALT

        ; 82/8B46






      rlCheckUnitsMarriedToEachOther ; 84/8EA0

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = CharacterID1
        ; wR1 = CharacterID2

        ; Output:
        ; SEC if married, clc if not

        lda wSelectedUnitDataRAMPointer,b
        pha
        lda wRoutineVariable1,b
        pha

        lda wR1
        jsl rlGetUnitRAMDataPointerByID
        bcs _CLC

          jsl rlGetSelectedUnitGenerationID
          bcs _CLC

            sta wRoutineVariable1,b
            lda wR0
            jsl rlGetUnitRAMDataPointerByID
            bcs _CLC

              jsl rlGetSelectedUnitLoverGenerationID
              cmp wRoutineVariable1,b
              bne _CLC

                sec

                -
                pla
                sta wRoutineVariable1,b
                pla
                sta wSelectedUnitDataRAMPointer,b
                rtl

        _CLC
        clc
        bra -

        .databank 0

      rsEvaluateSpecifiedRankingScore ; 84/8ED7

        .al
        .autsiz
        .databank ?

        phx
        phy
        ldx #0

          _Loop
          lda $0000,b,y
          dec a
          cmp wRoutineVariable1,b
          bpl _Next

            lda $0002,b,y
            cmp wRoutineVariable1,b
            bcs _End

          _Next
          inc x
          inc y
          inc y
          inc y
          inc y
          cpx #4
          bcc _Loop

        _End
        txa
        ply
        plx
        rts

        .databank 0

        ; 84/8EFB














859BD1

; lands at 7ffce1

.byte 8
.byte 10
.long aBG3TilemapBuffer
.byte
.long 0

size 9


      aDialogueBoxMapMenuTilemapData ; 85/9BD1

        .structMapMenuTilemapData 8, 10, aBG3TilemapBuffer, 0, None

      aDialogueBoxMapMenuData ; 85/9BDA

        .structMapMenu None, None, aDialogueBoxMapMenuTilemapData, 7, [1, 1]



; lands at 7ffcf0

.long 0
.long 0
.long $859BD1
.byte 7 ; index for aUnknown8589B5
.byte 1
.byte 1

size 12

      procDialogueBox ; 85/9BE6

        .structProcInfo "PC", rlProcDialogueBoxInit, rlProcDialogueBoxCycle1, $858398

        .long aDialogueBoxMapMenuData
        .byte 0

        ; Handles writing the necessary BG tiles to the BG2, increasing in width over time 
        ; and creates a HDMA that handles the box folding and modifies the height.
        ; aProcSystem.wInput0 = position indicator
        ; aProcSystem.wInput1 = Y tile position << 8 | X 

      rlProcDialogueBoxInit ; 85/9BF2

        .al
        .autsiz
        .databank ?

        jsl rlStallProcUntilMapMenuDataLoaded

        lda #0
        sta wBufferBG3VOFS
        sta wBufferBG3HOFS

        lda aProcSystem.wInput0,b
        sta aProcSystem.aBody5,b,x
        lda aProcSystem.wInput1,b
        sta aProcSystem.aBody6,b,x
        jsl rlSetMapMenuPosition

        lda #0
        sta aProcSystem.aBody4,b,x

        lda aProcSystem.aBody5,b,x
        sta wR42

        lda aProcSystem.wInput1,b
        xba
        and #$00FF
        asl a
        asl a
        asl a
        sta aProcSystem.aBody6,b,x
        sta wR43
        lda #2
        sta wR40

        lda #(`aDialogueBoxUnfoldingHDMA)<<8
        sta lR44+1
        lda #<>aDialogueBoxUnfoldingHDMA
        sta lR44
        jsl rlHDMAEngineCreateEntryByIndex
        rtl

        .databank 0

      rlProcDialogueBoxCycle1 ; 85/9C3B

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody5,b,x
        sta aProcSystem.wInput0,b

        lda #<>rlProcDialogueBoxCycle2
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueBoxCycle2 ; 85/9C48

        .al
        .autsiz
        .databank ?

        phx
        jsl rlLoadMapMenuEntryPointerFromProcBody
        lda aProcSystem.aBody5,b,x
        sta aProcSystem.wInput0,b

        jsl rlUnknown87829A
        jsl rlMapMenuBuildTilemap
        plx

        lda #<>rlProcDialogueBoxCycle3
        sta aProcSystem.aHeaderOnCycle,b,x
        lda #$0002
        tsb wUnknown000D79,b
        rtl

        .databank 0

      rlProcDialogueBoxCycle3 ; 85/9C69

        .al
        .autsiz
        .databank ?

        lda #$0002
        tsb wUnknown000D79,b

        jsl rlCheckDialogueBoxHDMAFinished
        bcs +

          lda aProcSystem.aBody5,b,x
          sta aProcSystem.wInput0,b
          jsl rlLoadMapMenuEntryPointerFromProcBody
          jsl rlGetMapMenuTilemapArea
          clc
          adc #2
          jsl rlSetMapMenuTilemapArea
          jsl rlMapMenuBuildTilemap
          rtl

        +
        phx
        lda aProcSystem.aBody5,b,x
        sta aProcSystem.wInput0,b
        jsl rlLoadMapMenuEntryPointerFromProcBody
        lda #pack([32, 10])
        jsl rlSetMapMenuTilemapArea
        jsl rlUnknown87829A
        jsl rlMapMenuBuildTilemap
        plx
        lda #<>rlProcDialogueBoxCycle4
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

        .databank 0

      rlProcDialogueBoxCycle4 ; 85/9CB2

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody5,b,x
        sta aProcSystem.wInput0,b

        lda aProcSystem.aBody4,b,x
        bit #$0001
        bne +

          rtl

        +
        jsl rlLoadMapMenuEntryPointerFromProcBody
        lda #<>rlProcDialogueBoxCycle5
        sta aProcSystem.aHeaderOnCycle,b,x
        lda aProcSystem.aBody5,b,x
        sta wR42
        lda aProcSystem.aBody6,b,x
        sta wR43
        lda #2
        sta wR40
        lda #(`aDialogueBoxFoldingHDMA)<<8
        sta lR44+1
        lda #<>aDialogueBoxFoldingHDMA
        sta lR44
        jsl rlHDMAEngineCreateEntryByIndex

        lda aProcSystem.aBody5,b,x
        sta aProcSystem.wInput0,b
        jsl rlUnknown87829A
        jsl rlMapMenuBuildTilemap
        lda #$0002
        tsb wUnknown000D79,b
        rtl

        .databank 0

      rlProcDialogueBoxCycle5 ; 85/9CFD

        .al
        .autsiz
        .databank ?

        jsl rlCheckDialogueBoxHDMAFinished
        bcs +

          lda aProcSystem.aBody5,b,x
          sta aProcSystem.wInput0,b
          lda #$0002
          tsb wUnknown000D79,b
          jsl rlLoadMapMenuEntryPointerFromProcBody
          jsl rlGetMapMenuTilemapArea
          sec
          sbc #4
          jsl rlSetMapMenuTilemapArea
          jsl $85884A
          rtl

        +
        jsl $8586FA
        jsl $85AB2A
        lda #$0002
        tsb wUnknown000D79,b
        lda #<>rlProcDialogueBoxCycle6
        sta aProcSystem.aHeaderOnCycle,b,x
        rtl

      rlProcDialogueBoxCycle6 ; 85/9D39

        .al
        .autsiz
        .databank ?

        lda #$7FFF
        sta wDialogueBoxHDMAStatus
        jsl rlProcEngineFreeProc
        rtl

        .databank 0

      rlCreateProcDialogueBox ; 85/9D45

        .al
        .autsiz
        .databank ?

        ; A = top or bottom indicator:  0 or 1
        ; X = tile y coordinate:        0 or (18 << 8)

        pha
        jsl rlFreeHDMAEntry0
        pla
        sta aProcSystem.wInput0,b
        stx aProcSystem.wInput1,b

        lda #(`procDialogueBox)<<8
        sta lR44+1
        lda #<>procDialogueBox
        sta lR44
        jsl rlProcEngineCreateProc
        rtl

        .databank 0

        ; 85/9D60


























      rlHandleMapMenuPaletteGraphicsData ; 87/86BA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        ; Handles copying palettes
        lda structMapMenu.PaletteDataPointer+1,b,y
        beq +

          sta lR19+1
          lda structMapMenu.PaletteDataPointer,b,y
          sta lR19
          jsl rlApplyMapMenuPaletteData

        ; Handles decompression and dma of graphics
        +
        lda structMapMenu.GraphicsDataPointer+1,b,y
        beq +

          sta lR19+1
          lda structMapMenu.GraphicsDataPointer,b,y
          sta lR19
          jsl rlHandleMapMenuDecompressionDMA
          bcs _SEC

        +
        sep #$20
        lda bUnknown000521
        and #~$20
        sta bUnknown000521
        rep #$20
        ply
        plp
        plb
        clc
        rtl

        _SEC
        lda bUnknown000521
        ora #$0020
        sta bUnknown000521
        ply
        plp
        plb
        sec
        rtl

        .databank 0

      rlGetMapMenuType ; 87/8710

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenu.Type,b,y
        and #$00FF
        ply
        plp
        plb
        rtl

        .databank 0

        ; 87/872B















      rlFreeDialogueBoxHDMAIfFinished ; 85/AB19

        .al
        .autsiz
        .databank ?

        lda wDialogueBoxHDMAStatus
        cmp #$FFFF
        beq +

          clc
          rtl

        +
        jsl rlFreeDialogueBoxHDMA
        sec
        rtl

        .databank 0

      rlFreeDialogueBoxHDMA ; 85/AB2A

        .al
        .autsiz
        .databank ?

        lda #2
        jsl rlHDMAEngineFreeEntryByIndex
        rtl

        .databank 0

        ; 85/AB32




      rlUnknown87829A ; 87/829A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        ; Get the height into wR13
        jsl rlGetMapMenuTilemapArea
        xba
        and #$00FF
        sta wR13

        jsl rlGetMapMenuPosition
        xba
        and #$00FF
        cmp #33
        bge +

          cmp wUnknown00052A,b
          bge +

            sta wUnknown00052A,b

        +
        sta wR12
        clc
        adc wR13
        cmp #33
        bge +

          cmp wUnknown00052C,b
          blt +

            sta wUnknown00052C,b

        +
        sta wR13
        plp
        plb
        rtl

        .databank 0

        ; 87/82D4






      rlMapMenuBuildTilemap ; 85/895C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR10
        pha
        lda wR11
        pha
        lda wR12
        pha
        lda wR13
        pha

        lda #$0001
        tsb wUnknown000D79,b

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenu.Position,b,y
        bmi _End

          jsl rlGetMapMenuYPositions

          lda wR10
          cmp wR13
          beq +
          bge _End

          +
          lda wR11
          cmp wR12
          blt _End

            phb
            php
            phk
            plb
            jsl rlGetMapMenuType
            asl a
            tax
            jsr (aMapMenuTypePointers,x)
            plp
            plb

        _End
        pla
        sta wR13
        pla
        sta wR12
        pla
        sta wR11
        pla
        sta wR10
        plx
        plp
        plb
        rtl

        .databank 0

      aMapMenuTypePointers ; 85/89B5

        .word $89F5
        .word $8A6F
        .word $8AD7
        .word $8B51
        .word $8B59
        .word $8C4E
        .word $8C56
        .word <>rsMapMenuTypeDialogue

        ; 85/89C5





      rsMapMenuTypeDialogue ; 85/8CD3

        .al
        .autsiz
        .databank ?

        phy
        jsl rlBuildMapMenuDialogueBox

        lda aProcSystem.wInput0,b
        bmi _End
        bne _Bottom

          ; Copy the 2x2 dialogue box tail to the correct spot

          ; Top
          jsl rlGetMapMenuTileIndex
          clc
          adc #C2I((8, 10), 32) * size(word)
          tax

          ; Load downwards facing tail
          ldy #TilemapEntry(C2I(10, 2) + C2I(0, 48), 0, true, false, false) 
          bra +

          _Bottom
          jsl rlGetMapMenuTileIndex
          clc
          adc #C2I((0, 18), 32) * size(word) ; $0024
          tax

          ; Load upwards facing tail
          ldy #TilemapEntry(C2I(8, 2) + C2I(0, 48), 0, true, false, false) 

          +
          tya
          sta aBG2TilemapBuffer.Page1,x
          tya
          inc a
          sta aBG2TilemapBuffer.Page1+2,x
          tya
          clc
          adc #C2I(0, 1)
          sta aBG2TilemapBuffer.Page1+$40,x
          tya
          clc
          adc #C2I(1, 1)
          sta aBG2TilemapBuffer.Page1+$40+2,x
        
        _End
        ply
        rts

        .databank 0

        ; 85/8D18




      rlBuildMapMenuDialogueBox ; 85/B81D

        .al
        .autsiz
        .databank ?

        phy
        phx
        jsl rlGetMapMenuTilemapArea
        and #$00FF
        sta wR5
        cmp #32
        beq _FullWidth

        lda aProcSystem.wInput0,b
        bne _Bottom

        ; Top
        lda #32
        sec
        sbc wR5
        pha
        sta wR13
        lda #3
        sta wR14
        jsl rlUnsignedDivide16By8
        pla
        lsr a
        sta wR10

        lda wR13
        sec
        sbc wR10
        bra _B870

        _FullWidth
        lda #0
        bra _B870

        _Bottom
        lda #32
        sec
        sbc wR5
        pha
        sta wR13
        lda #3
        sta wR14
        jsl rlUnsignedDivide16By8
        pla
        lsr a
        sta wR10
        lda wR13
        asl a
        sec
        sbc wR10

        _B870
        ; Get the middle of the box as the destination tile
        asl a
        sta wR3
        jsl rlGetMapMenuTileIndex
        clc
        adc #size(aDialogueBoxTilemap)-2
        sec
        sbc #32
        clc
        adc wR5
        clc
        adc wR3
        sta wR7

        ; Source offset
        lda #size(aDialogueBoxTilemap)-2
        sta wR6

          _Loop
          ; Write the right part to the tilemap
          lda wR6
          tay

          lda wR5
          lsr a
          dec a
          sta wR4
          ldx wR7
          jsr rsDialogueBoxWriteToBG2

          ; Write the left part to the tilemap
          lda wR6
          sec
          sbc #32 * size(word)
          clc
          adc wR5
          tay

          lda wR5
          lsr a
          dec a
          sta wR4
          jsr rsDialogueBoxWriteToBG2

          lda wR7
          sec
          sbc #32 * size(word)
          sta wR7
          lda wR6
          sec
          sbc #32 * size(word)
          sta wR6
          bpl _Loop

        plx
        ply
        rtl

        .databank 0

      rsDialogueBoxWriteToBG2 ; 85/B8C2

        .al
        .autsiz
        .databank $85

        ; Y = source offset
        ; X = destination offset
        ; wR4 = count

          _Loop
          lda aDialogueBoxTilemap,y
          clc
          adc #$0300
          sta aBG2TilemapBuffer.Page1,x
          dec x
          dec x
          dec y
          dec y
          dec wR4
          bpl _Loop

        rts

        .databank 0

        ; 85/B8D6











      rlGetMapMenuTileIndex ; 87/88B3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy
        lda wR0
        pha

        ldy lMapMenuRAMEntryPointer,b
        sep #$20
        lda lMapMenuRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda structMapMenu.XPosition,b,y
        and #$00FF
        sta wR0
        lda structMapMenu.YPosition,b,y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        asl a
        clc
        adc wR0
        asl a
        ply
        sty wR0
        ply
        plp
        plb
        rtl

        .databank 0

      rlUnknown8788E5 ; 87/88E5

        .al
        .autsiz
        .databank ?

        jsl rlGetMapMenuTilemapRAMEntryPointer
        jsl rlUnknown878B98
        rtl

        .databank 0

      rlUnknown8788EE ; 87/88EE

        .al
        .autsiz
        .databank ?

        jsl rlGetMapMenuTilemapRAMEntryPointer
        jsl rlUnknown878C8C
        rtl

        .databank 0

        ; 87/88F7








      rlUnknown878C8C ; 87/8C8C

        .al
        .autsiz
        .databank ?

        php
        phb
        phx
        phy

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        lda lR18
        clc
        adc #$000E
        tay

        ldx #$000E

          -
          lda $0000,b,y
          clc
          adc aCurrentTilemapInfo.wBaseTile,b
          sta wR1,x
          dec y
          dec y
          dec x
          dec x
          bpl -

        phk
        plb

        ldy lMapMenuTilemapRAMEntryPointer,b
        sep #$20
        lda lMapMenuTilemapRAMEntryPointer+2,b
        pha
        rep #$20
        plb

        lda $0006,b,y
        sta lR18
        lda $0006+1,b,y
        sta lR18+1
        lda $0000,b,y
        and #$00FF
        sta wR9
        lda $0001,b,y
        and #$00FF
        sta wR10

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        sep #$20
        lda wR9
        sta WRMPYA
        lda wR10
        dec a
        sta WRMPYB
        nop
        nop
        nop
        rep #$20

        lda RDMPY
        asl a
        clc
        adc lR18
        tay

        ldx lR18
        lda wR1
        sta $0000,b,x
        inc x
        inc x
        lda wR6
        sta $0000,b,y
        inc y
        inc y
        lda wR9
        dec a
        dec a
        sta wR0

          -
          lda wR2
          sta $0000,b,x
          lda wR7
          sta $0000,b,y
          inc x
          inc x
          inc y
          inc y
          dec wR0
          bne -

        lda wR3
        sta $0000,b,x
        lda wR8
        sta $0000,b,y
        asl wR9

        lda wR9
        clc
        adc lR18
        tax

        clc
        adc wR9
        dec a
        dec a
        tay

        lda wR10
        dec a
        dec a
        sta wR0

          -
          lda wR4
          sta $0000,b,x
          lda wR5
          sta $0000,b,y

          txa
          clc
          adc wR9
          tax

          tya
          clc
          adc wR9
          tay
          dec wR0
          bne -

        ply
        plx
        plb
        plp
        rtl

        .databank 0

        ; 87/8D61











      rlGetMapMenuYPositions ; 87/8517

        .al
        .autsiz
        .databank ?

        ; Output:
        ; wR10 = Y pos
        ; wR11 = Y pos + height

        jsl rlGetMapMenuTilemapArea
        xba
        and #$00FF
        sta wR11
        jsl rlGetMapMenuPosition
        xba
        and #$00FF
        sta wR10
        clc
        adc wR11
        sta wR11
        rtl

        .databank 0

        ; 87/8531







85839A

09 ; width?
02 ; height?
88 83 7E 
00 
4A CD 7F


8583A3

.long $000000
.long $000000
.long $85839A
.byte $02 ; type
.byte $04 ; x pos
.byte $06 ; y pos


; mapunitmenuproc 85E1CC

50 57 
DB E1 
ED E1 
AA 84 

A3 83 85 
01






85DCE2
09 
10 
88 83 7E 
00 
4A CD 7F



85DCEB

.long $000000
.long $000000
.long $85DCE2
.byte $02 
.byte $04 
.byte $06


; mapmenuproc 85DDDB

50 4D 
F9 DD 
13 DE 
AA 84 
EB DC 85 
01





8D9892

22 99 
2B 99 
33 99 
3B 99 43 99 4B 99 53 99 5B 99 64 99 6D 99 6D 99 74 99 7B 99 85 99 8D 99 96 99 A0 99 A9 99 B3 99 BD 99 C6 99 D0 99 D9 99 E3 99 EC 99 F3 99 FB 99 02 9A 09 9A 0E 9A 15 9A 1F 9A 29 9A 30 9A 3A 9A 40 9A 49 9A 51 9A 5A 9A 62 9A 6C 9A 76 9A 7D 9A 83 9A 8A 9A 93 9A 9D 9A A3 9A AA 9A B4 9A BA 9A C3 9A CA 9A CF 9A D8 9A E4 9A ED 9A F6 9A FD 9A 02 9B 07 9B 0E 9B 16 9B 1D 9B 22 9B 2C 9B 33 9B 3A 9B 42 9B 4B 9B 53 9B 5C 9B


8D9922 dialogueClassCavalier









      rlSplitNumberIntoDigits ; 89/A107

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phk
        plb
        sta wR0
        stz wR1
        stz wR2
        stz wR3
        stz wR4

        ldx #6

          _Loop
          lda wR0
          sec
          sbc aSplitNumberIntoDigitsTable,x
          bcc _Next

            sta wR0
            inc wR1,x
            bra _Loop

          _Next
          dec x
          dec x
          bpl _Loop

        plp
        plb
        rtl

        .databank 0

      aSplitNumberIntoDigitsTable ; 89/A130

        .word 10
        .word 100
        .word 1000
        .word 10000










      rlUnknown87EBC8 ; 87/EBC8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        ldy wEventLocationEntry,b
        sep #$20
        lda lChapterEventDataPointer+2,b
        pha
        rep #$20
        plb

        lda structChapterLocationEntry.ID,b,y
        and #$00FF
        sta wR3
        asl a
        tax

        lda structChapterLocationEntry.Type,b,y
        and #$00FF
        jsl rlGetEventLocationTypeBaseMoney
        sta aChapterLocationMoneyRewards,x

        lda structChapterLocationEntry.Type,b,y
        and #$00FF
        cmp #LocationTypeCastle
        bne _End

          lda lChapterEventDataPointer+1,b
          sta lR18+1
          lda structChapterCastleLocationEntry.ShopDataPointer,b,y
          beq _End

            sta lR18

            ldx lR18
            sep #$20
            lda lR18+2
            pha
            rep #$20
            plb

            _Loop
            lda $0000,b,x
            cmp #$FFFF
            beq _End

              and #$00FF
              jsl rlGetItemRAMStructEntryByPlayerItemIndex
              jsl rlGetItemRAMStateAndOwner

              lda wR0
              cmp #ItemStateUnobtained
              bne _Next

                lda #ItemStateShop
                sta wR0
                lda wR3
                sta wR1
                jsl rlSetItemRAMStateAndOwner

              _Next
              inc x
              bra _Loop

        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/EC42








      rlGetEventLocationTypeBaseMoney ; 87/F391

        .al
        .autsiz
        .databank `aEventLocationTypeOffsets

        phb
        php
        phk
        plb
        phx
        asl a
        tax
        lda aEventLocationTypeOffsets,b,x
        clc
        adc #<>aEventLocationTypeOffsets
        tax
        lda structEventLocationType.BaseMoney,b,x
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/F3A7















      rlASMCGiveJuliaLightIfNoWeapon ; 86/C6A2

        .al
        .autsiz
        .databank ?

        lda wSelectedUnitDataRAMPointer,b
        pha
        lda wRoutineVariable1,b
        pha

        lda #Julia
        jsl rlGetUnitRAMDataPointerByID
        bcs _End

          jsl rlGetFirstWeaponBattleMight
          ora #0
          bne _End

            jsl rlGetSelectedUnitInventorySize
            cmp #7
            bcc +

              lda #7
              sta wSelectedInventorySlot,b
              jsl rlDumpInventorySlotIntoSupplyIfFilled
              bcs _End

            +
            lda #PI_Light2
            sta wRoutineVariable1,b
            jsl rlGivePlayerItemIDToSelectedUnitsFirstItemSlot
            jsl rlEquipFirstWeaponInInventory

        _End
        pla
        sta wRoutineVariable1,b
        pla
        sta wSelectedUnitDataRAMPointer,b
        rtl

        .databank 0

      rlApplyMapTileChange ; 86/C6E8

        .al
        .autsiz
        .databank ?

        phx
        phy
        tay
        lda wR1
        xba
        lsr a
        lsr a
        clc
        adc wR0
        asl a
        tax
        lda $0000,b,y
        and #$00FF
        sta wR12
        lda $0001,b,y
        and #$00FF
        sta wR11

        lda #64
        sec
        sbc wR12
        asl a
        sta wR13
        
          _OuterLoop
          lda wR12
          sta wR10
          
            _InnerLoop
            lda $0002,b,y
            bmi +

              lda aMapData,x
              and #$FC00
              ora $0002,b,y
              sta aMapData,x

            +
            inc y
            inc y
            inc x
            inc x
            dec wR10
            bne _InnerLoop

          txa
          clc
          adc wR13
          tax
          dec wR11
          bne _OuterLoop

        ply
        plx
        rtl

        .databank 0

        ; 86/C739









      rlFillItemsOwnerAndSlotData ; 87/FBC5

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        phx
        lda #PI_IronSword1
        sta lR18

        jsl rlGetItemRAMStructEntryByPlayerItemIndex

          _Loop
          ldx wCurrentItemDataRAMPointer,b
          lda structItemRAMEntry.ItemState,b,x
          and #$00FF
          cmp #ItemStateInventory
          beq +

            cmp #ItemStateSupply
            bne _Next

          +
          pha
          lda structItemRAMEntry.OwnerRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitCharacterID
          cmp #Gerrard
          bcc +

            brk

          +
          and #$003F
          sta lR19

          plx
          cpx #ItemStateSupply
          beq _FC33

            lda #(`aUnit1DataBuffer._Inventory)<<8
            sta lRAMBufferPointer+1,b
            lda #<>aUnit1DataBuffer._Inventory
            sta lRAMBufferPointer,b
            jsl rlSaveCharacterInventoryToBuffer
            ldx #0

            -
            lda aUnit1DataBuffer._Inventory.aItems[0],x
            cmp lR18
            beq +

              inc x
              inc x
              cpx #7 * 2
              bne -

                brk

            +
            txa
            asl a
            asl a
            asl a
            asl a
            asl a
            ora lR19

          _FC33
          ldx wCurrentItemDataRAMPointer,b
          sta structItemRAMEntry.OwnerID_InventorySlot,b,x

          _Next
          lda wCurrentItemDataRAMPointer,b
          clc
          adc #size(structItemRAMEntry)
          sta wCurrentItemDataRAMPointer,b

          lda lR18
          inc a
          sta lR18
          cmp #size(aItemRAMData._Entry) + 1
          bne _Loop

        plx
        plp
        plb
        rtl

        .databank 0

      rlFillItemDurabilityData ; 87/FC51

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        phx
        lda #PI_IronSword1
        sta lR18
        jsl rlGetItemRAMStructEntryByPlayerItemIndex

          _Loop
          ldx wCurrentItemDataRAMPointer,b
          jsr rsCapItemDurability
          sep #$20
          lda structItemRAMEntry.Durability,b,x
          cmp #63
          bne +

            lda #$FF
            sta structItemRAMEntry.Durability,b,x
            rep #$20

          +
          lda structItemRAMEntry.ItemState,b,x
          and #$00FF
          cmp #ItemStateInventory
          beq +

            cmp #ItemStateSupply
            bne _Next

          +
          lda structItemRAMEntry.OwnerRAMPointer,b,x
          bit #$FE00
          bne _Next

            and #$003F
            jsl rlGetUnitRAMDataPointerByID
            bcs +

              lda wSelectedUnitDataRAMPointer,b
              sta structItemRAMEntry.OwnerRAMPointer,b,x
              bra _Next

          +
          lda #ItemStateUnobtained
          sta structItemRAMEntry.ItemState,b,x
          brk

          _Next
          lda wCurrentItemDataRAMPointer,b
          clc
          adc #size(structItemRAMEntry)
          sta wCurrentItemDataRAMPointer,b
          lda lR18
          inc a
          sta lR18
          cmp #256 + 1
          bne _Loop

        plx
        plp
        plb
        rtl

        .databank 0

      rsCapItemDurability ; 87/FCC3

        .al
        .autsiz
        .databank ?

        sep #$20
        lda structItemRAMEntry.ItemID,b,x
        cmp #ValkyrieStaff
        beq _Max1Durability

        cmp #SleepStaff
        beq _Max1Durability

        cmp #BerserkStaff
        beq _Max1Durability

        cmp #EarthSword
        beq _Max10Durability

        cmp #SilenceStaff
        beq _Max3Durability

        cmp #Circlet
        beq _SetUnbreakable
        bra _End

        _Max10Durability
        lda structItemRAMEntry.Durability,b,x
        cmp #10
        bcc _SetDurability

        lda #10
        bra _SetDurability

        _Max3Durability
        lda structItemRAMEntry.Durability,b,x
        cmp #3
        bcc _SetDurability

        lda #3
        bra _SetDurability
        
        _Max1Durability
        lda structItemRAMEntry.Durability,b,x
        beq _SetDurability

        lda #1
        bra _SetDurability

        _SetUnbreakable
        lda #$FF

        _SetDurability
        sta structItemRAMEntry.Durability,b,x

        _End
        rep #$20
        rts

        .databank 0

        ; 87/FD09






































      rlCalculateTacticsRanking ; 84/8CFE

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        stz wRoutineVariable1,b
        ldx #11 * size(word)
        
          -
          lda aChapterTurncounts,b,x
          clc
          adc wRoutineVariable1,b
          sta wRoutineVariable1,b
          dec x
          dec x
          bpl -

        ldy #<>aTacticsRankingThresholds
        jsr rsEvaluateSpecifiedRankingScore
        clc
        adc wDestroyedLocationsCount,b
        cmp #5
        bcc +

          lda #4

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aTacticsRankingThresholds ; 84/8D2F

        .word   1,  399
        .word 400,  549
        .word 550,  799
        .word 800, 1099

      rlCalculateSurvivalRanking ; 84/8D3F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        lda wTotalAlivePlayerUnitCount
        sta wRoutineVariable1,b

        ldy #<>aSurvivalRankingThresholds
        jsr rsEvaluateSpecifiedRankingScore

        ply
        plp
        plb
        rtl

        .databank 0

      aSurvivalRankingThresholds ; 84/8D55

        .word 44, 48
        .word 43, 43
        .word 42, 42
        .word 41, 41

      rlCalculateCombatRanking ; 84/8D65

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        stz wRoutineVariable1,b
        ldx #48 - 1
        
          -
          txa
          jsl rlUnknown91EBBE
          clc
          adc wRoutineVariable1,b
          sta wRoutineVariable1,b
          dec x
          bpl -

        ldy #<>aCombatRankingThresholds
        jsr rsEvaluateSpecifiedRankingScore

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aCombatRankingThresholds ; 84/8D8B

        .word  0,  3
        .word  4, 10
        .word 11, 30
        .word 31, 50

      rlCalculateExperienceRanking ; 84/8D9B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        lda wTotalLevelUpCount
        sta wRoutineVariable1,b

        ldy #<>aExperienceRankingThresholds
        jsr rsEvaluateSpecifiedRankingScore

        ply
        plp
        plb
        rtl

        .databank 0

      aExperienceRankingThresholds ; 84/8DB1

        .word 1000, 1440
        .word 800, 999
        .word 600, 799
        .word 400, 599

      rlCalculateFinalRankingScore ; 84/8DC1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        stz wR10

        jsl rlCalculateTacticsRanking
        clc
        adc wR10
        sta wR10

        jsl rlCalculateSurvivalRanking
        clc
        adc wR10
        sta wR10

        jsl rlCalculateCombatRanking
        clc
        adc wR10
        sta wR10

        jsl rlCalculateExperienceRanking
        clc
        adc wR10
        sta wR10

        lda wR10
        inc a
        inc a
        lsr a
        lsr a
        plp
        plb
        rtl

        .databank 0

      rlGetFatherUnitsChildrenRAMPointers ; 84/8DF4

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = father CharacterID

        ; Output:
        ; wSonCharacterROMPointer
        ; wDaughterCharacterROMPointer

        phb
        php
        phk
        plb
        phx

        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx
        ldx wR1
        phx

        sta wR0

        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        lda aUnitRAMPointers._Entry,b
        and #$00FF
        asl a
        sta wR1

        stz wSonCharacterROMPointer,b
        stz wDaughterCharacterROMPointer,b

        ldx #0

          _Loop
          lda aUnitRAMPointers._Entry,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitFatherID
          cmp wR0
          bne _Next

            jsl rlGetSelectedUnitGender
            cmp #GenderMale
            bne _Female

              lda wSelectedUnitDataRAMPointer,b
              sta wSonCharacterROMPointer
              bra _Next

            _Female
            lda wSelectedUnitDataRAMPointer,b
            sta wDaughterCharacterROMPointer

          _Next
          inc x
          inc x
          cpx wR1
          bcc _Loop

        stz wSelectedUnitDataRAMPointer,b

        pla
        sta wR1
        pla
        sta wR0
        pla
        sta wSelectedUnitDataRAMPointer,b

        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/8E5D
















































































      aEpilogueLoverGroups ; B3/EDD9

        .long aEpilogueLoverPointersPeppy
        .long aEpilogueLoverPointersCreidneLarcei
        .long aEpilogueLoverPointersMuirneLana
        .long aEpilogueLoverPointersPeppy
        .long aEpilogueLoverPointersLindaTine
        .long aEpilogueLoverPointersPeppy
        .long aEpilogueLoverPointersJeanneNanna

      aEpilogueLoverPointersPeppy ; B3/EDEE

        ; daisy, patty, hermina, fee, laylea, lene

        .long dialogueEpilogueLover_Seliph_JuliaDead_Peppy
        .long dialogueEpilogueLover_Seliph_JuliaAlive_All
        .long dialogueEpilogueLover_Shannan_Peppy
        .long dialogueEpilogueLover_DalvinScathach_ShannanDead_Peppy
        .long dialogueEpilogueLover_DalvinScathach_ShannanAlive_All
        .long dialogueEpilogueLover_Deimne_MuirneDead_Peppy
        .long dialogueEpilogueLover_Deimne_MuirneAlive_All
        .long dialogueEpilogueLover_Leif_Peppy
        .long dialogueEpilogueLover_Leif_Peppy
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalDead_Peppy
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_Peppy
        .long dialogueEpilogueLover_Asaello_DaisyDead_Peppy
        .long dialogueEpilogueLover_Asaello_DaisyAlive_Peppy
        .long dialogueEpilogueLover_Ares_Peppy
        .long dialogueEpilogueLover_Diarmuid_Peppy
        .long dialogueEpilogueLover_Diarmuid_Peppy
        .long dialogueEpilogueLover_Tristan_Peppy
        .long dialogueEpilogueLover_Tristan_Peppy
        .long dialogueEpilogueLover_JamkesSon_Peppy
        .long dialogueEpilogueLover_Febail_Peppy
        .long dialogueEpilogueLover_Lester_BrigidsChildrenDead_Peppy
        .long dialogueEpilogueLover_Lester_BrigidsChildrenAlive_Peppy
        .long dialogueEpilogueLover_AmidArthur_Peppy
        .long dialogueEpilogueLover_LexSon_Peppy
        .long dialogueEpilogueLover_Iuchar_Peppy
        .long dialogueEpilogueLover_Iucharba_Peppy
        .long dialogueEpilogueLover_ClaudsSon_Peppy
        .long dialogueEpilogueLover_AzellesSon_Peppy
        .long dialogueEpilogueLover_Oifey_Peppy
        .long dialogueEpilogueLover_Ced_Peppy
        .long dialogueEpilogueLover_LewynsSon_Peppy

      aEpilogueLoverPointersCreidneLarcei ; B3/EE4B

        ; creidne, larcei

        .long dialogueEpilogueLover_Seliph_JuliaDead_Noble
        .long dialogueEpilogueLover_Seliph_JuliaAlive_All
        .long dialogueEpilogueLover_Shannan_Noble
        .long dialogueEpilogueLover_DalvinScathach_ShannanDead_Peppy
        .long dialogueEpilogueLover_DalvinScathach_ShannanAlive_All
        .long dialogueEpilogueLover_Deimne_MuirneDead_CreidneLarcei
        .long dialogueEpilogueLover_Deimne_MuirneAlive_CreidneLarcei
        .long dialogueEpilogueLover_Leif_AltenaDead_CreidneLarcei
        .long dialogueEpilogueLover_Leif_AltenaAlive_CreidneLarcei
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalDead_CreidneLarcei
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_CreidneLarcei
        .long dialogueEpilogueLover_Asaello_DaisyDead_CreidneLarcei
        .long dialogueEpilogueLover_Asaello_DaisyAlive_CreidneLarcei
        .long dialogueEpilogueLover_Ares_CreidneLarcei
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_JamkesSon_CreidneLarcei
        .long dialogueEpilogueLover_Febail_CreidneLarcei
        .long dialogueEpilogueLover_Lester_BrigidsChildrenDead_Noble
        .long dialogueEpilogueLover_Lester_BrigidsChildrenAlive_Noble
        .long dialogueEpilogueLover_AmidArthur_NobleA
        .long dialogueEpilogueLover_LexSon_CreidneLarcei
        .long dialogueEpilogueLover_Iuchar_CreidneLarcei
        .long dialogueEpilogueLover_Iucharba_Noble
        .long dialogueEpilogueLover_ClaudsSon_CreidneLarcei
        .long dialogueEpilogueLover_AzellesSon_CreidneLarcei
        .long dialogueEpilogueLover_Oifey_Noble
        .long dialogueEpilogueLover_Ced_Noble
        .long dialogueEpilogueLover_LewynsSon_Noble

      aEpilogueLoverPointersMuirneLana ; B3/EEA8

        ; murine, lana

        .long dialogueEpilogueLover_Seliph_JuliaDead_Noble
        .long dialogueEpilogueLover_Seliph_JuliaAlive_All
        .long dialogueEpilogueLover_Shannan_Noble
        .long dialogueEpilogueLover_DalvinScathach_ShannanDead_Noble
        .long dialogueEpilogueLover_DalvinScathach_ShannanAlive_MuirneLana
        .long dialogueEpilogueLover_Deimne_MuirneDead_Peppy
        .long dialogueEpilogueLover_Deimne_MuirneAlive_All
        .long dialogueEpilogueLover_Leif_Noble
        .long dialogueEpilogueLover_Leif_Noble
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalDead_Noble
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_MuirneLana
        .long dialogueEpilogueLover_Asaello_DaisyDead_Noble
        .long dialogueEpilogueLover_Asaello_DaisyAlive_MuirneLana
        .long dialogueEpilogueLover_Ares_Noble
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_JamkesSon_Noble
        .long dialogueEpilogueLover_Febail_MuirneLana
        .long dialogueEpilogueLover_Lester_BrigidsChildrenDead_Noble
        .long dialogueEpilogueLover_Lester_BrigidsChildrenAlive_Noble
        .long dialogueEpilogueLover_AmidArthur_NobleA
        .long dialogueEpilogueLover_LexSon_Noble
        .long dialogueEpilogueLover_Iuchar_Noble
        .long dialogueEpilogueLover_Iucharba_Noble
        .long dialogueEpilogueLover_ClaudsSon_MuirneLana
        .long dialogueEpilogueLover_AzellesSon_MuirneLana
        .long dialogueEpilogueLover_Oifey_Noble
        .long dialogueEpilogueLover_Ced_Noble
        .long dialogueEpilogueLover_LewynsSon_Noble

      aEpilogueLoverPointersLindaTine ; B3/EF05

        ; linda, tine

        .long dialogueEpilogueLover_Seliph_JuliaDead_Noble
        .long dialogueEpilogueLover_Seliph_JuliaAlive_All
        .long dialogueEpilogueLover_Shannan_Noble
        .long dialogueEpilogueLover_DalvinScathach_ShannanDead_Noble
        .long dialogueEpilogueLover_DalvinScathach_ShannanAlive_All
        .long dialogueEpilogueLover_Deimne_MuirneDead_Noble
        .long dialogueEpilogueLover_Deimne_MuirneAlive_LindaTine
        .long dialogueEpilogueLover_Leif_Noble
        .long dialogueEpilogueLover_Leif_Noble
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalDead_Noble
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_LindaTine
        .long dialogueEpilogueLover_Asaello_DaisyDead_Noble
        .long dialogueEpilogueLover_Asaello_DaisyAlive_LindaTine
        .long dialogueEpilogueLover_Ares_Noble
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_JamkesSon_Noble
        .long dialogueEpilogueLover_Febail_Noble
        .long dialogueEpilogueLover_Lester_BrigidsChildrenDead_Noble
        .long dialogueEpilogueLover_Lester_BrigidsChildrenAlive_Noble
        .long dialogueEpilogueLover_AmidArthur_NobleB
        .long dialogueEpilogueLover_LexSon_Noble
        .long dialogueEpilogueLover_Iuchar_Noble
        .long dialogueEpilogueLover_Iucharba_Noble
        .long dialogueEpilogueLover_ClaudsSon_LindaTine
        .long dialogueEpilogueLover_AzellesSon_LindaTine
        .long dialogueEpilogueLover_Oifey_Noble
        .long dialogueEpilogueLover_Ced_Noble
        .long dialogueEpilogueLover_LewynsSon_Noble

      aEpilogueLoverPointersJeanneNanna ; B3/EF62

        ; jeanne, nanna

        .long dialogueEpilogueLover_Seliph_JuliaDead_Noble
        .long dialogueEpilogueLover_Seliph_JuliaAlive_All
        .long dialogueEpilogueLover_Shannan_Noble
        .long dialogueEpilogueLover_DalvinScathach_ShannanDead_JeanneNanna
        .long dialogueEpilogueLover_DalvinScathach_ShannanAlive_All
        .long dialogueEpilogueLover_Deimne_MuirneDead_Noble
        .long dialogueEpilogueLover_Deimne_MuirneAlive_All
        .long dialogueEpilogueLover_Leif_Noble
        .long dialogueEpilogueLover_Leif_Noble
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalDead_Noble
        .long dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_JeanneNanna
        .long dialogueEpilogueLover_Asaello_DaisyDead_Noble
        .long dialogueEpilogueLover_Asaello_DaisyAlive_JeanneNanna
        .long dialogueEpilogueLover_Ares_Noble
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Diarmuid_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_Tristan_Noble
        .long dialogueEpilogueLover_JamkesSon_Noble
        .long dialogueEpilogueLover_Febail_Noble
        .long dialogueEpilogueLover_Lester_BrigidsChildrenDead_Noble
        .long dialogueEpilogueLover_Lester_BrigidsChildrenAlive_Noble
        .long dialogueEpilogueLover_AmidArthur_NobleB
        .long dialogueEpilogueLover_LexSon_Noble
        .long dialogueEpilogueLover_Iuchar_Noble
        .long dialogueEpilogueLover_Iucharba_Noble
        .long dialogueEpilogueLover_ClaudsSon_JeanneNanna
        .long dialogueEpilogueLover_AzellesSon_JeanneNanna
        .long dialogueEpilogueLover_Oifey_Noble
        .long dialogueEpilogueLover_Ced_Noble
        .long dialogueEpilogueLover_LewynsSon_Noble

B3EFBF
 -fill 0







      rlFillUnitsDeploymentSaveData ; 87/FA83

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        phx
        jsl rlGetSelectedUnitDeploymentOffset
        bcs +

          tax
          lda aDeploymentTable._State,b,x
          xba
          sta aSave.wCharacterDeploymentState,b
          lda aDeploymentTable._XTilePosition,x
          sta aSave.wCharacterXPosition,b
          lda aDeploymentTable._YTilePosition,x
          sta aSave.wCharacterYPosition,b
          bra _End

        +
        lda #$00FF
        sta aSave.wCharacterDeploymentState,b
        sta aSave.wCharacterXPosition,b
        sta aSave.wCharacterYPosition,b
        
        _End
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/FABC






      rlCompactStaticDynamicUnitBuffer1UnitStates ; 87/F9CE

        .al
        .autsiz
        .databank ?

        lda aUnit1DataBuffer._Personal.UnitStates
        sta wR0
        and #UnitStateArenaLevelMask
        sta wR1

        lda wR0
        and #(UnitStateMapAnimation | UnitStateMiracleActive | UnitStateGroupLeader | UnitStateDead)
        lsr a
        lsr a
        lsr a
        ora wR1
        sta wR1

        lda wR0
        and #(UnitState1000 | UnitStateGuardingCastle | UnitStateMoved | UnitStateFielded)
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        ora wR1
        sta aUnit1DataBuffer._Personal.UnitStates
        rtl

        .databank 0

        ; 87/F9F6




      rlCompactHolyEnemyUnitBuffer1UnitStates ; 87/FA1E

        .al
        .autsiz
        .databank ?

        lda aUnit1DataBuffer._Personal.UnitStates
        sta wR0
        and #UnitStateArenaLevelMask
        sta wR1

        lda wR0
        and #(UnitStateGroupLeader | UnitStateDead)
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        ora wR1
        sta wR1

        lda wR0
        and #(UnitState1000 | UnitStateGuardingCastle | UnitStateMoved | UnitStateFielded)
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        ora wR1
        sta aUnit1DataBuffer._Personal.UnitStates

        lda aUnit1DataBuffer._Personal.ClassMoney
        beq +

          lda #1
          sta aUnit1DataBuffer._Personal.ClassMoney

        +
        rtl

        .databank 0

        ; 87FA57










      rlCheckIfCharacterHasFemaleGenerationID ; 87/F4CF

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID

        phb
        phy
        jsl rlSwapToMainDataBank
        jsl rlGetCharacterDataROMPointer
        tay
        lda structCharacterROMEntry.Type,b,y
        and #$00FF
        cmp #UnitTypeStatic
        beq _Static

          cmp #UnitTypeDynamic
          beq _Dynamic

            _CLC
            clc
            bra _End

        _Static
        lda structStaticCharacterROMEntry.GenerationID,b,y
        bra +

        _Dynamic
        lda structDynamicCharacterROMEntry.GenerationID,b,y

        +
        and #$00FF
        cmp #16
        bcc _CLC

        sec

        _End
        ply
        plb
        rtl

        .databank 0

        ; 87/F501



      rlUnknown87FB5E ; 87/FB5E

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        phx
        phy
        ldx #0
        
          _Loop
          lda aFactionArea,b,x
          tay
          clc
          adc #size(structFactionHeader)
          sta aSave.aFactionEntryOffsets,b,x
          sep #$20

          lda aFactionArea + structFactionHeader.LocationID,b,y
          cmp #$0F
          bne +

            lda #$FF
            sta aFactionArea + structFactionHeader.LocationID,b,y

          +
          rep #$20

          inc x
          inc x
          cpx #7 * size(word)
          bne _Loop

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/FB94





      procUnknown8292A9 

        .structProcInfo "NP", rlProcUnknown8292A9Init, rlProcUnknown8292A9Init, aProcUnknown8292A9Code ; 82/92A9
        .word 0

      rlProcUnknown8292A9Init ; 82/92B3

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      aProcUnknown8292A9Code ; 82/92B4

        PROC_END

      procUnknown8292B6 ; 82/92B6

        .structProcInfo "RS", rlProcUnknown8292B6Init, rlProcUnknown8292B6Cycle, aProcUnknown8292B6Code ; 82/92A9
        .word 0

      rlProcUnknown8292B6Init ; 82/92C0

        .al
        .autsiz
        .databank ?

        php
        ldy wActiveEventOffset,b
        lda [lR22],y
        sta aProcSystem.aBody0,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody1,b,x
        inc y
        inc y
        lda [lR22],y
        and #$00FF
        sta aProcSystem.aBody2,b,x
        cmp #$00FF
        bne +

          ldx aProcSystem.wOffset,b
          jsl rlUnknown91A4AC

        +
        lda #$FFFF
        sta aProcSystem.aBody5,b,x
        plp
        rtl

        .databank 0

      rlProcUnknown8292B6Cycle ; 82/92ED

        .al
        .autsiz
        .databank ?

        php
        jsr rsUnknown829306
        bcc +

          jsr rsUnknown82932C
          bcc +

            lda #0
            sta aProcSystem.aBody2,b,x
            jsl rlEventEngineFreeProc

        +
        plp
        rtl

        .databank 0

      aProcUnknown8292B6Code ; 82/9304

        PROC_HALT

      rsUnknown829306 ; 82/9306

        .al
        .autsiz
        .databank ?

        php
        phx
        lda aProcSystem.aBody5,b,x
        cmp #$FFFE
        beq _SEC

          cmp #$FFFF
          bne +

            dec a
            sta aProcSystem.aBody5,b,x
            bra _CLC

          +
          tax
          lda aProcSystem.aHeaderBitfield,b,x
          bit #$2000
          bne _SEC

          _CLC
          plx
          plp
          clc
          rts
        
        _SEC
        plx
        plp
        sec
        rts

        .databank 0

      rsUnknown82932C ; 82/932C

        .al
        .autsiz
        .databank ?

        php
        lda aProcSystem.aBody2,b,x
        beq _SEC

          cmp #$00FF
          beq +

            dec a
            sta aProcSystem.aBody2,b,x

          +
          lda lActiveEventPointer,b
          sta aProcSystem.aBody3,b,x
          lda wActiveEventOffset,b
          sta aProcSystem.aBody4,b,x
          jsr rsUnknown829391

          ldy #0
          sty wActiveEventOffset,b
          lda lActiveEventPointer+1,b
          sta lR22+1
          lda aProcSystem.aBody0,b,x
          sta lActiveEventPointer,b
          sta lR22
          phx

          lda [lR22],y
          sta lR23
          inc y
          inc y
          sty wActiveEventOffset,b
          jsl rlUnknown91C6D8

          txa
          plx
          lda aProcSystem.aBody3,b,x
          sta lActiveEventPointer,b
          lda aProcSystem.aBody4,b,x
          sta wActiveEventOffset,b
          lda lActiveEventPointer+1,b
          sta lR22+1
          lda lActiveEventPointer,b
          sta lR22
          plp
          clc
          rts

        _SEC
        plp
        sec
        rts

        .databank 0

      rsUnknown829391 ; 82/9391

        .al
        .autsiz
        .databank ?

        ; Store first free proc offset into aBody5

        phx
        ldx #$001E

        -
        lda aProcSystem.aHeaderTypeOffset,b,x
        beq _CLC

          dec x
          dec x
          bpl -

          lda #$FFFF
          plx
          sta aProcSystem.aBody5,b,x
          sec
          rts

        _CLC
        txa
        plx
        sta aProcSystem.aBody5,b,x
        clc
        rts

        .databank 0

      procUnknown8293AE

        .structProcInfo "CC", rlProcUnknown8293AEInit, rlProcUnknown8293AECycle, aProcUnknown8293AECode ; 82/93AE
        .word 0

      rlProcUnknown8293AEInit ; 82/93B8

        .al
        .autsiz
        .databank ?

        ldy wActiveEventOffset,b
        lda [lR22],y
        sta aProcSystem.aBody0,b,x
        inc y
        lda [lR22],y
        and #$FF00
        sta aProcSystem.aBody2,b,x

        inc y
        inc y
        lda [lR22],y
        sta lR19
        inc y
        inc y

        sep #$20
        lda [lR22],y
        sta aProcSystem.aBody2,b,x
        sta lR19+2
        rep #$20

        lda [lR19]
        and #$00FF
        asl a
        sta aProcSystem.aBody5,b,x

        inc lR19
        lda [lR19]
        and #$00FF
        asl a
        sta aProcSystem.aBody6,b,x

        lda lR19
        inc a
        sta aProcSystem.aBody1,b,x

        stz aProcSystem.aBody3,b,x
        lda #1
        sta aProcSystem.aBody4,b,x

        ldx aProcSystem.wOffset,b
        jsl rlUnknown91A4AC
        rtl

        .databank 0

      rlProcUnknown8293AECycle ; 82/9407

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody4,b,x
        dec a
        beq +

          sta aProcSystem.aBody4,b,x
          rtl

        +
        lda aProcSystem.aBody2,b,x
        sta lR18+1
        xba
        sta lR19+1

        lda aProcSystem.aBody0,b,x
        sta lR18
        lda aProcSystem.aBody1,b,x
        sta lR19

        lda aProcSystem.aBody3,b,x
        inc a
        inc a
        
          -
          sta aProcSystem.aBody3,b,x
          tay
          lda [lR19],y
          bit #$FF00
          bne +

            lda #0
            bra -

        +
        phx
        sep #$20
        xba
        sta aProcSystem.aBody4,b,x
        rep #$20
        xba
        and #$00FF
        asl a
        clc
        adc lR18
        sta lR18

        lda #0
        sta lR20+1

        lda #<>aBGPaletteBuffer
        clc
        adc aProcSystem.aBody5,b,x
        sta lR20

        lda aProcSystem.aBody6,b,x
        tay

          -
          lda [lR18],y
          sta [lR20],y
          dec y
          dec y
          bne -

        plx
        rtl

        .databank 0

      aProcUnknown8293AECode ; 82/9467

        PROC_HALT

        ; 82/9469







      rlUnknown858728 ; 85/8728

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $0521,b
        bit #$0080
        beq _End

          bit #$0020
          bne _End

            lda $0D79,b
            bit #$0001
            beq +

              jsr $858D18
              lda #$0001
              trb $0D79,b

            +
            jsl $878256

        _End
        plp
        plb
        rtl

        .databank 0

        ; 85/8751



      rlUnknown8CEDD0 ; 8C/EDD0

        .al
        .autsiz
        .databank ?

        lda wSelectedUnitDataRAMPointer,b
        sta $078C,b
        jsl rlGetSelectedUnitLoverGenerationID
        ora #0
        beq _CLC

          jsl rlFindCharacterByGenerationID
          bcs _CLC

            jsl rlGetSelectedUnitCharacterID
            jsl rlUnknown87A040
            bcc _CLC
            bra +

        _CLC
        lda $078C,b
        sta wSelectedUnitDataRAMPointer,b
        clc
        rtl

        +
        sta $08B4,b
        lda $078C,b
        sta wSelectedUnitDataRAMPointer,b

        ; Get lover target CharacterID
        lda wSelectedUnitDataRAMPointer,b
        pha
        lda $08B4,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        sta $08B4,b

        ; Get own CharacterID
        pla
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        sta $08B2,b

        lda $08B2,b
        sec
        sbc #1
        asl a
        tax
        lda $8CEE6A,x
        cmp #$FFFF
        beq +

          sta $078E,b
          jsl rlCheckPermanentEventFlagSet
          bcs _CLC

            lda $078E,b
            jsl rlSetPermanentEventFlag
            bra _EE64

        +
        lda $08B4,b
        sec
        sbc #1
        asl a
        tax
        lda $8CEE6A,x
        cmp #$FFFF
        beq _EE64

          sta $078E,b
          jsl rlCheckPermanentEventFlagSet
          bcs _CLC

            lda $078E,b
            jsl rlSetPermanentEventFlag

        _EE64
        jsl $8CED00
        sec
        rtl

        .databank 0

      aUnknown8CEE6A ; 8C/EE6A

        ; Holds permanent event flags

        .word $FFFF ; 1 Sigurd
        .word $FFFF ; 2 Naoise
        .word $FFFF ; 3 Alec
        .word $FFFF ; 4 Arden
        .word $FFFF ; 5 Finn
        .word $FFFF ; 6 Quan
        .word $FFFF ; 7 Midir
        .word $FFFF ; 8 Lewyn
        .word $FFFF ; 9 Chulainn
        .word $FFFF ; a Azelle
        .word $FFFF ; b Jamke
        .word $FFFF ; c Claud
        .word $FFFF ; d Beowulf
        .word $FFFF ; e Lex
        .word $FFFF ; F Dew
        .word $0004 ; 10 - Deirdre
        .word $0005 ; 11 - ethlyn
        .word $0006 ; 12 Lachesis
        .word $0007 ; 13 Ayra
        .word $0008 ; 14 Erinys
        .word $0009 ; 15 Tailtiu
        .word $000A ; 16 Silvia
        .word $000B ; 17 Edain
        .word $000C ; 18 Brigid
        .word $FFFF ; Seliph
        .word $FFFF ; Shannan
        .word $FFFF ; Dalvin
        .word $FFFF ; Asaello
        .word $FFFF ; Leif
        .word $FFFF ; Iuchar
        .word $FFFF ; Charlot
        .word $FFFF ; Hawk
        .word $FFFF ; Tristan
        .word $FFFF ; AdultFinn
        .word $FFFF ; Deimne
        .word $FFFF ; Hannibal
        .word $FFFF ; Ares
        .word $FFFF ; Amid
        .word $FFFF ; Oifey
        .word $000D ; Daisy
        .word $000E ; Creidne
        .word $000F ; Muirne
        .word $0010 ; Julia
        .word $0011 ; Altena
        .word $0012 ; Hermina
        .word $0013 ; Linda
        .word $0014 ; Laylea
        .word $0015 ; Jeanne
        .word $FFFF ; Iucharba
        .word $FFFF ; Scathach
        .word $FFFF ; Febail
        .word $FFFF ; Coirpre
        .word $FFFF ; Ced
        .word $FFFF ; Diarmuid
        .word $FFFF ; Lester
        .word $FFFF ; Arthur
        .word $000D ; Patty
        .word $000E ; Larcei
        .word $000F ; Lana
        .word $0012 ; Fee
        .word $0013 ; Tine
        .word $0014 ; Lene
        .word $0015 ; Nanna



F1 F0 8C 02 F1 8C 1A F1 8C 31 F1 8C 4D F1 8C 68 F1 8C 86 F1 8C A2 F1 8C
























      rlUnknown87A040 ; 87/A040

        .al
        .autsiz
        .databank ?

        ; Check if selected unit alive in home castle.

        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wRoutineVariable1,b
        phx

        jsl rlGetUnitRAMDataPointerByID
        bcs _CLC

          jsl rlGetSelectedUnitStates
          bit #(UnitStateFielded | UnitStateDead)
          bne _CLC

            jsl rlGetSelectedUnitFactionSlot
            ora #FS_Player
            bne _CLC

              lda #0
              jsl rlGetFactionSlotLocationID
              sta wRoutineVariable1,b

              jsl rlGetSelectedUnitHomeCastle
              cmp wRoutineVariable1,b
              bne _CLC

                sec
                bra +

        _CLC
        clc

        +
        pla
        sta wRoutineVariable1,b
        pla
        sta wSelectedUnitDataRAMPointer,b
        plx
        rtl

        .databank 0

        ; 87/A082




      procUnknown828BEA 

        .structProcInfo "CC", rlProcUnknown828BEAInit, rlProcUnknown828BEACycle, $828CA1 ; 82/8BEA
        .word 0

      rlProcUnknown828BEAInit ; 82/8BF4

        .al
        .autsiz
        .databank ?

        ldy wActiveEventOffset,b
        sep #$20
        lda [lR22],y
        sta aProcSystem.aBody0,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody0+1,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody2,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody1,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody1+1,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody2+1,b,x
        inc y
        lda [lR22],y
        sta aProcSystem.aBody3,b,x
        rep #$20
        inc y
        lda [lR22],y
        sta aProcSystem.aBody6,b,x
        inc y
        inc y
        lda [lR22],y
        sta aProcSystem.aBody7,b,x

        stz aProcSystem.aBody4,b,x
        stz aProcSystem.aBody5,b,x
        rtl

        .databank 0

      rlProcUnknown828BEACycle ; 82/8C38

        .al
        .autsiz
        .databank ?

        ldx aProcSystem.wOffset,b
        jsl rlUnknown91A4AC

        lda aProcSystem.aBody4,b,x
        cmp aProcSystem.aBody3,b,x
        bcs +

          inc a
          sta aProcSystem.aBody4,b,x
          rtl

        +
        lda aProcSystem.aBody5,b,x
        beq +

          sep #$20
          lda aProcSystem.aBody0,b,x
          sta lR18
          lda aProcSystem.aBody0+1,b,x
          sta lR18+1
          lda aProcSystem.aBody2,b,x
          sta lR18+2
          bra ++

          +
          sep #$20
          lda aProcSystem.aBody1,b,x
          sta lR18
          lda aProcSystem.aBody1+1,b,x
          sta lR18+1
          lda aProcSystem.aBody2+1,b,x
          sta lR18+2

        +
        rep #$20
        ldy aProcSystem.aBody6,b,x
        phy
        tya
        clc
        adc aProcSystem.aBody7,b,x
        sta wR0
        plx

          -
          lda [lR18],y
          sta aBGPaletteBuffer,x
          inc x
          inc x
          inc y
          inc y
          cpy wR0
          bcc -

        ldx aProcSystem.wOffset,b
        lda aProcSystem.aBody5,b,x
        eor #1
        sta aProcSystem.aBody5,b,x
        stz aProcSystem.aBody4,b,x
        rtl

        .databank 0

      aProcUnknown828BEACode ; 82/8CA1

        PROC_HALT

      procUnknown828CA3 ; 82/8CA3

        .structProcInfo "BM", rlProcUnknown828CA3Init, rlProcUnknown828CA3Cycle, aProcUnknown828CA3Code
        .word 0

      rlProcUnknown828CA3Init ; 82/8CAD

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #$01
        ora bBufferTM
        sta bBufferTM
        lda #$01
        ora bBufferTMW
        sta bBufferTMW
        rep #$20

        stz aProcSystem.aBody0,b,x

        lda wMapScrollXPixels,b
        sta wBufferBG1HOFS
        lda wMapScrollYPixels,b
        sta wBufferBG1VOFS
        rtl

        .databank 0

      rlProcUnknown828CA3Cycle ; 82/8CCB

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        cmp #2
        beq _8D01

          cmp #1
          beq +

            lda bBufferINIDISP
            bit #$0080
            bne _8CF3

              ora #$0080
              sta bBufferINIDISP

              lda #1
              sta aProcSystem.aBody0,b,x
              bra _8D05

          +
          lda bBufferINIDISP
          eor #$0080
          sta bBufferINIDISP

          _8CF3
          phx
          jsl $888082
          plx
          lda #2
          sta aProcSystem.aBody0,b,x
          bra _8D05
        
        _8D01
        jsl rlUnknown888560

        _8D05
        ldx aProcSystem.wOffset,b
        jsl rlUnknown91A4AC
        bcc +

          jsr rsUnknown828D12

        +
        rtl

        .databank 0

      rsUnknown828D12 ; 82/8D12

        .al
        .autsiz
        .databank ?

        lda bBufferTM
        eor #$0001
        sta bBufferTM
        ldx aProcSystem.wOffset,b
        jsr rsProcCodeEnd

      aProcUnknown828CA3Code ; 82/8D1F

        PROC_HALT

        ; 82/8D21






      procUnknown828D52 ; 82/8D52

        .structProcInfo "MS", rlProcUnknown828D52Init, rlProcUnknown828D52Cycle, aProcUnknown828D52Code
        .word 0

      rlProcUnknown828D52Init ; 82/8D5C

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        lda #0
        sta aProcSystem.aBody2,b,x
        ldy wActiveEventOffset,b
        lda [lR22],y
        sta aProcSystem.aBody0,b,x
        inc y
        inc y
        lda [lR22],y
        and #$00FF
        sta aProcSystem.aBody1,b,x
        jsr rsUnknown828E61
        bcs +

          lda #0
          sta aProcSystem.aBody1,b,x

        +
        plp
        rtl

        .databank 0

      rlProcUnknown828D52Cycle ; 82/8D84

        .al
        .autsiz
        .databank ?

        php
        phb
        lda $0302,b
        cmp #$0012
        beq +

          cmp #$000F
          bne _End

        +
        ldx aProcSystem.wOffset,b
        lda aProcSystem.aBody6,b,x
        inc a
        sta aProcSystem.aBody6,b,x
        cmp aProcSystem.aBody3,b,x
        beq _8DE8

        sta wR12
        lda #0
        sta wR13
        lda $175F,b
        sta wR10
        lda $1761,b
        sta wR11
        jsl rlUnsignedMultiply32By32

        ldx aProcSystem.wOffset,b
        lda wR15
        sec
        sbc aProcSystem.aBody5,b,x
        sta wMapScrollSpeed,b
        lda wR15
        sta aProcSystem.aBody5,b,x

        lda aProcSystem.aBody7,b,x
        sta wR0

        lda wR0
        cmp #9
        bmi +

          -
          bra -

        +
        asl a
        tax
        jsr (aUnknown828E1F,x)

        lda wMapScrollXPixels,b
        sta wBufferBG1HOFS
        lda wMapScrollYPixels,b
        sta wBufferBG1VOFS

        _End
        plb
        plp
        rtl

        _8DE8
        lda aProcSystem.aBody4,b,x
        sec
        sbc aProcSystem.aBody5,b,x
        sta wMapScrollSpeed,b

        lda aProcSystem.aBody7,b,x
        sta wR0

        lda wR0
        cmp #9
        bmi +

          -
          bra -

        +
        asl a
        tax
        jsr (aUnknown828E1F,x)
        jsr rsUnknown828E61
        bcs _End

        jsl $88BF97
        bcc +

          lda #$0080
          sta wCursorXOffset,b
          sta wCursorYOffset,b

        +
        jsl rlEventEngineFreeProc
        bra _End

        .databank 0

      aUnknown828E1F ; 82/8E1F

        .addr rsUnknown828E31
        .addr rsUnknown828E36
        .addr rsUnknown828E3B
        .addr rsUnknown828E40
        .addr rsUnknown828E45
        .addr rsUnknown828E4A
        .addr rsUnknown828E4F
        .addr rsUnknown828E54
        .addr rsUnknown828E59

      rsUnknown828E31 ; 82/8E31

        .al
        .autsiz
        .databank ?

        jsl $8885D3
        rts
 
        .databank 0

      rsUnknown828E36 ; 82/8E36

        .al
        .autsiz
        .databank ?

        jsl $8885E1
        rts

        .databank 0

      rsUnknown828E3B ; 82/8E3B

        .al
        .autsiz
        .databank ?

        jsl $8885EF
        rts

        .databank 0

      rlUnknown828E40 ; 82/8E40

        .al
        .autsiz
        .databank ?

        jsl $8885FD
        rts

        .databank 0

      rsUnknown828E45 ; 82/8E45

        .al
        .autsiz
        .databank ?

        jsl $88860B
        rts

        .databank 0

      rsUnknown828E4A ; 82/8E4A

        .al
        .autsiz
        .databank ?

        jsl $88861C
        rts

        .databank 0

      rsUnknown828E4F ; 82/8E4F

        .al
        .autsiz
        .databank ?

        jsl $88862D
        rts

        .databank 0

      rsUnknown828E54 ; 82/8E54

        .al
        .autsiz
        .databank ?

        jsl $88863E
        rts

        .databank 0

      rsUnknown828E59 ; 82/8E59

        .al
        .autsiz
        .databank ?

        jsl rlUnknown828E5E
        rts

        .databank 0

      rlUnknown828E5E ; 82/8E5E

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      aProcUnknown828D52Code ; 82/8E5F

        PROC_HALT

      rsUnknown828E61 ; 82/8E61

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        ldx aProcSystem.wOffset,b
        lda aProcSystem.aBody1,b,x
        xba
        sta lR18+1
        lda aProcSystem.aBody0,b,x
        sta lR18
        ldy aProcSystem.aBody2,b,x

        lda [lR18],y
        cmp #$00FF
        beq _CLC

          lda [lR18],y
          sta aProcSystem.aBody7,b,x
          inc y
          inc y
          lda [lR18],y
          sta aProcSystem.aBody3,b,x
          sta wR13
          inc y
          inc y
          lda [lR18],y
          sta aProcSystem.aBody3,b,x
          sta wR14

          lda aProcSystem.aBody7,b,x
          cmp #8
          bne +

            stz aProcSystem.aBody4,b,x

          +
          inc y
          inc y
          tya
          sta aProcSystem.aBody2,b,x
          lda #0
          sta wR12
          sta wR15
          jsl $80A1D8

          lda wR12
          sta $175F,b
          lda wR13
          sta $1761,b
          ldx aProcSystem.wOffset,b
          lda #0
          sta aProcSystem.aBody5,b,x
          sta aProcSystem.aBody6,b,x
          plp
          sec
          rts

        _CLC
        plp
        clc
        rts

        .databank 0

      procUnknown828ECB ; 82/8ECB

        .structProcInfo "CM", rlProcUnknown828ECBInit, rlProcUnknown828ECBCycle, aProcUnknown828ECBCode
        .word 0

      rlProcUnknown828ECBInit ; 82/8ED5

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #$01
        ora bBufferTM
        sta bBufferTM
        lda #$01
        ora bBufferTMW
        sta bBufferTMW
        rep #$20
        stz aProcSystem.aBody0,b,x
        rtl

        .databank 0

      rlProcUnknown828ECBCycle ; 82/8EE9

        .al
        .autsiz
        .databank ?

        lda aProcSystem.aBody0,b,x
        cmp #2
        beq _8F1F

          cmp #1
          beq +

            lda bBufferINIDISP
            bit #$0080
            bne _8F11

              ora #$0080
              sta bBufferINIDISP

              lda #1
              sta aProcSystem.aBody0,b,x
              bra _8F23

          +
          lda bBufferINIDISP
          eor #$0080
          sta bBufferINIDISP

          _8F11
          phx
          jsl $8883C7
          plx
          lda #2
          sta aProcSystem.aBody0,b,x
          bra _8F23

        _8F1F
        jsl $80B63F

        _8F23
        ldx aProcSystem.wOffset,b
        jsl rlUnknown91A4AC
        bcc +

          jsr rsUnknown828F30

        +
        rtl

        .databank 0

      rsUnknown828F30 ; 82/8F30

        .al
        .autsiz
        .databank ?

        lda bBufferTM
        eor #$0001
        sta bBufferTM
        ldx aProcSystem.wOffset,b
        jsr rsProcCodeEnd

        .databank 0

      aProcUnknown828ECBCode ; 82/8F3D

        PROC_HALT

        ; 82/8F3F



      procUnknown829245 ; 82/9245

        .structProcInfo "e0", rlProcUnknown829245Init, rlProcUnknown829245Cycle, aProcUnknown829245Code
        .word 2

      rlProcUnknown829245Init ; 82/924F

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlProcUnknown829245Cycle ; 82/9250

        .al
        .autsiz
        .databank ?

        lda wJoy1New
        bit #JOY_ABXY
        beq +

          jsl rlEventEngineFreeProc

        +
        rtl

        .databank 0

      aProcUnknown829245Code ; 82/925C

        PROC_HALT

      procUnknown82925E ; 82/925E

        .structProcInfo "e0", rlProcUnknown82925EInit, rlProcUnknown82925ECycle, aProcUnknown82925ECode
        .word 2

      rlProcUnknown82925EInit ; 82/9268

        .al
        .autsiz
        .databank ?

        ldy wActiveEventOffset,b
        lda [lR22],y
        sta aProcSystem.aBody0,b,x
        rtl

        .databank 0

      rlProcUnknown82925ECycle ; 82/9271

        .al
        .autsiz
        .databank ?

        dec aProcSystem.aBody0,b,x
        beq +

          lda wJoy1New
          bit #JOY_ABXY
          bne +

            rtl

        +
        jsl rlEventEngineFreeProc
        rtl

        .databank 0

      aProcUnknown82925ECode ; 82/9283

        PROC_HALT





      rlUnknown91A7BC ; 91/A7BC

        .al
        .autsiz
        .databank ?

        ; A = fill value

        php
        ldx #$07FE

          -
          sta aBG3TilemapBuffer,x
          dec x
          dec x
          bpl -

        jsl rlDMAByStruct

          .structDMAToVRAM aBG3TilemapBuffer, $0800, $80, $B000

        nop
        nop
        nop
        nop
        jsl rlUnknown8780EC
        plp
        rtl

        .databank 0





      rlUnknown80C32C ; 80/C32C

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda #$09
        sta bBufferBGMODE
        rep #$20

        lda #0
        sta wR1
        sta wR2
        lda #$8000 >> 1
        sta wR3
        sta wR4
        lda #$C000 >> 1
        sta wR5
        lda #$A000 >> 1
        sta wR6
        lda #$A800 >> 1
        sta wR7
        lda #$B000 >> 1
        sta wR8
        jsl rlSetLayerPositionsAndSizes
        plp
        rtl

        .databank 0

      rlUnknown80C35D ; 80/C35D

        .al
        .autsiz
        .databank ?

        plp
        sep #$20
        lda #3
        sta BGMODE,b
        sta bBufferBGMODE
        lda #0
        sta BG1SC,b
        sta bBufferBG1SC
        sta BG2SC,b
        sta bBufferBG2SC
        rep #$20

        lda #$2000 >> 1
        sta wR1
        sta wR2
        lda #$0000 >> 1
        sta wR3
        sta wR4
        lda #$0000 >> 1
        sta wR5
        lda #$E000 >> 1
        sta wR6
        sta wR7
        lda #$0000 >> 1
        sta wR8
        jsl rlSetLayerPositionsAndSizes
        plp
        rtl

        .databank 0

        ; 80/C39A






      rlUnknown91A9BB ; 91/A9BB

        .al
        .autsiz
        .databank ?

        jsl rlLoadMapMenuData

        lda #$2000
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #$00FF
        sta wUnknown053E,b
        lda #$20FF
        sta wUnknown053C,b
        jsl rlUnknown8788E5

        lda #(`aUnknown91A9E4)<<8
        sta lR18+1
        lda #<>aUnknown91A9E4
        sta lR18
        jsl rlUnknown8788EE
        rtl

        .databank 0

      aUnknown91A9E4 ; 91/A9E4

        .word $6106
        .word $2107
        .word $2106
        .word $6108
        .word $2108
        .word $E106
        .word $A107

06 A1 85 06 A5 27 48 A5 28 48 A9 00 00 85 28 A9 08 00 85 27 A5 06 20 15 AA 20 6F AA 68 85 28 68 85 27 6B 08 DA 5A A0 00 00 85 1A A9 10 27





      rlUnknown8B87A0 ; 8B/87A0

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

        ; 8B/87A1






      rlUnknown84CDA4 ; 84/CDA4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $0580,b
        beq _End

          sta wEventLocationEntry,b
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlUnknown84CAA9
          lda #8
          sta bEventActionIdentifier,b
          jsl rlGetSelectedUnitCharacterID
          sta wEventEngineArgument1,b
          jsl rlGetEventLocationEntryID
          sta wEventEngineArgument2,b
          jsl rlGetAndRunChapterMapEventConditions

        _End
        plp
        plb
        rtl

        .databank 0

        ; 84/CDD6





      rlUnknown85DF3F ; 85/DF3F

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown88AF7B
        ldx $0772,b
        jsl rlUnknown84CDA4

        lda #<>$80B6B6
        sta aProcSystem.wInput0,b
        lda #(`procUnknown8282D3)<<8
        sta lR44+1
        lda #<>procUnknown8282D3
        sta lR44
        jsl rlProcEngineCreateProc
        plx
        rtl

        .databank 0

        ; 85/DF61



        ; 85/E070

57 DE 85 01 01 81 40 82 B1 82 A4 82 B0 82 AB 00 00 ; attack
7C DE 85 01 01 81 40 82 C6 82 C2 82 B0 82 AB 00 00 ; assault
AB DE 85 01 01 81 40 82 A8 82 C7 82 E9 00 00 ; dance
D6 DE 85 01 01 81 40 82 C2 82 A6 00 00 ; staff
FB DE 85 01 01 81 40 82 E0 82 BF 82 E0 82 CC 00 00 ; belongings?
C2 DF 85 01 01 81 40 82 CD 82 C8 82 B7 00 00 ; talk
30 E0 85 01 01 81 40 82 A0 82 B0 82 E9 00 00 ; give?
50 E0 85 01 01 81 40 82 A0 82 B0 82 E9 00 00 ; give2?
12 E0 85 01 01 81 40 82 BD 82 B7 82 AF 82 E9 00 00 ; help?
6F DF 85 01 01 81 40 82 B9 82 A2 82 A0 82 C2 00 00 ; seize
20 DF 85 01 01 81 40 82 CD 82 A2 82 E9 00 00 ; enter
3F DF 85 01 01 81 40 82 DC 82 BF 00 00 ; town?
61 DF 85 01 01 81 40 82 DE 82 E7 00 00 ; village
7D DF 85 01 01 81 40 82 B5 82 E3 82 D1 00 00 ; guard
8A DF 85 01 01 81 40 82 B5 82 E3 82 C2 82 B0 82 AB 00 00 ; depart
98 DF 85 01 01 81 40 8F E9 82 C9 82 E0 82 C7 82 E9 00 00 ; return
43 DE 85 01 01 81 40 82 BD 82 A2 82 AB 00 00 ; atmosphere?
04 E0 85 01 01 81 40 8F E9 82 C9 82 E0 82 C7 82 E9 00 00 ; return2
B4 DF 85 01 01 81 40 82 CC 82 E9 00 00 ; mount
A6 DF 85 01 01 81 40 82 A8 82 E8 82 E9 00 00 ; dismount
DE DF 85 01 01 81 40 82 BB 82 A4 82 D1 00 00 ; equipment
FD DF 85 01 01 81 40 83 41 83 6A 83 81 00 00 ; anime


00 00 18 00 50 57 DB E1 ED E1 AA 84 A3 83 85 01 C8 E1 85 22 C2 83 85 A9 00 00 85 89 85 87 AD CF 0E 9D B7 10 6B A9 09 00 22 AD 8F 80 BD D7 0E A8 22 80 82 85 22 AC 84 85 A9 00 00 8D 00 01 A9 00 20 8D 3A 05 A9 FF 20 8D 3C 05 BD B7 10 8D CF 0E A9 01 00 8D 43 05 8D 45 05 DA AE 72 07 BF EB 46 7E 8D 6F 05 20 4E E4 20 68 E4 A2 2E 00 DA FC 7F E2 FA 90 0F A9 E2 85 8D 41 05 BD AF E2 8D 40 05 20 32 E3 CA CA 10 E6 FA 22 BE F3 82 1A 0A EB 09 09 00 22 97 87 87 22 6E 85 85 22 DC 84 85 BD B7 10 C9 02 00 F0 0A C9 01 00 D0 05 20 DF E2 80 00 A9 3D E3 9D 57 0F 6B B6 E5 E8 E6 45 E5 39 E5 A5 E6 D7 E6 F6 E7 B3 E7 24



      rlUnknown81B461 ; 81/B461

        .al
        .autsiz
        .databank ?


        phb
        php
        phk
        plb
        dec a
        cmp #6
        bcs +

          tax
          sep #$20
          lda wAreaRestrictionBitfield,b
          and $81B47D,x
          sta wAreaRestrictionBitfield,b
          rep #$20

        +
        plp
        plb
        rtl

        .databank 0

        ; 81/B47D































