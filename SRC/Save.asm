    
    .weak

      rlCalculateFinalRankingScore                :?= address($848DC1)
      rlFillItemsOwnerAndSlotData                 :?= address($87FBC5)
      rlFillItemDurabilityData                    :?= address($87FC51)
      rlFillUnitsDeploymentSaveData               :?= address($87FA83)
      rlCompactStaticDynamicUnitBuffer1UnitStates :?= address($87F9CE)
      rlCompactHolyEnemyUnitBuffer1UnitStates     :?= address($87FA1E)
      rlCheckIfCharacterHasFemaleGenerationID     :?= address($87F4CF)

    .endweak

    .section SaveCode1Section

      rlHandleSaveFile ; 91/D9C5

        .al
        .autsiz
        .databank ?

        lda aSave.wMenuOperation,b
        beq _End

          bit #$8000
          bne _LoadFile

            ; SaveFile
            lda aSave.wMenuOperation,b
            dec a
            jsl rlSaveToSaveSlot

            lda aSave.wMenuOperation,b
            dec a
            jsl rlUnknown91ECE4
            bra +

          _LoadFile
          lda aSave.wMenuOperation,b
          and #$7FFF
          dec a
          jsl rlLoadFromSaveSlot

          +
          lda aSave.wMenuOperation,b
          and #$7FFF
          dec a
          sta aSave.wUnknown001B09,b
          stz aSave.wMenuOperation,b

        _End
        rtl

        .databank 0

        ; 91/D9FA

    .endsection SaveCode1Section


    .section SaveCode2Section

      rlSaveToSaveSlot ; 91/E95F

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID, 0 indexed

        phx
        phy
        pha
        sta aSave.wActiveSlot,b
        jsr rsClearSaveSlot
        jsr rsSaveGameTimerAndUnitLosses
        jsr rsSaveSaveFileBody
        jsr rsSaveLastUsedOptions
        jsr rsFillSaveSlotDataBuffers
        pla
        ply
        plx
        rtl

        .databank 0

      rlLoadFromSaveSlot ; 91/E978

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID, 0 indexed

        phx
        phy
        pha
        sta aSave.wActiveSlot,b
        jsl $88818A
        jsl $81A85C
        jsr rsLoadGameTimerAndUnitLosses
        jsr rsLoadSaveFileBody
        jsr rsFillSaveSlotDataBuffers
        jsl $87BF6F
        jsl $8BCEAD
        pla
        ply
        plx
        rtl

        .databank 0

      rlUnknown91E99B ; 91/E99B

        .al
        .autsiz
        .databank ?

        jsl $88818A
        jsl $81A85C
        jsl rlUnknown848000
        jsr rsFillSaveSlotDataBuffers
        jsr rsGetNewUniqueSaveID
        sta aSave.wActiveSaveData,b
        jsr rsClearUnitLosses
        jsr rsClearGameTimer
        jsl $87BF6F
        rtl

        .databank 0

      rlUnknown91E9BB ; 91/E9BB

        .al
        .autsiz
        .databank ?

        phb
        pha
        jsr rsCalculateSaveSlotChecksum
        inc a
        tay
        pla
        jsr rsSetSaveSlotChecksum
        jsr rsFillSaveSlotDataBuffers

        lda aSave.aSlotDataBuffer[0],b
        bne _End

          lda aSave.aSlotDataBuffer[1],b
          bne _End

            lda aSave.aSlotDataBuffer[2],b
            bne _End

              lda aSave.aSlotDataBuffer[3],b
              bne _End

                lda #0
                sta aSRAM.wLastUsedOptions
                sta aSRAM.wRankingScore

        _End
        plb
        rtl

        .databank 0

      rsFillSaveSlotDataBuffers ; 91/E9EA

        .al
        .autsiz
        .databank ?

        ldy #0
        sty aSave.wActiveSlot,b
        
          _Loop
          phy
          lda aSave.wActiveSlot,b
          jsr rsCalculateSaveSlotChecksum
          pha
          lda aSave.wActiveSlot,b
          jsr rsGetSaveSlotChecksum
          sta wR0
          pla
          cmp wR0
          bne _AE21

            lda aSave.wActiveSlot,b
            jsr rsGetSaveSlotMagicNumber
            cmp #$9207
            beq +

              cmp #$1206
              bne _AE21

            +
            lda aSave.wActiveSlot,b
            jsr rsGetSaveSlotOffset
            lda aSRAM.aSaveSlot1.SaveData,x
            bra +

          _AE21
          lda #0

          +
          ply
          sta aSave.aSlotDataBuffer[0],b,y
          inc aSave.wActiveSlot,b
          inc y
          inc y
          cpy #len(aSave.aSlotDataBuffer) * size(word)
          bne _Loop

        rts

        .databank 0

      rsGetNewUniqueSaveID ; 91/EA33

        .al
        .autsiz
        .databank ?

        ; Output:
        ; A = SaveID that isnt used yet + highest completion count

        lda #0
        sep #$20
        lda aSave.aSlotDataBuffer[0],b
        cmp aSave.aSlotDataBuffer[1],b
        bcs +

          lda aSave.aSlotDataBuffer[1],b

        +
        cmp aSave.aSlotDataBuffer[2],b
        bcs +

          lda aSave.aSlotDataBuffer[2],b

        +
        cmp aSave.aSlotDataBuffer[3],b
        bcs +

          lda aSave.aSlotDataBuffer[3],b

        +
        and #$F8
        bpl +

          cmp #$F8
          beq +

            ; Add to the completion count
            clc
            adc #1 << 3

        +
        and #$7F
        inc a

        _Loop
        cmp aSave.aSlotDataBuffer[0],b
        beq _Next

          cmp aSave.aSlotDataBuffer[1],b
          beq _Next

            cmp aSave.aSlotDataBuffer[2],b
            beq _Next

              cmp aSave.aSlotDataBuffer[3],b
              bne +

        _Next
        inc a
        bra _Loop

        +
        rep #$20
        rts

        .databank 0

      rlUnknown91EA7B ; 91/EA7B

        .al
        .autsiz
        .databank ?

        jsr rsGetSaveSlotOffset
        lda $306001,x
        and #$00FF
        rtl

        .databank 0

      rlUnknown91EA86 ; 91/EA86

        .al
        .autsiz
        .databank ?

        jsr rsGetSaveSlotOffset
        lda $306015,x
        xba
        sep #$20
        ora $306002,x
        rep #$20
        pha

        lda $3067BC,x
        cmp #$9207
        beq _End

        pla
        pha
        cmp #$00FF
        bne _End

        pla
        lda #$FFFF
        pha
        
        _End
        pla
        rtl

        .databank 0

      rlGetHighestCompletionCount ; 91/EAAE

        .al
        .autsiz
        .databank ?

        phx
        phy
        jsr rsFillSaveSlotDataBuffers
        jsr rsGetNewUniqueSaveID
        lsr a
        lsr a
        lsr a
        and #$000F
        ply
        plx
        rtl

        .databank 0

      rlGetCurrentSaveCompletionCount ; 91/EABF

        .al
        .autsiz
        .databank ?

        lda aSave.wActiveSaveData,b
        lsr a
        lsr a
        lsr a
        and #$000F
        rtl

        .databank 0

      rlSetSaveSlotCompletionFlag ; 91/EAC9

        .al
        .autsiz
        .databank ?

        phx
        phy
        ldy #0
        
          _Loop
          lda aSave.aSlotDataBuffer[0],b,y
          beq _Next

            and #$007F
            cmp aSave.wActiveSaveData,b
            bne _Next

              tya
              lsr a
              jsr rsGetSaveSlotOffset
              lda aSRAM + structSaveDataEntry.SaveData,x
              bit #$0080
              bne _Next

                clc
                adc #$0080
                sta aSRAM + structSaveDataEntry.SaveData,x
                phy
                tya
                lsr a
                pha
                jsr rsGetSaveSlotChecksum
                clc
                adc #$0080
                tay
                pla
                jsr rsSetSaveSlotChecksum
                ply

          _Next
          inc y
          inc y
          cpy #4 * 2
          bne _Loop

        jsr rsUnknown91ECA6

        ply
        plx
        rtl

        .databank 0

      rlUnknown91EB0F ; 91/EB0F

        .al
        .autsiz
        .databank ?

        phx
        phy
        cmp #48
        bcc +

          brk

        +
        tax
        sta aSave.wStructCount,b
        lda aUnitLossesCount[0],x
        and #$00FF
        cmp #$00FF
        beq +

          lda aUnitLossesCount[0],x
          inc a
          sta aUnitLossesCount[0],x

        +
        ldy #0
        
          _Loop
          lda $0D69,b
          and #$FF00
          ora aSave.wActiveSaveData,b
          and #$FF7F
          sta $1B29,b

          lda aSave.aSlotDataBuffer[0],b,y
          and #$FF7F
          cmp $1B29,b
          bne _Next

            tya
            lsr a
            jsr rsUnknown91EB5C

          _Next
          inc y
          inc y
          cpy #8
          bne _Loop

        ply
        plx
        rtl

        .databank 0

      rsUnknown91EB5C ; 91/EB5C

        .al
        .autsiz
        .databank ?

        jsr rsGetSaveSlotOffset
        clc
        adc aSave.wStructCount,b
        tax
        sep #$20
        lda aSRAM + structSaveDataEntry.UnitLossesCount[0],x
        cmp #$FF
        beq +

          inc a
          sta aSRAM + structSaveDataEntry.UnitLossesCount[0],x

        +
        rep #$20
        rts

        .databank 0

      rlUnknown91EB76 ; 91/EB76

        .al
        .autsiz
        .databank ?

        php
        phb
        phx
        phy
        phk
        plb
        lda aSave.wActiveSaveData,b
        beq _End

          inc aSave.wGameTimerLow,b
          bne +

            inc aSave.wGameTimerHigh,b

          +
          lda aSave.wGameTimerLow,b
          and #$07FF
          bne _End

          ldy #0
          
            _Loop
            lda aSave.aSlotDataBuffer[0],b,y
            and #$007F
            cmp aSave.wActiveSaveData,b
            bne _Next

              tya
              lsr a
              jsr rsGetSaveSlotOffset
              lda aSave.wGameTimerLow,b
              sta $3067F0,x
              lda aSave.wGameTimerHigh,b
              sta $3067F2,x

            _Next
            inc y
            inc y
            cpy #4 * 2
            bne _Loop

        _End
        ply
        plx
        plb
        plp
        rtl

        .databank 0

      rlUnknown91EBBE ; 91/EBBE

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda aUnitLossesCount[0],x
        and #$00FF
        plx
        rtl

        .databank 0

      rlUnknown91EBC9 ; 91/EBC9

        .al
        .autsiz
        .databank ?

        lda aSave.wGameTimerLow,b
        sta wR12
        lda aSave.wGameTimerHigh,b
        sta wR13
        lda #3600
        sta wR14
        lda #0
        sta wR15
        jsl $80A1D8

        lda #60
        sta wR14
        lda #0
        sta wR15
        jsl $80A1D8

        lda wR13
        bne +

          lda wR12
          cmp #9999
          bcc ++

        +
        lda #9999

        +
        tax
        lda wR10
        rtl

        .databank 0

      rsClearUnitLosses ; 91/EC01

        .al
        .autsiz
        .databank ?

        ldy #len(aUnitLossesCount) / size(byte)
        lda #0
        tax
        sep #$20

          -
          sta aUnitLossesCount[0],x
          inc x
          dec y
          bne -

        rep #$20
        rts

        .databank 0

      rsClearGameTimer ; 91/EC15

        .al
        .autsiz
        .databank ?

        lda #0
        sta aSave.wGameTimerLow,b
        sta aSave.wGameTimerHigh,b
        rts

        .databank 0

      rsSaveGameTimerAndUnitLosses ; 91/EC1F

        .al
        .autsiz
        .databank ?

        lda aSave.wActiveSlot,b
        jsr rsGetSaveSlotOffset

        lda aSave.wGameTimerLow,b
        sta aSRAM + structSaveDataEntry.GameTimerLow,x
        lda aSave.wGameTimerHigh,b
        sta aSRAM + structSaveDataEntry.GameTimerHigh,x

        lda #(`aUnitLossesCount[0])<<8
        sta lR18+1
        lda #<>aUnitLossesCount[0]
        sta lR18
        ldy #0
        sep #$20

          -
          lda [lR18],y
          sta aSRAM.aSaveSlot1.UnitLossesCount[0],x
          inc x
          inc y
          cpy #len(aUnitLossesCount) / size(byte)
          bne -

        rep #$20
        rts

        .databank 0

      rsLoadGameTimerAndUnitLosses ; 91/EC52

        .al
        .autsiz
        .databank ?

        lda aSave.wActiveSlot,b
        jsr rsGetSaveSlotOffset

        lda aSRAM + structSaveDataEntry.GameTimerLow,x
        sta aSave.wGameTimerLow,b
        lda aSRAM + structSaveDataEntry.GameTimerHigh,x
        sta aSave.wGameTimerHigh,b

        lda #(`aUnitLossesCount[0])<<8
        sta lR18+1
        lda #<>aUnitLossesCount[0]
        sta lR18
        ldy #0
        sep #$20

          -
          lda aSRAM + structSaveDataEntry.UnitLossesCount[0],x
          sta [lR18],y
          inc x
          inc y
          cpy #len(aUnitLossesCount) / size(byte)
          bne -

        rep #$20
        rts

        .databank 0

      rsGetSaveSlotOffset ; 91/EC85

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID

        ; Output:
        ; X = offset

        and #$0003
        xba
        asl a
        asl a
        asl a
        tax
        rts

        .databank 0

      rlUnknown91EC8E ; 91/EC8E

        .al
        .autsiz
        .databank ?

        jsr rsUnknown91EC9A
        rtl

        .databank 0

      rsSaveLastUsedOptions ; 91/EC92

        .al
        .autsiz
        .databank ?

        lda wOptionSettings,b
        sta aSRAM.wLastUsedOptions
        rts

        .databank 0

      rsUnknown91EC9A ; 91/EC9A

        .al
        .autsiz
        .databank ?

        lda aSRAM.wLastUsedOptions
        sta wOptionSettings,b
        rts

        .databank 0

      rlUnknown91ECA2 ; 91/ECA2

        .al
        .autsiz
        .databank ?

        jsr $91ECC3
        rtl

        .databank 0

      rsUnknown91ECA6 ; 91/ECA6

        .al
        .autsiz
        .databank ?

        jsl rlCalculateFinalRankingScore
        inc a
        and #$0007
        sta wR0

        jsr rsUnknown91ECC3
        beq +

          cmp wR0
          bcc _End

        +
        lda wR0
        ora #$F290
        sta aSRAM.wRankingScore

        _End
        rts

        .databank 0

      rsUnknown91ECC3 ; 91/ECC3

        .al
        .autsiz
        .databank ?

        lda aSRAM.wRankingScore
        pha

        and #$FFF8
        cmp #$F290
        beq +

          pla
          lda #0
          pha

        +
        pla
        and #$0007
        rts

        .databank 0

      rlUnknown91ECDA ; 91/ECDA

        .al
        .autsiz
        .databank ?

        sta aSRAM.wUnknown3077FE
        rtl

        .databank 0

      rlUnknown91ECDF ; 91/ECDF

        .al
        .autsiz
        .databank ?

        lda aSRAM.wUnknown3077FE
        rtl

        .databank 0

      rlUnknown91ECE4 ; 91/ECE4

        .al
        .autsiz
        .databank ?

        and #$0003
        ora #$D8C0
        sta aSRAM.wUnknown307FFE
        rtl

        .databank 0

      rlUnknown91ECEF ; 91/ECEF

        .al
        .autsiz
        .databank ?

        lda aSRAM.wUnknown307FFE
        pha
        and #$FFFC
        cmp #$D8C0
        beq +

          pla
          lda #0
          pha

        +
        pla
        and #$0003
        rtl

        .databank 0

      rsSetSaveDataOffsets ; 91/ED06

        .al
        .autsiz
        .databank ?

        xba
        asl a
        asl a
        asl a
        sta aSave.wAvtiveSaveSlotOffset,b
        stz aSave.wCurrentBitOffset,b
        rts

        .databank 0

      rsWriteBitpackedSaveData ; 91/ED11

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = value to write

        phx
        stz wR1

        lda aSave.wDataBitLength,b
        beq _End

          dec a
          asl a
          tax
          lda aSaveDataBitmasks,x
          and wR0
          sta wR0

          lda aSave.wCurrentBitOffset,b
          and #$0007
          beq +

            tax

              -
              asl wR0
              rol wR1
              dec x
              bne -

          +
          lda aSave.wCurrentBitOffset,b
          lsr a
          lsr a
          lsr a
          clc
          adc aSave.wAvtiveSaveSlotOffset,b
          tax

          lda wR0
          beq +

            ora aSRAM,x
            sta aSRAM,x

          +
          lda wR1
          beq +

            ora aSRAM + size(word),x
            sta aSRAM + size(word),x

          +
          lda aSave.wCurrentBitOffset,b
          clc
          adc aSave.wDataBitLength,b
          sta aSave.wCurrentBitOffset,b

        _End
        plx
        rts

        .databank 0

      rsReadBitpackedSaveData ; 91/ED63

        .al
        .autsiz
        .databank ?

        phx
        lda aSave.wDataBitLength,b
        beq _End

          lda aSave.wCurrentBitOffset,b
          lsr a
          lsr a
          lsr a
          clc
          adc aSave.wAvtiveSaveSlotOffset,b
          tax

          lda aSRAM,x 
          sta wR0
          lda aSRAM + 2,x
          sta wR1

          lda aSave.wCurrentBitOffset,b
          and #$0007
          beq +

            tax

              -
              lsr wR1
              ror wR0
              dec x
              bne -

          +
          lda aSave.wDataBitLength,b
          dec a
          asl a
          tax
          lda aSaveDataBitmasks,x
          and wR0
          pha

          lda aSave.wCurrentBitOffset,b
          clc
          adc aSave.wDataBitLength,b
          sta aSave.wCurrentBitOffset,b
          pla

        _End
        plx
        rts

        .databank 0

      aSaveDataBitmasks ; 91/EDAA

        .word $0001 ; 1
        .word $0003 ; 2
        .word $0007 ; 3
        .word $000F ; 4
        .word $001F ; 5
        .word $003F ; 6
        .word $007F ; 7
        .word $00FF ; 8
        .word $01FF ; 9
        .word $03FF ; 10
        .word $07FF ; 11
        .word $0FFF ; 12
        .word $1FFF ; 13
        .word $3FFF ; 14
        .word $7FFF ; 15
        .word $FFFF ; 16

      rsSaveBitpackedDataOffsets ; 91/EDCA

        .al
        .autsiz
        .databank ?

        _Loop
        tay
        inc x
        lda $0000,b,x
        and #$007F
        sta aSave.wDataBitLength,b

        _EDD5
        lda [lR18],y
        sta wR0
        inc x

        phx
        jsr rsWriteBitpackedSaveData
        plx

        _Entry ; 91/EDDF
        lda $0000,b,x
        and #$00FF
        cmp #$00FF
        bne _Loop

        rts

        .databank 0

      rsLoadBitpackedDataOffsets ; 91/EDEB

        .al
        .autsiz
        .databank ?

        _Loop
        tay
        inc x
        lda $0000,b,x
        pha
        and #$007F
        sta aSave.wDataBitLength,b
        inc x
        phx
        jsr rsReadBitpackedSaveData
        sta wR0
        plx
        pla
        bit #$0080
        beq +

          sep #$20
          lda wR0
          sta [lR18],y
          rep #$20
          bra +_Entry

        +
        lda wR0
        sta [lR18],y

        _Entry ; 91/EE13
        lda $0000,b,x
        and #$00FF
        cmp #$00FF
        bne _Loop
        
        rts

        .databank 0

      rsSaveBitpackedDataList ; 91/EE1F

        .al
        .autsiz
        .databank ?

        _Loop
        and #$007F
        sta aSave.wDataBitLength,b
        inc x
        lda $0000,b,x
        sta lR18
        inc x
        lda $0000,b,x
        sta lR18+1
        inc x
        inc x
        ldy #0
        lda [lR18],y
        sta wR0

        phx
        jsr rsWriteBitpackedSaveData
        plx

        _Entry ; 91/EE3F
        lda $0000,b,x
        and #$00FF
        cmp #$00FF
        bne _Loop

        rts

        .databank 0

      rsLoadBitpackedDataList ; 91/EE4B

        .al
        .autsiz
        .databank ?

        _Loop
        pha
        and #$007F
        sta aSave.wDataBitLength,b
        inc x
        lda $0000,b,x
        sta lR18
        inc x
        lda $0000,b,x
        sta lR18+1
        inc x
        inc x
        phx
        jsr rsReadBitpackedSaveData
        sta wR0
        plx
        ldy #0
        pla
        bit #$0080
        beq _Word

          sep #$20
          lda wR0
          sta [lR18],y
          rep #$20
          bra _Entry

        _Word
        lda wR0
        sta [lR18],y

        _Entry ; 91/EE7E
        lda $0000,b,x
        and #$00FF
        cmp #$00FF
        bne _Loop

        rts

        .databank 0

      rsCalculateSaveSlotChecksum ; 91/EE8A

        .al
        .autsiz
        .databank ?

        phb
        pea #(`aSRAM)<<8
        plb
        plb
        xba
        asl a
        asl a
        asl a
        clc
        adc #<>aSRAM
        tax
        ldy #$07BE
        lda #0
        sta wR0
        clc

          _Loop
          lda $0000,b,x
          and #$00FF
          adc wR0
          sta wR0
          inc x
          dec y
          bne _Loop

        inc a
        plb
        rts

        .databank 0

      rsGetSaveSlotChecksum ; 91/EEB3

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID

        jsr rsGetSaveSlotOffset
        lda aSRAM + structSaveDataEntry.Checksum,x
        rts

        .databank 0

      rsSetSaveSlotChecksum ; 91/EEBB

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID
        ; Y = checksum

        jsr rsGetSaveSlotOffset
        tya
        sta aSRAM + structSaveDataEntry.Checksum,x
        rts

        .databank 0

      rsGetSaveSlotMagicNumber ; 91/EEC4

        .al
        .autsiz
        .databank ?

        jsr rsGetSaveSlotOffset
        lda aSRAM + structSaveDataEntry.MagicNumber,x
        rts

        .databank 0

      rsSetSaveSlotMagicNumber ; 91/EECC

        .al
        .autsiz
        .databank ?

        jsr rsGetSaveSlotOffset
        lda #$9207
        sta aSRAM + structSaveDataEntry.MagicNumber,x
        rts

        .databank 0

      rsClearSaveSlot ; 91/EED7

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot

        jsr rsGetSaveSlotOffset
        ldy #size(structSaveDataEntry)
        lda #0

          -
          sta aSRAM.aSaveSlot1,x
          inc x
          inc x
          dec y
          dec y
          bne -

        rts

        .databank 0

      rsSaveSaveFileBody ; 91/EEEB

        .al
        .autsiz
        .databank ?

        ; Saves to file from $00 until the checksum.

        phb
        phk
        plb
        lda aSave.wActiveSlot,b
        jsr rsSetSaveDataOffsets

        jsl rlFillItemsOwnerAndSlotData
        jsr rsSaveGeneralSaveData
        jsr rsSaveFactionHeaderRAMData
        jsr rsSaveItemRAMData
        jsr rsSaveChapterLocationData
        jsr rsSaveChapterEventData
        jsr rsSaveUnitData
        jsl rlFillItemDurabilityData

        lda aSave.wActiveSlot,b
        jsr rsSetSaveSlotMagicNumber

        lda aSave.wActiveSlot,b
        jsr rsCalculateSaveSlotChecksum
        tay

        lda aSave.wActiveSlot,b
        jsr rsSetSaveSlotChecksum

        lda aSave.wCurrentBitOffset,b
        cmp #structSaveDataEntry.Checksum * 8
        bcc +

          brk

        +
        plb
        rts

        .databank 0

      rsLoadSaveFileBody ; 91/EF2C

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        lda aSave.wActiveSlot,b
        jsr rsSetSaveDataOffsets
        jsl rlUnknown848000
        jsr rsLoadGeneralSaveData
        jsr rsLoadFactionHeaderRAMData
        jsl $87FB5E
        jsr rsLoadItemRAMData
        jsr rsLoadChapterLocationData
        jsr rsLoadChapterEventData
        jsr rsLoadUnitData
        jsl rlFillItemDurabilityData
        plb
        rts

        .databank 0

      rsSaveUnitData ; 91/EF55

        .al
        .autsiz
        .databank ?

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b
        jsl rlGetRAMStructCurrentStructCount

        pha
        sta wR0
        lda #7
        sta aSave.wDataBitLength,b
        jsr rsWriteBitpackedSaveData

        pla
        ora #0
        beq _End
        
          sta aSave.wStructIndex,b
          lda #0

            -
            pha
            inc a
            sta wStructIndex,b
            jsl rlLoadRAMStructDataByIndex
            lda lStructPointer1,b
            sta wSelectedUnitDataRAMPointer,b
            jsr rsSaveSpecifiedUnitsData
            pla
            inc a
            cmp aSave.wStructIndex,b
            bne -

        _End
        rts

        .databank 0

      rsLoadUnitData ; 91/EF97

        .al
        .autsiz
        .databank ?

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b
        lda #7
        sta aSave.wDataBitLength,b
        jsr rsReadBitpackedSaveData
        ora #0
        beq _End

          sta aSave.wStructIndex,b
          lda #0

            -
            pha
            inc a
            jsr rsLoadSpecifiedUnitsData
            pla
            inc a
            cmp aSave.wStructIndex,b
            bne -

        _End
        rts

        .databank 0

      aSaveCharacterDeploymentData ; 91/EFC4

        .byte 9
        .long aSave.wCharacterID

        .byte 5
        .long aSave.wCharacterDeploymentState

        .byte 6
        .long aSave.wCharacterXPosition

        .byte 6
        .long aSave.wCharacterYPosition

        .byte $FF

      rsSaveSpecifiedUnitsData ; 91/EFD5

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._Personal)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit1DataBuffer._Personal
        sta lRAMBufferPointer,b
        jsl rlSavePersonalCharacterDataToBuffer

        lda #(`aUnit1DataBuffer._Extended)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit1DataBuffer._Extended
        sta lRAMBufferPointer,b
        jsl rlSaveExtendedCharacterDataToBuffer

        lda #(`aUnit1DataBuffer._ROM)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit1DataBuffer._ROM
        sta lRAMBufferPointer,b
        jsl rlSaveCharacterROMDataToBuffer

        lda #(`aUnit1DataBuffer._Inventory)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit1DataBuffer._Inventory
        sta lRAMBufferPointer,b
        jsl rlSaveCharacterInventoryToBuffer

        lda #(`aUnit1DataBuffer._Lover)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit1DataBuffer._Lover
        sta lRAMBufferPointer,b
        jsl rlSaveLoverDataToBuffer

        jsl rlFillUnitsDeploymentSaveData
        jsl rlGetSelectedUnitCharacterID
        sta aSave.wCharacterID

        ldx #<>aSaveCharacterDeploymentData
        jsr rsSaveBitpackedDataList._Entry

        jsl rlGetUnitType
        jsr rsSaveSpecifiedUnitsDataByType
        rts

        .databank 0

      rsLoadSpecifiedUnitsData ; 91/F03F

        .al
        .autsiz
        .databank ?

        ldx #<>aSaveCharacterDeploymentData
        jsr rsLoadBitpackedDataList._Entry

        lda aSave.wCharacterID
        sta aUnit1DataBuffer._ROM.CharacterID

        jsl $87F501
        jsr rsLoadSpecifiedUnitsDataByType

        lda aSave.wCharacterID
        jsl rlUnknown87F515
        rts

        .databank 0

      rsSaveSpecifiedUnitsDataByType ; 91/F05D

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = unit type

        cmp #UnitTypeStatic
        beq _Static

          cmp #UnitTypeDynamic
          beq _Dynamic

            ; Holy/Enemy
            jml rsSaveHolyEnemyPersonalCharacterData

        _Static
        jsr rsSaveStaticDynamicPersonalCharacterData
        jsr rsSaveStaticDynamicExtendedCharacterData
        bra +

        _Dynamic
        jsr rsSaveStaticDynamicPersonalCharacterData
        jsr rsSaveStaticDynamicExtendedCharacterData
        jsr rsSaveDynamicCharacterROMData

        +
        jsr rsSaveStaticDynamicCharacterInventoryData
        jml rsSaveFemaleCharacterLoverData

        .databank 0

      rsLoadSpecifiedUnitsDataByType ; 91/F083

        .al
        .autsiz
        .databank ?

        cmp #UnitTypeStatic
        beq _Static

          cmp #UnitTypeDynamic
          beq _Dynamic

            jml rsLoadHolyEnemyPersonalCharacterData

        _Static
        jsr rsLoadStaticDynamicPersonalCharacterData
        jsr rsLoadStaticDynamicExtendedCharacterData
        bra +

        _Dynamic
        jsr rsLoadStaticDynamicPersonalCharacterData
        jsr rsLoadStaticDynamicExtendedCharacterData
        jsr rsLoadDynamicCharacterROMData

        +
        jsr rsLoadStaticDynamicCharacterInventoryData
        jml rsLoadFemaleCharacterLoverData

        .databank 0

      aSaveStaticDynamicPersonalCharacterData ; 91/F0A9

        .byte structPersonalCharacterDataBuffer.UnitStates,         11
        .byte structPersonalCharacterDataBuffer.LoverGenerationID,   5
        .byte structPersonalCharacterDataBuffer.ResidingCastle,      4
        .byte structPersonalCharacterDataBuffer.FactionSlot,         3
        .byte structPersonalCharacterDataBuffer.AI,                  4
        .byte structPersonalCharacterDataBuffer.Status,              3
        .byte structPersonalCharacterDataBuffer.StatusDuration,      4
        .byte structPersonalCharacterDataBuffer.CurrentHP,           7
        .byte $FF

      aSaveHolyEnemyPersonalCharacterData ; 91/F0BA

        .byte structPersonalCharacterDataBuffer.UnitStates,         9
        .byte structPersonalCharacterDataBuffer.ResidingCastle,     4
        .byte structPersonalCharacterDataBuffer.FactionSlot,        3
        .byte structPersonalCharacterDataBuffer.AI,                 4
        .byte structPersonalCharacterDataBuffer.Status,             3
        .byte structPersonalCharacterDataBuffer.StatusDuration,     4
        .byte structPersonalCharacterDataBuffer.CurrentHP,          7
        .byte structPersonalCharacterDataBuffer.ClassMoney,         1
        .byte $FF

      rsSaveStaticDynamicPersonalCharacterData ; 91/F0CB

        .al
        .autsiz
        .databank ?

        ; Static or dynamic

        jsl rlCompactStaticDynamicUnitBuffer1UnitStates

        lda #(`aUnit1DataBuffer._Personal)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Personal
        sta lR18
        ldx #<>aSaveStaticDynamicPersonalCharacterData
        jsr rsSaveBitpackedDataOffsets._Entry
        rts

        .databank 0

      rsLoadStaticDynamicPersonalCharacterData ; 91/F0E0

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._Personal)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Personal
        sta lR18
        ldx #<>aSaveStaticDynamicPersonalCharacterData
        jsr rsLoadBitpackedDataOffsets._Entry

        jsl $87F9F6
        rts

        .databank 0

      rsSaveHolyEnemyPersonalCharacterData ; 91/F0F5

        .al
        .autsiz
        .databank ?

        jsl rlCompactHolyEnemyUnitBuffer1UnitStates

        lda #(`aUnit1DataBuffer._Personal)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Personal
        sta lR18
        ldx #<>aSaveHolyEnemyPersonalCharacterData
        jsr rsSaveBitpackedDataOffsets._Entry
        rts

        .databank 0

      rsLoadHolyEnemyPersonalCharacterData ; 91/F10A

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._Personal)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Personal
        sta lR18
        ldx #<>aSaveHolyEnemyPersonalCharacterData
        jsr rsLoadBitpackedDataOffsets._Entry

        jsl $87FA57
        rts

        .databank 0

      aSaveStaticDynamicExtendedCharacterData ; 91/F11F

        .byte structExtendedCharacterDataBuffer.HP,          7
        .byte structExtendedCharacterDataBuffer.Strength,    4
        .byte structExtendedCharacterDataBuffer.Magic,       4
        .byte structExtendedCharacterDataBuffer.Skill,       4
        .byte structExtendedCharacterDataBuffer.Speed,       4
        .byte structExtendedCharacterDataBuffer.Defense,     4
        .byte structExtendedCharacterDataBuffer.Resistance,  4
        .byte structExtendedCharacterDataBuffer.Luck,        5
        .byte structExtendedCharacterDataBuffer.Class,       7
        .byte structExtendedCharacterDataBuffer.Level,       5
        .byte structExtendedCharacterDataBuffer.Money,      16
        .byte structExtendedCharacterDataBuffer.Experience,  7
        .byte structExtendedCharacterDataBuffer.TalkTarget,  6
        .byte $FF

      rsSaveStaticDynamicExtendedCharacterData ; 91/F13A

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._Extended)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Extended
        sta lR18
        ldx #<>aSaveStaticDynamicExtendedCharacterData
        jsr rsSaveBitpackedDataOffsets._Entry
        rts

        .databank 0

      rsLoadStaticDynamicExtendedCharacterData ; 91/F14B

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._Extended)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Extended
        sta lR18
        ldx #<>aSaveStaticDynamicExtendedCharacterData
        jsr rsLoadBitpackedDataOffsets._Entry
        rts

        .databank 0

      aSaveDynamicCharacterROMData ; 91/F15C

        .byte structCharacterROMDataBuffer.FatherID,          4
        .byte structCharacterROMDataBuffer.HPGrowth,          7
        .byte structCharacterROMDataBuffer.StrengthGrowth,    7
        .byte structCharacterROMDataBuffer.MagicGrowth,       7
        .byte structCharacterROMDataBuffer.SkillGrowth,       7
        .byte structCharacterROMDataBuffer.SpeedGrowth,       7
        .byte structCharacterROMDataBuffer.DefenseGrowth,     7
        .byte structCharacterROMDataBuffer.ResistanceGrowth,  7
        .byte structCharacterROMDataBuffer.LuckGrowth,        7
        .byte structCharacterROMDataBuffer.Skills1,           16
        .byte structCharacterROMDataBuffer.Skills3,           7
        .byte structCharacterROMDataBuffer.HolyBlood1,        16
        .byte structCharacterROMDataBuffer.HolyBlood2,        10
        .byte $FF

      rsSaveDynamicCharacterROMData ; 91/F177

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._ROM)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._ROM
        sta lR18
        ldx #<>aSaveDynamicCharacterROMData
        jsr rsSaveBitpackedDataOffsets._Entry
        rts

        .databank 0

      rsLoadDynamicCharacterROMData ; 91/F188

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._ROM)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._ROM
        sta lR18
        ldx #<>aSaveDynamicCharacterROMData
        jsr rsLoadBitpackedDataOffsets._Entry
        rts

        .databank 0

      aSaveCharacterInventoryData ; 91/F199

        .byte structInventoryDataBuffer.EquippedWeaponBitfield, 7
        .byte $FF

      rsSaveStaticDynamicCharacterInventoryData ; 91/F19C

        .al
        .autsiz
        .databank ?

        lda aUnit1DataBuffer._Inventory.EquippedWeaponBitfield
        lsr a
        sta aUnit1DataBuffer._Inventory.EquippedWeaponBitfield

        lda #(`aUnit1DataBuffer._Inventory)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Inventory
        sta lR18
        ldx #<>aSaveCharacterInventoryData
        jsr rsSaveBitpackedDataOffsets._Entry
        rts

        .databank 0

      rsLoadStaticDynamicCharacterInventoryData ; 91/F1B6

        .al
        .autsiz
        .databank ?

        lda #(`aUnit1DataBuffer._Inventory)<<8
        sta lR18+1
        lda #<>aUnit1DataBuffer._Inventory
        sta lR18
        ldx #<>aSaveCharacterInventoryData
        jsr rsLoadBitpackedDataOffsets._Entry

        lda aUnit1DataBuffer._Inventory.EquippedWeaponBitfield
        asl a
        sta aUnit1DataBuffer._Inventory.EquippedWeaponBitfield
        rts

        .databank 0

      aSaveFemaleCharacterLoverData ; 91/F1D0

        .byte  0, 9
        .byte  2, 9
        .byte  4, 9
        .byte  6, 9
        .byte  8, 9
        .byte 10, 9
        .byte 12, 9
        .byte 14, 9
        .byte 16, 9
        .byte 18, 9
        .byte 20, 9
        .byte 22, 9
        .byte 24, 9
        .byte 26, 9
        .byte 28, 9
        .byte $FF

      rsSaveFemaleCharacterLoverData ; 91/F1EF

        .al
        .autsiz
        .databank ?

        lda aSave.wCharacterID
        jsl rlCheckIfCharacterHasFemaleGenerationID
        bcc +

          lda #(`aUnit1DataBuffer._Lover)<<8
          sta lR18+1
          lda #<>aUnit1DataBuffer._Lover
          sta lR18
          ldx #<>aSaveFemaleCharacterLoverData
          jsr rsSaveBitpackedDataOffsets._Entry

        +
        rts

        .databank 0

      rsLoadFemaleCharacterLoverData ; 91/F20A

        .al
        .autsiz
        .databank ?

        lda aSave.wCharacterID
        jsl rlCheckIfCharacterHasFemaleGenerationID
        bcc +

          lda #(`aUnit1DataBuffer._Lover)<<8
          sta lR18+1
          lda #<>aUnit1DataBuffer._Lover
          sta lR18
          ldx #<>aSaveFemaleCharacterLoverData
          jsr rsLoadBitpackedDataOffsets._Entry

        +
        rts

        .databank 0

      sSaveFactionHeaderData ; 91/F225

        .byte structFactionHeader.GroupID,          8 + LoadAsByteFlag
        .byte structFactionHeader.LocationID,       4 + LoadAsByteFlag
        .byte structFactionHeader.HostileFactions,  7 + LoadAsByteFlag
        .byte structFactionHeader.AlliedFactions,   7 + LoadAsByteFlag
        .byte structFactionHeader.UnitCount,        6 + LoadAsByteFlag
        .byte $FF

      rsSaveFactionHeaderRAMData ; 91/F230

        .al
        .autsiz
        .databank ?

        lda #0
        sta aSave.wStructIndex,b

          -
          jsr rsSaveGetFactionSlotOffset

          ldx #<>sSaveFactionHeaderData
          jsr rsSaveBitpackedDataOffsets._Entry
          inc aSave.wStructIndex,b
          lda aSave.wStructIndex,b
          cmp #7
          bne -

        rts

        .databank 0

      rsLoadFactionHeaderRAMData ; 91/F24B

        .al
        .autsiz
        .databank ?

        lda #0
        sta aSave.wStructCount,b
        tay
        jsr rsSaveWriteToFactionSlotOffset

        lda #0
        sta aSave.wStructIndex,b

          _Loop
          lda aSave.wStructIndex,b
          jsr rsSaveGetFactionSlotOffset

          ldx #<>sSaveFactionHeaderData
          jsr rsLoadBitpackedDataOffsets._Entry

          ldy #structFactionHeader.UnitCount
          lda [lR18],y
          and #$00FF
          asl a
          clc
          adc #size(structFactionHeader)
          adc aSave.wStructCount,b
          sta aSave.wStructCount,b

          lda aSave.wStructIndex,b
          inc a
          ldy aSave.wStructCount,b
          jsr rsSaveWriteToFactionSlotOffset

          inc aSave.wStructIndex,b
          lda aSave.wStructIndex,b
          cmp #7
          bne _Loop

        rts

        .databank 0

      rsSaveGetFactionSlotOffset ; 91/F290

        .al
        .autsiz
        .databank ?

        asl a
        tax
        lda #(`aFactionArea)<<8
        sta lR18+1
        lda aFactionArea,x
        clc
        adc #<>aFactionArea
        sta lR18
        rts

        .databank 0

      rsSaveWriteToFactionSlotOffset ; 91/F2A2

        .al
        .autsiz
        .databank ?

        asl a
        tax
        tya
        clc
        adc #8 * size(word)
        sta aFactionArea,x
        rts

        .databank 0

      aSaveItemRAMData ; 91/F2AE

        .byte structItemRAMEntry.Durability,      6 + LoadAsByteFlag
        .byte structItemRAMEntry.ItemState,       3 + LoadAsByteFlag
        .byte structItemRAMEntry.OwnerRAMPointer, 9
        .byte structItemRAMEntry.KillCount,       7 + LoadAsByteFlag
        .byte $FF

      rsSaveItemRAMData ; 91/F2B7

        .al
        .autsiz
        .databank ?

        lda #PI_IronSword1
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        lda #PI_IronSword1

          -
          pha
          lda #(`aItemRAMData)<<8
          sta lR18+1
          lda wCurrentItemDataRAMPointer,b
          sta lR18
          clc
          adc #size(structItemRAMEntry)
          sta wCurrentItemDataRAMPointer,b

          ldx #<>aSaveItemRAMData
          jsr rsSaveBitpackedDataOffsets._Entry
          pla
          inc a
          cmp #144 + 1
          bne -

        rts

        .databank 0

      rsLoadItemRAMData ; 91/F2E1

        .al
        .autsiz
        .databank ?

        lda aSave.wActiveSlot,b
        jsr rsGetSaveSlotMagicNumber
        cmp #$9207
        beq _F321

          lda #PI_IronSword1
          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          lda #PI_IronSword1

            _Loop1
            pha
            lda #(`aItemRAMData)<<8
            sta lR18+1
            lda wCurrentItemDataRAMPointer,b
            sta lR18
            clc
            adc #size(structItemRAMEntry)
            sta wCurrentItemDataRAMPointer,b
            pla

            pha
            jsr rsUnknown91F34B
            lda aSave.wActiveSlot,b
            jsr rsGetSaveSlotMagicNumber
            ldx #<>aSaveItemRAMData
            jsr rsLoadBitpackedDataOffsets._Entry
            pla

            inc a
            cmp #144 + 1
            bne _Loop1

          rts

        _F321
        lda #PI_IronSword1
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        lda #PI_IronSword1

          _Loop2
          pha
          lda #(`aItemRAMData)<<8
          sta lR18+1
          lda wCurrentItemDataRAMPointer,b
          sta lR18
          clc
          adc #size(structItemRAMEntry)
          sta wCurrentItemDataRAMPointer,b
          ldx #<>aSaveItemRAMData
          jsr rsLoadBitpackedDataOffsets._Entry
          pla

          inc a
          cmp #144 + 1
          bne _Loop2

        rts

        .databank 0

      rsUnknown91F34B ; 91/F34B

        .al
        .autsiz
        .databank ?

        sta aSave.wStructCount,b
        tax

        lda aUnknown91F369,x
        and #$00FF
        sec
        sbc aSave.wStructCount,b
        asl a
        sta aSave.wStructCount,b
        asl a
        clc
        adc aSave.wStructCount,b
        clc
        adc lR18
        sta lR18
        rts

        .databank 0

      aUnknown91F369 ; 91/F369

        .byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $10, $11
        .byte $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $20, $21, $22, $23
        .byte $24, $25, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F, $30, $31, $32, $33, $34, $35, $36
        .byte $37, $38, $39, $3B, $3E, $3C, $3D, $3F, $40, $41, $42, $44, $43, $45, $46, $47, $48, $49
        .byte $4A, $4B, $4C, $4D, $4F, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $5B, $5C
        .byte $5D, $5E, $5F, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6A, $6B, $6C, $6D, $6E
        .byte $6F, $74, $70, $71, $72, $73, $7B, $77, $75, $7D, $7F, $81, $79, $82, $83, $84, $85, $86
        .byte $7C, $78, $76, $7E, $80, $7A, $87, $8A, $8B, $88, $26, $4E, $3A, $89, $8C, $8D, $8E, $8F
        .byte $90

      rsSaveChapterLocationData ; 91/F3FA

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda aChapterLocationRAMData,x
          sta wR0
          lda #8
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          cpx #len(aChapterLocationRAMData)
          bcc -

        ldx #0

          -
          lda aChapterLocationMoneyRewards,x
          sta wR0
          lda #14
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          inc x
          cpx #len(aChapterLocationMoneyRewards)
          bcc -

        rts

        .databank 0

      rsLoadChapterLocationData ; 91/F42C

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda #8
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sta aChapterLocationRAMData,x
          inc x
          cpx #len(aChapterLocationRAMData)
          bcc -

        ldx #0

          -
          lda #14
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sta aChapterLocationMoneyRewards,x
          inc x
          inc x
          cpx #len(aChapterLocationMoneyRewards)
          bcc -

        rts

        .databank 0

      aSaveChapterEventData ; 91/F45A

        .byte structChapterEventRAMEntry.Chapter,                5
        .byte structChapterEventRAMEntry.Counter1,               8 + LoadAsByteFlag
        .byte structChapterEventRAMEntry.Counter2,               8 + LoadAsByteFlag
        .byte structChapterEventRAMEntry.TemporaryEventFlags,   16
        .byte structChapterEventRAMEntry.TemporaryEventFlags+2, 16
        .byte structChapterEventRAMEntry.TemporaryEventFlags+4, 16
        .byte structChapterEventRAMEntry.TemporaryEventFlags+6, 16
        .byte structChapterEventRAMEntry.TemporaryEventFlags+8, 16
        .byte $FF

      rsSaveChapterEventData ; 91/F46B

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda aPermanentEventFlags,x
          sta wR0
          lda #8
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          cpx #len(aPermanentEventFlags)
          bcc -

        lda #(`aChapterEventRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aChapterEventRAMData
        sta lStructPointer2,b
        jsl rlGetRAMStructCurrentStructCount
        sta wR0
        lda #2
        sta aSave.wDataBitLength,b
        jsr rsWriteBitpackedSaveData

        lda #2
        sta aSave.wStructIndex,b
        lda #0

          -
          pha
          inc a
          sta wStructIndex,b
          jsl rlGetRAMStructEntryPointerByStructIndex
          lda lStructPointer1+1,b
          sta lR18+1
          lda lStructPointer1,b
          sta lR18
          ldx #<>aSaveChapterEventData
          jsr rsSaveBitpackedDataOffsets._Entry
          pla
          inc a
          cmp aSave.wStructIndex,b
          bne -

        rts

        .databank 0

      rsLoadChapterEventData ; 91/F4C8

        .al
        .autsiz
        .databank ?

        jsl $868079

        ldx #0
        
          -
          lda #8
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sta aPermanentEventFlags,x
          inc x
          cpx #len(aPermanentEventFlags)
          bcc -

        lda #(`aChapterEventRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aChapterEventRAMData
        sta lStructPointer2,b
        lda #2
        sta aSave.wDataBitLength,b
        jsr rsReadBitpackedSaveData

        sta aSave.wStructCount,b
        lda #2
        sta aSave.wStructIndex,b
        lda #0

          -
          pha
          lda #(`aDecompressionBuffer)<<8
          sta lR18+1
          lda #<>aDecompressionBuffer
          sta lR18
          ldx #<>aSaveChapterEventData
          jsr rsLoadBitpackedDataOffsets._Entry

          lda aSave.wStructCount,b
          beq +

            lda #(`aDecompressionBuffer)<<8
            sta lStructPointer1+1,b
            lda #<>aDecompressionBuffer
            sta lStructPointer1,b
            jsl rlAppendNewStructEntry
            dec aSave.wStructCount,b

          +
          pla
          inc a
          cmp aSave.wStructIndex,b
          bne -

        jsl $86C4EB
        rts

        .databank 0

      aSaveGeneralData ; 91/F538

        .byte 8
        .long aSave.wActiveSaveData

        .byte 8
        .long wCurrentChapter

        .byte 8 + LoadAsByteFlag
        .long wCurrentTurn

        .byte 7
        .long wLoadedUnitCount

        .byte 4
        .long wLoadedFactionCount

        .byte 16
        .long wOptionSettings

        .byte 8
        .long wAreaRestrictionBitfield

        .byte 15
        .long wMapXOffset

        .byte 15
        .long wMapYOffset

        .byte 8
        .long wCursorXOffset

        .byte 8
        .long wCursorYOffset

        .byte 16
        .long aChapterActiveMapChanges

        .byte 16
        .long aChapterActiveMapChanges +2

        .byte 11
        .long wTotalLevelUpCount

        .byte 6
        .long wTotalAlivePlayerUnitCount

        .byte 8
        .long $000897

        .byte 6
        .long wDestroyedLocationsCount

        .byte 8 + LoadAsByteFlag
        .long wCurrentTurn + 1

        .byte 8
        .long aSave.wStructCount

        .byte 10
        .long aSave.wStructCount

        .byte 8
        .long aSave.wStructCount

        .byte 16
        .long aSave.wStructCount

        .byte 16
        .long aSave.wStructCount

        .byte 4
        .long aSave.wStructCount

        .byte 4
        .long aSave.wStructCount

        .byte 15
        .long aSave.wStructCount

        .byte $FF

      rsSaveGeneralSaveData ; 91/F5A1

        .al
        .autsiz
        .databank ?

        lda #0
        sta aSave.wStructCount,b

        ldx #<>aSaveGeneralData
        jsr rsSaveBitpackedDataList._Entry

        jsr rsSaveChapterTurncountsHigh

        ; ViewingHomeCastleFlag
        lda wUnknown000D79,b
        and #$0020
        beq +

          lda #1

        +
        sta wR0

        lda #1
        sta aSave.wDataBitLength,b
        jsr rsWriteBitpackedSaveData

        jsr rsSaveUnitWinCounts
        jsr rsSaveChapterTurncountsLow
        jsr rsSaveRNArray
        jsr rsSaveUnitJoinOrderData
        rts

        .databank 0

      rsLoadGeneralSaveData ; 91/F5D3

        .al
        .autsiz
        .databank ?

        ldx #<>aSaveGeneralData
        jsr rsLoadBitpackedDataList._Entry

        lda wMapYOffset
        and #$FFF0
        sta wMapYOffset
        lda wMapXOffset
        and #$FFF0
        sta wMapXOffset

        jsr rsLoadChapterTurncountsHigh

        lda #1
        sta aSave.wDataBitLength,b
        jsr rsReadBitpackedSaveData
        lsr a
        bcc +

          ; ViewingHomeCastleFlag
          lda #$0020
          ora wUnknown000D79,b
          sta wUnknown000D79,b

        +
        jsr rsLoadUnitWinCounts
        jsr rsLoadChapterTurncountsLow
        jsr rsLoadRNArray
        jsr rsLoadUnitJoinOrderData

        lda aSave.wActiveSlot,b
        jsr rsGetSaveSlotMagicNumber
        cmp #$9207
        beq _End

          lda wCurrentTurn,b
          cmp #$00FF
          bne _End

            lda #$FFFF
            sta wCurrentTurn,b

        _End
        rts

        .databank 0

      rsSaveUnitWinCounts ; 91/F62D

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda aUnitWinCounts,x
          sta wR0
          lda #12
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          inc x
          cpx #len(aUnitWinCounts)
          bne -

        rts

        .databank 0

      rsLoadUnitWinCounts ; 91/F647

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda #12
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sta aUnitWinCounts,x
          inc x
          inc x
          cpx #len(aUnitWinCounts)
          bne -

        rts

        .databank 0

      rsSaveChapterTurncountsLow ; 91/F65F

        .al
        .autsiz
        .databank ?

        ; Since turn counts only get capped at 999, the number needs
        ; to be saved as a 10 bit value, this handles the lower 8 bit.

        ldx #0
        
          -
          lda aChapterTurncounts,x
          sta wR0
          lda #8
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          inc x
          cpx #len(aChapterTurncounts)
          bne -

        rts

        .databank 0

      rsSaveChapterTurncountsHigh ; 91/F679

        .al
        .autsiz
        .databank ?

        ; See previous routine. This handles the higher 2 bit.

        ldx #0
        
          -
          lda aChapterTurncounts + 1,x
          sta wR0
          lda #2
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          inc x
          cpx #len(aChapterTurncounts)
          bne -

        rts

        .databank 0

      rsLoadChapterTurncountsLow ; 91/F693

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda #8
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sep #$20
          sta aChapterTurncounts,x
          rep #$20
          inc x
          inc x
          cpx #len(aChapterTurncounts)
          bne -

        rts

        .databank 0

      rsLoadChapterTurncountsHigh ; 91/F6AF

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda #2
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sep #$20
          sta aChapterTurncounts+1,x
          rep #$20
          inc x
          inc x
          cpx #len(aChapterTurncounts)
          bne -

        rts

        .databank 0

      rsSaveRNArray ; 91/F6CB

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda aRNArray,x
          sta wR0
          lda #7
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          cpx #len(aRNArray) + 1
          bne -

        rts

        .databank 0

      rsLoadRNArray ; 91/F6E4

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda #7
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sta aRNArray,x
          inc x
          cpx #len(aRNArray) + 1
          bne -

        rts

        .databank 0

      aSaveUnitJoinOrderData ; 91/F6FB

        .byte 3 
        .long wUnknown7E5315
        
        .byte 6 
        .long wUnknown7E5319
        
        .byte 1 
        .long wUnknown7E5317
        
        .byte 2 
        .long aUnitJoinOrder[12]

        .byte $FF

      rsSaveUnitJoinOrderData ; 91/F70C

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda aUnitJoinOrder[0],x
          sta wR0
          lda #5
          sta aSave.wDataBitLength,b
          jsr rsWriteBitpackedSaveData
          inc x
          cpx #len(aUnitJoinOrder)
          bne -

        ldx #<>aSaveUnitJoinOrderData
        jsr rsSaveBitpackedDataList._Entry
        rts

        .databank 0

      rsLoadUnitJoinOrderData ; 91/F72B

        .al
        .autsiz
        .databank ?

        ldx #0

          -
          lda #5
          sta aSave.wDataBitLength,b
          jsr rsReadBitpackedSaveData
          sta aUnitJoinOrder[0],x
          inc x
          cpx #len(aUnitJoinOrder)
          bne -

        ldx #<>aSaveUnitJoinOrderData
        jsr rsLoadBitpackedDataList._Entry
        rts

        .databank 0

        ; 91/F748

    .endsection SaveCode2Section
