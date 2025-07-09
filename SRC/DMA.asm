
    .section DMAEngineSection

      rlProcessDMAStructArray ; 80/A34F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        sep #$20
        lda bDMAArrayFlag,b
        beq _End

          stz bDMAArrayFlag,b
          stz MDMAEN,b
          stz HDMAEN,b
          rep #$30
          stz wDMAArrayPosition,b
          ldy #0

          _Loop
          cpy #size(aDMAArray)
          bcc +

            -
            bra -

          +
          lda aDMAArray,b,y
          and #$00FF
          asl a
          tax
          jmp (_DMARoutineTable,x)

          _DMARoutineTable
          .addr _End
          .addr _ToCGRAM
          .addr _ToVRAM
          .addr _FromVRAM
          .addr _InputDest

        _End
        sep #$20
        stz aDMAArray,b
        plp
        plb
        rtl

        _ToCGRAM
        sep #$20
        lda aDMAArray+1,b,y
        sta DMA_IO[1].A1,b 
        lda aDMAArray+2,b,y
        sta DMA_IO[1].A1+1,b
        lda aDMAArray+3,b,y
        sta DMA_IO[1].A1+2,b
        lda aDMAArray+4,b,y
        sta DMA_IO[1].DAS,b
        lda aDMAArray+5,b,y
        sta DMA_IO[1].DAS+1,b
        lda aDMAArray+6,b,y
        sta CGADD,b
        stz DMA_IO[1].DMAP,b 
        lda #$22
        sta DMA_IO[1].BBAD,b 
        lda #2
        sta MDMAEN,b
        rep #$20
        tya
        clc
        adc #7
        tay
        jml _Loop

        _ToVRAM
        sep #$20
        lda aDMAArray+1,b,y
        sta DMA_IO[1].A1,b
        lda aDMAArray+2,b,y
        sta DMA_IO[1].A1+1,b
        lda aDMAArray+3,b,y
        sta DMA_IO[1].A1+2,b
        lda aDMAArray+4,b,y
        sta DMA_IO[1].DAS,b
        lda aDMAArray+5,b,y
        sta DMA_IO[1].DAS+1,b
        lda aDMAArray+6,b,y
        sta VMAIN,b
        lda aDMAArray+7,b,y
        sta VMADD,b
        lda aDMAArray+8,b,y
        sta VMADD+1,b
        lda #1
        sta DMA_IO[1].DMAP,b 
        lda #$18
        sta DMA_IO[1].BBAD,b 
        lda #2
        sta MDMAEN,b
        rep #$20
        tya
        clc
        adc #9
        tay
        jml _Loop

        _FromVRAM
        sep #$20
        lda aDMAArray+1,b,y
        sta DMA_IO[1].A1,b
        lda aDMAArray+2,b,y
        sta DMA_IO[1].A1+1,b
        lda aDMAArray+3,b,y
        sta DMA_IO[1].A1+2,b
        lda aDMAArray+4,b,y
        sta DMA_IO[1].DAS,b
        lda aDMAArray+5,b,y
        sta DMA_IO[1].DAS+1,b
        lda aDMAArray+6,b,y
        sta VMAIN,b
        lda aDMAArray+7,b,y
        sta VMADD,b
        lda aDMAArray+8,b,y
        sta VMADD+1,b
        lda #$81
        sta DMA_IO[1].DMAP,b
        lda #$39
        sta DMA_IO[1].BBAD,b 
        lda RDVRAM,b
        lda RDVRAM+1,b
        lda #2
        sta MDMAEN,b
        rep #$20
        tya
        clc
        adc #9
        tay
        jml _Loop

        _InputDest
        sep #$20
        lda aDMAArray+1,b,y
        sta DMA_IO[1].A1,b
        lda aDMAArray+2,b,y
        sta DMA_IO[1].A1+1,b
        lda aDMAArray+3,b,y
        sta DMA_IO[1].A1+2,b
        lda aDMAArray+4,b,y
        sta DMA_IO[1].DAS,b 
        lda aDMAArray+5,b,y
        sta DMA_IO[1].DAS+1,b
        lda aDMAArray+6,b,y
        sta DMA_IO[1].DMAP,b
        lda aDMAArray+7,b,y
        sta DMA_IO[1].BBAD,b
        lda aDMAArray+8,b,y
        sta VMAIN,b
        lda aDMAArray+9,b,y
        sta VMADD,b
        lda aDMAArray+10,b,y
        sta VMADD+1,b
        lda #2
        sta MDMAEN,b
        rep #$20
        tya
        clc
        adc #11
        tay
        jml _Loop

        .databank 0

      rlDMAByStruct ; 80/A4BD

        .al
        .autsiz
        .databank ?

        php
        phb
        sep #$20
        lda #5,s
        pha
        plb
        rep #$30

        lda #3,s
        tax
        ldy wDMAArrayPosition,b
        sep #$20
        lda $0001,b,x
        inc x
        sta aDMAArray,b,y
        dec a
        bne +

          jml _CGRAM

        +
        dec a
        bne +

          jml _VRAM

        +
        dec a
        bne +

          jml _VRAM

        +
        dec a
        bne _VRAM

          jml _Input

        _VRAM

        .as

        lda #0
        sta aDMAArray+9,b,y
        rep #$20
        lda $0001,b,x
        sta aDMAArray+1,b,y
        lda $0003,b,x
        sta aDMAArray+3,b,y
        lda $0005,b,x
        sta aDMAArray+5,b,y
        lda $0007,b,x
        sta aDMAArray+7,b,y
        txa
        clc
        adc #8
        sta #3,s
        tya
        clc
        adc #9
        bra _End

        _Input

        .as

        lda #0
        sta aDMAArray+11,b,y
        rep #$20
        lda $0001,b,x
        sta aDMAArray+1,b,y
        lda $0003,b,x
        sta aDMAArray+3,b,y
        lda $0005,b,x
        sta aDMAArray+5,b,y
        lda $0007,b,x
        sta aDMAArray+7,b,y
        lda $0009,b,x
        sta aDMAArray+9,b,y
        txa
        clc
        adc #10
        sta #3,s
        tya
        clc
        adc #11
        bra _End

        _CGRAM

        .as

        lda #0
        sta aDMAArray+7,b,y
        rep #$20
        lda $0001,b,x
        sta aDMAArray+1,b,y
        lda $0003,b,x
        sta aDMAArray+3,b,y
        lda $0005,b,x
        sta aDMAArray+5,b,y
        txa
        clc
        adc #6
        sta #3,s
        tya
        clc
        adc #7

        _End
        sta wDMAArrayPosition,b
        sep #$30
        lda #1
        sta bDMAArrayFlag,b
        lda bBufferINIDISP
        bpl +

          jsl rlProcessDMAStructArray

        +
        plb
        plp
        rtl

        .databank 0

      rlDMAByPointer ; 80/A58C

        .al
        .autsiz
        .databank ?

        ; wR0 = size
        ; wR1 = destination
        ; lR18 = source

        phb
        php
        phk
        plb
        ldx wDMAArrayPosition,b
        sep #$20
        lda #2
        sta aDMAArray,b,x
        rep #$20

        lda lR18
        sta aDMAArray+1,b,x
        lda lR18+1
        sta aDMAArray+2,b,x
        lda wR0
        sta aDMAArray+4,b,x

        sep #$20
        lda #$80
        sta aDMAArray+6,b,x
        rep #$20

        lda wR1
        sta aDMAArray+7,b,x
        lda #0
        sta aDMAArray+9,b,x
        txa
        clc
        adc #9
        sta wDMAArrayPosition,b

        sep #$20
        lda #1
        sta bDMAArrayFlag,b
        lda bBufferINIDISP
        bpl +

          jsl rlProcessDMAStructArray

        +
        plp
        plb
        rtl

        .databank 0

        ; 80/A5D9

    .endsection DMAEngineSection
