
    .section Code8AB317Section

      rlDecompressDialoguePortrait ; 8A/B317

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = PortraitID
        ; X = dialogue slot offset

        ; Output:
        ; lR18 = destination of decompressed portrait

        phb
        php
        phk
        plb
        phk
        plb
        sta $078C,b
        cpx #0
        bne _Slot1

        ; Slot0
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
        clc
        adc #$4000
        sta lR47

        phx
        jsl $95A3FB ; rlDecompressSingle
        plx

        lda #(`aDecompressionBuffer)<<8
        sta lR18+1
        lda #<>aDecompressionBuffer
        sta lR18

        lda lR18
        clc
        adc #$4000
        sta lR18
        bra _End

        _Slot1
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
        clc
        adc #$4800
        sta lR47

        phx
        jsl $95A3FB ; rlDecompressSingle
        plx

        lda #(`aDecompressionBuffer)<<8
        sta lR18+1
        lda #<>aDecompressionBuffer
        sta lR18

        lda lR18
        clc
        adc #$4800
        sta lR18

        _End
        lda aPortraitPalettePointers+1,x
        sta lR19+1
        lda aPortraitPalettePointers,x
        sta lR19

        plp
        plb
        rtl

        .databank 0

      rlGetCharacterPortraitData ; 8A/B3BA

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID

        ; Output:
        ; lR18 = portrait graphics pointer
        ; lR19 = portrait palette pointer

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
        sta lR18
        lda aPortraitGraphicPointers+1,x
        sta lR18+1
        lda aPortraitPalettePointers+1,x
        sta lR19+1
        lda aPortraitPalettePointers,x
        sta lR19
        rtl

        .databank 0

      rlTryGetClassPortraitDataID ; 8A/B3E8

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = portrait data ID

        cmp #$00F3
        beq +

          rts

        +
        lda $078C,b
        jsl rlGetCharacterClass
        phx
        asl a
        tax
        lda aClassPortraitDataIDs,x
        plx
        rts

        .databank 0

        ; 8A/B3FE

    .endsection Code8AB317Section



















