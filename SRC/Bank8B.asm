

    .section Code8B8345Section

      rlLoadPortraitIntoSlot ; 8B/8345

        .al
        .autsiz
        .databank ?

        ldy $0302,b
        cpy #0
        bne +

          jml $88E33D

        +
        phx
        txy
        jsl $8AB49A
        plx

        phx
        lda aPortraitSlotPaletteOffsets,x
        sec
        sbc #2
        tax

        ldy #size(Palette) - size(word)

          -
          lda [lR19],y
          sta aPortraitSlotsPaletteBuffer + size(Palette),x
          dec x
          dec x
          dec y
          dec y
          bpl -

        lda #$35AD
        sta aPortraitSlotsPaletteBuffer + size(Palette) +$1E,x
        plx

        ; Portrait size
        lda #$0800
        sta wR0

        lda #$6000
        clc
        adc aPortraitSlotVRAMOffsets,x
        sta wR1
        phx
        jsl rlDMAByPointer
        plx
        rtl

        .databank 0

      aPortraitSlotPaletteOffsets ; 8B/838F

        .word size(Palette) * 2
        .word size(Palette) * 3
        .word size(Palette) * 4
        .word size(Palette) * 5
        .word size(Palette) * 6
        .word size(Palette) * 7

      aPortraitSlotVRAMOffsets ; 8B/839B

        .word $0800
        .word $0C00
        .word $1000
        .word $1400
        .word $1800
        .word $1C00

        ; 8B/83A7

    .endsection Code8B8345Section

    .section WorldMapHighlightCodeSection

      rlHighlightWorldMapPart ; 8B/88CE

        .al
        .autsiz
        .databank ?

        asl a
        tax
        phx
        jsr (aWorldMapHighlights,x)
        plx

        sep #$20
        lda #T_Setting(false, true, true, false, true)
        sta bBufferTS
        rep #$20

        lda #0
        sta wBufferBG2HOFS
        lda #0
        sta wBufferBG2VOFS

        lda #(`$8B901D)<<8
        sta lR44+1
        lda #<>$8B901D
        sta lR44
        jsl rlProcEngineCreateProc

        jsl rlDMAByStruct

          .structDMAToVRAM $7E7B88, 32 * 21 * size(word), $80, $A800

        rtl

        .databank 0

      aWorldMapHighlights .include "../TABLES/SYSTEM/WorldMapHighlights.csv.asm" ; 8B/8903

      rsDecompressVerdaneMapHighlight ; 8B/8919

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aVerdaneMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aVerdaneMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressAgustriaMapHighlight ; 8B/8936

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aAgustriaMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aAgustriaMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressSilesseMapHighlight ; 8B/8953

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aSilesseMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aSilesseMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressAedMapHighlight ; 8B/8970

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aAedMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aAedMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressIsaachMapHighlight ; 8B/898D

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aIsaachMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aIsaachMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressMunsterMapHighlight ; 8B/89AA

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aMunsterMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aMunsterMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressThraciaMapHighlight ; 8B/89C7

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aThraciaMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aThraciaMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressMiletosMapHighlight ; 8B/89E4

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aMiletosMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aMiletosMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressGrannvaleMapHighlight ; 8B/8A01

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aGrannvaleMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aGrannvaleMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressUnitedGrannvaleMapHighlight ; 8B/8A1E

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aUnitedGrannvaleMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aUnitedGrannvaleMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

      rsDecompressUnifiedThraciaMapHighlight ; 8B/8A3B

        .al
        .autsiz
        .databank ?

        sep #$20
        rep #$10
        ldx #<>aUnifiedThraciaMapHighlightTilemap
        stx DecompressionVariables.lSource
        lda #`aUnifiedThraciaMapHighlightTilemap
        sta DecompressionVariables.lSource+2
        ldx #<>$7E7B88
        stx DecompressionVariables.lDest
        lda #`$7E7B88
        sta DecompressionVariables.lDest+2
        rep #$30
        jsl rlDecompressor
        rts

        .databank 0

        ; 8B/8A58

    .endsection WorldMapHighlightCodeSection

    .section Code8BCDD8Section

      rlAddToUnitJoinOrder ; 8B/CDD8

        .al
        .autsiz
        .databank ?

        lda #FS_Player
        jsl rlGetFactionSlotUnitCount
        sta wR0

        jsl rlGetSelectedUnitGenerationID
        dec a
        tax

        lda wR0
        sep #$20
        sta aUnitJoinOrder[0],x
        rep #$20
        rtl

        .databank 0

      rlRemoveFromUnitJoinOrder ; 8B/CDF2

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitGenerationID
        dec a
        tax
        lda aUnitJoinOrder[0],x
        and #$00FF
        sta wR2

        sep #$20
        lda #0
        sta aUnitJoinOrder[0],x
        rep #$20

        ldx #0

          -
          lda aUnitJoinOrder[0],x
          and #$00FF
          cmp wR2
          bcc +

            lda aUnitJoinOrder[0],x
            dec a
            sta aUnitJoinOrder[0],x

          +
          inc x
          cpx #len(aUnitJoinOrder)
          bne -

        rtl

        .databank 0

        ; 8B/CE29

    .endsection Code8BCDD8Section
