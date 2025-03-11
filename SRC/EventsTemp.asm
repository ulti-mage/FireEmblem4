



      rsUnknown91A40E ; 91/A40E

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        inc wUnknown00171C,b
        jsl rlUnknown91A7A8
        jsr rsGetEventLength
        jsl rlUnknown91A487
        jsl rlUnknown91C611
        jsl rlActiveSpriteEngineClearAllSprites

        lda $0302,b
        sta wUnknown001730,b

        stz wR26

        lda #0
        sta aMovingMapSprites.wState,b

        lda #8
        trb wUnknown00171A,b

        plp
        jml rlUnknown91A5CA

        .databank 0

      rsEventEngineClearProcs ; 91/A440

        .al
        .autsiz
        .databank ?

        php
        phx
        ldx #size(wEventProcBanks)-2
        
          -
          lda #$FFFF
          sta wEventProcBanks,b,x
          stz wEventProcOffsets,b,x
          dec x
          dec x
          bpl -

        plx
        plp
        rts

        .databank 0

      rlEventEngineCreateProc ; 91/A455

        .al
        .autsiz
        .databank ?

        php
        lda lR44
        pha
        lda lR44+1
        pha

        jsl rlProcEngineCreateProc
        tax

        pla
        sta lR44+1
        pla
        sta lR44

        lda lR44+1
        and #$FF00
        xba
        sta wEventProcBanks,b,x
        lda lR44
        sta wEventProcOffsets,b,x

        lda #$0004
        tsb wUnknown00171A,b

        plp
        rtl

        .databank 0

      rlEventEngineFreeProc ; 91/A47D

        .al
        .autsiz
        .databank ?

        php
        ldx aProcSystem.wOffset,b
        jsl rlProcEngineFreeProc
        plp
        rtl

        .databank 0

      rlUnknown91A487 ; 91/A487

        .al
        .autsiz
        .databank ?

        php

        rep #$30
        ldx #size(wEventProcOffsets)-2

          -
          lda wEventProcBanks,b,x
          cmp #$FFFF
          beq +

            phx
            txa
            lsr a
            jsl rlProcEngineFreeProcByIndex
            plx

            lda #$FFFF
            sta wEventProcBanks,b,x
            stz wEventProcOffsets,b,x

          +
          dec x
          dec x
          bpl -

        plp
        rtl

        .databank 0

        ; 91/A4AC








      rsUnknown91A4C8 ; 91/A4C8

        .al
        .autsiz
        .databank ?

        lda #$0002
        tsb wUnknown00171A,b

        ldx #(16 - 1) *2
        
        _Loop
        lda wEventProcBanks,b,x
        cmp #$FFFF
        beq _Next

        lda wEventProcBanks,b,x
        bit #$0200
        bne _Next

        lda wEventProcOffsets,b,x
        cmp aProcSystem.aHeaderTypeOffset,b,x
        bne +

        lda wEventProcBanks,b,x
        and #$00FF
        cmp aProcSystem.aHeaderTypeBank,b,x
        beq ++

        +
        lda #$FFFF
        sta wEventProcBanks,b,x
        stz wEventProcOffsets,b,x

        _Next
        dec x
        dec x
        bpl _Loop

        rts

        +
        lda #$0002
        trb wUnknown00171A,b
        bra _Next

        .databank 0

        ; 91/A50A
















      aEventCommandPointers ; 91/A50A

        .word <>rsEventCommand00
        .word <>rsEventCommand01
        .word <>rsEventCommand02
        .word <>rsEventCommand03
        .word <>rsEventCommand04
        .word <>rsEventCommand05
        .word <>rsEventCommand06
        .word <>rsEventCommand07
        .word <>rsEventCommand08
        .word <>rsEventCommand09
        .word <>rsEventCommand0A
        .word <>rsEventCommand0B
        .word <>rsEventCommand0C
        .word <>rsEventCommand0D
        .word <>rsEventCommand0E
        .word <>rsEventCommand0F
        .word <>rsEventCommand10
        .word <>rsEventCommand11
        .word <>rsEventCommand12
        .word <>rsEventCommand13
        .word <>rsEventCommand14
        .word <>rsEventCommand15
        .word <>rsEventCommand16
        .word <>rsEventCommand17
        .word $0000               ; $18
        .word <>rsEventCommand19
        .word <>rsEventCommand1A
        .word <>rsEventCommand1B
        .word <>rsEventCommand1C
        .word <>rsEventCommand1D
        .word $0000               ; $1E
        .word <>rsEventCommand1F
        .word <>rsEventCommand20
        .word <>rsEventCommand21
        .word <>rsEventCommand22
        .word <>rsEventCommand23
        .word <>rsEventCommand24
        .word <>rsEventCommand25
        .word <>rsEventCommand26
        .word <>rsEventCommand27
        .word <>rsEventCommand28
        .word <>rsEventCommand29
        .word <>rsEventCommand2A
        .word <>rsEventCommand2B
        .word <>rsEventCommand2C
        .word <>rsEventCommand2D
        .word <>rsEventCommand2E
        .word <>rsEventCommand2F
        .word <>rsEventCommand30
        .word <>rsEventCommand31
        .word <>rsEventCommand32
        .word <>rsEventCommand33
        .word <>rsEventCommand34
        .word <>rsEventCommand35
        .word <>rsEventCommand36
        .word <>rsEventCommand37
        .word <>rsEventCommand38
        .word <>rsEventCommand39
        .word <>rsEventCommand3A
        .word <>rsEventCommand3B
        .word <>rsEventCommand3C
        .word <>rsEventCommand3D
        .word <>rsEventCommand3E
        .word <>rsEventCommand3F
        .word <>rsEventCommand40
        .word <>rsEventCommand41
        .word <>rsEventCommand42
        .word <>rsEventCommand43
        .word <>rsEventCommand44
        .word <>rsEventCommand45
        .word <>rsEventCommand46
        .word <>rsEventCommand47
        .word <>rsEventCommand48
        .word <>rsEventCommand49
        .word <>rsEventCommand4A
        .word <>rsEventCommand4B
        .word <>rsEventCommand4C
        .word <>rsEventCommand4D
        .word <>rsEventCommand4E
        .word <>rsEventCommand4F
        .word <>rsEventCommand50
        .word <>rsEventCommand51
        .word <>rsEventCommand52
        .word <>rsEventCommand53
        .word <>rsEventCommand54
        .word <>rsEventCommand55
        .word <>rsEventCommand56
        .word <>rsEventCommand57
        .word <>rsEventCommand58
        .word <>rsEventCommand59
        .word <>rsEventCommand5A
        .word <>rsEventCommand5B
        .word <>rsEventCommand5C
        .word <>rsEventCommand5D
        .word <>rsEventCommand5E
        .word $0000               ; $5F

      rlUnknown91A5CA ; 91/A5CA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsr rsUnknown91A629
        bcc _End

          lda lActiveEventPointer+1,b
          sta lR22+1,b
          lda lActiveEventPointer,b
          sta lR22

          ldy wActiveEventOffset,b
          bra _A5FC

          _Loop
          inc y
          sty wActiveEventOffset,b

          phy
          asl a
          tay

          lda aEventCommandPointers,b,y
          ply

          sta lR23
          pea #<>(+)-1
          jmp (lR23)

          +
          bcc _A5FC

            sty wActiveEventOffset,b
            bra _End

          _A5FC
          lda [lR22],y
          cmp #$FEFE
          bne +

            inc y
            inc y
            sty wActiveEventOffset,b
            lda [lR22],y

          +
          cmp #$FFFF
          bne +

            lda #2
            sta wUnknown00171C,b
            bra _End

          +
          and #$00FF
          cmp #$00FD
          bne _Loop

          inc y
          sty wActiveEventOffset,b

        _End
        stz wUnknown000921,b

        plp
        plb
        rtl

        .databank 0

      rsUnknown91A629 ; 91/A629

        .al
        .autsiz
        .databank ?

        lda wUnknown00171A,b
        bit #$0004
        beq _SEC

          jsr rsUnknown91A4C8

          lda #$0002
          bit wUnknown00171A,b
          beq _CLC

            ora #$0004
            trb wUnknown00171A,b

        _SEC
        sec
        bra +
        
        _CLC
        clc
        
        +
        rts

        .databank 0

      rsGetEventLength ; 91/A647

        .al
        .autsiz
        .databank ?

        php
        lda lActiveEventPointer,b
        sta lR22
        lda lActiveEventPointer+1,b
        sta lR22+1,b
        ldy #0

        -
        lda [lR22],y
        cmp #$FEFE
        beq ++

          cmp #$FFFF
          beq +

            inc y
            bra -

          +
          stz wActiveEventLength,b
          bra _End

        +
        inc y
        inc y
        sty wActiveEventLength,b

        _End
        plp
        rts

        .databank 0

        ; 91/A670



      rlUnknown91A7A8 ; 91/A7A8

        .al
        .autsiz
        .databank ?

        phb
        phx

        ldx #24
        lda #0
        
          -
          sta $7E93AA,x
          dec x
          dec x
          dec x
          bpl -

        plx
        plb
        rtl

        .databank 0

        ; 91/A7BC









      rsEventCommand00 ; 91/BDD2

        .al
        .autsiz
        .databank ?

        phy
        lda [lR22],y
        and #$00FF
        pha

        lda #(`$8292A9)<<8
        sta lR44+1,b
        lda #<>$8292A9
        sta lR44,b

        jsl rlEventEngineCreateProc

        pla
        sta wR0

        pla
        clc
        adc wR0
        tay
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand02 ; 91/BDF4

        .al
        .autsiz
        .databank ?

        ; JUMP

        lda [lR22],y
        sec
        sbc lR22
        tay
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand03 ; 91/BDFF

        .al
        .autsiz
        .databank ?

        ; JUMP_TRUE

        lda wEventEngineTruthFlag,b
        bne +

        inc y
        inc y
        bra ++
        
        +
        lda [lR22],y
        sec
        sbc lR22
        tay

        +
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand04 ; 91/BE13

        .al
        .autsiz
        .databank ?

        ; JUMP_FALSE

        lda wEventEngineTruthFlag,b
        beq +

        inc y
        inc y
        bra ++
        
        +
        lda [lR22],y
        sec
        sbc lR22
        tay

        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand05 ; 91/BE27

        .al
        .autsiz
        .databank ?

        ; JUMP_RELATIVE_TRUE

        lda wEventEngineTruthFlag,b
        bne +

        inc y
        inc y
        bra ++
        
        +
        lda [lR22],y
        clc
        adc wActiveEventOffset,b
        tay
        
        +
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand06 ; 91/BE3C

        .al
        .autsiz
        .databank ?

        ; JUMP_RELATIVE_FALSE

        lda wEventEngineTruthFlag,b
        beq +

        inc y
        inc y
        bra ++
        
        +
        lda [lR22],y
        clc
        adc wActiveEventOffset,b
        tay
        
        +
        sty wActiveEventOffset,b
        
        clc
        rts

        .databank 0

      rsEventCommand07 ; 91/BE51

        .al
        .autsiz
        .databank ?

        ; CHECK_PERMANENT_FLAG_SET

        phy
        lda [lR22],y
        and #$00FF
        jsl rlCheckPermanentEventFlagSet

        lda #0
        rol a
        sta wEventEngineTruthFlag,b

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand08 ; 91/BE69

        .al
        .autsiz
        .databank ?

        ; CHECK_FLAG_IN_CHAPTER_SET

        phy
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        tax

        lda wR0
        jsl rlGetSpecifiedChaptersRAMPointer
        bcs +

          tax
          jsl rlCheckEventFlagSet

          lda #0
          rol a
          sta wEventEngineTruthFlag,b

        +
        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand09 ; 91/BE94

        .al
        .autsiz
        .databank ?

        phy

        lda #(`$8293AE)<<8
        sta $62+1
        lda #<>$8293AE
        sta $62
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #6
        tay
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand0A ; 91/BEAE

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        jsl $8780AA
        jsl $8780DF
        jsl rlResetDialogueEngine

        ply
        plx
        plp
        plb

        clc
        rts

        .databank 0

      aUnknown91BEC6 ; 91/BEC6

        .word $2000
        .word $4000
        .word $2B01
        .word $C00A
        .word $0B00
        .word $4880
        .word $7B01
        .word $C019

      rsEventCommand0B ; 91/BED6

        .al
        .autsiz
        .databank ?

        phy
        jsl $8780EC
        ply

        clc
        rts

        .databank 0

      rsEventCommand0C ; 91/BEDE

        .al
        .autsiz
        .databank ?

        ; DIALOGUE

        phy
        lda #0
        jsl rlUnknown91913B

        lda #(`$82845F)<<8
        sta lR44+1
        lda #<>$82845F
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand0D ; 91/BEFD

        .al
        .autsiz
        .databank ?

        ; CASTLE_NAME

        phy
        lda #(`$8286B6)<<8
        sta lR44+1
        lda #<>$8286B6
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand0E ; 91/BF17

        .al
        .autsiz
        .databank ?

        phy
        lda [lR22],y
        and #$00FF
        sta $04BA,b

        lda #(`procUnknown828AF2)<<8
        sta lR44+1
        lda #<>procUnknown828AF2
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        sty wActiveEventOffset,b

        sec
        rts

        .databank 0

      rsEventCommand0F ; 91/BF35

        .al
        .autsiz
        .databank ?

        phy
        lda [$30],y
        and #$00FF
        jsl $808FAD

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand10 ; 91/BF46

        .al
        .autsiz
        .databank ?

        phy
        lda [$30],y
        and #$00FF
        jsl $808FAD

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand11 ; 91/BF57

        .al
        .autsiz
        .databank ?

        ; PLAY_SFX_BYTE

        phy
        lda [lR22],y
        and #$00FF
        jsl rlUnknown80900D

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand12 ; 91/BF68

        .al
        .autsiz
        .databank ?

        ; PLAY_SFX_WORD

        phy
        lda [lR22],y
        jsl $808FA3

        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand13 ; 91/BF77

        .al
        .autsiz
        .databank ?

        ; RESTORE_PHASE_MUSIC

        phy
        jsl $81AB26

        lda #(`procUnknown828AF2)<<8
        sta lR44+1
        lda #<>procUnknown828AF2
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand14 ; 91/BF90

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_WITH_BG

        php
        phy

        lda #0
        sta $08B8,b

        lda #(`$828906)<<8
        sta lR44+1
        lda #<>$828906
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #6
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand15 ; 91/BFB2

        .al
        .autsiz
        .databank ?

        php
        phy
        lda #1
        sta $08B8,b

        lda #(`$828906)<<8
        sta $62+1
        lda #<>$828906
        sta $62
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #6
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand16 ; 91/BFD4

        .al
        .autsiz
        .databank ?

        php
        phy
        jsl $8CED0D

        lda #(`$828A88)<<8
        sta $62+1
        lda #<>$828A88
        sta $62
        jsl rlEventEngineCreateProc

        pla
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand17 ; 91/BFF0

        .al
        .autsiz
        .databank ?

        ; BERSERK_CAST

        php
        phy

        lda #(`$828B61)<<8
        sta $62+1
        lda #<>$828B61
        sta $62
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #2
        sta wActiveEventOffset,b

        tay
        plp

        clc
        rts

        .databank 0

      rsEventCommand19 ; 91/C00C

        .al
        .autsiz
        .databank ?

        phy
        jsl $91A931
        ply

        phy
        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1
        inc y
        inc y
        lda [$30],y
        tax

        lda #(`aDecompressionBuffer)<<8
        sta $27+1
        lda #<>aDecompressionBuffer
        sta $27
        jsl $9183A8

        pla
        clc
        adc #5
        tay
        sta wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand1A ; 91/C03A

        .al
        .autsiz
        .databank ?

        phy
        jsl $9183A9
        ply

        clc
        rts

        .databank 0

      rsEventCommand1B ; 91/C042

        .al
        .autsiz
        .databank ?

        phy
        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1

        jsl $9183CC

        ply
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand1C ; 91/C059

        .al
        .autsiz
        .databank ?

        phy
        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1

        jsl $9183D7

        ply
        inc y
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand1D ; 91/C070

        .al
        .autsiz
        .databank ?

        jsl rlEnableActiveSpriteEngine
        jsl rlUnknown91C611

        clc
        rts

        .databank 0

      rsEventCommand1F ; 91/C07A

        .al
        .autsiz
        .databank ?

        phy
        lda [$30],y
        sta $62
        inc y
        lda [$30],y
        sta $62+1

        jsl rlHDMAEngineCreateEntry

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        clc
        rts

        .databank 0

      rsEventCommand20 ; 91/C093

        .al
        .autsiz
        .databank ?

        php
        phy
        jsl rlActiveSpriteEngineReset
        jsl rlEnableActiveSpriteEngine
        jsl $81804E
        jsl $818064

        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1
        inc y
        inc y

        lda [$30],y
        sta $02
        inc y
        inc y
        lda [$30],y
        sta $00

        jsl rlDMAByPointer

        pla
        clc
        adc #7
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand21 ; 91/C0CA

        .al
        .autsiz
        .databank ?

        php
        phy
        lda [$30],y
        sta $62
        inc y
        lda [$30],y
        sta $62+1

        inc y
        inc y
        lda [$30],y
        tax

        inc y
        inc y
        lda [$30],y
        tay

        jsl rlActiveSpriteEngineCreateSpriteHighestSlot

        pla
        clc
        adc #7
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rlUnknown91C0EF ; 91/C0EF

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        plp
        rtl

        .databank 0

      rlUnknown91C0F4 ; 91/C0F4

        .al
        .autsiz
        .databank ?

        lda #1
        sta aMovingMapSprites.wUnknown0017C2,b
        jml +

      rsUnknown91C0FE ; 91/C0FE

        .al
        .autsiz
        .databank ?

        lda #0
        sta aMovingMapSprites.wUnknown0017C2,b

        +
        phx
        stx aMovingMapSprites.wOffset,b
        stz aMovingMapSprites.wUnknown0017C0,b

        ldy #0
        lda [lR18],y
        sta wR0
        inc y
        inc y
        lda [lR18],y
        and #$00FF
        sta wR2
        inc y
        lda [lR18],y
        and #$00FF
        sta wR3
        inc y
        lda [lR18],y
        and #$00FF
        sta wR4
        inc y
        lda [lR18],y
        and #$00FF
        sta wR5
        inc y
        lda [lR18],y
        and #$00FF
        sta wR1
        inc y
        lda [lR18],y
        and #$00FF
        sta wR6
        inc y
        phy

        lda wR1
        bit #$0020
        beq _SkipSlot1

        lda wEventUnitSlot1XCoordinate
        cmp #$FFFF
        beq _End

          sta wR2
          lda wEventUnitSlot1YCoordinate
          cmp #$FFFF
          beq _End

            sta wR3
            bra _Continue

              _SkipSlot1
              lda wR1
              bit #$0040
              beq _Continue

                lda wEventUnitSlot2XCoordinate
                cmp #$FFFF
                beq _End

                  sta wR4
                  lda wEventUnitSlot2YCoordinate
                  cmp #$FFFF
                  beq _End

                    sta wR5

            _Continue
            lda #0
            sta wR7
            jsl rlUnknown818FA1
            jsr rsUnknown91C38C

        _End
        ply
        plx
        clc
        rts

        .databank 0

      rsUnknown91C191 ; 91/C191

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_BY_GROUP ?

        phx
        stx aMovingMapSprites.wOffset,b
        stz aMovingMapSprites.wUnknown0017C0,b
        lda #2
        sta aMovingMapSprites.wUnknown0017C2,b

        ldy #0
        lda [lR18],y
        and #$00FF
        sta wR0

        inc y
        lda [lR18],y
        sta wRoutineVariable1,b

        inc y
        inc y
        lda [lR18],y
        and #$00FF
        sta wR2

        inc y
        lda [lR18],y
        and #$00FF
        sta wR3

        inc y
        lda [lR18],y
        and #$00FF
        sta wR1

        inc y
        lda [lR18],y
        and #$00FF
        sta wR6

        inc y
        phy

        lda wR1
        pha
        lda wR2
        pha
        lda wR3
        pha
        lda wR0

        phx
        jsl rlLoadUNITAsHidden
        bcc +

          .byte 0

        +
        plx
        sta aMovingMapSprites.wUnknown0017CC,b,x

        ; Grab the X coordinate
        lda wR1
        and #$00FF
        sta wR4

        ; and the Y coordinate
        lda wR1
        xba
        and #$00FF
        sta wR5

        phx
        ldx wR2
        lda aUnknown91C21D,x
        and #$00FF
        sta wR6
        plx

        pla
        sta wR3
        pla
        sta wR2
        pla
        sta wR1

        lda #1
        sta wR7
        jsl rlUnknown818FA1
        jsr rsUnknown91C38C

        ply
        plx
        clc
        rts

        .databank 0

      aUnknown91C21D ; 91/C21D

        ; Indexed with allegiance

        .byte $02
        .byte $04
        .byte $06
        .byte $08

      rsEventCommand28 ; 91/C221

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_BY_GROUP_SILENT

        lda [lR22],y
        and #$00FF
        sta wR0
        inc y
        lda [lR22],y
        sta wRoutineVariable1,b
        inc y
        inc y
        phy

        lda wR0
        jsl rlLoadUNITAsHidden
        bcc +

          .byte 0

        +
        tax
        jsl rlDeployedUnitUnsetHiddenIfAlive

        ply
        rts

        .databank 0

      rsUnknown91C241 ; 91/C241

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_DIRECT ?

        phx
        stx aMovingMapSprites.wOffset,b
        stz aMovingMapSprites.wUnknown0017C0,b

        lda #4
        sta aMovingMapSprites.wUnknown0017C2,b

        ldy #0
        lda [lR18],y
        sta wR0

        inc y
        inc y
        lda [lR18],y
        and #$00FF
        sta aMovingMapSprites.wUnknown001822,b
        sta wR7

        inc y
        lda [lR18],y
        and #$00FF
        sta wR2

        inc y
        lda [lR18],y
        and #$00FF
        sta wR3

        inc y
        lda [lR18],y
        and #$00FF
        sta wR4

        inc y
        lda [lR18],y
        and #$00FF
        sta wR5

        inc y
        lda [lR18],y
        and #$00FF
        sta wR1

        inc y
        lda [lR18],y
        and #$00FF
        sta wR6

        inc y
        lda [lR18],y
        and #$00FF
        sta aMovingMapSprites.wUnknown001824,b

        inc y
        phy

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
        pha
        phx

        lda #0
        sta wR7
        jsl rlUnknown818FA1

        plx

        phx
        lda wR4
        pha
        lda wR5
        pha

        jsr rsUnknown91C38C

        pla
        sta wR8
        pla
        sta wR9
        plx

        pla
        sta wR7
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

        phx
        lda wR0
        xba
        ora wR9
        sta wRoutineVariable1,b

        lda wR0
        ldx wR7
        plx
        sta aMovingMapSprites.wUnknown0017CC,b,x

        ply
        plx

        clc
        rts

        .databank 0

        ; 91/C2FD











      rsUnknown91C382 ; 91/C382

        .al
        .autsiz
        .databank ?

        lda #0
        sta aMovingMapSprites.wUnknown0017C2
        stz aMovingMapSprites.wUnknown0017C0,b

      rsUnknown91C38C ; 91/C38C

        .al
        .autsiz
        .databank ?

        ; X = mover ID

        phx
        stx aMovingMapSprites.wOffset,b
        phx
        ldy #aMovingMapSpriteData[0].wCharacterID - aMovingMapSpriteData[0]

        lda aMovingMapSprites.wUnknown0017C0,b
        bne _C3CA

          ; Check if the character is already in RAM
          lda [lR18],y
          pha
          jsl rlGetUnitRAMDataPointerByID
          pla
          bcc +

            ; Is a new unit
            jsl rlGetCharacterMapSprite
            bra _C3CA

          +
          ldy #aMovingMapSpriteData[0].bFlags - aMovingMapSpriteData[0]
          lda [lR18],y
          bit #$0080
          beq +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            beq +

              tya
              clc
              adc #9
              tay
              plx
              brl _End

          +
          jsl rlGetSelectedUnitMapSprite

        _C3CA
        plx
        sta wActiveMoversMapSprites,b,x

        phx
        phy
        plb
        jsl rsMovingMapSpriteAppendDecomp
        plb
        ply
        plx

        jsr rsUnknown91C447
        jsl rlUnknown91C4CE

        ldy #aMovingMapSpriteData[0].aSpawnCoordinates - aMovingMapSpriteData[0]
        lda [lR18],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta aMovingMapSprites.wXPixelPosition,b,x
        inc y

        lda [lR18],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta aMovingMapSprites.wYPixelPosition,b,x
        inc y

        lda [lR18],y
        and #$000F
        sta aMovingMapSprites.wSpeed,b,x

        lda [lR18],y
        and #$00F0
        bit #$0010
        beq +

          lda aMovingMapSprites.wUnknown0017C2
          ora #$0010
          sta aMovingMapSprites.wUnknown0017C2

        +
        inc y

        ; bAllegianceColor

        lda [lR18],y
        and #$003E
        xba
        sta aMovingMapSprites.wUnknown001804,b,x
        inc y

        lda [lR18],y
        sta aMovingMapSprites.wPathScriptAddress,b,x
        inc y

        lda [lR18],y
        sta aMovingMapSprites.wPathScriptBank,b,x

        stz aMovingMapSprites.wPathScriptOffset,b,x
        inc y
        inc y

        phy
        lda #(`$8188B0)<<8
        sta lR44+1
        lda #<>$8188B0
        sta lR44
        jsl rlActiveSpriteEngineCreateSpriteHighestSlot
        ply

        _End
        plx
        clc
        rts

        .databank 0

      rsUnknown91C447 ; 91/C447

        .al
        .autsiz
        .databank ?

        ; Sound stuff

        pha
        phx
        phy

        lda lR18
        pha
        lda lR18+1
        pha
        php

        phx
        ldy #0
        lda [lR18],y
        jsl rlGetCharacterMapSprite
        jsl rlGetMapSpriteMovementSound
        jsl rlUnknown91C472

        plx
        sta aMovingMapSprites.wMovingSound,b,x

        plp
        pla
        sta lR18+1
        pla
        sta lR18

        ply
        plx
        pla
        rts

        .databank 0

      rlUnknown91C472 ; 91/C472

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = map sprite movement sound

        phx
        pha
        stz wR0

        ldx #0

          -
          lda aMovingMapSprites.wMovingSound,b,x
          and #$FF00
          ora wR0
          sta wR0
          inc x
          inc x
          cpx #8
          bne -

        lda wR0
        cmp #$0300
        beq +

          ldx #$0100
          cmp #$0200
          beq ++

            ldx #$0200
            bra ++

        +
        inc aMovingMapSprites.wUnknown00181C,b
        lda aMovingMapSprites.wUnknown00181C,b
        and #$0001
        inc a
        xba
        tax

        +
        stx wR0

        ldx #0

          -
          lda aMovingMapSprites.wMovingSound,b,x
          and #$FF00
          cmp wR0
          bne +

            lda aMovingMapSprites.wMovingSound,b,x
            and #$00FF
            sta aMovingMapSprites.wMovingSound,b,x

          +
          inc x
          inc x
          cpx #8
          bne -

        pla
        ora wR0
        plx
        rtl

        .databank 0

      rlUnknown91C4CE ; 91/C4CE

        .al
        .autsiz
        .databank ?

        ; Something with the playing song and the movement sound.

        phx
        lda $04BA,b
        beq +

          lda aMovingMapSprites.wMovingSound,b,x
          and #$00FF
          sta aMovingMapSprites.wMovingSound,b,x
          bra _End

        +
        lda aMovingMapSprites.wMovingSound,b,x
        sta wR0
        and #$FF00
        beq _End

          xba
          tax
          lda wR0
          and #$00FF
          dec x
          bne +

            sta $04CA,b
            stz $04D0,b
            bra _End

          +
          sta $04CD,b
          stz $04D3,b

        _End
        plx
        rtl

        .databank 0

        ; 91/C502























      rsEventCommand27 ; 91/C503

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_BY_SCRIPT

        lda #0
        jml +

        .databank 0

      rsEventCommand22 ; 91/C50A

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS

        lda #1
        jml +

        .databank 0

      rsEventCommand23 ; 91/C511

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_BY_GROUP

        lda #2
        jml +

        .databank 0

      rsEventCommand24 ; 91/C518

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_DIRECT

        lda #3
        jml +

        .databank 0

      rsEventCommand25 ; 91/C51F

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS_FOLLOW

        lda #4
        jml +

        .databank 0

      rsEventCommand26 ; 91/C526

        .al
        .autsiz
        .databank ?

        lda #5
        jml +

        +
        phy
        sta wR0

        ; Wait until any decomps finished
        lda bDecompressionArrayFlag,b
        bne _SEC

          ; Wait until the move engine is free
          lda aMovingMapSprites.wState,b
          cmp #0
          bne _SEC

            lda lR22+1
            sta lR18+1

            tya
            clc
            adc lR22
            sta lR18

            ldx #6

              -
              lda aMovingMapSprites.wActiveSpriteOffset,b,x
              cmp #$FFFF
              beq +

                dec x
                dec x
                bpl -

        _SEC
        ply
        dec y
        sec
        bra _End

        +
        lda wR0
        jsr rsUnknown91C56C
        sty wR0

        pla
        clc
        adc wR0
        tay
        sty wActiveEventOffset,b

        clc
        
        _End
        rts

        .databank 0

      rsUnknown91C56C ; 91/C56C

        .al
        .autsiz
        .databank ?

        ; Unit movement?

        phx
        asl a
        tax
        lda aUnknown91C57D,x
        sta lR23
        plx

        pea #<>(+)-1
        jmp (lR23)
        
        +
        rts

        .databank 0

      aUnknown91C57D ; 91/C57D

        .word <>rsUnknown91C382
        .word <>rsUnknown91C0FE
        .word <>rsUnknown91C191
        .word <>rsUnknown91C241
        .word <>rlUnknown91C0F4
        .word $C2FD

      rsEventCommand29 ; 91/C589

        .al
        .autsiz
        .databank ?

        ; WAIT_UNIT_SPRITE_DECOMPRESSED

        lda bDecompressionArrayFlag,b
        bne _SEC

          lda aMovingMapSprites.wState,b
          cmp #0
          bne _SEC

            clc
            bra +

        _SEC
        dec y
        sec

        +
        rts

        .databank 0

      rsEventCommand2A ; 91/C59C

        .al
        .autsiz
        .databank ?

        ; WAIT_UNTIL_MAP_SPRITES_HALTING

        phy
        ldx #6

        -
        lda aMovingMapSprites.wActiveSpriteOffset,b,x
        cmp #$FFFF
        bne +

          dec x
          dec x
          bpl -
          bra _End

        +
        lda #(`procUnknown828431)<<8
        sta lR44+1
        lda #<>procUnknown828431
        sta lR44
        jsl rlEventEngineCreateProc

        _End
        ply
        clc
        rts

        .databank 0

      rsEventCommand2B ; 91/C5BF

        .al
        .autsiz
        .databank ?

        ; CONTINUE_FORM_MAP_SPRITE_HALT

        phx
        phy
        ldx #6

          _Loop
          lda aMovingMapSprites.wActiveSpriteOffset,b,y
          cmp #$FFFF
          beq _Next

            tax
            lda aActiveSpriteSystem.aUnknown0012E0,b,x
            ora #$8000
            sta aActiveSpriteSystem.aUnknown0012E0,b,x

            tyx
            lda aMovingMapSprites.wMovingSound,b,x
            and #$FF00
            bne +

              lda aMovingMapSprites.wMovingSound,b,x
              jsl rlUnknown91C472
              sta aMovingMapSprites.wMovingSound,b,x

            +
            jsl rlUnknown91C4CE

        _Next
        dec y
        dec y
        bpl _Loop

        ply
        plx
        rts

        .databank 0

      rsEventCommand2C ; 91/C5F4

        .al
        .autsiz
        .databank ?

        phx
        phy
        ldy #6
        
          _Loop
          lda aMovingMapSprites.wActiveSpriteOffset,b,y
          cmp #$FFFF
          beq +

            tax
            stz aActiveSpriteSystem.aTypeOffset,b,x

          +
          dec y
          dec y
          bpl _Loop

        jsl rlUnknown91C611

        ply
        plx
        clc
        rts

        .databank 0

      rlUnknown91C611 ; 91/C611

        .al
        .autsiz
        .databank ?

        lda #$FFFF
        sta aMovingMapSprites.wActiveSpriteOffset,b 
        sta aMovingMapSprites.wActiveSpriteOffset+2,b
        sta aMovingMapSprites.wActiveSpriteOffset+4,b
        sta aMovingMapSprites.wActiveSpriteOffset+6,b

        sep #$20
        lda #$10
        sta $04CA,b
        rep #$20

        ldx #0
        jsl $809933

        sep #$20
        lda #$10
        sta $04CD,b
        rep #$20

        ldx #3
        jsl $809933
        rtl

        .databank 0

      rsUnknown91C641 ; 91/C641

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        cpy #$0201
        bcs _End

        sty $00
        ldy #0
        
        _Loop
        lda [$24],y
        sta $0100,b,x
        inc x
        inc x
        inc y
        inc y
        cpy $00
        bcc _Loop
        
        _End
        plp
        rts

        .databank 0

      rsEventCommand2D ; 91/C65D

        .al
        .autsiz
        .databank ?

        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1

        inc y
        inc y
        lda [$30],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        asl a
        tax

        inc y
        phy

        lda [$30],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        asl a
        tay

        jsr rsUnknown91C641

        ply
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand2E ; 91/C68A

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$828BEA)<<8
        sta $62+1
        lda #<>$828BEA
        sta $62
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #11
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand2F ; 91/C6A6

        .al
        .autsiz
        .databank ?

        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1

        inc y
        inc y
        lda [$30],y
        sta [$24]
        inc y
        inc y
        sty wActiveEventOffset,b

        clc
        rts

        .databank 0

      rsEventCommand30 ; 91/C6BC

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$8292B6)<<8
        sta $62+1
        lda #<>$8292B6
        sta $62
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rlUnknown91C6D8 ; 91/C6D8

        .al
        .autsiz
        .databank ?

        pea #<>(+)-1
        jmp ($0033)

        +
        rtl

        .databank 0

      rsEventCommand32 ; 91/C6DF

        .al
        .autsiz
        .databank ?

        clc
        rts

        .databank 0

      rsEventCommand33 ; 91/C6E1

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30
        jsl rlActiveSpriteEngineReset
        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand31 ; 91/C6ED

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30
        ply 
        plp
        clc
        rts

        .databank 0

      rsEventCommand37 ; 91/C6F5

        .al
        .autsiz
        .databank ?

        php
        phy

        jsl $80C32C

        stz $7F
        stz $81
        stz $83
        stz $85
        stz $87
        stz $89

        lda #$00FF
        jsl $91A7BC

        sep #$20
        lda #$17
        sta $96
        sta $98
        rep #$20

        jsl $8780AA

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand38 ; 91/C720

        .al
        .autsiz
        .databank ?

        php
        phy

        jsl $80C35D

        stz $7F
        stz $81
        stz $83
        stz $85

        sep #$20
        lda #$11
        sta $96
        sta $98
        lda #0
        sta $7D
        lda $71
        and #$1F
        sta $2101,b
        sta $71
        rep #$20

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand39 ; 91/C749

        .al
        .autsiz
        .databank ?

        ; SET_CAMERA_TO_EVENT_UNIT_SLOT_1

        php
        lda wEventUnitSlot1XCoordinate
        cmp #$FFFF
        beq +

          lda wEventUnitSlot1YCoordinate
          cmp #$FFFF
          beq +

            lda wEventUnitSlot1XCoordinate
            asl a
            asl a
            asl a
            asl a
            sec
            sbc wMapScrollXPixels,b
            sta wCursorXOffset,b

            lda wEventUnitSlot1YCoordinate
            asl a
            asl a
            asl a
            asl a
            sec
            sbc wMapScrollYPixels,b
            sta wCursorYOffset,b

        +
        plp
        clc
        rts

        .databank 0

      rsEventCommand3A ; 91/C77D

        .al
        .autsiz
        .databank ?

        ; SET_CAMERA_POSITION

        php
        lda [lR22],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta wMapXOffset,b

        inc y
        lda [lR22],y
        and #$00FF
        asl a
        asl a
        asl a
        asl a
        sta wMapYOffset,b

        inc y
        sty wActiveEventOffset,b

        lda #$0080
        sta wCursorXOffset,b
        sta wCursorYOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand3B ; 91/C7A7

        .al
        .autsiz
        .databank ?

        ; Sets map state? $80 = not interactable?

        php
        phy
        lda [lR22],y
        and #$003F
        sta wScreenFadingProcInput,b

        lda [lR22],y
        ldx #3
        bit #$0080
        bne +

          ldx #2
          bit #$0040
          bne +

            ldx #0

        +
        stx $0D77,b

        lda #<>$80B122
        sta aProcSystem.wInput0,b

        lda #(`procUnknown828364)<<8
        sta lR44+1
        lda #<>procUnknown828364
        sta lR44
        jsl rlProcEngineCreateProc

        lda #(`procUnknown828A30)<<8
        sta lR44+1
        lda #<>procUnknown828A30
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y

        plp
        clc
        rts

        .databank 0

      rsEventCommand3C ; 91/C7F0

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$828CA3)<<8
        sta lR44+1
        lda #<>$828CA3
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        plp
        clc
        rts

        .databank 0

      rsEventCommand3D ; 91/C804

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$828ECB)<<8
        sta lR44+1
        lda #<>$828ECB
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        plp
        clc
        rts

        .databank 0

      rsEventCommand3E ; 91/C818

        .al
        .autsiz
        .databank ?

        php
        phy

        lda #(`$828D52)<<8
        sta lR44+1
        lda #<>$828D52
        lda lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand3F ; 91/C834

        .al
        .autsiz
        .databank ?

        ; SCRIPTED_MAP_SCROLL

        php
        phy
        lda [lR22],y
        sta wEventMapScrollScript,b
        inc y
        lda [lR22],y
        sta wEventMapScrollScript+1,b

        inc y
        inc y
        lda [lR22],y
        and #$00FF
        sta wEventMapScrollSpeed,b

        lda #(`procMapScroll)<<8
        sta lR44+1
        lda #<>procMapScroll
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand40 ; 91/C865

        .al
        .autsiz
        .databank ?

        ; MAP_SCROLL

        php
        phy

        lda wMapScrollXPixels,b
        lsr a
        lsr a
        lsr a
        lsr a
        sta wR2

        lda wMapScrollYPixels,b
        lsr a
        lsr a
        lsr a
        lsr a
        sta wR3

        lda [lR22],y
        and #$00FF
        sta wR4

        inc y
        lda [lR22],y
        and #$00FF
        sta wR5

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        jsl rlCreateMapScrollScriptFromCoordinates

        lda lR18
        sta wEventMapScrollScript,b
        lda lR18+1
        sta wEventMapScrollScript+1,b

        lda #(`procMapScroll)<<8
        sta lR44+1
        lda #<>procMapScroll
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand41 ; 91/C8B8

        .al
        .autsiz
        .databank ?

        php
        phy

        lda wEventUnitSlot1XCoordinate
        cmp #$FFFF
        beq _End

          lda wEventUnitSlot1YCoordinate
          cmp #$FFFF
          beq _End

            lda wEventUnitSlot1XCoordinate
            sta wR0
            lda wEventUnitSlot1YCoordinate
            sta wR1

            jsl $88C473

            lda wR0
            sta wR4
            lda wR1
            sta wR5

            lda wMapScrollXPixels,b
            lsr a
            lsr a
            lsr a
            lsr a
            sta wR2

            lda wMapScrollYPixels,b
            lsr a
            lsr a
            lsr a
            lsr a
            sta wR3

            lda [lR22],y
            and #$00FF
            sta wR1

            jsl rlCreateMapScrollScriptFromCoordinates

            lda lR18
            sta wEventMapScrollScript,b
            lda lR18+1
            lda wEventMapScrollScript+1,b

            lda #(`procMapScroll)<<8
            sta lR44+1
            lda #<>procMapScroll
            sta lR44
            jsl rlEventEngineCreateProc

        _End
        pla
        clc
        adc #1
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand42 ; 91/C925

        .al
        .autsiz
        .databank ?

        ; FILL_EVENT_UNIT_SLOT

        php
        lda [lR22],y
        tax

        inc y
        inc y
        lda [lR22],y
        and #$00FF

        inc y
        phy

        cmp #0
        bne +

          txa
          jsl rlFillEventUnitSlot1
          bra ++

        +
        txa
        jsl rlFillEventUnitSlot2

        +
        ply
        plp

        clc
        rts

        .databank 0

      rlFillEventUnitSlot1 ; 91/C947

        .al
        .autsiz
        .databank ?

        jsl rlGetUnitRAMDataPointerByID
        bcs +

          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnitSlot1ID,b
          jsl rlGetSelectedUnitDeploymentOffset

          tax
          lda aDeploymentTable._XTilePosition,x
          sta wEventUnitSlot1XCoordinate
          lda aDeploymentTable._YTilePosition,x
          sta wEventUnitSlot1YCoordinate
          bra ++

        +
        lda #$FF
        sta wEventUnitSlot1XCoordinate
        sta wEventUnitSlot1YCoordinate
        stz wEventUnitSlot1ID,b

        +
        rtl

        .databank 0

      rlFillEventUnitSlot2 ; 91/C979

        .al
        .autsiz
        .databank ?

        jsl rlGetUnitRAMDataPointerByID
        bcs +

          lda wSelectedUnitDataRAMPointer,b
          sta wEventUnitSlot2ID,b
          jsl rlGetSelectedUnitDeploymentOffset

          tax
          lda aDeploymentTable._XTilePosition,x
          sta wEventUnitSlot2XCoordinate
          lda aDeploymentTable._YTilePosition,x
          sta wEventUnitSlot2YCoordinate
          bra ++

        +
        lda #$FFFF
        sta wEventUnitSlot2XCoordinate
        sta wEventUnitSlot2YCoordinate
        stz wEventUnitSlot2ID,b
        
        +
        rtl

        .databank 0

      rsEventCommand43 ; 91/C9AB

        .al
        .autsiz
        .databank ?

        php
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        inc y
        lda [lR22],y
        and #$00FF
        tax

        bne +

        stz wEventUnitSlot1ID,b
        bra ++
        
        +
        stz wEventUnitSlot2ID,b
        
        +
        inc y
        phy

        phx
        jsl $848776
        plx
        bcs _End

        lda wSelectedUnitDataRAMPointer,b
        cpx #0
        bne +

        sta wEventUnitSlot1ID,b
        bra _End

        +
        sta wEventUnitSlot2ID,b

        _End
        ply 
        plp

        clc
        rts

        .databank 0

      rsEventCommand44 ; 91/C9EA

        .al
        .autsiz
        .databank ?

        ; FACTION_UNIT_DEATH

        php
        lda [lR22],y
        and #$00FF
        sta aProcSystem.wInput0,b

        inc y
        lda [lR22],y
        and #$00FF
        cmp #$00FF
        bne +

          lda #$FFFF

        +
        sta aProcSystem.wInput1,b

        inc y
        lda [lR22],y
        sta aProcSystem.wInput2,b

        inc y
        inc y
        phy

        lda #(`$87C249)<<8
        sta lR44+1
        lda #<>$87C249
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand45 ; 91/CA1F

        .al
        .autsiz
        .databank ?

        ; RUN_ASM

        php
        phy
        rep #$30
        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        jsl +

        pla
        clc
        adc #3
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        +
        jml [lR18]

        .databank 0

      rsEventCommand48 ; 91/CA3F

        .al
        .autsiz
        .databank ?

        php
        phy

        phy
        lda $053E,b
        sta $7EA7C5
        lda #$00FF
        sta $053E,b
        ply

        lda [$30],y
        and #$00FF
        sta $00
        asl a
        clc
        adc $00
        tax

        inc y
        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1

        phx
        jsl $91A9BB
        plx

        lda lMapMenuRAMEntryPointer,b
        sta $7E93AA,x
        lda lMapMenuRAMEntryPointer+1,b
        sta $7E93AB,x

        lda #3
        ora $7E
        sta $7E

        lda $96
        ora #$0004
        sta $96

        lda $98
        ora #$0004
        sta $98

        sep #$20
        lda $74
        ora #$08
        sta $74
        rep #$20

        jsl $91A7DF

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand49 ; 91/CAA9

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30
        lda [$30],y
        and #$00FF
        sta $00
        asl a
        clc
        adc $00
        tax

        lda $7E93AA,x
        sta lMapMenuRAMEntryPointer,b
        lda $7E93AB,x
        sta lMapMenuRAMEntryPointer+1,b

        lda #0
        sta $7E93AA,x
        rep #$20

        jsl $8785A4

        ply
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand46 ; 91/CADC

        .al
        .autsiz
        .databank ?

        php
        phy
        jsl rlClearAllFadeProcs

        lda #(`procEventFadeInByTimer)<<8
        sta lR44+1
        lda #<>procEventFadeInByTimer
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand47 ; 91/CAF8

        .al
        .autsiz
        .databank ?

        php
        phy
        jsl rlClearAllFadeProcs

        lda #(`procEventFadeOutByTimer)<<8
        sta lR44+1
        lda #<>procEventFadeOutByTimer
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand34 ; 91/CB14

        .al
        .autsiz
        .databank ?

        ; PAUSE

        php
        phy

        lda #(`procEventPause)<<8
        sta lR44+1
        lda #<>procEventPause
        sta lR44
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand35 ; 91/CB2D

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30

        lda #(`$829245)<<8
        sta $62+1
        lda #<>$829245
        sta $62
        jsl rlEventEngineCreateProc

        ply
        plp

        clc
        rts

        .databank 0

      rsEventCommand36 ; 91/CB43

        .al
        .autsiz
        .databank ?

        php
        phy
        rep #$30

        lda #(`$82925E)<<8
        sta $62+1
        lda #<>$82925E
        sta $62
        jsl rlEventEngineCreateProc

        ply
        inc y
        inc y
        sty wActiveEventOffset,b

        plp
        clc
        rts

        .databank 0

      rsEventCommand4A ; 91/CB5E

        .al
        .autsiz
        .databank ?

        ; RUN_EVENT_CONDITION

        php
        phb

        sep #$20
        lda lR22+2
        pha
        plb
        rep #$20

        tya
        clc
        adc lR22
        tay

        jsl rlUnknown86816B

        tya
        sec
        sbc lR22
        tay

        plp
        plb

        clc
        rts

        .databank 0

      rsEventCommand4B ; 91/CB7A

        .al
        .autsiz
        .databank ?

        ; SET_FLAG_IF_IN_CHAPTER

        php
        phb
        phy
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        tax

        lda wR0
        jsl rlGetSpecifiedChaptersRAMPointer
        bcs +

          txa
          jsl rlSetEventFlag

        +
        pla
        clc
        adc #2
        tay

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4C ; 91/CBA2

        .al
        .autsiz
        .databank ?

        ; UNSET_FLAG_IF_IN_CHAPTER

        php
        phb
        phy
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        tax

        lda wR0
        jsl rlGetSpecifiedChaptersRAMPointer
        bcs +

          txa
          jsl rlUnsetEventFlag

        +
        pla
        clc
        adc #2
        tay

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4D ; 91/CBCA

        .al
        .autsiz
        .databank ?

        ; RUN_EVENT_CONDITION_UNSKIPPABLE

        php
        phb

        jsr rsEventCommand4A

        phy
        lda #(`procUnknown828A93)<<8
        sta lR44+1
        lda #<>procUnknown828A93
        sta lR44
        jsl rlEventEngineCreateProc
        ply

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4E ; 91/CBE3

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        lda [$30],y
        sta $24
        inc y
        lda [$30],y
        sta $24+1

        lda #2
        jsl $91811C
        ldx #0
        jsl $8ACE50

        phy
        lda #(`$828AC3)<<8
        sta $62+1
        lda #<>$828AC3
        sta $62
        jsl rlEventEngineCreateProc
        ply

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand4F ; 91/CC15

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        lda #<>$80B3A2
        sta aProcSystem.wInput0,b

        lda #(`procUnknown8282D3)<<8
        sta lR44+1
        lda #<>procUnknown8282D3
        sta lR44
        jsl rlProcEngineCreateProc

        ply
        plb
        plp
        
        clc
        rts

        .databank 0

      rsEventCommand50 ; 91/CC31

        .al
        .autsiz
        .databank ?

        ; transition from world map to chapter name display?

        php
        phb
        phy

        lda wCurrentChapter,b
        cmp #$FFFF
        beq +

          stz $0302,b

          lda #<>$80F2BE
          sta aProcSystem.wInput0,b
          lda #2
          sta wScreenFadingProcInput,b

          lda #(`procUnknown828364)<<8
          sta lR44+1
          lda #<>procUnknown828364
          sta lR44
          jsl rlProcEngineCreateProc

          _End
          ply
          plb
          plp

          clc
          rts

        +
        jsl $8B80CB
        bra _End

        .databank 0

      rsEventCommand51 ; 91/CC64

        .al
        .autsiz
        .databank ?

        ; WM_SCROLL

        php
        phy

        lda #(`procWorldMapScroll)<<8
        sta lR44+1
        lda #<>procWorldMapScroll
        sta lR44
        jsl rlEventEngineCreateProc

        pla
        clc
        adc #4
        sta wActiveEventOffset,b
        tay

        plp
        clc
        rts

        .databank 0

      rsEventCommand52 ; 91/CC80

        .al
        .autsiz
        .databank ?

        ; WM_MARKER

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        inc y
        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y
        and #$00FF
        tay

        jsl rlUnknown8B84E5

        ply
        inc y
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand53 ; 91/CCAD

        .al
        .autsiz
        .databank ?

        ; WM_CLEAR_MARKER

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        jsl rlUnknown8B86BF

        ply
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand54 ; 91/CCC0

        .al
        .autsiz
        .databank ?

        ; WM_LOAD_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y

        jsl rlLoadPortraitIntoSlot

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand55 ; 91/CCD8

        .al
        .autsiz
        .databank ?

        ; WM_FADE_IN_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        jsl rlFadeInPortraitSlot

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand56 ; 91/CCFD

        .al
        .autsiz
        .databank ?

        ; WM_FADE_OUT_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        jsl rlFadeOutPortraitSlot

        ply
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand57 ; 91/CD10

        .al
        .autsiz
        .databank ?

        ; WM_MOVE_PORTRAIT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF
        tax

        inc y
        lda [lR22],y
        and #$00FF
        sta wR0

        inc y
        lda [lR22],y
        and #$00FF
        sta wR1

        jsl $8B8261

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand58 ; 91/CD35

        .al
        .autsiz
        .databank ?

        ; WM_DIALOGUE

        php
        phb
        phy

        phy
        jsl rlResetDialogueEngine
        ply

        lda [lR22],y
        sta lR18
        inc y
        lda [lR22],y
        sta lR18+1

        lda #0
        jsl rlUnknown91811C

        lda #(`$8B9275)<<8
        sta aDialogue.lHDMARoutine+1,b
        lda #<>$8B9275
        sta aDialogue.lHDMARoutine,b

        ldx #0
        jsl rlUnknown8B91F6

        phy
        lda #(`procUnknown828AC3)<<8
        sta lR44+1
        lda #<>procUnknown828AC3
        sta lR44
        jsl rlEventEngineCreateProc
        ply

        ply
        inc y
        inc y
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand59 ; 91/CD79

        .al
        .autsiz
        .databank ?

        php
        phb

        phy
        jsl $8B87A0
        ply

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5A ; 91/CD85

        .al
        .autsiz
        .databank ?

        ; Clears BG3HOFS hdma?

        php
        phb

        phy
        jsl rlUnknown8B87C5
        ply

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5B ; 91/CD91

        .al
        .autsiz
        .databank ?

        ; WM_HIGHLIGHT

        php
        phb
        phy

        lda [lR22],y
        and #$00FF

        jsl rlHighlightWorldMapPart

        ply
        inc y

        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5C ; 91/CDA3

        .al
        .autsiz
        .databank ?

        ; WM_CLEAR_HIGHLIGHT

        php
        phb

        phy
        jsl rlClearHighlightWorldMapPart
        ply

        ply
        plb

        clc
        rts

        .databank 0

      rsEventCommand01 ; 91/CDAF

        .al
        .autsiz
        .databank ?

        lda #2
        sta $171C,b

        clc
        rts

        .databank 0

      rsEventCommand5D ; 91/CDB7

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        stz $0D7B,b
        lda #1
        sta $1832,b

        lda $0CC2,b
        bne +

          lda $1B49,b
          and #$FFFE
          bne +

            stz $1832,b
            lda #$00D0
            jsl $808FA3

        +
        lda #(`$828865)<<8
        sta $62+1
        lda #<>$828865
        sta $62
        jsl rlEventEngineCreateProc

        lda #$8000
        tsb $171A,b

        lda #$0010
        tsb $0788,b

        lda $04EA,b
        ora #$0005
        sta $04EA,b

        ply
        plb
        plp

        clc
        rts

        .databank 0

      rsEventCommand5E ; 91/CE02

        .al
        .autsiz
        .databank ?

        php
        phb
        phy

        stz $0302,b
        lda #$C0B6
        sta $0ECF,b

        lda #(`$8282D3)<<8
        sta $62+1
        lda #<>$8282D3
        sta $62
        jsl rlProcEngineCreateProc

        lda $04EA,b
        and #$FFFA
        sta $04EA,b

        ply
        plb
        plp

        clc
        rts

        .databank 0

        ; 91/CE2A



























