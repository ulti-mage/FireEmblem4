
    .weak

      rlGetTextSpeedOption        :?= address($87BEF1)
      rlUnknown85AB3F             :?= address($85AB3F)
      rlUnknown878459             :?= address($878459)
      rlDMAByPointer              :?= address($80A58C)
      rlUnknown808FAD             :?= address($808FAD)
      rlUnknown808FA3             :?= address($808FA3)
      rsEventCommand52            :?= address($91CC80)
      rsEventCommand53            :?= address($91CCAD)
      rsEventCommand54            :?= address($91CCC0)
      rsEventCommand55            :?= address($91CCD8)
      rsEventCommand56            :?= address($91CCFD)
      rsEventCommand57            :?= address($91CD10)
      rsEventCommand5B            :?= address($91CD91)
      rsEventCommand5C            :?= address($91CDA3)


    .endweak


    .section Dialogue1Section

      procUnknown918000 ; 91/8000

        .structProcInfo "MM", rlProcUnknown918000Init, rlProcUnknown918000Cycle, aProcUnknown918000Code

      rlProcUnknown918000Init ; 91/8008

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlProcUnknown918000Cycle ; 91/8009

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      aProcUnknown918000Code ; 91/800A

        ; This isnt proc code.

        rtl

      rlResetDialogueEngine ; 91/800B

        .al
        .autsiz
        .databank ?

        stz aDialogue.wStatus,b
        stz aDialogue.wCommandCycle,b
        stz aDialogue.wPauseTimer,b
        stz aDialogue.wUnknown00188C,b
        stz aDialogue.wUnknown00188E,b
        stz aDialogue.wUnknown0018A3,b
        stz aDialogue.wUnknown0018A5,b
        stz aDialogue.wUnknown0018A7,b
        stz aDialogue.wFreeHDMATable,b

        jsl rlDialogueClearActivePointerStack

        sep #$20
        stz aDialogue.bFontPage,b
        stz aDialogue.wTextSound,b
        rep #$20

        lda #0
        sta aDialogue.wSlotOffset,b

        stz aDialogue.wUnknown001890,b
        stz aDialogue.wGraphicBufferPixelOffset,b
        stz aDialogue.wStringPixelLength,b

        lda #2
        sta aDialogue.wUnknown001892,b

        stz aDialogue.wBaseTile,b

        lda #TilemapEntry($0FF, 0, false, false, false)
        sta aDialogue.wClearTile,b

        jsr rsDialogueClearCharacterGraphicsBuffer

        lda #(`rlUnknown91949E)<<8
        sta aDialogue.lHDMARoutine+1,b
        lda #<>rlUnknown91949E
        sta aDialogue.lHDMARoutine,b

        lda #(`g2bppDialogueFont)<<8
        sta aDialogue.lFontGraphics+1,b
        lda #<>g2bppDialogueFont
        sta aDialogue.lFontGraphics,b

        lda #(`aDialogueFontWidth)<<8
        sta aDialogue.lFontWidthTable+1,b
        lda #<>aDialogueFontWidth
        sta aDialogue.lFontWidthTable,b

        lda #$8000 >> 1
        sta aDialogue._Slot[0].wVRAMAddress,b
        lda #$9000 >> 1
        sta aDialogue._Slot[1].wVRAMAddress,b

        ldx #0
        lda #<>$7E840E
        jsl +

        ldx #size(aDialogue._Slot[0])
        lda #<>$7E878E

        +
        pha
        lda #(`$7E840E)<<8
        sta aDialogue._Slot[0].lBGBufferPosition+1,b,x
        pla

        sta aDialogue._Slot[0].lBGBufferPosition,b,x
        lda #(6 << 8 | 28)
        sta aDialogue._Slot[0].wDisplayArea,b,x

        _80A6
        lda #0
        sta aDialogue._Slot[0].wBGBufferOffset,b,x
        sta aDialogue._Slot[0].wVRAMTileOffset,b,x
        sta aDialogue._Slot[0].wUnknown0018E1,b,x
        sta aDialogue.wUnknown001890,b
        sta aDialogue.wGraphicBufferPixelOffset,b
        sta aDialogue.wStringPixelLength,b
        rtl

        .databank 0

      rlUnknown9180BC ; 91/80BC

        .al
        .autsiz
        .databank ?

        stz aDialogue.wStatus,b
        stz aDialogue.wPauseTimer,b
        stz aDialogue.wUnknown0018A3,b
        stz aDialogue.wUnknown0018A5,b
        stz aDialogue.wUnknown0018A7,b
        rtl

        .databank 0

      rlDialogueStartHDMA ; 91/80CC

        .al
        .autsiz
        .databank ?

        lda #0
        sta aDialogueHDMATable1
        sta aDialogueHDMATable2

        jsl rlUnknown9196A9

        lda #(`rlUnknown91949E)<<8
        sta aDialogue.lHDMARoutine+1,b
        lda #<>rlUnknown91949E
        sta aDialogue.lHDMARoutine,b
        rtl

        .databank 0

      rlDialogueFreeHDMA ; 91/80E8

        .al
        .autsiz
        .databank ?

        lda #4
        jsl rlHDMAEngineFreeEntryByIndex
        rtl

        .databank 0

      rlUnknown9180F0 ; 91/80F0

        .al
        .autsiz
        .databank ?

        ; Converts coords to tile index?

        pha
        and #$FF00
        lsr a
        lsr a
        lsr a
        sta wR0
        pla
        and #$00FF
        clc
        adc wR0
        asl a
        rtl

        .databank 0

      rlUnknown918102 ; 91/8102

        .al
        .autsiz
        .databank ?

        lda aDialogue.wStatus,b
        beq +

          sec
          bra _End

        +
        jsl rlUnknown918114
        clc

        _End
        rtl

        .databank 0

      rlUnknown918110 ; 91/8110

        .al
        .autsiz
        .databank ?

        jsl rlResetDialogueEngine

      rlUnknown918114 ; 91/8114

        .al
        .autsiz
        .databank ?

        lda #0
        jsl rlUnknown918127
        rtl

        .databank 0

      rlUnknown91811C ; 91/811C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = ?
        ; lR18 = dialogue pointer

        php
        jsl rlUnknown918127
        jsl rlDialogueStartHDMA
        plp
        rtl

        .databank 0

      rlUnknown918127 ; 91/8127

        .al
        .autsiz
        .databank ?

        php
        sta aDialogue.wUnknown0018D0,b
        lda lR18
        sta aDialogue.lActivePointer,b
        lda lR18+1
        sta aDialogue.lActivePointer+1,b

        sep #$20
        stz aDialogue.bFontPage,b
        stz aDialogue.wTextSound,b
        rep #$20

        lda #0
        sta aDialogue.wSlotOffset,b

        ; Clear both slots
        jsl rlUnknown918166

        jsr rsDialogueGetTextSpeed
        sta aDialogue.wTextSpeed,b
        sta aDialogue.wPauseTimer,b

        stz aDialogue.wUnknown001890,b
        stz aDialogue.wGraphicBufferPixelOffset,b
        stz aDialogue.wStringPixelLength,b
        stz aDialogue.wFreeHDMATable,b

        lda #DialogueStatusEnabled
        sta aDialogue.wStatus,b

        plp
        rtl

        .databank 0

      rlUnknown918166 ; 91/8166

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        lda #$FFFF
        sta aDialogue._Slot[0].wUnknown0018E3,b
        sta aDialogue._Slot[0].wPortraitID,b
        sta aDialogue._Slot[0].wUnknown0018E7,b
        sta aDialogue._Slot[0].wUnknown0018E9,b
        sta aDialogue._Slot[1].wUnknown0018E3,b
        sta aDialogue._Slot[1].wPortraitID,b
        sta aDialogue._Slot[1].wUnknown0018E7,b
        sta aDialogue._Slot[1].wUnknown0018E9,b
        plp
        rtl

        .databank 0

      rlUnknown918186 ; 91/8186

        .al
        .autsiz
        .databank ?

        rep #$30
        lda #0
        sta aDialogue.wSlotOffset
        sta aDialogue._Slot[0].wUnknown0018E1
        sta aDialogue.wPauseTimer
        rtl

        .databank 0

      rlUnknown918198 ; 91/8198

        .al
        .autsiz
        .databank ?

        lda #DialogueStatusWaitForInput
        trb aDialogue.wStatus,b

        lda aDialogue.wPauseTimer,b
        beq +

          lda aDialogue.wTextSpeed,b
          sta aDialogue.wPauseTimer,b
          lda #0
          sta aDialogue.wUnknown001890,b

        +
        rtl

        .databank 0

      rlUnknown9181B0 ; 91/81B0

        .al
        .autsiz
        .databank ?

        lda aDialogue.wStatus,b
        bit #DialogueStatusWaitForInput
        beq +

          lda #DialogueStatusWaitForInput
          trb aDialogue.wStatus,b
          lda aDialogue.wTextSpeed,b
          bra ++

        +
        lda aDialogue.wStatus,b
        bit #DialogueStatusPreventASpeedUp
        bne _End

          lda aDialogue.wPauseTimer,b
          beq _End

            cmp #$FFFF
            beq _End

              lda #$FFFF

              +
              sta aDialogue.wPauseTimer,b
              lda #0
              sta aDialogue.wUnknown001890,b

        _End
        rtl

        .databank 0

      rsUnknown9181E2 ; 91/81E2

        .al
        .autsiz
        .databank ?

        lda aDialogue.wPauseTimer,b
        cmp #$FFFF
        beq +

          and #$FFFF
          bne +

            lda aDialogue.wTextSpeed,b
            sta aDialogue.wPauseTimer,b

        +
        rts

        .databank 0

      rlUnknown9181F6 ; 91/81F6

        .al
        .autsiz
        .databank ?

        php
        rep #$30

        lda #0
        sta aDialogue.wUnknown0018C9,b

        lda #DialogueStatusToggleMouthMove
        trb aDialogue.wStatus,b

        lda #(DialogueStatusCaretLight | DialogueStatusCaretDark)
        trb aDialogue.wStatus,b

        jsr rsUnknown91830E
        bcc +

          jml _End

        +
        lda aDialogue.wPauseTimer,b
        bne +

          brl _End

        +
        cmp #$FFFF
        beq _HandleEncoding

        lda aDialogue.wStatus,b
        bit #DialogueStatusPreventASpeedUp
        bne +

          lda aDialogue.wCommandCycle,b
          bne +

            lda wJoy1New
            bit #JOY_Start
            beq +

              lda $04BA,b
              bne _825E

                lda aDialogue.wUnknown0018D0,b
                cmp #3
                beq _825E

                  jsl rlUnknown9182F0
                  bra _8295

        +
        lda aDialogue.wStatus,b
        bit #DialogueStatusPreventBSkipping
        bne _825E

          lda wJoy1New
          bit #(JOY_B | JOY_A)
          beq _825E

            jsl $9181B0
            brl _End

        _825E
        lda aDialogue.wStatus,b
        bit #DialogueStatusWaitForInput
        beq _827C

          ldx #DialogueStatusCaretLight
          lda wVBlankEnabledFramecount
          and #$001F
          cmp #12
          bcs +

            ldx #DialogueStatusCaretDark

          +
          txa
          tsb aDialogue.wStatus,b
          bra _End

        _827C
        dec aDialogue.wPauseTimer,b
        beq _HandleEncoding

          jml _End

        _HandleEncoding
        jsr rsDialogueHandleGraphicBufferClearing

          _Loop
          ldx aDialogue.wSlotOffset,b
          lda aDialogue.lActivePointer,b
          sta lR18
          lda aDialogue.lActivePointer+1,b
          sta lR18+1

          _8295
          ldy #0
          lda [lR18],y
          and #$00FF
          cmp #$0010
          bcs _Character

            ; Command
            jsr rsRunDialogueCommand

            ldx aDialogue.wSlotOffset,b
            lda aDialogue._Slot[0].wUnknown0018D2,b,x
            and #~$0001
            sta aDialogue._Slot[0].wUnknown0018D2,b,x
            bcc _Loop
            bra _End

          _Character
          jsr rsDialogueHandleCharacter

          ldx aDialogue.wSlotOffset,b
          lda aDialogue._Slot[0].wUnknown0018D2,b,x
          ora #$0001
          sta aDialogue._Slot[0].wUnknown0018D2,b,x
          bcc _Loop

        lda aDialogue.wCurrentCharacter,b
        cmp #$00BF
        beq _End

          lda #DialogueStatusToggleMouthMove
          tsb aDialogue.wStatus,b

        _End
        jsr rsUnknown919855
        jsr rsUnknown91874E
        phk
        pea #<>(+)-1
        jml [aDialogue.lHDMARoutine]

        +
        lda aDialogue.wFreeHDMATable,b
        eor #$0001
        sta aDialogue.wFreeHDMATable,b
        jsl rlDialogueSwapActiveHDMATable

        plp
        rtl

        .databank 0

      rlUnknown9182F0 ; 91/82F0

        .al
        .autsiz
        .databank ?

        jsl rlUnknown85AB3F
        jsl rlDialogueClearActivePointerStack

        lda #DialogueStatusWaitForInput
        trb aDialogue.wStatus,b

        stz aDialogue.wCommandCycle,b

        lda #(`aUnknown91830C)<<8
        sta lR18+1
        lda #<>aUnknown91830C
        sta lR18
        rtl

        .databank 0

      aUnknown91830C ; 91/830C

        .word $0100

      rsUnknown91830E ; 91/830E

        .al
        .autsiz
        .databank ?

        ; Returns CLC if the pause timer is greater than 1

        ldx aDialogue.wSlotOffset,b
        lda aDialogue.wPauseTimer,b
        cmp #$FFFF
        beq +

          cmp #1
          beq +

            jml _CLC

        +
        lda aDialogue.wStatus,b
        bit #DialogueStatusAutoscroll
        beq +

          inc aDialogue.wUnknown00188E,b
          lda aDialogue.wUnknown00188E,b
          and #$7FFF
          cmp aDialogue.wUnknown00188C,b
          bcc _CLC

            stz aDialogue.wUnknown00188E,b
            lda aDialogue._Slot[0].wUnknown0018E1,b,x
            clc
            adc #1
            sta aDialogue._Slot[0].wUnknown0018E1,b,x
            bra _CLC

        +
        lda aDialogue._Slot[0].wUnknown0018E1,b,x
        and #$000F
        beq _CLC

          lda aDialogue.wUnknown00188C,b
          beq +

            inc aDialogue.wUnknown00188E,b
            lda aDialogue.wUnknown00188E,b
            and #$7FFF
            cmp aDialogue.wUnknown00188C,b
            bcc _SEC

            stz aDialogue.wUnknown00188E,b
            lda aDialogue._Slot[0].wUnknown0018E1,b,x
            clc
            adc #1
            sta aDialogue._Slot[0].wUnknown0018E1,b,x
            bra ++

          +
          lda aDialogue._Slot[0].wUnknown0018E1,b,x
          clc
          adc #2
          sta aDialogue._Slot[0].wUnknown0018E1,b,x

          +
          and #$000F
          beq _SEC

            lda aDialogue._Slot[0].wUnknown0018E1,b,x
            and #$000E
            cmp #$000E
            bne _SEC

              jsr rsDialogueClearNextLineBGBuffer
              jsr rsDialogueSetDefaultPauseTimer

              lda aDialogue.wUnknown0018D0,b
              cmp #2
              beq _SEC

                cmp #3
                beq _SEC

                  jsl rlUnknown878459

          _SEC
          sec
          bra +

        _CLC
        clc

        +
        rts

        .databank 0

      rlUnknown9183A7 ; 91/83A7

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlUnknown9183A8 ; 91/83A8

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlUnknown9183A9 ; 91/83A9

        .al
        .autsiz
        .databank ?

        lda aDialogue._Slot[0].wVRAMTileOffset,b
        asl a
        asl a
        asl a
        asl a
        sta wR0
        lda aDialogue._Slot[0].wVRAMAddress,b
        sta wR1
        lda aDialogue.lUnknown00187F,b
        sta lR18
        lda aDialogue.lUnknown00187F+1,b
        sta lR18+1
        jsl rlDMAByPointer
        lda #$0010
        tsb bUnknown000521,b
        rtl

        .databank 0

      rlUnknown9183CC ; 91/83CC

        .al
        .autsiz
        .databank ?

        lda lR18
        sta aDialogue.lUnknown00187F,b
        lda lR18+1
        sta aDialogue.lUnknown00187F+1,b
        rtl

        .databank 0

      rlUnknown9183D7 ; 91/83D7

        .al
        .autsiz
        .databank ?

        lda lR18
        sta aDialogue.lActivePointer,b
        lda lR18+1
        sta aDialogue.lActivePointer+1,b
        rtl

        .databank 0

      rsDialogueHandleCharacter ; 91/83E2

        .al
        .autsiz
        .databank ?

        lda $1753,b
        beq +

          sep #$20
          lda #$0F
          sta bBufferINIDISP
          rep #$20

        +
        stz aDialogue.wCommandCycle,b

        lda #DialogueStatusActive
        tsb aDialogue.wStatus,b

        jsr rsUnknown9184CD
        jsr rsDialogueWriteBaseTileIndexToBGBuffer

        inc aDialogue.lActivePointer,b

        lda aDialogue.wPauseTimer,b
        cmp #$FFFF
        beq +

          lda aDialogue.wTextSpeed,b
          sta aDialogue.wPauseTimer,b

          _SEC
          sec
          rts

        +
        lda aDialogue.wStatus,b
        bit #DialogueStatusInstantSpeedUp
        beq +

          inc aDialogue.wUnknown001890,b

          lda aDialogue.wUnknown001890,b
          cmp aDialogue.wUnknown001892,b
          bcc _CLC

        +
        stz aDialogue.wUnknown001890,b
        bra _SEC

        _CLC
        clc
        rts

        .databank 0

      rsDialogueIncrementVRAMTileOffset ; 91/842B

        .al
        .autsiz
        .databank ?

        ; Increment the VRAM tile offset and if it 
        ; goes over the assinged area, reset the offset.

        lda aDialogue._Slot[0].wVRAMTileOffset,b,x
        clc
        adc #2
        sta aDialogue._Slot[0].wVRAMTileOffset,b,x

        _CheckWrap ; 91/8435
        lda aDialogue._Slot[0].wDisplayArea,b,x
        jsl rlUnsignedMultiply8By8
        dec a
        cmp aDialogue._Slot[0].wVRAMTileOffset,b,x
        bcs +

          lda #0
          sta aDialogue._Slot[0].wVRAMTileOffset,b,x

        +
        rts

        .databank 0

      rsDialogueIncrementBGBufferOffset ; 91/8449

        .al
        .autsiz
        .databank ?

        lda aDialogue._Slot[0].wBGBufferOffset,b,x
        clc
        adc #2
        sta aDialogue._Slot[0].wBGBufferOffset,b,x

        _CheckWrap ; 91/8453
        lda aDialogue.wStatus,b
        bit #DialogueStatusPreventInput
        bne +

          ; Height * 64 - 1
          lda aDialogue._Slot[0].bDisplayHeight,b,x
          and #$00FF
          lsr a
          asl a
          asl a
          asl a
          asl a
          asl a
          asl a
          asl a
          dec a
          cmp aDialogue._Slot[0].wBGBufferOffset,b,x
          bcs +

            lda #0
            sta aDialogue._Slot[0].wBGBufferOffset,b,x

        +
        rts

        .databank 0

      rsDialogueWriteBaseTileIndexToBGBuffer ; 91/8476

        .al
        .autsiz
        .databank ?

        lda aDialogue._Slot[0].lBGBufferPosition+1,b,x
        sta lR19+1
        lda aDialogue._Slot[0].lBGBufferPosition,b,x
        clc
        adc aDialogue._Slot[0].wBGBufferOffset,b,x
        sta lR19

        lda aDialogue._Slot[0].wVRAMAddress,b,x
        sec
        sbc aDialogue._Slot[0].wVRAMAddress,b
        lsr a
        lsr a
        lsr a
        sta wR0

        lda aDialogue._Slot[0].wVRAMTileOffset,b,x
        clc
        adc wR0
        adc aDialogue.wBaseTile,b
        sta wR0

        lda aDialogue.wGraphicBufferPixelOffset,b
        dec a
        lsr a
        lsr a
        lsr a

          ; If character is wider than 8 pixels, loop
          -
          pha
          lda wR0
          ldy #0
          sta [lR19],y
          inc a
          ldy #$0040
          sta [lR19],y

          lda wR0
          and #$FC00
          sta wR1

          lda wR0
          clc
          adc #2
          and #$03FF
          ora wR1
          sta wR0

          inc lR19
          inc lR19
          pla
          dec a
          bpl -

        rts

        .databank 0

      rsUnknown9184CD ; 91/84CD

        .al
        .autsiz
        .databank ?

        phy
        phx
        lda aDialogue.bFontPage,b
        and #$00FF
        xba
        sta wR0

        ldy #0
        lda [lR18],y
        and #$00FF
        ora wR0
        sta aDialogue.wCurrentCharacter,b

        jsr rsDialogueLoadCharacterGraphicIntoBuffer
        jsr rsUnknown918650

        plx
        ply
        rts

        .databank 0

      rsDialogueHandleGraphicBufferClearing ; 91/84EE

        .al
        .autsiz
        .databank ?

        ; If there is no pixel offset, clear the buffer
        ; If there is an offset, aka something is loaded in the buffer,
        ; shift the rightmost part of the graphic in the buffer over, clear the rest
        ; so the new graphic can be appended right after the existing one.

        lda aDialogue.wGraphicBufferPixelOffset,b
        beq _ClearBuffer

          lda aDialogue.wUnknown001890,b
          beq +
          brl _End

          +
          lda aDialogue.wGraphicBufferPixelOffset,b
          beq _ClearBuffer

            cmp #8
            bcs +
            brl _End

            +
            tax
            and #$0007
            sta aDialogue.wGraphicBufferPixelOffset,b

            txa
            lsr a
            lsr a
            lsr a
            tay
            txa
            and #$00F8
            asl a
            asl a
            tax
            dec x
            dec x

              _OuterLoop
              phy
              ldy #$0010

                _InnerLoop
                lda aDialogue.aCharacterGraphicsBuffer+$20,x
                sta aDialogue.aCharacterGraphicsBuffer,x
                dec x
                dec x
                dec y
                bne _InnerLoop

              phx
              ldx aDialogue.wSlotOffset,b
              jsr rsDialogueIncrementVRAMTileOffset
              jsr rsDialogueIncrementBGBufferOffset

              plx
              ply
              dec y
              bne _OuterLoop

            jsr rsDialoguePartialClearCharacterGraphicsBuffer
            bra _End

        _ClearBuffer
        jsr rsDialogueClearCharacterGraphicsBuffer
        
        _End
        rts

        .databank 0

      rsDialogueLoadCharacterGraphicIntoBuffer ; 91/8546

        .al
        .autsiz
        .databank ?

        lda aDialogue.bFontPage,b
        and #$00FF
        pha
        xba
        sta wR1
        pla

        ora #$1000
        jsl rlUnsignedMultiply8By8
        sta wR0

        ldy #0
        lda [lR18],y
        and #$00FF
        sec
        sbc #$0010
        clc
        adc wR1
        sec
        sbc wR0
        pha

        and #$FE00
        lsr a
        clc
        adc aDialogue.lFontGraphics+1,b
        sta lR19+1

        pla
        and #$01FF
        asl a
        pha

        and #$000F
        asl a
        asl a
        asl a
        asl a
        sta lR19

        pla
        and #$FFF0
        asl a
        asl a
        asl a
        asl a
        asl a
        clc
        adc lR19
        adc aDialogue.lFontGraphics,b
        sta lR19

        lda aDialogue.wGraphicBufferPixelOffset,b
        and #$00F8
        asl a
        asl a
        tax
        ldy #0

          ; Load the upper left part of a character into the buffer
          -
          lda [lR19],y
          jsr rsDialogueFineAdjustGraphicsData

          lda aDialogue.aCharacterGraphicsBuffer,x
          ora wR0
          sta aDialogue.aCharacterGraphicsBuffer,x
          lda aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 2),x
          ora wR1
          sta aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 2),x
          inc x
          inc x
          inc y
          inc y
          cpy #size(Tile2bpp)
          bne -

        lda aDialogue.wGraphicBufferPixelOffset,b
        and #$00F8
        asl a
        asl a
        tax
        ldy #size(Tile2bpp) * 16

          ; Load the lower left part of a character into the buffer
          -
          lda [lR19],y
          jsr rsDialogueFineAdjustGraphicsData

          lda aDialogue.aCharacterGraphicsBuffer + size(Tile2bpp),x
          ora wR0
          sta aDialogue.aCharacterGraphicsBuffer + size(Tile2bpp),x
          lda aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 3),x
          ora wR1
          sta aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 3),x
          inc x
          inc x
          inc y
          inc y
          cpy #size(Tile2bpp) * 16 + size(Tile2bpp)
          bne -

        lda aDialogue.wGraphicBufferPixelOffset,b
        and #$00F8
        asl a
        asl a
        tax
        ldy #size(Tile2bpp)

          ; Load the upper right part of a character into the buffer
          -
          lda [lR19],y
          jsr rsDialogueFineAdjustGraphicsData

          lda aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 2),x
          ora wR0
          sta aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 2),x
          lda aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 4),x
          ora wR1
          sta aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 4),x
          inc x
          inc x
          inc y
          inc y
          cpy #size(Tile2bpp) + size(Tile2bpp)
          bne -

        lda aDialogue.wGraphicBufferPixelOffset,b
        and #$00F8
        asl a
        asl a
        tax
        ldy #(size(Tile2bpp) * 16 + size(Tile2bpp))

          ; Load the lower right part of a character into the buffer
          -
          lda [lR19],y
          jsr rsDialogueFineAdjustGraphicsData

          lda aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 3),x
          ora wR0
          sta aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 3),x
          lda aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 5),x
          ora wR1
          sta aDialogue.aCharacterGraphicsBuffer + (size(Tile2bpp) * 5),x
          inc x
          inc x
          inc y
          inc y
          cpy #(size(Tile2bpp) * 16 + size(Tile2bpp)) + size(Tile2bpp)
          bne -

        rts

        .databank 0

      rsUnknown918650 ; 91/8650

        .al
        .autsiz
        .databank ?

        ; Updates the pixel offsets and VRAM address.

        lda aDialogue.bFontPage,b
        and #$00FF
        pha

        xba
        sta wR1

        pla
        ora #$1000
        jsl rlUnsignedMultiply8By8
        sta wR0

        ldy #0
        lda [lR18],y
        and #$00FF
        sec
        sbc #$0010
        clc
        adc wR1
        sec
        sbc wR0
        tay

        lda aDialogue.lFontWidthTable+1,b
        sta lR19+1
        lda aDialogue.lFontWidthTable,b
        sta lR19

        lda [lR19],y
        and #$00FF
        jsr rsDialogueAdjustCharacterWidthByNextCharacter
        pha

        clc
        adc aDialogue.wGraphicBufferPixelOffset,b
        sta aDialogue.wGraphicBufferPixelOffset,b

        pla
        clc
        adc aDialogue.wStringPixelLength,b
        sta aDialogue.wStringPixelLength,b

        lda aDialogue.wGraphicBufferPixelOffset,b
        dec a
        and #$00F8
        asl a
        asl a
        clc
        adc #$0020
        sta aDialogue.wUnknown0018C9,b

        ldx aDialogue.wSlotOffset,b
        lda aDialogue._Slot[0].wVRAMTileOffset,b,x
        asl a
        asl a
        asl a
        clc
        adc aDialogue._Slot[0].wVRAMAddress,b,x
        sta aDialogue.wUnknown0018CB,b
        rts

        .databank 0

      rsDialogueAdjustCharacterWidthByNextCharacter ; 91/86BA

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = character pixel width

        ; Only modifies width for font page 0.
        ; 

        ; Output:
        ; A = character pixel width

        pha

        ; Dialogue character
        ldy #0
        lda [lR18],y
        and #$00FF
        sta wR0

        ; Next character
        inc y
        lda [lR18],y
        and #$00FF
        cmp #$0010
        bcs _Character

          ; Is a command
          cmp #0
          bne +

            inc y
            lda [lR18],y
            and #$00FF

          +
          cmp #9
          bne _SEC

            inc y
            lda [lR18],y
            and #$00FF

        _Character
        sta wR1
        sec
        sbc #$0010
        tax

        lda aDialogue.bFontPage,b
        and #$00FF
        bne _SEC

          lda aDialogueAdjustPriorCharacterWidth,x
          and #$00FF
          bne _CLC

            lda wR1
            sec
            sbc #$0010
            asl a
            tax

            lda #(`aDialogueCustomWidthAdjustTable)<<8
            sta lR20+1
            lda aDialogueCustomWidthAdjustTable,x
            sta lR20
            ldy #$FFFF

              _Loop
              inc y
              lda [lR20],y
              cmp #$0200
              beq _SEC

                and #$00FF
                cmp wR0
                bne _Loop

          _CLC
          clc
          bra +

        _SEC
        sec

        +
        pla
        sbc #0
        rts

        .databank 0

      rsUnknown91872C ; 91/872C

        .al
        .autsiz
        .databank ?

        lda aDialogue.wSlotOffset,b
        bne +

        jsl rlDMAByStruct
          .structDMAToVRAM aBG3TilemapBuffer, $0400, $80, $B000

        bra _End

        +
        jsl rlDMAByStruct
          .structDMAToVRAM aBG3TilemapBuffer + $400, $0400, $80, $B400

        _End
        rts

        .databank 0

      rsUnknown91874E ; 91/874E

        .al
        .autsiz
        .databank ?

        lda aDialogue.wUnknown0018C9,b
        bne +

          rts

        +
        lda aDialogue.wUnknown0018D0,b
        cmp #2
        beq +

          cmp #3
          beq +

            jsl rlUnknown878459

        +
        jsr rsDialoguePlayTextSound

        ldx aDialogue.wSlotOffset,b
        lda aDialogue._Slot[0].wVRAMTileOffset,b,x
        asl a
        asl a
        asl a

        lda aDialogue.wUnknown0018CB,b
        sec
        sbc aDialogue._Slot[0].wVRAMAddress,b,x
        lsr a
        lsr a
        lsr a
        sta wR0

        lda aDialogue.wUnknown0018C9,b
        lsr a
        lsr a
        lsr a
        lsr a
        clc
        adc wR0
        sec
        sbc #$0400
        bcs +

          lda #0

        +
        sta wR0
        tay

        lda aDialogue.wUnknown0018C9,b
        lsr a
        lsr a
        lsr a
        lsr a
        sec
        sbc wR0
        tax

        phy
        phx
        lda #(`aDialogue.aCharacterGraphicsBuffer)<<8
        sta lR18+1
        lda #<>aDialogue.aCharacterGraphicsBuffer
        sta lR18

        tya
        asl a
        asl a
        asl a
        asl a
        sta wR0

        lda aDialogue.wUnknown0018C9,b
        sec
        sbc wR0
        sta wR0

        lda aDialogue.wUnknown0018CB,b
        sta wR1

        ; wR0 = size, wR1 = dest, lR18 = source

        jsl rlDMAByPointer
        plx
        ply

        tya
        beq _End

          lda #(`aDialogue.aCharacterGraphicsBuffer)<<8
          sta lR18+1

          txa
          asl a
          asl a
          asl a
          asl a
          clc
          adc #<>aDialogue.aCharacterGraphicsBuffer
          sta lR18

          tya
          asl a
          asl a
          asl a
          asl a
          sta wR0

          txa
          asl a
          asl a
          asl a
          clc
          adc aDialogue.wUnknown0018CB,b
          sec
          sbc #$2000
          sta wR1

          jsl rlDMAByPointer

        _End
        rts

        .databank 0

      rsDialogueClearCharacterGraphicsBuffer ; 91/87F1

        .al
        .autsiz
        .databank ?

        ; Clears the full buffer

        phx
        ldx #0
        bra rsDialoguePartialClearCharacterGraphicsBuffer._Loop

      rsDialoguePartialClearCharacterGraphicsBuffer ; 91/87F7

        .al
        .autsiz
        .databank ?

        ; Doesn't clear the 2 leftmost 8x8 tiles.

        phx
        ldx #size(Tile2bpp) * 2

          _Loop
          lda #0
          sta aDialogue.aCharacterGraphicsBuffer,x
          sta aDialogue.aCharacterGraphicsBuffer+$02,x
          sta aDialogue.aCharacterGraphicsBuffer+$04,x
          sta aDialogue.aCharacterGraphicsBuffer+$06,x
          sta aDialogue.aCharacterGraphicsBuffer+$08,x
          sta aDialogue.aCharacterGraphicsBuffer+$0A,x
          sta aDialogue.aCharacterGraphicsBuffer+$0C,x
          sta aDialogue.aCharacterGraphicsBuffer+$0E,x
          sta aDialogue.aCharacterGraphicsBuffer+$10,x
          sta aDialogue.aCharacterGraphicsBuffer+$12,x
          sta aDialogue.aCharacterGraphicsBuffer+$14,x
          sta aDialogue.aCharacterGraphicsBuffer+$16,x
          sta aDialogue.aCharacterGraphicsBuffer+$18,x
          sta aDialogue.aCharacterGraphicsBuffer+$1A,x
          sta aDialogue.aCharacterGraphicsBuffer+$1C,x
          sta aDialogue.aCharacterGraphicsBuffer+$1E,x

          txa
          clc
          adc #$0020
          tax
          cpx #size(aDialogue.aCharacterGraphicsBuffer)
          bcc _Loop

        plx
        rts

        .databank 0

      rsDialogueFineAdjustGraphicsData ; 91/884B

        .al
        .autsiz
        .databank ?

        ; Fine adjusts the graphic data word if it needs to be moved 
        ; a certain pixel amount

        phx
        pha
        xba
        and #$FF00
        sta wR2

        pla
        and #$FF00
        sta wR3

        lda aDialogue.wGraphicBufferPixelOffset,b
        and #$0007
        tax
        beq +
        
          -
          lsr wR2
          lsr wR3
          dec x
          bne -

        +
        lda wR2
        xba
        and #$00FF
        sta wR0

        lda wR3
        and #$FF00
        ora wR0
        sta wR0

        lda wR2
        and #$00FF
        sta wR1

        lda wR3
        xba
        and #$FF00
        ora wR1
        sta wR1
        plx
        rts

        .databank 0

      rsUnknown91888D ; 91/888D

        .al
        .autsiz
        .databank ?

        lda aDialogue._Slot[0].wBGBufferOffset,b,x
        and #$FF80
        clc
        adc #32 * size(word) * 2
        sta aDialogue._Slot[0].wBGBufferOffset,b,x

        jsr rsDialogueIncrementBGBufferOffset._CheckWrap

        lda aDialogue.wStatus,b
        bit #DialogueStatusPreventInput
        bne _88D7

          lda aDialogue._Slot[0].wVRAMTileOffset,b,x
          lsr a
          sta WRDIVA,b

          sep #$20
          lda aDialogue._Slot[0].bDisplayWidth,b,x
          sta WRDIVB,b
          nop
          nop
          nop
          nop
          nop
          nop
          nop
          nop
          lda RDDIV,b
          inc a
          cmp aDialogue._Slot[0].bDisplayHeight,b,x
          bcc +

            lda #0

          +
          xba
          lda aDialogue._Slot[0].bDisplayWidth,b,x
          rep #$20

          jsl rlUnsignedMultiply8By8
          asl a
          sta aDialogue._Slot[0].wVRAMTileOffset,b,x
          bra +

        _88D7
        lda aDialogue.wGraphicBufferPixelOffset,b
        beq _88EC

        lsr a
        lsr a
        lsr a

          -
          pha
          jsr rsDialogueIncrementVRAMTileOffset
          pla
          dec a
          bpl -

        +
        jsr rsDialogueIncrementVRAMTileOffset._CheckWrap
        bra _88FB

        _88EC
        lda aDialogue._Slot[0].wVRAMTileOffset,b,x
        bit #$0002
        beq +

        inc a
        inc a
        sta aDialogue._Slot[0].wVRAMTileOffset,b,x

        +
        bra _8921

        _88FB
        lda aDialogue.wStatus,b
        bit #DialogueStatusAutoscroll
        bne _8921

          lda aDialogue.wUnknown00188C,b
          beq +

            lda aDialogue._Slot[0].wUnknown0018E1,b,x
            clc
            adc #1
            bra ++

            +
            lda aDialogue._Slot[0].wUnknown0018E1,b,x
            clc
            adc #2

          +
          sta aDialogue._Slot[0].wUnknown0018E1,b,x
          lda #1
          sta aDialogue.wPauseTimer,b

        _8921
        lda #0
        sta aDialogue.wGraphicBufferPixelOffset,b
        sta aDialogue.wUnknown001890,b
        rts

        .databank 0

      rsDialogueClearDialogue ; 91/892B

        .al
        .autsiz
        .databank ?

        phx
        lda aDialogue._Slot[0].lBGBufferPosition+1,b,x
        sta lR19+1
        sta lR20+1
        lda aDialogue._Slot[0].lBGBufferPosition,b,x
        sta lR19
        clc
        adc #$0040
        sta lR20

        lda aDialogue._Slot[0].bDisplayHeight,b,x
        and #$00FF
        lsr a
        tay

        lda aDialogue._Slot[0].bDisplayWidth,b,x
        and #$00FF
        tax
        
          -
          phy
          phx
          lda aDialogue.wClearTile,b
          ldy #0
          
            -
            sta [lR19],y
            sta [lR20],y
            inc y
            inc y
            dec x
            bne -

          lda lR19
          clc
          adc #$0080
          sta lR19
          lda lR20
          clc
          adc #$0080
          sta lR20
          plx
          ply
          dec y
          bne --

        plx
        phx
        jsl rlResetDialogueEngine._80A6
        jsr rsDialogueClearCharacterGraphicsBuffer
        plx
        rts

        .databank 0

      rsDialogueClearNextLineBGBuffer ; 91/897E

        .al
        .autsiz
        .databank ?

        phx
        lda aDialogue._Slot[0].wBGBufferOffset,b,x
        and #$FF80
        sta wR0
        lda aDialogue._Slot[0].lBGBufferPosition+1,b,x
        sta lR19+1
        sta lR20+1

        lda aDialogue._Slot[0].lBGBufferPosition,b,x
        clc
        adc wR0
        sta lR19
        clc
        adc #32 * size(word)
        sta lR20

        lda aDialogue._Slot[0].bDisplayWidth,b,x
        and #$00FF
        tax

        lda aDialogue.wClearTile,b
        ldy #0

          -
          sta [lR19],y
          sta [lR20],y
          inc y
          inc y
          dec x
          bne -

        plx
        rts

        .databank 0

      rsDialoguePlayTextSound ; 91/89B4

        .al
        .autsiz
        .databank ?

        lda aDialogue.wPauseTimer,b
        cmp #$FFFF
        beq +

        cmp #1
        bne ++
        
        +
        lda wVBlankEnabledFramecount
        and #$0003
        bne _End

        +
        lda aDialogue.wTextSound,b
        and #$00FF
        asl a
        tax
        jmp (_89D3,x)

        _89D3
        .word <>_End
        .word <>_89E9
        .word <>_89F1
        .word <>_89F9
        .word <>_89E9
        .word <>_89E9
        .word <>_89E9
        .word <>_89E9
        .word <>_89E9
        .word <>_89E9
        .word <>_89E9

        _89E9
        lda #1
        jsl rlUnknown808FAD
        rts

        _89F1
        lda #2
        jsl rlUnknown808FAD
        rts

        _89F9
        lda #$0014
        jsl rlUnknown808FAD

        _End
        rts

        .databank 0

      rsRunDialogueCommand ; 91/8A01

        .al
        .autsiz
        .databank ?

        cmp #0
        bne +

          inc lR18
          lda [lR18],y
          and #$00FF
          bne +

            nop

        +
        inc y
        pha

        lda lR18+1
        sta aDialogue.lActivePointer+1,b
        lda lR18
        inc a
        sta aDialogue.lActivePointer,b

        pla
        cmp #$0080
        bcc +

          ; If bit $80 is set, the command does event stuff

          and #$007F
          jsl rlRunDialogueEventCommand
          bra _End

        +
        sta wR0

        lda wR0
        cmp #$0041
        bmi +

          -
          bra -

        +
        asl a
        tax
        jsr (aDialogueCommandPointers,x)

        _End
        rts

        .databank 0

      aDialogueCommandPointers ; 91/8A3D

        .word <>rsDialogueCommand00 ; $00
        .word <>rsDialogueCommand01 ; $01
        .word <>rsDialogueCommand00 ; $02
        .word <>rsDialogueCommand03 ; $03
        .word <>rsDialogueCommand04 ; $04
        .word <>rsDialogueCommand05 ; $05
        .word <>rsDialogueCommand06 ; $06
        .word <>rsDialogueCommand07 ; $07
        .word <>rsDialogueCommand08 ; $08
        .word <>rsDialogueCommand09 ; $09
        .word <>rsDialogueCommand0A ; $0A
        .word <>rsDialogueCommand0B ; $0B
        .word <>rsDialogueCommand0C ; $0C
        .word <>rsDialogueCommand0D ; $0D
        .word <>rsDialogueCommand0E ; $0E
        .word <>rsDialogueCommand0E ; $0F
        .word <>rsDialogueCommand10 ; $10
        .word <>rsDialogueCommand11 ; $11
        .word <>rsDialogueCommand12 ; $12
        .word <>rsDialogueCommand13 ; $13
        .word <>rsDialogueCommand14 ; $14
        .word <>rsDialogueCommand15 ; $15
        .word <>rsDialogueCommand16 ; $16
        .word <>rsDialogueCommand17 ; $17
        .word <>rsDialogueCommand18 ; $18
        .word <>rsDialogueCommand19 ; $19
        .word <>rsDialogueCommand1A ; $1A
        .word <>rsDialogueCommand1B ; $1B
        .word <>rsDialogueCommand1C ; $1C
        .word <>rsDialogueCommand1D ; $1D
        .word <>rsDialogueCommand1E ; $1E
        .word <>rsDialogueCommand1F ; $1F
        .word <>rsDialogueCommand20 ; $20
        .word <>rsDialogueCommand08 ; $21
        .word <>rsDialogueCommand22 ; $22
        .word <>rsDialogueCommand23 ; $23
        .word <>rsDialogueCommand24 ; $24
        .word <>rsDialogueCommand25 ; $25
        .word <>rsDialogueCommand26 ; $26
        .word <>rsDialogueCommand27 ; $27
        .word <>rsDialogueCommand28 ; $28
        .word <>rsDialogueCommand29 ; $29
        .word <>rsDialogueCommand2A ; $2A
        .word <>rsDialogueCommand2B ; $2B
        .word <>rsDialogueCommand2C ; $2C
        .word <>rsDialogueCommand2D ; $2D
        .word <>rsDialogueCommand2E ; $2E
        .word <>rsDialogueCommand2F ; $2F
        .word <>rsDialogueCommand30 ; $30
        .word <>rsDialogueCommand31 ; $31
        .word <>rsDialogueCommand32 ; $32
        .word <>rsDialogueCommand33 ; $33
        .word <>rsDialogueCommand34 ; $34
        .word <>rsDialogueCommand00 ; $35
        .word <>rsDialogueCommand00 ; $36
        .word <>rsDialogueCommand00 ; $37
        .word <>rsDialogueCommand00 ; $38
        .word <>rsDialogueCommand00 ; $39
        .word <>rsDialogueCommand03 ; $3A
        .word <>rsDialogueCommand04 ; $3B
        .word <>rsDialogueCommand05 ; $3C
        .word <>rsDialogueCommand3D ; $3D
        .word <>rsDialogueCommand3E ; $3E
        .word <>rsDialogueCommand3F ; $3F
        .word <>rsDialogueCommand40 ; $40

      rsDialogueCommand01 ; 91/8ABF

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_EOF

        ; Check if any command swapped the active pointer to do its own thing,
        ; if yes, that ones EOF only ends its own stuff, so keep looking for the
        ; original EOF.

        lda aDialogue.lActivePointerStack1,b
        bne +

          jsl rlUnknown918F74
          sec
          rts

        +
        jsl rlDialoguePullFromActivePointerStack
        clc
        rts

        .databank 0

      rsDialogueCommand00 ; 91/8AD0

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_ESCAPE

        ldx aDialogue.wSlotOffset,b
        lda aDialogue.wStatus,b
        bit #DialogueStatusAutoscroll
        beq _8AF4

          lda aDialogue.wUnknown00188E,b
          bit #$8000
          bne +

            lda aDialogue._Slot[0].wUnknown0018E1,b,x
            and #$000F
            beq _8AF4

          +
          dec aDialogue.lActivePointer,b
          jsr rsDialogueSetDefaultPauseTimer
          sec
          bra _End

        _8AF4
        jsl rlUnknown91907E
        
        lda aDialogue.wStatus,b
        bit #DialogueStatusAutoscroll
        beq +

          lda #$8000
          tsb aDialogue.wUnknown00188E,b

          jsr rsDialogueClearNextLineBGBuffer

        +
        sec
        
        _End
        rts

        .databank 0

      rsDialogueSetDefaultPauseTimer ; 91/8B0B

        .al
        .autsiz
        .databank ?

        lda aDialogue.wPauseTimer,b
        cmp #$FFFF
        beq +

          lda #1
          sta aDialogue.wPauseTimer,b

        +
        rts

        .databank 0

      rsDialogueCommand03 ; 91/8B1A

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_CLEAR

        jsl rlDialogueClearCurrentSlotsDialogue
        clc
        rts

        .databank 0

      rsDialogueCommand04 ; 91/8B20

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SCROLL

        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aUnknown918B3C,x
        sta lR23

        pea #<>(+)-1
        jmp (lR23)

        +
        dec aDialogue.lActivePointer,b
        inc aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer

        sec
        rts

        .databank 0

      aUnknown918B3C ; 91/8B3C

        .word <>rsUnknown918B48
        .word <>rsUnknown918B49
        .word <>rsUnknown918B49
        .word <>rsUnknown918B49
        .word <>rsUnknown918B5F
        .word <>rsUnknown918B67

      rsUnknown918B48 ; 91/8B48

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsUnknown918B49 ; 91/8B49

        .al
        .autsiz
        .databank ?

        jsl rlUnknown91907E
        rts

        .databank 0

      rsUnknown918B4E ; 91/8B4E

        .al
        .autsiz
        .databank ?

        lda #0
        ldx aDialogue.wSlotOffset,b
        bne +

          inc a

        +
        jsl rlDialogueUpdateSlotOffset
        lda aDialogue.wSlotOffset,b
        rts

        .databank 0

      rsUnknown918B5F ; 91/8B5F

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        jsl rlResetDialogueEngine._80A6
        rts

        .databank 0

      rsUnknown918B67 ; 91/8B67

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        lda #1
        sta aDialogue.wPauseTimer,b
        stz aDialogue.wCommandCycle,b
        pla
        sec
        rts

        .databank 0

      rsDialogueCommand29 ; 91/8B76

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SCROLL_ALL

        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aUnknown918B95,x
        sta lR23

        pea #<>(+)-1
        jmp (lR23)

        +
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        inc aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rts

        .databank 0

      aUnknown918B95 ; 91/8B95

        .word <>rsUnknown918B49
        .word <>rsUnknown918B49
        .word <>rsUnknown918B49
        .word <>rsUnknown918B5F
        .word <>rsUnknown918B4E
        .word <>rsUnknown918B49
        .word <>rsUnknown918B49
        .word <>rsUnknown918B49
        .word <>rsUnknown918B5F
        .word <>rsUnknown918B4E
        .word <>rsUnknown918B67

      rsDialogueCommand1B ; 91/8BAB

        .al
        .autsiz
        .databank ?

        lda [lR18],y
        sta lR23
        inc y
        lda [lR18],y
        sta lR23+1
        jsl rlDialogueSetBufferPosition

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand10 ; 91/8BC3

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_TEXT_POSITION

        lda [lR18],y
        jsl rlUnknown91909D

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand11 ; 91/8BD1

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_DISPLAY_AREA

        lda [lR18],y
        jsl rlDialogueSetDisplayArea

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand12 ; 91/8BDF

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_SPEED

        lda [lR18],y
        and #$00FF
        jsl rlDialogueSetTextSpeed

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand13 ; 91/8BED

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_PLAY_SONG

        lda [lR18],y
        and #$00FF
        sta $04BA,b

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand2B ; 91/8BFA

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_PLAY_SFX2B

        lda [lR18],y
        and #$00FF
        jsl rlUnknown808FA3

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand14 ; 91/8C08

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_TEXT_SOUND

        lda [lR18],y
        and #$00FF
        jsl rlDialogueSetTextSound

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand31 ; 91/8C16

        .al
        .autsiz
        .databank ?

        lda [lR18],y
        and #$00FF
        jsl rlUnknown9190FB

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand32 ; 91/8C24

        .al
        .autsiz
        .databank ?

        lda [lR18],y
        and #$00FF
        jsl rlUnknown919103

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand33 ; 91/8C32

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_PLAY_SFX

        lda [lR18],y
        and #$00FF
        jsl rlUnknown91910B

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand15 ; 91/8C40

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_BASE_TILE

        lda [lR18],y
        jsl rlDialogueSetBaseTileIndex

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand16 ; 91/8C4E

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_CLEAR_TILE

        lda [lR18],y
        jsl rlDialogueSetClearTileIndex

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand17 ; 91/8C5C

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_CLEAR_HALT

        jsl rlDialogueClearCurrentSlotsDialogueHalt
        sec
        rts

        .databank 0

      rsDialogueCommand18 ; 91/8C62

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_18

        jsl rlDialogueHalt1
        sec
        rts

        .databank 0

      rsDialogueCommand19 ; 91/8C68

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_BUFFER_OFFSET

        lda [lR18],y
        jsl rlUnknown919134

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand05 ; 91/8C76

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SIDE

        lda [lR18],y
        and #$00FF
        jsl rlDialogueUpdateSlotOffset

        lda #0
        sta aDialogue.wGraphicBufferPixelOffset,b
        sta aDialogue.wUnknown001890,b

        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand06 ; 91/8C8D

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_LEFT

        lda #0
        jsl rlDialogueUpdateSlotOffset

        lda #0
        sta aDialogue.wGraphicBufferPixelOffset,b
        sta aDialogue.wUnknown001890,b
        clc
        rts

        .databank 0

      rsDialogueCommand07 ; 91/8C9F

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_RIGHT

        lda #1
        jsl rlDialogueUpdateSlotOffset

        lda #0
        sta aDialogue.wGraphicBufferPixelOffset,b
        sta aDialogue.wUnknown001890,b
        clc
        rts

        .databank 0

      rsDialogueCommand1A ; 91/8CB1

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_VRAM_ADDRESS

        lda [lR18],y
        jsl rlDialogueSetSlotsVRAMAdress

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand1C ; 91/8CBF

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_ADD_TILE_OFFSET

        lda [lR18],y
        and #$00FF
        jsl rlDialogueAddTileOffset

        inc aDialogue.lActivePointer,b
        sec
        rts

        .databank 0

      rsDialogueCommand1D ; 91/8CCD

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_PAUSE , instead of FE5s $0F

        lda [lR18],y
        and #$00FF
        jsl rlUnknown919182

        inc aDialogue.lActivePointer,b
        sec
        rts

        .databank 0

      rsDialogueCommand3D ; 91/8CDB

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_OPEN_BOX

        jsl rlUnknown919186
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rts

        .databank 0

      rsDialogueCommand3E ; 91/8CE4

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_CLOSE_BOX

        jsl rlUnknown919256
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rts

        .databank 0

      rsDialogueCommand3F ; 91/8CED

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_LOAD_PORTRAIT

        lda [lR18],y
        jsl rlUnknown91931D

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rts

        .databank 0

      rsDialogueCommand2E ; 91/8CFE

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_LOAD_UNIT1_PORTRAIT

        lda aDialogue.wUnit1,b
        bra +

      rsDialogueCommand2F ; 91/8D03

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_LOAD_UNIT2_PORTRAIT

        lda aDialogue.wUnit2,b
        bra +

      rsDialogueCommand34 ; 91/8D08

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_LOAD_CHILD_SIBLING_PORTRAIT

        lda aDialogue.wUnit2,b
        jsl rlDialogueTryGetActiveChildSiblingCharacterID
        bra +

      rsDialogueCommand24 ; 91/8D11

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_LOAD_SLOT_PORTRAIT

        lda aDialogue.wUnit1,b
        ldx aDialogue.wSlotOffset,b
        bne +

          lda aDialogue.wUnit2,b

        +
        jsl rlUnknown9193C6
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rts

        .databank 0

      rsDialogueCommand40 ; 91/8D25

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        jsl rlUnknown919420
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rts

        .databank 0

      rsDialogueCommand2C ; 91/8D31

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_CHILD_NAME

        lda [lR18],y
        jsl rlDialogueTryGetActiveChildCharacterID

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        bra +

      rsDialogueCommand30 ; 91/8D3F

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_CHILD_SIBLING_NAME

        lda aDialogue.wUnit2,b
        jsl rlDialogueTryGetActiveChildSiblingCharacterID
        bra +

      rsDialogueCommand22 ; 91/8D48

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_UNIT1_NAME

        lda aDialogue.wUnit1,b
        bra +

      rsDialogueCommand23 ; 91/8D4D

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_UNIT2_NAME

        lda aDialogue.wUnit2,b
        
        +
        ldx #(`aDialogueCharacterNames)<<8
        stx lR18+1
        dec a
        cmp #aDialogueCharacterNames.Nanna + 1
        bcc +

          lda #0

        +
        asl a
        tax
        lda aDialogueCharacterNames,x
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        jsr rsDialogueSetDefaultPauseTimer
        clc
        rts

        .databank 0

      rsDialogueCommand2D ; 91/8D6F

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_ASMC

        lda [lR18],y
        sta lR19
        inc y
        lda [lR18],y
        sta lR19+1

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        jsl +
        clc
        rts

        +
        jml [lR19]

        .databank 0

      rsDialogueCommand25 ; 91/8D8A

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_NUMBER1

        lda aDialogue.wNumber1,b
        bra +

      rsDialogueCommand26 ; 91/8D8F

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_NUMBER2

        lda aDialogue.wNumber2,b

        +
        jsl $89A107
        stz wR5

        ldx #0
        lda wR4
        jsr rsDialogueTurnDigitIntoDialogueNumber
        lda wR3
        jsr rsDialogueTurnDigitIntoDialogueNumber
        lda wR2
        jsr rsDialogueTurnDigitIntoDialogueNumber
        lda wR1
        jsr rsDialogueTurnDigitIntoDialogueNumber
        lda wR0
        jsr rsUnknown918DE0
        jsl rlDialogueSetFont0

        lda #(`$0018B5)<<8
        sta lR18+1
        lda #<>$0018B5
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        jsr rsDialogueSetDefaultPauseTimer
        clc
        rts

        .databank 0

      rsDialogueTurnDigitIntoDialogueNumber ; 91/8DCB

        .al
        .autsiz
        .databank ?

        ldy wR5
        bne +

          cmp #0
          beq ++

        +
        clc
        adc #$00B1
        sta $0018B5,x
        inc x
        inc wR5

        +
        rts

        .databank 0

      rsUnknown918DE0 ; 91/8DE0

        .al
        .autsiz
        .databank ?

        clc
        adc #$00B1
        sta $0018B5,x
        inc x
        lda #1
        sta $0018B5,x
        rts

        .databank 0

      rsDialogueCommand27 ; 91/8DF1

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_ITEM_NAME

        ldx #(`aDialogueItemNames)<<8
        stx lR18+1
        lda aDialogue.wItemID,b
        cmp #aDialogueItemNames.BrokenHolyStaff + 1
        bcc +

          lda #0

        +
        asl a
        tax
        lda aDialogueItemNames,x
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        clc
        rts

        .databank 0

      rsDialogueCommand28 ; 91/8E0F

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_CLASS_NAME

        ldx #(`aDialogueClassNames)<<8
        stx lR18+1
        lda aDialogue.wClassID,b
        dec a
        cmp #DarkPrince + 1
        bcc +

          lda #0

        +
        asl a
        tax
        lda aDialogueClassNames,x
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        clc
        rts

        .databank 0

      rsDialogueCommand09 ; 91/8E2E

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_FONT_0

        jsl rlDialogueSetFont0
        clc
        rts

        .databank 0

      rsDialogueCommand0A ; 91/8E34

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_FONT_1

        jsl rlDialogueSetFont1
        clc
        rts

        .databank 0

      rsDialogueCommand0B ; 91/8E3A

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_FONT_2

        jsl rlDialogueSetFont2
        clc
        rts

        .databank 0

      rsDialogueCommand0C ; 91/8E40

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_FONT_3

        jsl rlDialogueSetFont3
        clc
        rts

        .databank 0

      rsDialogueCommand0D ; 91/8E46

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_FONT_4

        jsl rlDialogueSetFont4
        clc
        rts

        .databank 0

      rsDialogueCommand0E ; 91/8E4C

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_FONT_5

        jsl rlDialogueSetFont5
        clc
        rts

        .databank 0

      rsDialogueCommand2A ; 91/8E52

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_TEXT

        lda [lR18],y
        sta wR0
        inc y
        lda [lR18],y
        sta lR18+1
        lda wR0
        sta lR18

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b

        jsl rlDialoguePushToActivePointerStack
        clc
        rts

        .databank 0

      rlDialoguePushToActivePointerStack ; 91/8E6E

        .al
        .autsiz
        .databank ?

        lda aDialogue.lActivePointerStack6,b
        bne _SEC

          lda aDialogue.lActivePointerStack5,b
          sta aDialogue.lActivePointerStack6,b
          lda aDialogue.lActivePointerStack5+1,b
          sta aDialogue.lActivePointerStack6+1,b

          lda aDialogue.lActivePointerStack4,b
          sta aDialogue.lActivePointerStack5,b
          lda aDialogue.lActivePointerStack4+1,b
          sta aDialogue.lActivePointerStack5+1,b

          lda aDialogue.lActivePointerStack3,b
          sta aDialogue.lActivePointerStack4,b
          lda aDialogue.lActivePointerStack3+1,b
          sta aDialogue.lActivePointerStack4+1,b

          lda aDialogue.lActivePointerStack2,b
          sta aDialogue.lActivePointerStack3,b
          lda aDialogue.lActivePointerStack2+1,b
          sta aDialogue.lActivePointerStack3+1,b

          lda aDialogue.lActivePointerStack1,b
          sta aDialogue.lActivePointerStack2,b
          lda aDialogue.lActivePointerStack1+1,b
          sta aDialogue.lActivePointerStack2+1,b

          lda aDialogue.lActivePointer,b
          sta aDialogue.lActivePointerStack1,b
          lda aDialogue.lActivePointer+1,b
          sta aDialogue.lActivePointerStack1+1,b

          lda lR18+1
          sta aDialogue.lActivePointer+1,b
          lda lR18
          sta aDialogue.lActivePointer,b
          clc
          bra +

        _SEC
        sec

        +
        rtl

        .databank 0

      rlDialoguePullFromActivePointerStack ; 91/8ECA

        .al
        .autsiz
        .databank ?

        lda aDialogue.lActivePointerStack1,b
        sta aDialogue.lActivePointer,b
        lda aDialogue.lActivePointerStack1+1,b
        sta aDialogue.lActivePointer+1,b

        lda aDialogue.lActivePointerStack2,b
        sta aDialogue.lActivePointerStack1,b
        lda aDialogue.lActivePointerStack2+1,b
        sta aDialogue.lActivePointerStack1+1,b

        lda aDialogue.lActivePointerStack3,b
        sta aDialogue.lActivePointerStack2,b
        lda aDialogue.lActivePointerStack3+1,b
        sta aDialogue.lActivePointerStack2+1,b

        lda aDialogue.lActivePointerStack4,b
        sta aDialogue.lActivePointerStack3,b
        lda aDialogue.lActivePointerStack4+1,b
        sta aDialogue.lActivePointerStack3+1,b

        lda aDialogue.lActivePointerStack5,b
        sta aDialogue.lActivePointerStack4,b
        lda aDialogue.lActivePointerStack5+1,b
        sta aDialogue.lActivePointerStack4+1,b

        lda aDialogue.lActivePointerStack6,b
        sta aDialogue.lActivePointerStack5,b
        lda aDialogue.lActivePointerStack6+1,b
        sta aDialogue.lActivePointerStack5+1,b

        lda #0
        sta aDialogue.lActivePointerStack6,b
        sta aDialogue.lActivePointerStack6+1,b
        rtl

        .databank 0

      rlDialogueClearActivePointerStack ; 91/8F1C

        .al
        .autsiz
        .databank ?

        lda #0
        sta aDialogue.lActivePointerStack1,b
        sta aDialogue.lActivePointerStack1+1,b
        sta aDialogue.lActivePointerStack2,b
        sta aDialogue.lActivePointerStack2+1,b
        sta aDialogue.lActivePointerStack3,b
        sta aDialogue.lActivePointerStack3+1,b
        sta aDialogue.lActivePointerStack4,b
        sta aDialogue.lActivePointerStack4+1,b
        sta aDialogue.lActivePointerStack5,b
        sta aDialogue.lActivePointerStack5+1,b
        sta aDialogue.lActivePointerStack6,b
        sta aDialogue.lActivePointerStack6+1,b
        rtl

        .databank 0

      rsDialogueCommand1E ; 91/8F44

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_SET_STATUS

        lda [lR18],y
        jsl rlDialogueSetStatus

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand1F ; 91/8F52

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_ADD_STATUS

        lda [lR18],y
        jsl rlDialogueAddStatus

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand20 ; 91/8F60

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_MASK_STATUS

        lda [lR18],y
        jsl rlDialogueMaskStatus

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        clc
        rts

        .databank 0

      rsDialogueCommand08 ; 91/8F6E

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_WAIT_PRESS

        jsl rlDialogueHalt2
        sec
        rts

        .databank 0

      rlUnknown918F74 ; 91/8F74

        .al
        .autsiz
        .databank ?

        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aUnknown918F8D,x
        sta lR23
        pea #<>(+)-1
        jmp (lR23)
        
        +
        dec aDialogue.lActivePointer,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rtl

        .databank 0

      aUnknown918F8D ; 91/8F8D

        .word <>rsUnknown918F9B
        .word <>rsUnknown918FCB
        .word <>rsUnknown918FF7
        .word <>rsUnknown919010
        .word <>rsUnknown91901D
        .word <>rsUnknown919030
        .word <>rlUnknown91903A

      rsUnknown918F9B ; 91/8F9B

        .al
        .autsiz
        .databank ?

        lda aDialogue.wUnknown0018D0,b
        cmp #1
        bne _End

        lda $07E8,b
        bit #$8000
        bne +

          lda #DialogueStatusAssetLoading
          tsb aDialogue.wStatus,b
          jsl $88CD53

        +
        lda $07E8,b
        bit #$0001
        bne _End

          lda #DialogueStatusUpdateMouth
          tsb aDialogue.wStatus,b
          jsl $88CD61

        _End
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsUnknown918FCB ; 91/8FCB

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        lda #$FFFF
        sta @l aDialogue._Slot[0].wPortraitID
        sta @l aDialogue._Slot[1].wPortraitID

        lda aDialogue.wUnknown0018D0,b
        cmp #1
        bne rlUnknown91903A

        ldx #0
        jsr rsUnknown9197DC
        ldx #1
        jsr rsUnknown9197DC
        lda #$0002
        tsb wUnknown000D79,b
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsUnknown918FF7 ; 91/8FF7

        .al
        .autsiz
        .databank ?

        lda aDialogue.wStatus,b
        bit #DialogueStatus2000
        beq +

          lda #$00FF
          jsl $809F01
          stz wBufferBG3HOFS
          jsl rlUnknown878459

        +
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsUnknown919010 ; 91/9010

        .al
        .autsiz
        .databank ?

        lda #1
        sta wR0
        jsl $859D60
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsUnknown91901D ; 91/901D

        .al
        .autsiz
        .databank ?

        jsl $85AB32
        bcc +

          lda #0
          sta wR0
          jsl $859D60
          inc aDialogue.wCommandCycle,b

        +
        rts

        .databank 0

      rsUnknown919030 ; 91/9030

        .al
        .autsiz
        .databank ?

        jsl $85AB32
        bcc +

          inc aDialogue.wCommandCycle,b

        +
        rts

        .databank 0

      rlUnknown91903A ; 91/903A

        .al
        .autsiz
        .databank ?

        lda aDialogue.wUnknown0018D0,b
        cmp #1
        bne _End

          lda aDialogue.wStatus,b
          bit #DialogueStatusAssetLoading
          beq +

            lda #DialogueStatusAssetLoading
            trb aDialogue.wStatus,b
            jsl $88CD4C

          +
          lda aDialogue.wStatus,b
          bit #DialogueStatusUpdateMouth
          beq +

            lda #DialogueStatusUpdateMouth
            trb aDialogue.wStatus,b
            jsl $88CD5A

          +
          jsl rlUnknown899FDC
          jsl $80B0A3

        _End
        stz aDialogue.wCommandCycle,b
        stz aDialogue.wStatus,b
        stz aDialogue.wPauseTimer,b
        jsl rlUnknown9180BC
        pla
        sec
        rtl

        .databank 0

      rlUnknown91907E ; 91/907E

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        jsr rsUnknown91888D
        jsr rsUnknown9181E2
        rtl

        .databank 0

      rlDialogueClearCurrentSlotsDialogue ; 91/9088

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        jsr rsDialogueClearDialogue
        rtl

        .databank 0

      rlDialogueSetBufferPosition ; 91/908F

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        lda lR23
        sta aDialogue._Slot[0].lBGBufferPosition,b,x
        lda lR23+1
        sta aDialogue._Slot[0].lBGBufferPosition+1,b,x
        rtl

        .databank 0

      rlUnknown91909D ; 91/909D

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        sta aDialogue._Slot[0].wUnknown0018D9,b,x
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
        rtl

        .databank 0

      rlDialogueSetDisplayArea ; 91/90CF

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        sta aDialogue._Slot[0].wDisplayArea,b,x
        rtl

        .databank 0

      rlDialogueSetTextSpeed ; 91/90D6

        .al
        .autsiz
        .databank ?

        cmp #$00FD
        bne +

          jsr rsDialogueGetTextSpeed

        +
        sta aDialogue.wTextSpeed,b
        rtl

        .databank 0

      rsDialogueGetTextSpeed ; 91/90E2

        .al
        .autsiz
        .databank ?

        jsl rlGetTextSpeedOption
        sta wR0

        lda #6
        sec
        sbc wR0
        cmp #2
        bne +

          lda #1

        +
        rts

        .databank 0

      rlDialogueSetTextSound ; 91/90F7

        .al
        .autsiz
        .databank ?

        sta aDialogue.wTextSound,b
        rtl

        .databank 0

      rlUnknown9190FB ; 91/90FB

        .al
        .autsiz
        .databank ?

        and #$00FF
        jsl rlUnknown808FAD
        rtl

        .databank 0

      rlUnknown919103 ; 91/9103

        .al
        .autsiz
        .databank ?

        and #$00FF
        jsl rlUnknown808FAD
        rtl

        .databank 0

      rlUnknown91910B ; 91/910B

        .al
        .autsiz
        .databank ?

        and #$00FF
        jsl $80900D
        rtl

        .databank 0

      rlDialogueSetBaseTileIndex ; 91/9113

        .al
        .autsiz
        .databank ?

        sta aDialogue.wBaseTile,b
        rtl
 
        .databank 0

      rlDialogueSetClearTileIndex ; 91/9117

        .al
        .autsiz
        .databank ?

        sta aDialogue.wClearTile,b
        rtl

        .databank 0

      rlDialogueClearCurrentSlotsDialogueHalt ; 91/911B

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        jsr rsDialogueClearDialogue

      rlDialogueHalt1 ; 91/9121

        .al
        .autsiz
        .databank ?

        lda #DialogueStatusActive
        trb aDialogue.wStatus,b
        lda #DialogueStatusWaitForInput
        tsb aDialogue.wStatus,b
        lda #1
        sta aDialogue.wPauseTimer,b
        rtl

        .databank 0

      rlUnknown919134 ; 91/9134

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        sta aDialogue._Slot[0].wBGBufferOffset,b,x
        rtl

        .databank 0

      rlDialogueUpdateSlotOffset ; 91/913B

        .al
        .autsiz
        .databank ?

        and #$0001
        ora #size(aDialogue._Slot[0]) << 8
        jsl rlUnsignedMultiply8By8
        sta aDialogue.wSlotOffset,b
        tax
        jsr rsDialogueClearCharacterGraphicsBuffer

        lda #0
        sta aDialogue._Slot[0].wUnknown0018E9,b
        sta aDialogue.wUnknown0018A3,b
        sta aDialogue.wUnknown0018A5,b
        rtl

        .databank 0

      rlDialogueSetSlotsVRAMAdress ; 91/9159

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        sta aDialogue._Slot[0].wVRAMAddress,b,x
        rtl

        .databank 0

      rlDialogueAddTileOffset ; 91/9160

        .al
        .autsiz
        .databank ?

        sta wR0
        lda aDialogue.wGraphicBufferPixelOffset,b
        lsr a
        lsr a
        lsr a
        inc a
        clc
        adc wR0

          -
          pha

          lda aDialogue.wSlotOffset,b
          tax
          jsr rsDialogueIncrementVRAMTileOffset
          jsr rsDialogueIncrementBGBufferOffset
          pla
          dec a
          bne -

        stz aDialogue.wGraphicBufferPixelOffset,b
        jsr rsUnknown9181E2
        rtl

        .databank 0

      rlUnknown919182 ; 91/9182

        .al
        .autsiz
        .databank ?

        sta aDialogue.wPauseTimer,b
        rtl

        .databank 0

      rlUnknown919186 ; 91/9186

        .al
        .autsiz
        .databank ?

        lda aDialogue.wUnknown0018D0,b
        cmp #0
        bne +

        -
        rtl

        +
        lda #DialogueStatusTopOpened
        ldx aDialogue.wSlotOffset,b
        beq +

          lda #DialogueStatusBottomOpened

        +
        bit aDialogue.wStatus,b
        bne -

        lda aDialogue.wUnknown0018D0,b
        cmp #1
        beq rlUnknown9191F3

        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aUnknown9191C6,x
        sta lR23
        pea #<>(+)-1
        jmp (lR23)

        +
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        inc aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rtl

        .databank 0

      aUnknown9191C6 ; 91/91C6

        .word <>rsUnknown9191CE
        .word <>rsUnknown9191DE
        .word <>rsUnknown9191DE
        .word <>rsUnknown9191DE

      rsUnknown9191CE ; 91/91CE

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        bne +

        jsl $8ADA08
        bra ++

        +
        jsl $8ADA16

        +
        rts

        .databank 0

      rsUnknown9191DE ; 91/91DE

        .al
        .autsiz
        .databank ?

        lda aDialogue.wCommandCycle,b
        cmp #1
        bcs +

          rts

        +
        stz aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        jsr rsDialogueSetDialogueBoxOpen
        pla
        sec
        rtl

        .databank 0

      rlUnknown9191F3 ; 91/91F3

        .al
        .autsiz
        .databank ?

        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aDialogueOpenBoxCycles,x
        sta lR23
        pea #<>(+)-1
        jmp (lR23)

        +
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rtl

        .databank 0

      aDialogueOpenBoxCycles ; 91/920F

        .word <>rsDialogueOpenBoxCycle1
        .word <>rsDialogueOpenBoxCycle2
        .word <>rsDialogueOpenBoxCycle3

      rsDialogueOpenBoxCycle1 ; 91/9215

        .al
        .autsiz
        .databank ?

        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsDialogueOpenBoxCycle2 ; 91/9219

        .al
        .autsiz
        .databank ?

        ldx #0
        lda aDialogue.wSlotOffset,b
        beq +

          lda #1
          ldx #$1200

        +
        jsl $859D45
        lda #4
        sta wBufferBG3HOFS
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsDialogueOpenBoxCycle3 ; 91/9234

        .al
        .autsiz
        .databank ?

        jsl $85AB19
        bcs +

          rts

        +
        stz aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        jsr rsDialogueSetDialogueBoxOpen
        pla
        sec
        rtl

        .databank 0

      rsDialogueSetDialogueBoxOpen ; 91/9247

        .al
        .autsiz
        .databank ?

        lda #DialogueStatusTopOpened
        ldx aDialogue.wSlotOffset,b
        beq +

          lda #DialogueStatusBottomOpened

        +
        tsb aDialogue.wStatus,b
        rts

        .databank 0

      rlUnknown919256 ; 91/9256

        .al
        .autsiz
        .databank ?

        lda aDialogue.wUnknown0018D0,b
        cmp #0
        bne +
        
        -
        rtl

        +
        lda #DialogueStatusTopOpened
        ldx aDialogue.wSlotOffset,b
        beq +

          lda #DialogueStatusBottomOpened

        +
        bit aDialogue.wStatus,b
        beq -

        lda aDialogue.wUnknown0018D0,b
        cmp #1
        beq rlUnknown9192C3

        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aUnknown919296,x
        sta lR23
        pea #<>(+)-1
        jmp (lR23)
        
        +
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        inc aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rtl

        .databank 0

      aUnknown919296 ; 91/9296

        .word <>rsUnknown91929E
        .word <>rsUnknown9192AE
        .word <>rsUnknown9192AE
        .word <>rsUnknown9192AE

      rsUnknown91929E ; 91/929E

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        bne +

        jsl $8ADA5B
        bra ++

        +
        jsl $8ADA6F

        +
        rts

        .databank 0

      rsUnknown9192AE ; 91/92AE

        .al
        .autsiz
        .databank ?

        lda aDialogue.wCommandCycle,b
        cmp #3
        bcs +

          rts

        +
        stz aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        jsr rsUnknown91930E
        pla
        sec
        rtl

        .databank 0

      rlUnknown9192C3 ; 91/92C3

        .al
        .autsiz
        .databank ?

        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aUnknown9192DF,x
        sta lR23
        pea #<>(+)-1
        jmp (lR23)
        
        +
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rtl

        .databank 0

      aUnknown9192DF ; 91/92DF

        .word <>rsUnknown9192E5
        .word <>rsUnknown9192F7
        .word <>rsUnknown919302

      rsUnknown9192E5 ; 91/92E5

        .al
        .autsiz
        .databank ?

        inc aDialogue.wCommandCycle,b
        lda aDialogue.wSlotOffset,b
        beq +

          lda #1

        +
        sta wR0
        jsl $859D60
        rts

        .databank 0

      rsUnknown9192F7 ; 91/92F7

        .al
        .autsiz
        .databank ?

        jsl $85AB32
        bcs +

          rts

        +
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsUnknown919302 ; 91/9302

        .al
        .autsiz
        .databank ?

        stz aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        jsr rsUnknown91930E
        pla
        sec
        rtl

        .databank 0

      rsUnknown91930E ; 91/930E

        .al
        .autsiz
        .databank ?

        lda #DialogueStatusTopOpened
        ldx aDialogue.wSlotOffset,b
        beq +

          lda #DialogueStatusBottomOpened

        +
        trb aDialogue.wStatus,b
        rts

        .databank 0

      rlUnknown91931D ; 91/931D

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = PortraitID

        jsl rlDialogueTryGetActiveChildCharacterID

        ldx aDialogue.wSlotOffset,b
        cmp aDialogue._Slot[0].wPortraitID,b,x
        beq _End

        ldx aDialogue.wUnknown0018D0,b
        cpx #0
        beq _End

          cpx #1
          beq _9362

            ldx $04BA,b
            bne _9355

              ldx aDialogue.wSlotOffset,b
              sta aDialogue._Slot[0].wPortraitID,b,x
              bne +

                ; Left portrait
                sta $08B2,b
                jsl $8ADACA
                bra _End

              ; Right portrait
              +
              sta $08B4,b
              jsl $8ADAD8
              bra _End

            _9355
            dec aDialogue.lActivePointer,b
            dec aDialogue.lActivePointer,b
            dec aDialogue.lActivePointer,b
            dec aDialogue.lActivePointer,b

        _End
        rtl

        _9362
        sta wR0
        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aDialogueLoadPortraitCycles,x
        sta lR23
        pea #<>(+)-1
        jmp (lR23)

        +
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rtl

        .databank 0

      aDialogueLoadPortraitCycles ; 91/9386

        .word <>rsDialogueLoadPortraitCycle1
        .word <>rsDialogueLoadPortraitCycle2
        .word <>rsDialogueLoadPortraitCycle3
        .word <>rsDialogueLoadPortraitCycle4
        .word <>rsDialogueLoadPortraitCycle2
        .word <>rsDialogueLoadPortraitCycle5

      rsDialogueLoadPortraitCycle1 ; 91/9392

        .al
        .autsiz
        .databank ?

        lda $04BA,b
        bne +

          inc aDialogue.wCommandCycle,b

        +
        rts

        .databank 0

      rsDialogueLoadPortraitCycle2 ; 91/939B

        .al
        .autsiz
        .databank ?

        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsDialogueLoadPortraitCycle3 ; 91/939F

        .al
        .autsiz
        .databank ?

        lda wR0
        ldx aDialogue.wSlotOffset,b
        jsr rsDialogueLoadPortraitData
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsDialogueLoadPortraitCycle4 ; 91/93AB

        .al
        .autsiz
        .databank ?

        lda wR0
        ldx aDialogue.wSlotOffset,b
        jsr rsDialogueLoadPortraitWriteTilemap
        inc aDialogue.wCommandCycle,b
        rts

        .databank 0

      rsDialogueLoadPortraitCycle5 ; 91/93B7

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        sta aDialogue._Slot[0].wPortraitID,b,x
        stz aDialogue.wCommandCycle,b
        jsr rsDialogueSetDefaultPauseTimer
        pla
        sec
        rtl

        .databank 0

      rlUnknown9193C6 ; 91/93C6

        .al
        .autsiz
        .databank ?

        jsl rlDialogueTryGetActiveChildCharacterID

        ldx aDialogue.wSlotOffset,b
        cmp aDialogue._Slot[0].wPortraitID,b,x
        beq _End

        ldx aDialogue.wUnknown0018D0,b
        cpx #0
        beq _End

        cpx #1
        beq _93F8

        ldx aDialogue.wSlotOffset,b
        sta aDialogue._Slot[0].wPortraitID,b,x
        bne +

        sta $08B2,b
        jsl $8ADACA
        bra _End
        
        +
        sta $08B4,b
        jsl $8ADAD8
        
        _End
        rtl

        _93F8
        sta wR0
        lda aDialogue.wCommandCycle,b
        asl a
        tax
        lda aUnknown919416,x
        sta lR23
        pea #<>(+)-1
        jmp (lR23)
        
        +
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        jsr rsDialogueSetDefaultPauseTimer
        sec
        rtl

        .databank 0

      aUnknown919416 ; 91/9416

        .word <>rsDialogueLoadPortraitCycle1
        .word <>rsDialogueLoadPortraitCycle2
        .word <>rsDialogueLoadPortraitCycle3
        .word <>rsDialogueLoadPortraitCycle4
        .word <>rsDialogueLoadPortraitCycle5

      rlUnknown919420 ; 91/9420

        .al
        .autsiz
        .databank ?

        ldx aDialogue.wSlotOffset,b
        lda #$FFFF
        cmp aDialogue._Slot[0].wPortraitID,b,x
        beq _End

        sta aDialogue._Slot[0].wPortraitID,b,x

        lda aDialogue.wUnknown0018D0,b
        cmp #0
        beq _End

        cmp #1
        beq _944B

        cpx #0
        bne +

        jsl $8ADAE6
        bra _End

        +
        jsl $8ADAF5

        _End
        rtl

        _944B
        jsr rsUnknown9197DC
        lda #$0002
        tsb wUnknown000D79,b
        rtl

        .databank 0

      rlDialogueSetFont0 ; 91/9455

        .al
        .autsiz
        .databank ?

        lda #0
        bra +

      rlDialogueSetFont1 ; 91/945A

        .al
        .autsiz
        .databank ?

        lda #1
        bra +

      rlDialogueSetFont2 ; 91/945F

        .al
        .autsiz
        .databank ?

        lda #2
        bra +

      rlDialogueSetFont3 ; 91/9464

        .al
        .autsiz
        .databank ?

        lda #3
        bra +

      rlDialogueSetFont4 ; 91/9469

        .al
        .autsiz
        .databank ?

        lda #4
        bra +

      rlDialogueSetFont5 ; 91/946E

        .al
        .autsiz
        .databank ?

        lda #5

        +
        sep #$20
        sta aDialogue.bFontPage,b
        rep #$20
        rtl

        .databank 0

      rlDialogueSetStatus ; 91/9479

        .al
        .autsiz
        .databank ?

        sta aDialogue.wStatus,b
        rtl

        .databank 0

      rlDialogueAddStatus ; 91/947D

        .al
        .autsiz
        .databank ?

        ora aDialogue.wStatus,b
        sta aDialogue.wStatus,b
        rtl

        .databank 0

      rlDialogueMaskStatus ; 91/9484

        .al
        .autsiz
        .databank ?

        and aDialogue.wStatus,b
        sta aDialogue.wStatus,b
        rtl

        .databank 0

      rlDialogueHalt2 ; 91/948B

        .al
        .autsiz
        .databank ?

        lda #DialogueStatusActive
        trb aDialogue.wStatus,b
        lda #DialogueStatusWaitForInput
        tsb aDialogue.wStatus,b
        lda #1
        sta aDialogue.wPauseTimer,b
        rtl

        .databank 0

      rlUnknown91949E ; 91/949E

        .al
        .autsiz
        .databank ?

        ; Sets up HDMA table for dialogue

        php
        lda #(`aDialogueHDMATable1)<<8
        sta lR18+1
        ldy #<>aDialogueHDMATable1

        lda aDialogue.wFreeHDMATable,b
        and #$0001
        bne +

          ldy #<>aDialogueHDMATable2

        +
        sty lR18

        ldy #0
        lda aDialogue._Slot[0].lBGBufferPosition,b
        sec
        sbc #<>aBG3TilemapBuffer

        ; Push the text Y tile coordinate

        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        pha

        ; If Y coord in pixels is greater than/equal $7F, splice it to make the HDMA data entry fit

        asl a
        asl a
        asl a
        cmp #$007F
        bcc +
        beq +

          pha
          lda wBufferBG3HOFS
          sta wR0
          lda wBufferBG3VOFS
          sta wR1
          lda #$007F
          jsl rlDialogueWriteHDMADataEntry
          pla
          sec
          sbc #$007F

        +
        pha
        lda wBufferBG3HOFS
        sta wR0
        lda wBufferBG3VOFS
        sta wR1
        pla
        jsl rlDialogueWriteHDMADataEntry

        jsl rlDialogueGetSlot1BoxPixelHeight
        sta lR19
        sec
        sbc #8 * 2
        cmp aDialogue._Slot[0].wUnknown0018E1,b
        bcs _9579

          sta lR21
          lda wBufferBG3HOFS
          clc
          adc #0
          sta wR0

          lda lR19
          tax
          lda aDialogue._Slot[0].wUnknown0018E1,b
          sec
          sbc lR21
          jsl rlUnknown91969C
          txa
          beq _9579

            sta lR20
            clc
            adc wBufferBG3VOFS
            sta wR1
            lda lR19
            sec
            sbc lR20
            jsl rlDialogueWriteHDMADataEntry

            lda lR20
            cmp #$0010
            bcc +

              lda wBufferBG3HOFS
              clc
              adc #0
              sta wR0

              lda lR20
              sec
              sbc lR19
              clc
              adc wBufferBG3VOFS
              sta wR1

              lda lR20
              and #$FFF0
              jsl rlDialogueWriteHDMADataEntry

            +
            lda lR20
            and #$000F
            sta lR20
            beq _958B
            
              _Loop
              lda wBufferBG3HOFS
              clc
              adc #0
              sta wR0

              lda lR20
              sec
              sbc lR19
              clc
              adc wBufferBG3VOFS
              dec a
              dec a
              dec a
              dec a
              sta wR1

              lda #1
              jsl rlDialogueWriteHDMADataEntry

              dec lR20
              bne _Loop
              bra _958B
        
        _9579
        lda wBufferBG3HOFS
        clc
        adc #0
        sta wR0
        lda wBufferBG3VOFS
        sta wR1
        lda lR19
        jsl rlDialogueWriteHDMADataEntry

        _958B
        ; Pull the text Y tile coordinate
        pla
        sta wR0

        lda aDialogue._Slot[0].bDisplayHeight,b
        and #$00FF
        clc
        adc wR0
        sta wR0

        lda aDialogue.wStatus,b
        bit #DialogueStatusBottomOpened
        bne +

          jml _965F

        +
        lda aDialogue._Slot[1].lBGBufferPosition,b
        sec
        sbc #<>aBG3TilemapBuffer
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sec
        sbc wR0
        asl a
        asl a
        asl a
        pha
        lda wBufferBG3HOFS
        sta wR0
        lda wBufferBG3VOFS
        sta wR1
        pla
        jsl rlDialogueWriteHDMADataEntry

        jsl rlDialogueGetSlot2BoxPixelHeight
        sta lR19

        sec
        sbc #$0010
        cmp aDialogue._Slot[1].wUnknown0018E1,b
        bcs _964D

        sta lR21
        
          lda wBufferBG3HOFS
          clc
          adc #0
          sta wR0

          lda lR19
          tax

          lda aDialogue._Slot[1].wUnknown0018E1,b
          sec
          sbc lR21
          jsl rlUnknown91969C
          txa
          beq _964D

            sta lR20
            clc
            adc wBufferBG3VOFS
            sta wR1
            lda lR19
            sec
            sbc lR20
            jsl rlDialogueWriteHDMADataEntry

            lda lR20
            cmp #$0010
            bcc +

              lda wBufferBG3HOFS
              clc
              adc #0
              sta wR0

              lda lR20
              sec
              sbc lR19
              clc
              adc wBufferBG3VOFS
              sta wR1
              lda lR20
              and #$FFF0
              jsl rlDialogueWriteHDMADataEntry

            +
            lda lR20
            and #$000F
            sta lR20
            beq _965F
            
              _Loop2
              lda wBufferBG3HOFS
              clc
              adc #0
              sta wR0

              lda lR20
              sec
              sbc lR19
              clc
              adc wBufferBG3VOFS
              dec a
              dec a
              dec a
              dec a
              sta wR1
              lda #1
              jsl rlDialogueWriteHDMADataEntry

              dec lR20
              bne _Loop2
              bra _965F
        
        _964D
        lda wBufferBG3HOFS
        clc
        adc #0
        sta wR0
        lda wBufferBG3VOFS
        sta wR1
        lda lR19
        jsl rlDialogueWriteHDMADataEntry

        _965F
        lda #1
        pha
        lda wBufferBG3HOFS
        sta wR0
        lda wBufferBG3VOFS
        sta wR1
        pla
        jsl rlDialogueWriteHDMADataEntry

        lda #0
        sta [lR18],y
        plp
        rtl

        .databank 0

      rlDialogueWriteHDMADataEntry ; 91/9677

        .al
        .autsiz
        .databank ?

        sta [lR18],y
        inc y
        lda wR0
        sta [lR18],y
        inc y
        inc y
        lda wR1
        dec a
        sta [lR18],y
        inc y
        inc y
        rtl

        .databank 0

      rlDialogueGetSlot1BoxPixelHeight ; 91/9688

        .al
        .autsiz
        .databank ?

        lda aDialogue._Slot[0].bDisplayHeight,b
        and #$00FF
        asl a
        asl a
        asl a
        rtl

        .databank 0

      rlDialogueGetSlot2BoxPixelHeight ; 91/9692

        .al
        .autsiz
        .databank ?

        lda aDialogue._Slot[1].bDisplayHeight,b
        and #$00FF
        asl a
        asl a
        asl a
        rtl

        .databank 0

      rlUnknown91969C ; 91/969C

        .al
        .autsiz
        .databank ?

        sta wR13
        stx wR14
        jsl $80A1AB
        lda wR13
        ldx wR10
        rtl

        .databank 0

      rlUnknown9196A9 ; 91/96A9

        .al
        .autsiz
        .databank ?

        lda #(`aHDMAUnknown9196BD)<<8
        sta lR44+1
        lda #<>aHDMAUnknown9196BD
        sta lR44
        lda #4
        sta wR40
        jsl rlHDMAEngineCreateEntryByIndex
        rtl

        .databank 0

      aHDMAUnknown9196BD ; 91/96BD

        .structHDMADirectEntryInfo rlHDMAUnknown9196BDInit, rlHDMAUnknown9196BDCycle, aHDMAUnknown9196BDCode, aDialogueHDMATable1, BG3HOFS, DMAP_HDMA_Setting(DMAP_CPUToIO, DMAP_Increment, DMAP_Mode3)

        .word $30C2

      rlHDMAUnknown9196BDInit ; 91/96CA

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlHDMAUnknown9196BDCycle ; 91/96CB

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      aHDMAUnknown9196BDCode ; 91/96CC

        HDMA_HALT

      rlDialogueSwapActiveHDMATable ; 91/96CE

        .al
        .autsiz
        .databank ?

        ; Swap the HDMAs active table, if the HDMA exists

        lda aDialogue.wStatus,b
        beq _End

          ldx #8
          lda aHDMASystem.aTypeOffset,b,x
          beq _End

            ldy #<>aDialogueHDMATable1
            lda aDialogue.wFreeHDMATable,b
            and #$0001
            beq +

              ldy #<>aDialogueHDMATable2

            +
            tya
            sta aHDMASystem.aOffset,b,x

        _End
        rtl

        .databank 0

      rlUnknown9196EE ; 91/96EE

        .al
        .autsiz
        .databank ?

        phx
        jsr rsDialogueLoadPortraitData
        plx

        phx
        jsr rsDialogueLoadPortraitWriteTilemap
        plx
        rtl

        .databank 0

      rsDialogueLoadPortraitData ; 91/96F9

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = PortraitID
        ; X = dialogue slot offset

        ; Decompresses the portrait, DMA it, and loads palette

        php
        phx
        jsl rlDecompressDialoguePortrait
        lda #(`aBGPaletteBuffer.aPalette6)<<8
        sta lR20+1
        plx

        cpx #0
        bne +

        lda #<>aBGPaletteBuffer.aPalette6
        bra ++
        
        +
        lda #<>aBGPaletteBuffer.aPalette7
        
        +
        sta lR20

        ldy #size(Palette)-2
        
        -
        lda [lR19],y
        sta [lR20],y
        dec y
        dec y
        bpl -

        cpx #0
        bne +

        lda #$7000 >> 1
        bra ++
        
        +
        lda #$7800 >> 1

        +
        sta wR1
        lda #16 * 4 * size(Tile4bpp)
        sta wR0
        jsl rlDMAByPointer
        plp
        rts

        .databank 0

      rsDialogueLoadPortraitWriteTilemap ; 91/9739

        .al
        .autsiz
        .databank ?

        php
        phx
        lda #5
        sta $7FC54A
        lda #$000B
        sta $7FC54C
        lda #$0015
        sta $7FC5AE
        lda #$000B
        sta $7FC5B0

        lda #(`$7FC54E)<<8
        sta lR20+1
        sta lR21+1

        cpx #0
        bne _Slot1

        ; Slot0
        ldy #<>$7FC54E
        lda #<>$7F7B80
        bra +

        _Slot1
        ldy #<>$7FC5B2
        lda #<>$7F3FC0

        +
        sty lR20
        sta wR0
        stx wR1

        ldx #4

          _OuterLoop
          ldy #0
          lda lR20
          clc
          adc #$0030
          sta lR21

            _InnerLoop
            jsr rsUnknown9197BD
            sta [lR20],y
            inc wR0
            clc
            adc #6
            sta [lR21],y
            inc y
            inc y
            cpy #6 * size(word)
            bcc _InnerLoop

          lda wR0
          clc
          adc #10
          sta wR0
          lda lR20
          clc
          adc #12
          sta lR20
          dec x
          bne _OuterLoop

        lda wUnknown000D79
        ora #$0001
        ora #$0002
        sta wUnknown000D79
        plx
        plp
        rts

        .databank 0

      rsUnknown9197BD ; 91/97BD

        .al
        .autsiz
        .databank ?

        ; Flips the portrait dest tile horizontally

        lda wR1
        bne _Slot1

        ; Slot0
        lda wR0
        and #$000F
        sta wR2

        lda #5
        sec
        sbc wR2
        sta wR2

        lda wR0
        and #$FFF0
        ora wR2
        bra +

        _Slot1
        lda wR0

        +
        rts

        .databank 0

      rsUnknown9197DC ; 91/97DC

        .al
        .autsiz
        .databank ?

        php
        lda #5
        sta $7FC54A
        lda #$000B
        sta $7FC54C
        lda #$0015
        sta $7FC5AE
        lda #$000B
        sta $7FC5B0
        lda #(`$7FC54E)<<8
        sta lR20+1

        cpx #0
        bne +

        ldy #<>$7FC54E
        bra ++

        +
        ldy #<>$7FC5B2

        +
        sty lR20

        ldx #4

          -
          ldy #0

            -
            lda #0
            sta [lR20],y
            inc y
            inc y
            cpy #12
            bcc -

          lda lR20
          clc
          adc #12
          sta lR20
          dec x
          bne --

        ldx #4

          -
          ldy #0

            -
            lda #$030F
            sta [lR20],y
            inc y
            inc y
            cpy #12
            bcc -

          lda lR20
          clc
          adc #12
          sta lR20
          dec x
          bne --

        plp
        rts

        .databank 0

      rlUnknown919849 ; 91/9849

        .al
        .autsiz
        .databank ?

        jsr rsUnknown91888D
        rtl

        .databank 0

      rlDialogueClearDialogueWrapper ; 91/984D

        .al
        .autsiz
        .databank ?

        jsr rsDialogueClearDialogue
        rtl

        .databank 0

      rlUnknown919851 ; 91/9851

        .al
        .autsiz
        .databank ?

        jsr rsDialogueClearNextLineBGBuffer
        rtl

        .databank 0

      rsUnknown919855 ; 91/9855

        .al
        .autsiz
        .databank ?

        lda aDialogue.wStatus,b
        bit #DialogueStatusToggleMouthMove
        bne +

          lda aDialogue.wUnknown0018A7,b
          beq _989E

          cmp #8
          bcs ++

          dec aDialogue.wUnknown0018A7,b
          bra _989E

        +
        lda #$000F
        sta aDialogue.wUnknown0018A7,b

        +
        dec aDialogue.wUnknown0018A7,b

        lda wVBlankEnabledFramecount
        and #$0007
        bne _End

          lda wVBlankEnabledFramecount
          lsr a
          lsr a
          lsr a
          and #$0007
          tax
          lda aUnknown9198AB,x
          and #$00FF
          sta aDialogue._Slot[0].wUnknown0018E9,b

          ldx aDialogue.wSlotOffset,b
          bne +

            sta aDialogue.wUnknown0018A3,b
            bra _End

          +
          sta aDialogue.wUnknown0018A5,b
          bra _End

          _989E
          lda #0
          sta aDialogue._Slot[0].wUnknown0018E9,b
          sta aDialogue.wUnknown0018A3,b
          sta aDialogue.wUnknown0018A5,b

        _End
        rts

        .databank 0

      aUnknown9198AB ; 91/98AB

        .byte $00
        .byte $01
        .byte $02
        .byte $01
        .byte $00
        .byte $02
        .byte $01
        .byte $02

      rlUnknown9198B3 ; 91/98B3

        .al
        .autsiz
        .databank ?

        php
        phy
        ldy #0
        
        -
        lda [lR18],y
        inc y
        cpy #$0100
        beq _98D0

        cmp #$3F00
        beq +
        bra -

        +
        inc y
        lda [lR18],y
        jsl rlDialogueTryGetActiveChildCharacterID
        bra +

        _98D0
        lda #0
        
        +
        ply
        plp
        rtl

        .databank 0

      rlUnknown9198D6 ; 91/98D6

        .al
        .autsiz
        .databank ?

        php
        phy
        ldy #0
        
        -
        lda [lR18],y
        inc y
        cpy #$0100
        beq _98EF

        cmp #$3F00
        beq +
        bra -
        
        +
        inc y
        lda [lR18],y
        bra +
        
        _98EF
        lda #0

        +
        ply
        plp
        rtl

        .databank 0

      rlUnknown9198F5 ; 91/98F5

        .al
        .autsiz
        .databank ?

        php
        phy
        ldy #0
        
        -
        lda [lR18],y
        sta [lR19],y
        inc y
        and #$00FF
        cmp #1
        bne -

        lda lR19
        sta lR18
        lda lR19+1
        sta lR18+1
        ply
        plp
        rtl

        .databank 0

      rlUnknown919912 ; 91/9912

        .al
        .autsiz
        .databank ?

        php
        phy
        ldy #0
        
          -
          lda [lR18],y
          inc y
          and #$00FF
          cmp #1
          bne -

        dec y
        tya
        clc
        adc lR18
        sta lR20
        lda lR18+1
        adc #0
        sta lR20+1

        ldy #0

          -
          lda [lR19],y
          sta [lR20],y
          inc y
          and #$00FF
          cmp #1
          bne -

        ply
        plp
        rtl

        .databank 0

      rlUnsignedMultiply8By8 ; 91/9943

        .al
        .autsiz
        .databank ?

        ; Multiplies the 2 halfs of the A word with each other

        phx
        ldx wR0
        phx
        ldx wR1
        phx

        pha
        and #$00FF
        sta wR0

        pla
        xba
        and #$00FF
        sta wR1

        ldx #8
        lda #0
        
          -
          lsr wR0
          bcc +

            clc
            adc wR1

          +
          asl wR1
          dec x
          bne -

        plx
        stx wR1
        plx
        stx wR0
        plx
        rtl

        .databank 0

      aDialogueFontWidth .include "../TABLES/DIALOGUE/DialogueFontWidth.asm" ; 91/9971
        ; This is indexed by the current character - $10 (to ignore the dialogue commands) to get the pixel width.

      aDialogueAdjustPriorCharacterWidth .include "../TABLES/DIALOGUE/DialogueAdjustPriorCharacterWidth.asm" ; 91/9E71
        ; This is indexed by the character that follows the current one and if the flag here is set, always subtracts
        ; 1 pixel from the current characters width. If flag is not set, look into the custom width adjust table.

      aDialogueCustomWidth00 ; 91/9F71

        .byte $09
        .byte $4B
        .byte $02

      aDialogueCustomWidth01 ; 91/9F74

        .byte $09
        .byte $4B
        .byte $02

      aDialogueCustomWidth02 ; 91/9F77

        .byte $09
        .byte $13
        .byte $35
        .byte $3A
        .byte $4C
        .byte $2D
        .byte $02

      aDialogueCustomWidth03 ; 91/9F7E

        .byte $09
        .byte $1D
        .byte $1F
        .byte $25
        .byte $3E
        .byte $41
        .byte $02

      aDialogueCustomWidth04 ; 91/9F85

        .byte $09
        .byte $22
        .byte $1F
        .byte $24
        .byte $25
        .byte $37
        .byte $3E
        .byte $4B
        .byte $4C
        .byte $02

      aDialogueCustomWidth05 ; 91/9F8F

        .byte $09
        .byte $20
        .byte $22
        .byte $25
        .byte $3E
        .byte $46
        .byte $4B
        .byte $4D
        .byte $4E
        .byte $02

      aDialogueCustomWidth06 ; 91/9F99

        .byte $09
        .byte $1D
        .byte $1F
        .byte $22
        .byte $25
        .byte $37
        .byte $3E
        .byte $48
        .byte $4B
        .byte $4D
        .byte $4E
        .byte $50
        .byte $02

      aDialogueCustomWidth07 ; 91/9FA6

        .byte $09
        .byte $18
        .byte $1C
        .byte $1D
        .byte $1F
        .byte $20
        .byte $22
        .byte $25
        .byte $4B
        .byte $51
        .byte $02

      aDialogueCustomWidth08 ; 91/9FB1

        .byte $09
        .byte $43
        .byte $56
        .byte $02

      aDialogueCustomWidth09 ; 91/9FB5

        .byte $09
        .byte $22
        .byte $3E
        .byte $43
        .byte $4B
        .byte $4C
        .byte $02

      aDialogueCustomWidth0A ; 91/9FBC

        .byte $09
        .byte $48
        .byte $02

      aDialogueCustomWidth0B ; 91/9FBF

        .word $0200

      aDialogueCustomWidth0C ; 91/9FC1

        .byte $09
        .byte $1F
        .byte $29
        .byte $23
        .byte $25
        .byte $37
        .byte $3C
        .byte $4B
        .byte $02

      aDialogueCustomWidth0D ; 91/9FCA

        .byte $09
        .byte $1F
        .byte $24
        .byte $25
        .byte $2F
        .byte $4B
        .byte $02

      aDialogueCustomWidth0E ; 91/9FD1

        .byte $09
        .byte $43
        .byte $4B
        .byte $02

      aDialogueCustomWidth0F ; 91/9FD5

        .byte $09
        .byte $13
        .byte $18
        .byte $4B
        .byte $4E
        .byte $02

      aDialogueCustomWidth10 ; 91/9FDB

        .byte $09
        .byte $13
        .byte $18
        .byte $1F
        .byte $4B
        .byte $4C
        .byte $02

      aDialogueCustomWidth11 ; 91/9FE2

        .byte $09
        .byte $16
        .byte $18
        .byte $1D
        .byte $20
        .byte $25
        .byte $37
        .byte $38
        .byte $3C
        .byte $4D
        .byte $4F
        .byte $02

      aDialogueCustomWidth12 ; 91/9FEE

        .word $0200

      aDialogueCustomWidth13 ; 91/9FF0

        .byte $09
        .byte $13
        .byte $18
        .byte $25
        .byte $4E
        .byte $02

      aDialogueCustomWidth14 ; 91/9FF6

        .byte $09
        .byte $13
        .byte $18
        .byte $1F
        .byte $25
        .byte $4B
        .byte $4C
        .byte $4D
        .byte $02

      aDialogueCustomWidth15 ; 91/9FFF

        .byte $09
        .byte $13
        .byte $18
        .byte $4B
        .byte $4D
        .byte $02

      aDialogueCustomWidth16 ; 91/A005

        .byte $09
        .byte $18
        .byte $1D
        .byte $4D
        .byte $02

      aDialogueCustomWidth17 ; 91/A00A

        .byte $09
        .byte $13
        .byte $1C
        .byte $18
        .byte $1D
        .byte $1F
        .byte $25
        .byte $48
        .byte $4B
        .byte $4D
        .byte $02

      aDialogueCustomWidth18 ; 91/A015

        .byte $09
        .byte $1F
        .byte $22
        .byte $4B
        .byte $4C
        .byte $4E
        .byte $02

      aDialogueCustomWidth19 ; 91/A01C

        .byte $09
        .byte $13
        .byte $25
        .byte $4B
        .byte $02

      aDialogueCustomWidth1A ; 91/A021

        .word $0200

      aDialogueCustomWidth1B ; 91/A023

        .byte $09
        .byte $22
        .byte $02

      aDialogueCustomWidth1C ; 91/A026

        .word $0200

      aDialogueCustomWidth1D ; 91/A028

        .byte $09
        .byte $1F
        .byte $22
        .byte $1D
        .byte $42
        .byte $43
        .byte $4D
        .byte $02

      aDialogueCustomWidth1E ; 91/A030

        .byte $09
        .byte $13
        .byte $1F
        .byte $20
        .byte $22
        .byte $23
        .byte $25
        .byte $39
        .byte $3D
        .byte $48
        .byte $4B
        .byte $4C
        .byte $4F
        .byte $02

      aDialogueCustomWidth1F ; 91/A03E

        .byte $09
        .byte $18
        .byte $29
        .byte $37
        .byte $22
        .byte $02

      aDialogueCustomWidth20 ; 91/A044

        .word $0200

      aDialogueCustomWidth21 ; 91/A046

        .byte $09
        .byte $11
        .byte $18
        .byte $1C
        .byte $1D
        .byte $25
        .byte $37
        .byte $41
        .byte $48
        .byte $4B
        .byte $4D
        .byte $02

      aDialogueCustomWidth22 ; 91/A052

        .byte $09
        .byte $18
        .byte $1D
        .byte $1F
        .byte $20
        .byte $37
        .byte $41
        .byte $4D
        .byte $53
        .byte $02

      aDialogueCustomWidth23 ; 91/A05C

        .byte $09
        .byte $13
        .byte $15
        .byte $53
        .byte $54
        .byte $02

      aDialogueCustomWidth24 ; 91/A062

        .byte $09
        .byte $13
        .byte $18
        .byte $1C
        .byte $1D
        .byte $1F
        .byte $22
        .byte $41
        .byte $4B
        .byte $4C
        .byte $4D
        .byte $4E
        .byte $02

      aDialogueCustomWidth25 ; 91/A06F

        .byte $09
        .byte $18
        .byte $41
        .byte $48
        .byte $4C
        .byte $4D
        .byte $4F
        .byte $51
        .byte $02

      aDialogueCustomWidth26 ; 91/A078

        .byte $09
        .byte $1D
        .byte $35
        .byte $48
        .byte $4C
        .byte $4D
        .byte $4E
        .byte $02

      aDialogueCustomWidth27 ; 91/A080

        .byte $09
        .byte $1F
        .byte $43
        .byte $4B
        .byte $4C
        .byte $4D
        .byte $02

      aDialogueCustomWidth28 ; 91/A087

        .byte $09
        .byte $13
        .byte $18
        .byte $1D
        .byte $25
        .byte $37
        .byte $6C
        .byte $02

      aDialogueCustomWidth29 ; 91/A08F

        .byte $09
        .byte $1C
        .byte $1D
        .byte $1E
        .byte $22
        .byte $3E
        .byte $41
        .byte $43
        .byte $46
        .byte $47
        .byte $4C
        .byte $4D
        .byte $4F
        .byte $02

      aDialogueCustomWidth2A ; 91/A09D

        .byte $09
        .byte $13
        .byte $18
        .byte $1F
        .byte $20
        .byte $48
        .byte $4E
        .byte $02

      aDialogueCustomWidth2B ; 91/A0A5

        .byte $09
        .byte $1C
        .byte $02

      aDialogueCustomWidth2C ; 91/A0A8

        .byte $09
        .byte $1C
        .byte $02

      aDialogueCustomWidth2D ; 91/A0AB

        .byte $09
        .byte $1F
        .byte $02

      aDialogueCustomWidth2E ; 91/A0AE

        .byte $09
        .byte $22
        .byte $02

      aDialogueCustomWidth2F ; 91/A0B1

        .word $0200

      aDialogueCustomWidth30 ; 91/A0B3

        .byte $09
        .byte $18
        .byte $02

      aDialogueCustomWidth31 ; 91/A0B6

        .byte $09
        .byte $13
        .byte $1D
        .byte $1F
        .byte $29
        .byte $2F
        .byte $36
        .byte $02

      aDialogueCustomWidth32 ; 91/A0BE

        .byte $09
        .byte $13
        .byte $1F
        .byte $38
        .byte $02

      aDialogueCustomWidth33 ; 91/A0C3

        .byte $09
        .byte $1C
        .byte $1F
        .byte $02

      aDialogueCustomWidth34 ; 91/A0C7

        .byte $09
        .byte $18
        .byte $4B
        .byte $4D
        .byte $4F
        .byte $02

      aDialogueCustomWidth35 ; 91/A0CD

        .word $0200

      aDialogueCustomWidth36 ; 91/A0CF

        .byte $09
        .byte $18
        .byte $02

      aDialogueCustomWidth37 ; 91/A0D2

        .byte $09
        .byte $18
        .byte $02

      aDialogueCustomWidth38 ; 91/A0D5

        .word $0200

      aDialogueCustomWidth39 ; 91/A0D7

        .byte $09
        .byte $18
        .byte $1F
        .byte $02

      aDialogueCustomWidth3A ; 91/A0DB

        .word $0200

      aDialogueCustomWidth3B ; 91/A0DD

        .byte $09
        .byte $25
        .byte $1F
        .byte $02

      aDialogueCustomWidth3C ; 91/A0E1

        .word $0200

      aDialogueCustomWidth3D ; 91/A0E3

        .byte $09
        .byte $4B
        .byte $02

      aDialogueCustomWidth3E ; 91/A0E6

        .word $0200

      aDialogueCustomWidth3F ; 91/A0E8

        .byte $09
        .byte $13
        .byte $1F
        .byte $20
        .byte $22
        .byte $23
        .byte $24
        .byte $46
        .byte $48
        .byte $4C
        .byte $4D
        .byte $02

      aDialogueCustomWidth40 ; 91/A0F4

        .word $0200

      aDialogueCustomWidth41 ; 91/A0F6

        .byte $09
        .byte $66
        .byte $02

      aDialogueCustomWidth42 ; 91/A0F9

        .byte $09
        .byte $74
        .byte $90
        .byte $02

      aDialogueCustomWidth43 ; 91/A0FD

        .byte $09
        .byte $88
        .byte $02

      aDialogueCustomWidth44 ; 91/A100

        .word $0200

      aDialogueCustomWidth45 ; 91/A102

        .byte $09
        .byte $61
        .byte $86
        .byte $93
        .byte $A3
        .byte $A8
        .byte $02

      aDialogueCustomWidth46 ; 91/A109

        .word $0200

      aDialogueCustomWidth47 ; 91/A10B

        .byte $09
        .byte $89
        .byte $92
        .byte $02

      aDialogueCustomWidth48 ; 91/A10F

        .word $0200

      aDialogueCustomWidth49 ; 91/A111

        .byte $09
        .byte $6C
        .byte $02

      aDialogueCustomWidth4A ; 91/A114

        .byte $09
        .byte $6C
        .byte $88
        .byte $02

      aDialogueCustomWidth4B ; 91/A118

        .byte $09
        .byte $73
        .byte $02

      aDialogueCustomWidth4C ; 91/A11B

        .byte $09
        .byte $73
        .byte $9B
        .byte $02

      aDialogueCustomWidth4D ; 91/A11F

        .word $0200

      aDialogueCustomWidth4E ; 91/A121

        .byte $09
        .byte $6C
        .byte $02

      aDialogueCustomWidth4F ; 91/A124

        .byte $09
        .byte $6C
        .byte $02

      aDialogueCustomWidth50 ; 91/A127

        .word $0200

      aDialogueCustomWidth51 ; 91/A129

        .byte $09
        .byte $6C
        .byte $A2
        .byte $02

      aDialogueCustomWidth52 ; 91/A12D

        .byte $09
        .byte $6C
        .byte $A2
        .byte $A4
        .byte $02

      aDialogueCustomWidth53 ; 91/A132

        .byte $09
        .byte $6C
        .byte $02

      aDialogueCustomWidth54 ; 91/A135

        .word $0200

      aDialogueCustomWidth55 ; 91/A137

        .byte $09
        .byte $74
        .byte $A8
        .byte $02

      aDialogueCustomWidth56 ; 91/A13B

        .word $0200

      aDialogueCustomWidth57 ; 91/A13D

        .byte $09
        .byte $88
        .byte $02

      aDialogueCustomWidth58 ; 91/A140

        .word $0200

      aDialogueCustomWidth59 ; 91/A142

        .byte $09
        .byte $88
        .byte $02

      aDialogueCustomWidth5A ; 91/A145

        .word $0200

      aDialogueCustomWidth5B ; 91/A147

        .byte $09
        .byte $97
        .byte $A2
        .byte $02

      aDialogueCustomWidth5C ; 91/A14B

        .word $0200

      aDialogueCustomWidth5D ; 91/A14D

        .byte $09
        .byte $6C
        .byte $90
        .byte $9E
        .byte $A2
        .byte $02

      aDialogueCustomWidth5E ; 91/A153

        .byte $09
        .byte $6C
        .byte $02

      aDialogueCustomWidth5F ; 91/A156

        .byte $09
        .byte $72
        .byte $90
        .byte $94
        .byte $95
        .byte $97
        .byte $9E
        .byte $A2
        .byte $A4
        .byte $02

      aDialogueCustomWidth60 ; 91/A160

        .word $0200

      aDialogueCustomWidth61 ; 91/A162

        .byte $09
        .byte $88
        .byte $94
        .byte $02

      aDialogueCustomWidth62 ; 91/A166

        .word $0200

      aDialogueCustomWidth63 ; 91/A168

        .byte $09
        .byte $66
        .byte $02

      aDialogueCustomWidth64 ; 91/A16B

        .word $0200

      aDialogueCustomWidth65 ; 91/A16D

        .byte $09
        .byte $A2
        .byte $02

      aDialogueCustomWidth66 ; 91/A170

        .word $0200

      aDialogueCustomWidth67 ; 91/A172

        .byte $09
        .byte $88
        .byte $02

      aDialogueCustomWidth68 ; 91/A175

        .word $0200

      aDialogueCustomWidth69 ; 91/A177

        .word $0200

      aDialogueCustomWidth6A ; 91/A179

        .byte $09
        .byte $88
        .byte $02

      aDialogueCustomWidth6B ; 91/A17C

        .word $0200

      aDialogueCustomWidth6C ; 91/A17E

        .byte $09
        .byte $88
        .byte $02

      aDialogueCustomWidth6D ; 91/A181

        .word $0200

      aDialogueCustomWidth6E ; 91/A183

        .byte $09
        .byte $88
        .byte $89
        .byte $02

      aDialogueCustomWidth6F ; 91/A187

        .word $0200

      aDialogueCustomWidth70 ; 91/A189

        .byte $09
        .byte $A1
        .byte $02

      aDialogueCustomWidth71 ; 91/A18C

        .byte $09
        .byte $A1
        .byte $02

      aDialogueCustomWidth72 ; 91/A18F

        .word $0200

      aDialogueCustomWidth73 ; 91/A191

        .byte $09
        .byte $A1
        .byte $02

      aDialogueCustomWidth74 ; 91/A194

        .byte $09
        .byte $A1
        .byte $02

      aDialogueCustomWidth75 ; 91/A197

        .byte $09
        .byte $97
        .byte $A1
        .byte $02

      aDialogueCustomWidth76 ; 91/A19B

        .byte $09
        .byte $A1
        .byte $02

      aDialogueCustomWidth77 ; 91/A19E

        .byte $09
        .byte $A1
        .byte $02

      aDialogueCustomWidth78 ; 91/A1A1

        .word $0200

      aDialogueCustomWidth79 ; 91/A1A3

        .word $0200

      aDialogueCustomWidthAdjustTable ; 91/A1A5

        .word <>aDialogueCustomWidth00 ; "あ"
        .word <>aDialogueCustomWidth01 ; "い"
        .word <>aDialogueCustomWidth02 ; "う"
        .word <>aDialogueCustomWidth03 ; "え"
        .word <>aDialogueCustomWidth04 ; "お"
        .word <>aDialogueCustomWidth05 ; "か"
        .word <>aDialogueCustomWidth06 ; "き"
        .word <>aDialogueCustomWidth07 ; "く"
        .word <>aDialogueCustomWidth08 ; "け"
        .word <>aDialogueCustomWidth09 ; "こ"
        .word <>aDialogueCustomWidth0A ; "さ"
        .word <>aDialogueCustomWidth0B ; "し"
        .word <>aDialogueCustomWidth0C ; "す"
        .word <>aDialogueCustomWidth0D ; "せ"
        .word <>aDialogueCustomWidth0E ; "そ"
        .word <>aDialogueCustomWidth0F ; "た"
        .word <>aDialogueCustomWidth10 ; "ち"
        .word <>aDialogueCustomWidth11 ; "つ"
        .word <>aDialogueCustomWidth12 ; "て"
        .word <>aDialogueCustomWidth13 ; "と"
        .word <>aDialogueCustomWidth14 ; "な"
        .word <>aDialogueCustomWidth15 ; "に"
        .word <>aDialogueCustomWidth16 ; "ぬ"
        .word <>aDialogueCustomWidth17 ; "ね"
        .word <>aDialogueCustomWidth18 ; "の"
        .word <>aDialogueCustomWidth19 ; "は"
        .word <>aDialogueCustomWidth1A ; "ひ"
        .word <>aDialogueCustomWidth1A ; "ふ"
        .word <>aDialogueCustomWidth1A ; "へ"
        .word <>aDialogueCustomWidth1A ; "ほ"
        .word <>aDialogueCustomWidth1A ; "ま"
        .word <>aDialogueCustomWidth1B ; "み"
        .word <>aDialogueCustomWidth1C ; "む"
        .word <>aDialogueCustomWidth1D ; "め"
        .word <>aDialogueCustomWidth1E ; "も"
        .word <>aDialogueCustomWidth1F ; "や"
        .word <>aDialogueCustomWidth20 ; "ゆ"
        .word <>aDialogueCustomWidth21 ; "よ"
        .word <>aDialogueCustomWidth22 ; "ら"
        .word <>aDialogueCustomWidth23 ; "り"
        .word <>aDialogueCustomWidth24 ; "る"
        .word <>aDialogueCustomWidth25 ; "れ"
        .word <>aDialogueCustomWidth26 ; "ろ"
        .word <>aDialogueCustomWidth27 ; "わ"
        .word <>aDialogueCustomWidth28 ; "を"
        .word <>aDialogueCustomWidth29 ; "ん"
        .word <>aDialogueCustomWidth2A ; "が"
        .word <>aDialogueCustomWidth2B ; "ぎ"
        .word <>aDialogueCustomWidth2C ; "ぐ"
        .word <>aDialogueCustomWidth2D ; "げ"
        .word <>aDialogueCustomWidth2E ; "ご"
        .word <>aDialogueCustomWidth2F ; "ざ"
        .word <>aDialogueCustomWidth30 ; "じ"
        .word <>aDialogueCustomWidth31 ; "ず"
        .word <>aDialogueCustomWidth32 ; "ぜ"
        .word <>aDialogueCustomWidth33 ; "ぞ"
        .word <>aDialogueCustomWidth34 ; "だ"
        .word <>aDialogueCustomWidth35 ; "ぢ"
        .word <>aDialogueCustomWidth35 ; "づ"
        .word <>aDialogueCustomWidth35 ; "で"
        .word <>aDialogueCustomWidth36 ; "ど"
        .word <>aDialogueCustomWidth37 ; "ば"
        .word <>aDialogueCustomWidth38 ; "び"
        .word <>aDialogueCustomWidth39 ; "ぶ"
        .word <>aDialogueCustomWidth3A ; "べ"
        .word <>aDialogueCustomWidth3A ; "ぼ"
        .word <>aDialogueCustomWidth3B ; "ぱ"
        .word <>aDialogueCustomWidth3C ; "ぴ"
        .word <>aDialogueCustomWidth3C ; "ぷ"
        .word <>aDialogueCustomWidth3C ; "ぺ"
        .word <>aDialogueCustomWidth3C ; "ぽ"
        .word <>aDialogueCustomWidth3C ; "ぁ"
        .word <>aDialogueCustomWidth3C ; "ぃ"
        .word <>aDialogueCustomWidth3C ; "ぅ"
        .word <>aDialogueCustomWidth3D ; "ぇ"
        .word <>aDialogueCustomWidth3E ; "ぉ"
        .word <>aDialogueCustomWidth3F ; "っ"
        .word <>aDialogueCustomWidth40 ; "ゃ"
        .word <>aDialogueCustomWidth40 ; "ゅ"
        .word <>aDialogueCustomWidth40 ; "ょ"
        .word <>aDialogueCustomWidth41 ; "ア"
        .word <>aDialogueCustomWidth42 ; "イ"
        .word <>aDialogueCustomWidth43 ; "ウ"
        .word <>aDialogueCustomWidth44 ; "エ"
        .word <>aDialogueCustomWidth45 ; "オ"
        .word <>aDialogueCustomWidth46 ; "カ"
        .word <>aDialogueCustomWidth46 ; "キ"
        .word <>aDialogueCustomWidth47 ; "ク"
        .word <>aDialogueCustomWidth48 ; "ケ"
        .word <>aDialogueCustomWidth49 ; "コ"
        .word <>aDialogueCustomWidth4A ; "サ"
        .word <>aDialogueCustomWidth4B ; "シ"
        .word <>aDialogueCustomWidth4C ; "ス"
        .word <>aDialogueCustomWidth4D ; "セ"
        .word <>aDialogueCustomWidth4D ; "ソ"
        .word <>aDialogueCustomWidth4E ; "タ"
        .word <>aDialogueCustomWidth4F ; "チ"
        .word <>aDialogueCustomWidth50 ; "ツ"
        .word <>aDialogueCustomWidth51 ; "テ"
        .word <>aDialogueCustomWidth52 ; "ト"
        .word <>aDialogueCustomWidth53 ; "ナ"
        .word <>aDialogueCustomWidth54 ; "ニ"
        .word <>aDialogueCustomWidth54 ; "ヌ"
        .word <>aDialogueCustomWidth54 ; "ネ"
        .word <>aDialogueCustomWidth55 ; "ノ"
        .word <>aDialogueCustomWidth56 ; "ハ"
        .word <>aDialogueCustomWidth56 ; "ヒ"
        .word <>aDialogueCustomWidth57 ; "フ"
        .word <>aDialogueCustomWidth58 ; "ヘ"
        .word <>aDialogueCustomWidth58 ; "ホ"
        .word <>aDialogueCustomWidth59 ; "マ"
        .word <>aDialogueCustomWidth5A ; "ミ"
        .word <>aDialogueCustomWidth5A ; "ム"
        .word <>aDialogueCustomWidth5B ; "メ"
        .word <>aDialogueCustomWidth5C ; "モ"
        .word <>aDialogueCustomWidth5C ; "ヤ"
        .word <>aDialogueCustomWidth5C ; "ユ"
        .word <>aDialogueCustomWidth5C ; "ヨ"
        .word <>aDialogueCustomWidth5D ; "ラ"
        .word <>aDialogueCustomWidth5E ; "リ"
        .word <>aDialogueCustomWidth5F ; "ル"
        .word <>aDialogueCustomWidth60 ; "レ"
        .word <>aDialogueCustomWidth60 ; "ロ"
        .word <>aDialogueCustomWidth60 ; "ワ"
        .word <>aDialogueCustomWidth60 ; "ン"
        .word <>aDialogueCustomWidth60 ; "ガ"
        .word <>aDialogueCustomWidth60 ; "ギ"
        .word <>aDialogueCustomWidth61 ; "グ"
        .word <>aDialogueCustomWidth62 ; "ゲ"
        .word <>aDialogueCustomWidth62 ; "ゴ"
        .word <>aDialogueCustomWidth63 ; "ザ"
        .word <>aDialogueCustomWidth64 ; "ジ"
        .word <>aDialogueCustomWidth65 ; "ズ"
        .word <>aDialogueCustomWidth66 ; "ゼ"
        .word <>aDialogueCustomWidth66 ; "ゾ"
        .word <>aDialogueCustomWidth67 ; "ダ"
        .word <>aDialogueCustomWidth68 ; "ヂ"
        .word <>aDialogueCustomWidth68 ; "ヅ"
        .word <>aDialogueCustomWidth68 ; "デ"
        .word <>aDialogueCustomWidth68 ; "ド"
        .word <>aDialogueCustomWidth69 ; "バ"
        .word <>aDialogueCustomWidth69 ; "ビ"
        .word <>aDialogueCustomWidth69 ; "ブ"
        .word <>aDialogueCustomWidth6A ; "ベ"
        .word <>aDialogueCustomWidth6B ; "ボ"
        .word <>aDialogueCustomWidth6C ; "ヴ"
        .word <>aDialogueCustomWidth6D ; "パ"
        .word <>aDialogueCustomWidth6D ; "ピ"
        .word <>aDialogueCustomWidth6E ; "プ"
        .word <>aDialogueCustomWidth6F ; "ペ"
        .word <>aDialogueCustomWidth6F ; "ポ"
        .word <>aDialogueCustomWidth70 ; "ァ"
        .word <>aDialogueCustomWidth71 ; "ィ"
        .word <>aDialogueCustomWidth72 ; "ゥ"
        .word <>aDialogueCustomWidth73 ; "ェ"
        .word <>aDialogueCustomWidth74 ; "ォ"
        .word <>aDialogueCustomWidth75 ; "ッ"
        .word <>aDialogueCustomWidth76 ; "ャ"
        .word <>aDialogueCustomWidth77 ; "ュ"
        .word <>aDialogueCustomWidth78 ; "ョ"
        .word <>aDialogueCustomWidth79 ; "ー"
        .word <>aDialogueCustomWidth79 ; "０"
        .word <>aDialogueCustomWidth79 ; "１"
        .word <>aDialogueCustomWidth79 ; "２"
        .word <>aDialogueCustomWidth79 ; "３"
        .word <>aDialogueCustomWidth79 ; "４"
        .word <>aDialogueCustomWidth79 ; "５"
        .word <>aDialogueCustomWidth79 ; "６"
        .word <>aDialogueCustomWidth79 ; "７"
        .word <>aDialogueCustomWidth79 ; "８"
        .word <>aDialogueCustomWidth79 ; "９"
        .word <>aDialogueCustomWidth79 ; "､"
        .word <>aDialogueCustomWidth79 ; "｡"
        .word <>aDialogueCustomWidth79 ; "！"
        .word <>aDialogueCustomWidth79 ; "？"
        .word <>aDialogueCustomWidth79 ; "･"
        .word <>aDialogueCustomWidth79 ; "｢"
        .word <>aDialogueCustomWidth79 ; "｣"
        .word <>aDialogueCustomWidth79 ; "（"
        .word <>aDialogueCustomWidth79 ; "）"
        .word <>aDialogueCustomWidth79 ; "～"
        .word <>aDialogueCustomWidth79 ; "　"
        .word <>aDialogueCustomWidth79 ; "𝑨"
        .word <>aDialogueCustomWidth79 ; "Ｂ"
        .word <>aDialogueCustomWidth79 ; "𝑪"
        .word <>aDialogueCustomWidth79 ; "𝑫"
        .word <>aDialogueCustomWidth79 ; "Ｅ"
        .word <>aDialogueCustomWidth79 ; "𝑩"
        .word <>aDialogueCustomWidth79 ; "Ｇ"
        .word <>aDialogueCustomWidth79 ; "𝑬"
        .word <>aDialogueCustomWidth79 ; "𝑺"
        .word <>aDialogueCustomWidth79 ; "Ｊ"
        .word <>aDialogueCustomWidth79 ; "Ｋ"
        .word <>aDialogueCustomWidth79 ; "Ｌ"
        .word <>aDialogueCustomWidth79 ; "Ｍ"
        .word <>aDialogueCustomWidth79 ; "Ｎ"
        .word <>aDialogueCustomWidth79 ; "Ｏ"
        .word <>aDialogueCustomWidth79 ; "Ｐ"
        .word <>aDialogueCustomWidth79 ; "Ｑ"
        .word <>aDialogueCustomWidth79 ; "Ｒ"
        .word <>aDialogueCustomWidth79 ; "Ｓ"
        .word <>aDialogueCustomWidth79 ; "Ｔ"
        .word <>aDialogueCustomWidth79 ; "Ｕ"
        .word <>aDialogueCustomWidth79 ; "Ｖ"
        .word <>aDialogueCustomWidth79 ; "Ｗ"
        .word <>aDialogueCustomWidth79 ; "Ｘ"
        .word <>aDialogueCustomWidth79 ; "Ｙ"
        .word <>aDialogueCustomWidth79 ; "Ｚ"
        .word <>aDialogueCustomWidth79 ; "，"
        .word <>aDialogueCustomWidth79 ; "一"
        .word <>aDialogueCustomWidth79 ; "二"
        .word <>aDialogueCustomWidth79 ; "三"
        .word <>aDialogueCustomWidth79 ; "四"
        .word <>aDialogueCustomWidth79 ; "五"
        .word <>aDialogueCustomWidth79 ; "六"
        .word <>aDialogueCustomWidth79 ; "七"
        .word <>aDialogueCustomWidth79 ; "八"
        .word <>aDialogueCustomWidth79 ; "九"
        .word <>aDialogueCustomWidth79 ; "十"
        .word <>aDialogueCustomWidth79 ; "𝐆"
        .word <>aDialogueCustomWidth79 ; "."
        .word <>aDialogueCustomWidth79 ; "A"
        .word <>aDialogueCustomWidth79 ; "B"
        .word <>aDialogueCustomWidth79 ; "C"
        .word <>aDialogueCustomWidth79 ; "D"
        .word <>aDialogueCustomWidth79 ; "E"
        .word <>aDialogueCustomWidth79 ; "F"
        .word <>aDialogueCustomWidth79 ; "G"
        .word <>aDialogueCustomWidth79 ; "H"
        .word <>aDialogueCustomWidth79 ; "I"
        .word <>aDialogueCustomWidth79 ; "J"
        .word <>aDialogueCustomWidth79 ; "K"
        .word <>aDialogueCustomWidth79 ; "L"
        .word <>aDialogueCustomWidth79 ; "M"
        .word <>aDialogueCustomWidth79 ; "N"
        .word <>aDialogueCustomWidth79 ; "O"
        .word <>aDialogueCustomWidth79 ; "P"
        .word <>aDialogueCustomWidth79 ; "Q"
        .word <>aDialogueCustomWidth79 ; "R"
        .word <>aDialogueCustomWidth79 ; "S"
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth78
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>aDialogueCustomWidth79
        .word <>$A3AB ; this isnt a table but a routine
        .word <>$A3D9
        .word <>$A3DD

        ; 91/A3AB

    .endsection Dialogue1Section


    .section Dialogue2Section

      rlRunDialogueEventCommand ; 91/A863

        .al
        .autsiz
        .databank ?

        ; Runs dialogue commands that are $80 or above

        ; 0 - 7 are available

        sta wR0

        lda lR18
        sta lR22
        lda lR18+1
        sta lR22+1

        lda wR0
        cmp #8
        bmi +
        
          -
          bra -

        +
        asl a
        tax
        jsr (aDialogueEventCommandPointers,x)

        rtl

        .databank 0

      aDialogueEventCommandPointers ; 91/A87C

        .word <>rsDialogueEventCommand00
        .word <>rsDialogueEventCommand01
        .word <>rsDialogueEventCommand02
        .word <>rsDialogueEventCommand03
        .word <>rsDialogueEventCommand04
        .word <>rsDialogueEventCommand05
        .word <>rsDialogueEventCommand06
        .word <>rsDialogueEventCommand07

      rsDialogueEventCommand00 ; 91/A88C

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_WMM

        ; $80

        jsr rsEventCommand52

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b

        clc
        rts

        .databank 0

      rsDialogueEventCommand01 ; 91/A89D

        .al
        .autsiz
        .databank ?

        ; DIALOGUE_CLEAR_WMM

        ; $81

        jsr rsEventCommand53

        inc aDialogue.lActivePointer,b

        clc
        rts

        .databank 0

      rsDialogueEventCommand02 ; 91/A8A5

        .al
        .autsiz
        .databank ?

        ; $82

        ; DIALOGUE_WM_LOAD_PORTRAIT

        jsr rsEventCommand54

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b

        clc
        rts

        .databank 0

      rsDialogueEventCommand03 ; 91/A8B3

        .al
        .autsiz
        .databank ?

        ; $83
        ; DIALOGUE_WM_FADE_IN_PORTRAIT

        jsr rsEventCommand55

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b

        clc
        rts

        .databank 0

      rsDialogueEventCommand04 ; 91/A8C1

        .al
        .autsiz
        .databank ?

        ; $84
        ; DIALOGUE_WM_FADE_OUT_PORTRAIT

        jsr rsEventCommand56

        inc aDialogue.lActivePointer,b

        clc
        rts

        .databank 0

      rsDialogueEventCommand05 ; 91/A8C9

        .al
        .autsiz
        .databank ?

        ; $85

        jsr rsEventCommand57

        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b
        inc aDialogue.lActivePointer,b

        clc
        rts

        .databank 0

      rsDialogueEventCommand06 ; 91/A8D7

        .al
        .autsiz
        .databank ?

        ; $86
        ; DIALOGUE_WM_HIGHLIGHT

        jsr rsEventCommand5B

        inc aDialogue.lActivePointer,b

        clc
        rts

        .databank 0

      rsDialogueEventCommand07 ; 91/A8DF

        .al
        .autsiz
        .databank ?

        ; $87
        ; DIALOGUE_WM_CLEAR_HIGHLIGHT

        jsr rsEventCommand5C

        clc
        rts

        .databank 0

        ; 91/A8E4

    .endsection Dialogue2Section


    .section Dialogue3Section

      rlUnknown91A984 ; 91/A984

        .al
        .autsiz
        .databank ?

        lda #TilemapEntry($000, 0, true, false, false)
        sta aDialogue.wBaseTile,b
        lda #TilemapEntry($0FF, 0, true, false, false)
        sta aDialogue.wClearTile,b
        lda #(`g2bppDialogueFont)<<8
        sta aDialogue.lFontGraphics+1,b
        lda #<>g2bppDialogueFont
        sta aDialogue.lFontGraphics,b
        lda #(`aDialogueFontWidth)<<8
        sta aDialogue.lFontWidthTable+1,b
        lda #<>aDialogueFontWidth
        sta aDialogue.lFontWidthTable,b
        lda #$2D8C
        sta aBGPaletteBuffer.aPalette0+2,b
        lda #$7FFF
        sta aBGPaletteBuffer.aPalette0+4,b
        lda #$0C62
        sta aBGPaletteBuffer.aPalette0+6,b
        rtl

        .databank 0

        ; 91/A9BB

    .endsection Dialogue3Section
