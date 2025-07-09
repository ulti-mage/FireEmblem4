
    .section Code8990DASection

      rlUnknown8990DA ; 89/90DA

        .al
        .autsiz
        .databank ?

        lda #1
        sta $7F82BD

        -
        lda $7F82BD
        jsl rlGetItemIDByInventorySlot
        bcs +

        pha
        lda $7F82BD
        dec a
        asl a
        tax
        lda $899109,x
        tax
        pla
        jsl $8BBE68

        lda $7F82BD
        inc a
        sta $7F82BD
        bra -
        
        +
        rtl

        .databank 0

      rsUnknown899109 ; 89/9109

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      aUnknown89910A ; 89/910A

        .word $6200
        .word $6400
        .word $6600
        .word $6800
        .word $6A00
        .word $6C00
        .word $6E00
        .byte 0

      rlClearTilemapRect ; 89/9119

        .al
        .autsiz
        .databank ?

        ; In:
        ; X = coord
        ; Y = width
        ; A = height

        stx wR0
        sty wR1
        sty wR3
        sta wR2

          -
          lda #$00FF
          sta aBG3TilemapBuffer,x
          inc x
          inc x
          dec wR1
          bne -

        lda wR0
        clc
        adc #$0040
        sta wR0
        tax 
        lda wR3
        sta wR1
        dec wR2
        bne -

        rtl

        .databank 0

        ; 89/9140

    .endsection Code8990DASection


    .section Code899FDCSection

      rlUnknown899FDC ; 89/9FDC

        .al
        .autsiz
        .databank ?

        ; DMA background and border tiles based on index $0756
        ; Also gets palette
        ; Different backgrounds were probably planned at some point
        ; but regardless of the index, the code is always the same 

        lda $0756,b
        asl a
        tax
        jsr (aUnknown899FEB,x)
        lda #0
        sta aBGPaletteBuffer,b
        rtl

        .databank 0

      aUnknown899FEB ; 89/9FEB

        .word <>rsUnknown899FF3
        .word <>rsUnknown89A00F
        .word <>rsUnknown89A02B
        .word <>rsUnknown89A047

      rsUnknown899FF3 ; 89/9FF3

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .structDMAToVRAM $DD72B0, $0600, $80, $6000

        ldx #size(Palette)-2
        
          _Loop
          lda $DE0000,x
          sta aBGPaletteBuffer,b,x
          dec x
          dec x
          bpl _Loop

        rts

        .databank 0

      rsUnknown89A00F ; 89/A00F

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .structDMAToVRAM $DD72B0, $0600, $80, $6000

        ldx #size(Palette)-2
        
          _Loop
          lda $DE0000,x
          sta aBGPaletteBuffer,b,x
          dec x
          dec x
          bpl _Loop

        rts

        .databank 0

      rsUnknown89A02B ; 89/A02B

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .structDMAToVRAM $DD72B0, $0600, $80, $6000

        ldx #size(Palette)-2
        
          _Loop
          lda $DE0000,x
          sta aBGPaletteBuffer,b,x
          dec x
          dec x
          bpl _Loop

        rts

        .databank 0

      rsUnknown89A047 ; 89/A047

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .structDMAToVRAM $DD72B0, $0600, $80, $6000

        ldx #size(Palette)-2
        
          _Loop
          lda $DE0000,x
          sta aBGPaletteBuffer,b,x
          dec x
          dec x
          bpl _Loop

        rts

        .databank 0

      rlGetDialogueBoxGraphicsAndPalette ; 89/A063

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .structDMAToVRAM $DE2CC0, $0800, $80, $6000

        ldx #size(Palette)-2
        
          _Loop
          lda $DE6200,x
          sta aBGPaletteBuffer,b,x
          dec x
          dec x
          bpl _Loop

        lda #0
        sta aBGPaletteBuffer,b
        rtl

        .databank 0

        ; 89/A085

    .endsection Code899FDCSection


    .section Code89A150Section

      rlUnknown89A150 ; 89/A150

        .al
        .autsiz
        .databank ?

        ; portrait stuff for research

        ; A = portrait ID

        jsl rlDecompressDialoguePortrait

        lda #$0800
        sta wR0

        txa
        asl a
        tay
        lda #$6200
        sta wR1
        phx
        jsl rlDMAByPointer

        plx
        ldx #$001E
        ldy #$001E
        
          -
          lda [$27],y
          sta $0280,b,y
          dec x
          dec x
          dec y
          dec y
          bpl -

        lda $7F8195
        jsl rlGetCharacterPortraitDataID
        cmp #$00F3
        beq +

          lda #$35AD
          sta $029C,b
        
        +
        rtl

        .databank 0

        ; 89/A18C

    .endsection Code89A150Section

