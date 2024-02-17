
  .weak

    rlDMAByStruct                                 :?= address($80A4BD)
    rlDrawMenuTextLine                            :?= address($879354)
    rlDrawMenuTextNumber                          :?= address($89A18C)


    HPCap   = 80
    StatCap = 15
    LuckCap = 30

  .endweak












    * = $008223
    .logical $808223

      rlEnableVBlank ; 80/8223

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda bBufferNMITIMEN
        ora #NMITIMEN_VBlank
        sta bBufferNMITIMEN
        sta NMITIMEN,b
        plp
        rtl

        .databank 0

      rlDisableVBlank ; 80/8231

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda bBufferNMITIMEN
        and #~(NMITIMEN_VBlank)
        sta bBufferNMITIMEN
        sta NMITIMEN,b
        plp
        rtl

        .databank 0

        ; 80/823F

    .here





    * = $009D4F
    .logical $809D4F

      rsUnknown809D4F ; 80/9D4F

        .al
        .autsiz
        .databank ?

        ; Run every frame

        jsl rlButtonCombinationResetCheck
        jsl $80A5E9 ; maybe decomp check?
        jsl $809903 ; ?
        rts

        .databank 0

      rlUnknown809D5C ; 80/9D5C

        .al
        .autsiz
        .databank ?

        ; Hardware regs shenanigans

        phb
        php

        phk
        plb

        sep #$30
        lda #NMITIMEN_Joypad
        sta NMITIMEN,b
        sta bBufferNMITIMEN

        lda #$80
        sta WRIO,b

        stz WRMPYA,b
        stz WRMPYB,b
        stz WRDIVA,b
        stz WRDIVA+1,b
        stz WRDIVB,b
        stz WRDIVB+1,b

        stz bBufferHTIMEL
        stz HTIME+1,b
        stz bBufferHTIMEH
        
        stz VTIME,b
        stz bBufferVTIMEL
        stz VTIME+1,b
        stz bBufferVTIMEH

        stz MDMAEN,b
        stz HDMAEN,b
        stz bBufferHDMAEN

        lda #MEMSEL_Setting(True)
        sta MEMSEL,b
        sta bBufferMEMSEL

        plp
        plb
        rtl

        .databank 0

      rlUnknown809DA3 ; 80/9DA3

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        sep #$30
        lda #INIDISP_ForcedBlank
        sta INIDISP,b
        sta bBufferINIDISP

        lda #0
        sta OBSEL,b
        sta bBufferOBSEL

        lda #$10
        sta OAMADD,b
        sta wBufferOAMADD

        lda #0
        sta OAMADD+1,b
        sta wBufferOAMADD+1

        stz OAMDATA,b
        stz OAMDATA,b

        lda #9
        sta BGMODE,b
        sta bBufferBGMODE

        stz MOSAIC,b
        stz bBufferMOSAIC

        stz BG1SC,b
        stz bBufferBG1SC
        stz BG2SC,b
        stz bBufferBG2SC
        stz BG3SC,b
        stz bBufferBG3SC
        stz BG4SC,b
        stz bBufferBG4SC

        stz BG12NBA,b
        stz bBufferBG12NBA
        stz BG34NBA,b
        stz bBufferBG34NBA

        stz BG1HOFS,b
        stz wBufferBG1HOFS
        stz BG1HOFS,b
        stz wBufferBG1HOFS+1
        stz BG1VOFS,b
        stz wBufferBG1VOFS
        stz BG1VOFS,b
        stz wBufferBG1VOFS+1
        stz BG2HOFS,b
        stz wBufferBG2HOFS
        stz BG2HOFS,b
        stz wBufferBG2HOFS+1
        stz BG2VOFS,b
        stz wBufferBG2VOFS
        stz BG2VOFS,b
        stz wBufferBG2VOFS+1
        stz BG3HOFS,b
        stz wBufferBG3HOFS
        stz BG3HOFS,b
        stz wBufferBG3HOFS+1
        stz BG3VOFS,b
        stz wBufferBG3VOFS
        stz BG3VOFS,b
        stz wBufferBG3VOFS+1
        stz BG4HOFS,b
        stz wBufferBG4HOFS
        stz BG4HOFS,b
        stz wBufferBG4HOFS+1
        stz BG4VOFS,b
        stz wBufferBG4VOFS
        stz BG4VOFS,b
        stz wBufferBG4VOFS+1

        stz VMAIN,b
        stz M7SEL,b
        stz bBufferM7SEL
        stz M7A,b
        stz M7B,b
        stz M7C,b
        stz M7D,b
        stz M7X,b
        stz M7Y,b

        lda #0
        sta W12SEL,b
        sta bBufferW12SEL

        lda #0
        sta W34SEL,b
        sta bBufferW34SEL

        stz WOBJSEL,b
        stz bBufferWOBJSEL

        lda #0
        sta WH0,b
        sta bBufferWH0
        lda #$F8
        sta WH1,b
        sta bBufferWH1
        stz WH2,b

        stz bBufferWH2
        stz WH3,b
        stz bBufferWH3
        stz WBGLOG,b
        stz bBufferWBGLOG
        stz WOBJLOG,b
        stz bBufferWOBJLOG

        lda #$11
        sta TM,b
        sta bBufferTM
        sta TMW,b
        sta bBufferTMW

        lda #0
        sta TS,b
        sta bBufferTS
        sta TSW,b
        sta bBufferTSW

        lda #2
        sta CGWSEL,b
        sta bBufferCGWSEL

        lda #$A1
        sta CGADSUB,b
        sta bBufferCGADSUB

        lda #$20
        sta COLDATA,b
        sta bBufferCOLDATA_1

        lda #$40
        sta COLDATA,b
        sta bBufferCOLDATA_2

        lda #$80
        sta COLDATA,b
        sta bBufferCOLDATA_3

        lda #0
        sta SETINI,b
        sta bBufferSETINI

        plp
        plb
        rtl

        .databank 0

        ; 80/9DD9


    .here








    * = $00A6C3
    .logical $80A6C3

      rlButtonCombinationResetCheck ; 80/A6C3

        .al
        .autsiz
        .databank ?

        ; Quick reset

        php
        lda $E4
        and #~JOY_Start
        eor #(JOY_Select | JOY_L | JOY_R)
        bne +

          lda $E8
          bit #JOY_Start
          beq +

            sep #$20
            lda #$80
            sta $2100,b
            lda #1
            sta $4200,b
            sta $B1
            stz $0341,b
            stz $0342,b
            stz $B6
            stz $0345,b
            rep #$20

            stz $0343,b
            jml $808ECC

        +
        plp
        rtl

        .databank 0

        ; 80/A6F9

    .here





    * = $00A70E
    .logical $80A70E

      rlGetRandomNumber100 ; 80/A70E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        and #$00FF
        beq +

        sta $14
        jsl rlUnknown80A73A
        and #$00FF
        beq +

          sta $16
          jsl $80A0BA
          lda $18
          sta $1A
          lda #100
          sta $1C
          jsl $80A156
          lda $1A

        +
        plp
        plb
        rtl

        .databank 0

      rlUnknown80A73A ; 80/A73A

        .al
        .autsiz
        .databank ?

        phx
        phy
        phb
        php
        phk
        plb

        lda #0
        sep #$30
        inc $04A2,b
        lda $04A2,b
        cmp #$37
        bcc ++

        jsr $80A7C5
        rep #$30

        jsl $8F8006
        bcc +

        jsr $80A7F3
        
        +
        lda #0
        sep #$30
        sta $04A2,b
        
        +
        tay
        lda $046B,b,y
        dec a
        bpl +

        lda #99

        +
        plp
        plb
        ply
        plx
        rtl

        .databank 0

        ; 80/A773

    .here




    * = $00A899
    .logical $80A899

      rlUnknown80A899 ; 80/A899

        .al
        .autsiz
        .databank ?

        ora #0
        beq +

          phx
          dec a
          asl
          tax
          lda aUnknown80A8A8,x
          plx

        +
        rtl

        .databank 0

      aUnknown80A8A8 ; 80/A8A8

        .word $0002, $0005, $0007, $000A, $000C, $000F, $0011, $0014, $0017, $0019
        .word $001C, $001E, $0021, $0023, $0026, $0028, $002B, $002E, $0030, $0033
        .word $0035, $0038, $003A, $003D, $0040, $0042, $0045, $0047, $004A, $004C
        .word $004F, $0051, $0054, $0057, $0059, $005C, $005E, $0061, $0063, $0066
        .word $0068, $006B, $006E, $0070, $0073, $0075, $0078, $007A, $007D, $0080
        .word $0082, $0085, $0087, $008A, $008C, $008F, $0091, $0094, $0097, $0099
        .word $009C, $009E, $00A1, $00A3, $00A6, $00A8, $00AB, $00AE, $00B0, $00B3
        .word $00B5, $00B8, $00BA, $00BD, $00C0, $00C2, $00C5, $00C7, $00CA, $00CC
        .word $00CF, $00D1, $00D4, $00D7, $00D9, $00DC, $00DE, $00E1, $00E3, $00E6
        .word $00E8, $00EB, $00EE, $00F0, $00F3, $00F5, $00F8, $00FA, $00FD, $0100

      rlBlockCopyMVNByRAM ; 80/A970

        .al
        .autsiz
        .databank ?

        ; move routine in ram

        ; lBlockCopySource = source data
        ; lBlockCopyDestination = destination

        phb
        php
        phk
        plb

        .databank `*

        phx
        phy

        sep #$20
        lda lBlockCopyDestination+2,b
        sta rsBlockCopyMVNRAM+1,b
        lda lBlockCopySource+2,b
        sta rsBlockCopyMVNRAM+2,b
        lda #$54    ; mvn
        sta rsBlockCopyMVNRAM,b
        lda #$60    ; rts
        sta rsBlockCopyMVNRAM+3,b
        rep #$20

        ldx lBlockCopySource,b
        ldy lBlockCopyDestination,b
        lda wBlockCopySize,b
        dec a
        jsr <>rsBlockCopyMVNRAM,k

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 80/A9A2

    .here





    * = $00E42B
    .logical $80E42B

      rsUnknown80E42B ; 80/E42B

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda #$80
        sta bBufferINIDISP
        rep #$20

        lda #<>$80BB9B ; vblank routine?
        sta $D3

        jsl $80823F ; waits for vblank?
        jsl rlDisableVBlank

        jsl rlUnknown809D5C
        jsl rlUnknown809DA3

        stz $00
        stz $04
        stz $08
        stz $0E
        stz $12

        lda #0
        sta $0A
        lda #0
        sta $02
        lda #$4000
        sta $06
        lda #$6000
        sta $0C
        lda #$7000
        sta $10

        jsl $809F15 ; some coord stuff?
        jsl $828006 ; clears stuff 
        jsl $81800A ; clears stuff + $8087C7 in $15E4
        jsl $82C006 ; clear DMAs
        jsl $82E073 ; clear
        jsl $82E400 ; clear
        jsl $8780AA ; clear and $7E8338 in $0518
        jsl $82F211 ; clear

        jsr rsUnknown80E4B3
        jsr rsUnknown80E4EB
        jsr $80E54D ; set hardware regs

        lda $7F8400
        sta $0304,b

        lda #$0027
        sta $0302,b
        lda #$0026
        sta $0300,b ; Main loop index

        lda #<>rsUnknown809D4F
        sta $D7

        jsl rlEnableVBlank

        plp
        rts

        .databank 0

      rsUnknown80E4B3 ; 80/E4B3

        .al
        .autsiz
        .databank ?

        lda $7F8183
        sta $7F8404

        lda #0
        sta $7F8402
        sta $7F8410
        sta $7F8412
        sta $7F840A
        sta $7F840C
        sta $7F8408

        lda #(`$80E422)<<8
        sta $0531+1,b
        lda #<>$80E422
        sta $0531,b
        jsl rlGetSelectedUnitFaction
        sta $7F840E
        rts

        .databank 0

      rsUnknown80E4EB ; 80/E4EB

        .al
        .xl
        .autsiz
        .databank ?

        ; Gets debug BG, pal and tilemap

        ; DMA graphics with pointing hand, promotion indicator, droppable item icon, arrows and a star

        jsl rlDMAByStruct

          .dstruct structDMAToVRAM, g4bppVariousMenuIcons, $0400, $80, $0000

        lda #(`aUnknown80E53D)<<8
        sta $27+1
        lda #<>aUnknown80E53D
        sta $27
        jsl $878979
        jsl rlUnknown899FDC ; DMA background/borders /get palette

        ldx #$0200  
        
        -
        lda $DDFFFE,x
        sta $FE,x
        dec x
        dec x
        bne -

        lda #0
        sta $0100,b
        jsl $8BB45D ; clear tilemap

        jsl rlDMAByStruct ; dma clean tilemap

          .dstruct structDMAToVRAM, $7E8388, $0800, $80, $E000

        lda #(`aUnknown80E545)<<8
        sta $27+1
        lda #<>aUnknown80E545
        sta $27
        jsl $878979
        rts

        .databank 0

      aUnknown80E53D ; 80/E53D

        .word $1800
        .word $4000
        .word $2B01
        .word $C00A

      aUnknown80E545 ; 80/E545

        .word $0800
        .word $6000
        .word $2001
        .word $DD3F

      rsUnknown80E54D ; 80/E54D

        .al
        .autsiz
        .databank ?

        sep #$20
        lda $76
        and #$FC
        ora #$02
        sta $76

        lda $78
        and #$FC
        ora #$02
        sta $78

        lda #$15
        sta $96
        lda #0
        sta $90
        sta $92
        sta $93
        lda #$FF
        sta $91
        lda #0
        sta $9A
        lda #$81
        sta $9B
        rep #$20

        stz $7F
        stz $81
        stz $83
        stz $85
        stz $87
        stz $89
        rts

        .databank 0

        ; 80/E586



    .here










    * = $02E41B
    .logical $82E41B

      rlBuildRAMStructHeader ; 82/E41B

        .al
        .autsiz
        .databank ?

        ; $00 = struct count
        ; $02 = struct size

        ; $24 = dest pointer

        phb
        php

        phk
        plb

        phx
        phy

        ldy $24

        sep #$20
        lda $24+2
        pha
        rep #$20
        plb

        sep #$20
        lda $02
        beq _End

        sta structRAMStructHeader.StructSize,b,y

        cmp #4
        bcc +

          ; struct size is more than 4?
          dec $00

        +
        lda $00
        beq _End

        sta structRAMStructHeader.MaxStructCount,b,y

        lda #0
        sta structRAMStructHeader.CurrentStructCount,b,y

        lda $02
        tax
        cpx #4
        bcs +

        lda aUnknown82E460,x
        bra ++

        +
        lda #3
        
        +
        sta structRAMStructHeader.Unknown,b,y
        rep #$20
        
        _End
        ply
        plx

        plp
        plb
        rtl

        .databank 0

      aUnknown82E460 ; 82/E460

        .byte 0
        .byte 0
        .byte 1
        .byte 2

      rlUnknown82E464 ; 82/E464

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlAppendNewStructEntry ; 82/E465

        .al
        .autsiz
        .databank ?

        ; lStructPointer1 source
        ; lStructPointer2 dest

        ; Gets the struct size of the destination on its own

        ; Returns clc if success, else return sec

        jsl rlGetRAMStructCurrentStructCount
        inc a
        sta wStructIndex

        jsl rlAddStructEntry
        lda wStructIndex

        rtl

        .databank 0

      rlWriteToFirstStructEntry ; 82/E477

        .al
        .autsiz
        .databank ?

        lda #1
        sta wStructIndex
        jsl rlAddStructEntry
        rtl

        .databank 0

        ; 82/E483

    .here





    * = $02E493
    .logical $82E493

      rlUnknown82E493 ; 82/E493

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        ldx lStructPointer2,b
        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda $0003,b,x
        bit #$0080
        bne _CLC

        lda $0002,b,x
        and #$00FF
        sta wStructSize
        sep #$20

        lda wStructIndex
        beq _SEC

        cmp $0000,b,x
        bcc +
        beq _E509
        bra _SEC

        +
        phx
        lda $0000,b,x
        rep #$20
        and #$00FF
        sec
        sbc wStructIndex
        inc a
        jsr rsGetRAMStructOffset
        sta $000556

        lda wStructIndex
        jsr rsGetRAMStructOffset
        clc
        adc lStructPointer2
        tax
        clc
        adc wStructSize
        tay
        
        -
        sep #$20
        lda $0004,b,y
        sta $0004,b,x
        rep #$20
        inc y
        inc x
        lda $000556
        dec a
        sta $000556
        bne -

        plx
        
        _E509
        rep #$20
        lda $0000,b,x
        dec a
        sta $0000,b,x
        
        _CLC
        ply
        plx
        plp
        plb
        clc
        rtl
        
        _SEC
        rep #$20
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

        ; 82/E520


    .here










    * = $02E55D
    .logical $82E55D

      rlAddStructEntry ; 82/E55D

        .al
        .autsiz
        .databank ?

        ; wStructIndex = struct to write to

        phb
        php

        phk
        plb

        phx
        phy

        ldx lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.Unknown,b,x
        bit #$0080
        bne _CLC

        lda structRAMStructHeader.StructSize,b,x
        and #$00FF
        sta wStructSize

        sep #$20
        lda structRAMStructHeader.CurrentStructCount,b,x
        sta $000552

        cmp structRAMStructHeader.MaxStructCount,b,x
        bcs _SEC

        cmp wStructIndex
        bcc _AppendNewEntry

        ; When adding an entry in the middle, shift all the data after the selected entry back
        ; so the new data can be written to the selected slot

        phx
        rep #$20
        and #$00FF
        sec
        sbc wStructIndex
        inc a
        inc a
        jsr rsGetRAMStructOffset
        sta $000556

        lda $000552
        and #$00FF
        jsr rsGetRAMStructOffset
        clc
        adc lStructPointer2
        clc
        adc wStructSize
        tay

        clc
        adc wStructSize
        tax

        sep #$20
        
        -
        lda $0003,b,y
        sta $0003,b,x
        dec y
        dec x
        lda $000556
        dec a
        sta $000556
        bne -

        plx
        bra +
        
        _AppendNewEntry
        inc a
        sta wStructIndex
        
        +
        rep #$20
        lda wStructIndex
        jsr rsSaveDataToRAMStruct

        lda structRAMStructHeader.CurrentStructCount,b,x
        inc a
        sta structRAMStructHeader.CurrentStructCount,b,x
        
        _CLC
        ply
        plx
        plp
        plb
        clc
        rtl

        _SEC
        rep #$20
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

        ; 82/E5FF


    .here








    * = $02E747
    .logical $82E747

      rlGetRAMStructCurrentStructCount ; 82/E747

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phy
        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.CurrentStructCount,b,y
        and #$00FF

        ply
        plp
        plb
        rtl

        .databank 0

        ; 82/E762

    .here











    * = $02E7BF
    .logical $82E7BF

      rlLoadRAMStructDataByIndex ; 82/E7BF

        .al
        .autsiz
        .databank ?

        ; In:
        ; wStructIndex
        ; lStructPointer2 = pointer to struct header

        phb
        php
        phk
        plb
        phy
        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.CurrentStructCount,b,y
        and #$00FF
        cmp wStructIndex
        bcc +

          lda structRAMStructHeader.StructSize,b,y
          and #$00FF
          sta wStructSize

          lda wStructIndex
          jsr rsLoadDataFromRAMStruct

          ply
          plp
          plb
          clc
          rtl

        +
        ply
        plp
        plb
        sec
        rtl

        .databank 0

        ; 82E7F7

    .here









    * = $02E810
    .logical $82E810

      rlGetRAMStructEntryPointerByStructIndex ; 82/E810

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phy

        ldy lStructPointer2,b

        sep #$20
        lda lStructPointer2+2,b
        pha
        rep #$20
        plb

        lda structRAMStructHeader.CurrentStructCount,b,y
        and #$00FF
        cmp wStructIndex
        bcc +

          lda structRAMStructHeader.StructSize,b,y
          and #$00FF
          sta wStructSize

          lda lStructPointer2+1
          sta lStructPointer1+1

          lda wStructIndex
          jsr rsGetRAMStructOffset
          clc
          adc #size(structRAMStructHeader)
          clc
          adc lStructPointer2
          sta lStructPointer1

          ply
          plp
          plb
          clc
          rtl

        +
        ply
        plp
        plb
        sec
        rtl

        .databank 0

        ; 82/E85D


    .here





    * = $02E8EA
    .logical $82E8EA

      rsGetRAMStructOffset ; 82/E8EA

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = struct index
        ; wStructSize

        ; Out:
        ; A = offset

        phb
        php

        phk
        plb

        dec a
        bmi _End
        beq _End

        cmp #4
        bcs _Multiply

        cmp #3
        beq ++

        cmp #2
        beq +

        lda wStructSize,b
        bra _End

        +
        lda wStructSize,b
        asl
        bra _End
        
        +
        lda wStructSize,b
        asl
        clc
        adc wStructSize,b
        bra _End
        
        _Multiply
        phx
        xba
        sta $0558,b

        lda wStructSize,b
        sta $055A,b

        lda #0
        ldx #8

        -
        asl
        asl $0558,b
        bcc +

        clc
        adc $055A,b
        
        +
        dec x
        bne -

        plx

        _End
        plp
        plb
        rts

        .databank 0

      rsSaveDataToRAMStruct ; 82/E939

        .al
        .autsiz
        .databank ?

        ; A = struct index
        ; wStructSize
        ; lStructPointer1 = data source, 1,2 or 3 bytes or pointer 
        ; lStructPointer2 = dest struct pointer

        php
        phy

        jsr rsGetRAMStructOffset

        clc
        adc lStructPointer2
        tay

        ; If the data to write is 4 bytes of more, do it indirect via a pointer
        lda wStructSize
        cmp #4
        bcs _Indirect

        ; Else the data is directly in the long regiser
        cmp #3
        beq ++

        cmp #2
        beq +

        sep #$20
        lda lStructPointer1
        sta $0004,b,y
        rep #$20
        bra _End
        
        +
        lda lStructPointer1
        sta $0004,b,y
        bra _End
        
        +
        lda lStructPointer1
        sta $0004,b,y
        lda lStructPointer1+1
        sta $0004+1,b,y
        bra _End

        _Indirect
        lda wStructSize
        pha
        lda $54
        pha
        lda $54+1
        pha

        phx
        lda lStructPointer1
        sta $54
        lda lStructPointer1+1
        sta $54+1

        sep #$20
        tyx
        ldy #0
        
        -
        lda [$54],y
        sta $0004,b,x
        inc y
        inc x
        lda wStructSize
        dec a
        sta wStructSize
        bne -

        rep #$20
        plx

        pla
        sta $54+1
        pla
        sta $54
        pla
        sta wStructSize
        
        _End
        ply
        plp
        rts

        .databank 0

      rsLoadDataFromRAMStruct ; 82/E9BE

        .al
        .autsiz
        .databank ?

        ; A = struct index
        ; wStructSize
        ; lStructPointer1 = dest struct pointer
        ; lStructPointer2 = data source, 1,2 or 3 bytes or pointer 

        php
        phx
        phy

        jsr rsGetRAMStructOffset

        clc
        adc lStructPointer2
        tay

        lda wStructSize
        cmp #4
        bcs _Indirect

        cmp #3
        beq ++

        cmp #2
        beq +

        sep #$20
        lda $0004,b,y
        sta lStructPointer1
        rep #$20
        bra _End
        
        +
        lda $0004,b,y
        sta lStructPointer1
        bra _End
        
        +
        lda $0004,b,y
        sta lStructPointer1
        lda $0004+1,b,y
        sta lStructPointer1+1
        bra _End
        
        _Indirect
        lda wStructSize
        pha
        lda $54
        pha
        lda $54+1
        pha

        lda lStructPointer1
        sta $54
        lda lStructPointer1+1
        sta $54+1

        sep #$20
        tyx
        ldy #0
        
        -
        lda $0004,b,x
        sta [$54],y
        inc x
        inc y
        lda wStructSize
        dec a
        sta wStructSize
        bne -

        rep #$20

        pla
        sta $54+1
        pla
        sta $54
        pla
        sta wStructSize
        
        _End
        ply
        plx
        plp
        rts

        .databank 0

        ; 82/EA43

    .here








    * = $02ECB9
    .logical $82ECB9

      rlBuildRAMAreaHeaderAndGuidingEntry ; 82/ECB9

        .al
        .autsiz
        .databank ?

        ; A   = area size
        ; $24 = ram area pointer
        ; wStructIndex = ?

        phb
        php

        phk
        plb

        tay
        phy

        lda $00
        pha

        sty $00
        jsl rlLoadRAMAreaPointer

        ldy $24

        sep #$20
        lda $24+2
        pha
        rep #$20
        plb

        sep #$20
        lda wStructIndex,b
        beq +

          lda #$80
        
        +
        sta structRAMAreaHeader.Flags,b,y
        bne +

        lda $00056B
        bra ++

        +
        lda #0

        +
        sta structRAMAreaHeader.Unknown2,b,y
        rep #$20

        lda $00
        clc
        adc lRAMAreaPointer
        sta structRAMAreaHeader.AreaEnd,b,y

        lda $00
        sec
        sbc #size(structRAMAreaHeader)
        sta $00
        sta structRAMAreaHeader.AreaSize,b,y

        phy

        tya
        clc
        adc #size(structRAMAreaHeader)
        tay

        jsr rsAddEmptyGuidingRAMAreaEntry
        jsr rsSaveOffsetToRAMAreaEntry

        ply

        jsr rsUnknown82F143
        sta structRAMAreaHeader.Unknown3,b,y

        pla
        sta $00

        ply
        plp
        plb
        rtl

        .databank 0

        ; 82/ED1D

    .here





    * = $02EDE7
    .logical $82EDE7

      rlAllocateRAMArea ; 82/EDE7

        .al
        .autsiz
        .databank ?

        ; This reserves space in a RAM area with the size of a specified RAM struct entry + the RAM area entry header

        ; $00   = size
        ; lRAMAreaPointer = RAM pointer

        phb
        php

        phk
        plb

        phy
        tay

        lda $00
        pha
        lda $04
        pha

        sty $00

        ; checks if pointer exists
        lda lRAMAreaPointer,b
        ora lRAMAreaPointer+1,b
        beq _End

        lda $00
        clc
        adc #size(structRAMAreaEntryHeader)
        sta $00

        ldy lRAMAreaPointer,b

        sep #$20
        lda lRAMAreaPointer+2,b
        pha
        rep #$20
        plb

        sep #$20
        lda structRAMAreaHeader.Flags,b,y
        ora #$20
        sta structRAMAreaHeader.Flags,b,y
        rep #$20

        ; check for free entry
        jsr rsUnknown82F032

        ; load max size, subtract requested size
        tay
        lda structRAMAreaEntryHeader.Offset,b,y
        sec
        sbc $00
        sta structRAMAreaEntryHeader.Offset,b,y

        cmp #7
        bcs +

          clc
          adc $00
          sta $00
          bra ++

        +
        jsr rsGetNewRAMAreaEntryOffset
        tay

        +
        jsr rsAddNewRAMAreaEntry
        jsr rsSaveOffsetToRAMAreaEntry

        phk
        plb

        lda lRAMAreaPointer+1,b
        sta $39+1
        tya
        clc
        adc #size(structRAMAreaEntryHeader)
        sta $39
        
        _End
        ldy #0

        pla
        sta $04
        pla
        sta $00

        tya
        ply

        plp
        plb
        rtl

        .databank 0

        ; 82/EE5C

    .here


    * = $02EED2
    .logical $82EED2

      rlUnknown82EED2 ; 82/EED2

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        phy

        lda $02
        pha
        lda $04
        pha
        lda $06
        pha
        lda $08
        pha

        ldy lRAMAreaPointer,b

        sep #$20
        lda lRAMAreaPointer+2,b
        pha
        rep #$20
        plb

        sep #$20
        lda structRAMAreaHeader.Flags,b,y
        ora #$40
        sta structRAMAreaHeader.Flags,b,y
        rep #$20

        lda structRAMAreaHeader.AreaEnd,b,y
        sta $04

        tya
        clc
        adc #size(structRAMAreaHeader)
        tay

        _Loop
        lda structRAMAreaEntryHeader.Flags,b,y
        bit #$0080
        beq _EF48

          jsr rsGetNewRAMAreaEntryOffset
          tax
          lda $0000,b,x
          bit #$0040
          bne _EF48

          lda $0003,b,x
          sta $02
          jsr rsUnknown82F1EA

          lda $0001,b,y
          sta $08
          lda $0001,b,x
          sta $06
          
          -
          sep #$20
          lda $0000,b,x
          sta $0000,b,y
          rep #$20

          inc x
          inc y
          dec $06
          bne -

          jsr rsAddEmptyGuidingRAMAreaEntry

          lda $08
          sta $0001,b,y
          jsr rsUnknown82F0EB

        _EF48
        jsr rsGetNewRAMAreaEntryOffset
        tay
        cpy $04
        bcc _Loop

        pla
        sta $08
        pla
        sta $06
        pla
        sta $04
        pla
        sta $02

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlSaveRAMAreaPointer ; 82/EF61

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        lda lRAMAreaPointer+1,b
        sta $24+1
        lda lRAMAreaPointer,b
        sta $24

        plp
        plb
        rtl

        .databank 0

      rlLoadRAMAreaPointer ; 82/EF72

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        lda $24+1
        sta lRAMAreaPointer+1,b
        lda $24
        sta lRAMAreaPointer,b

        plp
        plb
        rtl

        .databank 0

      rlBackupAndLoadNewRAMAreaPointer ; 82/EF83

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        lda lRAMAreaPointer+1,b
        sta $0568+1,b
        lda lRAMAreaPointer,b
        sta $0568,b

        lda $24+1
        sta lRAMAreaPointer+1,b
        lda $24
        sta lRAMAreaPointer,b

        plp
        plb
        rtl

        .databank 0

        ; 82/EFA0






    .here



    * = $02EFE1
    .logical $82EFE1

      rsAddEmptyGuidingRAMAreaEntry ; 82/EFE1

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #$80
        sta structRAMAreaEntryHeader.Flags,b,y
        rep #$20
        lda #0
        sta structRAMAreaEntryHeader.BaseTable+1,b,y
        sta structRAMAreaEntryHeader.BaseTable,b,y
        rts

        .databank 0

      rsAddNewRAMAreaEntry ; 82/EFF4

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #$40
        sta structRAMAreaEntryHeader.Flags,b,y
        rep #$20

        lda lRAMAreaPointer+1
        sta structRAMAreaEntryHeader.BaseTable+1,b,y
        lda lRAMAreaPointer
        sta structRAMAreaEntryHeader.BaseTable,b,y
        rts

        .databank 0

      rsUnknown82F00C ; 82/F00C

        .al
        .autsiz
        .databank ?

        sep #$20
        lda #0
        sta $0000,b,y
        rep #$20

        lda $000566
        sta $0003+1,b,y
        lda $02
        sta $0003,b,y
        rts

        .databank 0

      rsSaveOffsetToRAMAreaEntry ; 82/F022

        .al
        .autsiz
        .databank ?

        lda $00
        sta structRAMAreaEntryHeader.Offset,b,y
        rts

        .databank 0

      rsUnknown82F028 ; 82/F028

        .al
        .autsiz
        .databank ?

        lda $00
        clc
        adc #6
        sta $0001,b,y
        rts

        .databank 0

      rsUnknown82F032 ; 82/F032

        .al
        .autsiz
        .databank ?

        jsr rsCheckIfEntryFitsInRAMArea
        bcs +
        
        -
        rts
        
        ; all slots are filled
        +
        jsl rlUnknown82EED2
        jsr rsCheckIfEntryFitsInRAMArea
        bcs +
        bra -
        
        +
        sep #$20
        lda #$3F
        sta CGADSUB
        lda #$32
        sta COLDATA
        lda #$C0
        sta COLDATA
        rep #$20
        .byte 0

        .databank 0

      rsCheckIfEntryFitsInRAMArea ; 82/F05A

        .al
        .autsiz
        .databank ?

        ; $00 = size

        phy
        lda structRAMAreaHeader.AreaEnd,b,y
        sta $04

        tya
        clc
        adc #size(structRAMAreaHeader)
        tay

        -
        lda structRAMAreaEntryHeader.Flags,b,y
        bit #$0080
        beq +

        ; Is a guiding entry
        lda structRAMAreaEntryHeader.Offset,b,y
        cmp $00
        bcs ++

        ; Entry isnt a guiding one, or space isnt enough for entry
        +
        tya
        clc
        adc structRAMAreaEntryHeader.Offset,b,y
        tay
        cpy $04
        bcc -

        ; Entry doesnt fit
        ply
        sec
        rts

        ; Entry fits
        +
        tya
        ply
        clc
        rts

        .databank 0

      rsGetNewRAMAreaEntryOffset ; 82/F086

        .al
        .autsiz
        .databank ?

        tya
        clc
        adc structRAMAreaEntryHeader.Offset,b,y
        rts

        .databank 0

        ; 82/F08C

    .here



    * = $02F0EB
    .logical $82F0EB

      rsUnknown82F0EB ; 82/F0EB

        .al
        .autsiz
        .databank ?

        phx
        phy
        lda $04
        pha

        lda lRAMAreaPointer
        tay
        lda $0001,b,y
        sta $04

        tya
        clc
        adc #8
        tay
        
        _Loop
        lda $0000,b,y
        bit #$0080
        beq +
        
        -
        jsr rsGetNewRAMAreaEntryOffset
        tax
        cpx $04
        bcs _End

        lda $0000,b,x
        bit #$0080
        beq +

        lda $0001,b,y
        clc
        adc $0001,b,x
        sta $0001,b,y

        lda #0
        sta $0000,b,x
        sta $0001,b,x
        sta $0004,b,x
        sta $0003,b,x
        bra -
        
        +
        tya
        clc
        adc $0001,b,y
        tay
        cpy $04
        bcc _Loop
        
        _End
        pla
        sta $04

        ply
        plx
        rts

        .databank 0

      rsUnknown82F143 ; 82/F143

        .al
        .autsiz
        .databank ?

        phy
        lda $00
        pha
        lda $06
        pha

        lda structRAMAreaHeader.Unknown2,b,y
        and #$00FF
        beq _End

          sta $06
          asl
          asl
          clc
          adc #3
          sta $00
          jsl rlAllocateRAMArea

          ldy $39
          lda #0
          sta $0000,b,y

          sep #$20
          lda $06
          sta $0002,b,y
          rep #$20

          ldx $06
          
          -
          sep #$20
          lda #$80
          sta $0006,b,y
          rep #$20

          tya
          clc
          adc #4
          tay
          dec x
          bne -

          pla
          sta $06
          pla
          sta $00

          lda $39
          ply
          rts

        _End
        pla
        sta $06
        pla
        sta $00

        lda #0
        ply
        rts

        .databank 0

        ; 82/F19A

    .here





    * = $02F1EA
    .logical $82F1EA

      rsUnknown82F1EA ; 82/F1EA

        .al
        .autsiz
        .databank ?

        phx
        ldx $02
        sep #$20
        lda #0
        sta $0003,b,x
        rep #$20

        lda $00566
        sta $0001,b,x
        tya
        clc
        adc #6
        sta $0000,b,x
        plx
        rts

        .databank 0

        ; 82/F207

    .here





    * = $02F567
    .logical $82F567

      rlUnknown82F567 ; 82/F567

        .al
        .autsiz
        .databank ?

        ; Builds an offset table in ram and copies the data into the table for each entry.

        ; $00 = 5
        ; $24 = aFactionArea
        ; $27 = aUnknown84BBCD data

        phb
        php
        phk
        plb
        phy

        lda $00
        pha

        ldy $24

        sep #$20
        lda $24+2
        pha
        rep #$20
        plb

        ; Check for existing offset
        lda $0000,b,y
        bne +

          ; If there is no offset, set it to minimal possible offset
          lda #2
          sta $0000,b,y
          lda #0
          bra ++

        +
        lsr
        dec a
        pha
        sta $02
        lda #2
        sta $00
        
        -
        lda $02
        jsl rlUnknown82F5DD
        dec $02
        bne -

        pla
        asl
        
        +
        clc
        adc $24
        tay
        lda $0000,b,y
        clc
        adc #2
        sta $0000,b,y
        clc
        adc $24
        sta lBlockCopyDestination,b

        sep #$20
        lda $24+2
        sta lBlockCopyDestination+2,b
        rep #$20

        lda $27+1
        sta lBlockCopySource+1,b
        lda $27
        sta lBlockCopySource,b ; data pointer 

        pla
        sta $00 ; $05 set value

        sta wBlockCopySize,b
        jsl rlBlockCopyMVNByRAM

        lda $0000,b,y
        clc
        adc $00
        sta $0002,b,y

        ply
        plp
        plb
        rtl

        .databank 0

      rlUnknown82F5DD ; 82/F5DD

        .al
        .autsiz
        .databank ?

        ; This shifts data in a table back and adjusts all offsets to match the new locations

        phb
        php

        phk
        plb

        phy

        ldy $02
        phy

        dec a
        asl
        clc
        adc $24
        tay

        sep #$20
        lda $24+2
        sta lBlockCopySource+2,b
        sta lBlockCopyDestination+2,b
        pha
        rep #$20
        plb

        lda $0002,b,y
        sec
        sbc $0000,b,y
        sta $02

        lda $00
        bpl +

        lda $0000,b,y
        clc
        adc $24
        sta lBlockCopySource,b
        clc
        adc $00
        sta lBlockCopyDestination,b
        lda $02
        sta wBlockCopySize,b
        jsl rlBlockCopyMVNByRAM
        bra ++

        +
        lda $0002,b,y
        dec a
        clc
        adc $24
        sta lBlockCopySource,b
        clc
        adc $00
        sta lBlockCopyDestination,b
        lda $02
        sta wBlockCopySize,b
        jsl $80A9A2

        +
        lda $0000,b,y
        clc
        adc $00
        sta $0000,b,y

        ply
        sty $02
        ply
        plp
        plb
        rtl

        .databank 0

        ; 82/F649

    .here












    * = $038000
    .logical $838000

      aMainDataOffsets .block ; 83/8000

        CharacterNameOffsets    .word <>aCharacterNameOffsets     - aMainDataOffsets ; $00
        CharacterDataOffsets    .word <>aCharacterDataOffsets     - aMainDataOffsets ; $02
        ClassNameOffsets        .word <>aClassNameOffsets         - aMainDataOffsets ; $04
        ClassDataOffsets        .word <>aClassDataOffsets         - aMainDataOffsets ; $06
        MovementCostOffsets     .word <>aMovementCostOffsets      - aMainDataOffsets ; $08
        TerrainAvoidOffsets     .word <>aTerrainAvoidOffsets      - aMainDataOffsets ; $0A
        ItemNameOffsets         .word <>aItemNameOffsets          - aMainDataOffsets ; $0C
        ItemDescriptionOffsets  .word <>aItemDescriptionOffsets   - aMainDataOffsets ; $0E
        ItemDataOffsets         .word <>aItemDataOffsets          - aMainDataOffsets ; $10
                                .word <>aUnknown83D8E6            - aMainDataOffsets ; $12
        FactionNameOffsets      .word <>aFactionNameOffsets       - aMainDataOffsets ; $14
      .bend

      aClassWeaknessTable .binclude "../tables/ClassWeakness.asm" ; 83/8016

      ; 83/805E
      

    .here



    * = $03833C
    .logical $83833C

      aPromotionTable .binclude "../tables/PromotionTable.asm"                          ; 83/833C
      aTerrainNameOffsets .include "../tables/TerrainNameOffsets.csv.asm"               ; 83/837B
      aTerrainNames .binclude "../tables/TerrainNames.asm"                              ; 83/83AF       
      aMaleLoverIDs .include "../tables/MaleLoverIDs.csv.asm"                           ; 83/848D
        .sint -1
      aFemaleLoverIDs .include "../tables/FemaleLoverIDs.csv.asm"                       ; 83/84DB
        .sint -1
      aLoveBaseOffsets .include "../tables/LoveBaseOffsets.csv.asm"                     ; 83/850F
      aGen1LoveBases .binclude "../tables/Gen1LoveBases.csv.asm"                        ; 83/8541
      aGen2LoveBases .binclude "../tables/Gen2LoveBases.csv.asm"                        ; 83/85C8
      aLoveGrowthOffsets  .include "../tables/LoveGrowthOffsets.csv.asm"                ; 83/8738
      aGen1LoveGrowths .binclude "../tables/Gen1LoveGrowths.csv.asm"                    ; 83/876A
      aGen2LoveGrowths .binclude "../tables/Gen2LoveGrowths.csv.asm"                    ; 83/87F1
      aUnknown838961 .binclude "../tables/Unknown838961.asm"                            ; 83/8961
      aChildrenDataOffsets .binclude "../tables/ChildrenDataOffsets.csv.asm"            ; 83/8993
      aChildrenData .binclude "../tables/ChildrenData.csv.asm"                          ; 83/89A5
      aHolyBloodGrowthBoostsOffsets .binclude "../tables/HolyBloodDataOffsets.csv.asm"  ; 83/89C9
      aHolyBloodData .binclude "../tables/HolyBloodData.csv.asm"                        ; 83/89E3
      aClassNameOffsets .include "../tables/ClassNameOffsets.csv.asm"                   ; 83/8AB3
      aClassNames .binclude "../tables/ClassNames.asm"                                  ; 83/8B43
      aClassDataOffsets .include "../tables/ClassDataOffsets.csv.asm"                   ; 83/8F35
      aClassData .binclude "../tables/ClassData.csv.asm"                                ; 83/8FC5
      aMovementCostOffsets .include "../tables/MovementCostOffsets.csv.asm"             ; 83/987D
      aMovementCost .binclude "../tables/MovementCost.csv.asm"                          ; 83/989B
      aTerrainAvoidOffsets .include "../tables/TerrainAvoidOffsets.csv.asm"             ; 83/9A21
      aTerrainAvoid .binclude "../tables/TerrainAvoid.csv.asm"                          ; 83/9A25
      aCharacterNameOffsets .include "../tables/CharacterNameOffsets.csv.asm"           ; 83/9A59
      aCharacterNames .binclude "../tables/CharacterNames.asm"                          ; 83/9ECD
      aCharacterDataOffsets .include "../tables/CharacterDataOffsets.csv.asm"           ; 83/ADF5
      aCharacterData .binclude "../tables/CharacterData.asm"                            ; 83/B267
      aUnknown83D8E6 .word 0                                                            ; 83/D8E6
      aFactionNameOffsets .include "../tables/FactionNameOffsets.csv.asm"               ; 83/D8E8
      aFactionNames .binclude "../tables/FactionNames.asm"                              ; 83/D956
      aItemNameOffsets .include "../tables/ItemNameOffsets.csv.asm"                     ; 83/DC12
      aItemNames .binclude "../tables/ItemNames.asm"                                    ; 83/DD26
      aItemDescriptionOffsets .include "../tables/ItemDescriptionOffsets.csv.asm"       ; 83/E2E8
      aItemDescriptions .binclude "../tables/ItemDescriptions.asm"                      ; 83/E3FC
      aItemDataOffsets .include "../tables/ItemDataOffsets.csv.asm"                     ; 83/E9D0
      aItemData .binclude "../tables/ItemData.asm"                                      ; 83/EAE4
      aPlayerItemTable .include "../tables/PlayerItemTable.csv.asm"                     ; 83/F489
      .sint -1
      aCastleNameOffsets .include "../tables/CastleNameOffsets.csv.asm"                 ; 83/F517
      aCastleNames .binclude "../tables/CastleNames.asm"                                ; 83/F573

      rlUnknown83F7C1 ; 83/F7C1

        .al
        .autsiz
        .databank ?

        phk
        plb
        rtl

        .databank 0

        ; 83/F7C4

    .here

















    * = $048000
    .logical $848000

      rlUnknown848000 ; 84/8000

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        ldx #35
        lda #0
        
        -
        sta $056D,b,x
        dec x
        dec x
        bpl -

        ldx #$3295
        lda #0
        
        -
        sta $7E2000,x
        dec x
        dec x
        bpl -

        ldx #$008E
        lda #$FFFF
        
        -
        sta $7E480B,x
        dec x
        dec x
        bpl -

        lda #(`aUnitRAMPointers)<<8
        sta $24+1
        lda #<>aUnitRAMPointers
        sta $24
        lda #len(aUnitRAMPointers._Entry)
        sta $00
        lda #size(aUnitRAMPointers._Entry[0])
        sta $02
        jsl rlBuildRAMStructHeader

        lda #(`aUnitRAMArea)<<8
        sta $24+1
        lda #<>aUnitRAMArea
        sta $24
        lda #1
        sta wStructIndex,b
        lda #<>size(aUnitRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aStaticUnitRAMArea)<<8
        sta $24+1
        lda #<>aStaticUnitRAMArea
        sta $24
        lda #1
        sta wStructIndex,b
        lda #<>size(aStaticUnitRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aDynamicUnitRAMArea)<<8
        sta $24+1
        lda #<>aDynamicUnitRAMArea
        sta $24
        lda #1
        sta wStructIndex,b
        lda #<>size(aDynamicUnitRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aHolyAndEnemyRAMArea)<<8
        sta $24+1
        lda #<>aHolyAndEnemyRAMArea
        sta $24
        lda #1
        sta wStructIndex,b
        lda #<>size(aHolyAndEnemyRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aInventoryRAMArea)<<8
        sta $24+1
        lda #<>aInventoryRAMArea
        sta $24
        lda #1
        sta wStructIndex,b
        lda #<>size(aInventoryRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aLoverRAMArea)<<8
        sta $24+1
        lda #<>aLoverRAMArea
        sta $24
        lda #1
        sta wStructIndex,b
        lda #$014C
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aPlayerItemTable)<<8
        sta $0571+1,b
        lda #<>aPlayerItemTable
        sta $0571,b
        jsl rlInitiateItemRAMData

        jsl rlInitiateFactionRAMData

        jsl $8BCE71 ; clear some stuff

        plx
        plp
        plb
        rtl

        .databank 0

        ; 8480EC


    .here




    * = $048397
    .logical $848397

      rlCreateUnit ; 84/8397

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        jsl rlUnknown83F7C1

        jsl rlGetCharacterDataROMPointer

        tay
        lda structCharacterROMEntry.Type,b,y
        and #$00FF
        asl
        tax
        jsr (aUnitCreationRoutinesByType,x)
        plb
        rtl

        .databank 0

      aUnitCreationRoutinesByType ; 84/83B0

        .addr rsCreateStaticUnitRAMData
        .addr rsCreateDynamicUnitRAMData
        .addr rsCreateHolyUnitRAMData
        .addr rsCreateEnemyUnitRAMData

      ; 84/83B8



    .here





    * = $0483F3
    .logical $8483F3

      rlUnknown8483F3 ; 84/83F3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $02
        pha
        lda $04
        pha

        sep #$20
        lda $0573,b
        pha
        rep #$20
        plb

        lda $14
        sec
        sbc #16
        sta $14

        lda $16
        sec
        sbc #16
        sta $16

        lda $000571
        tay
        ldx #$0400
        lda #$FFFF

        -
        sta $0000,b,y
        inc y
        inc y
        dec x
        dec x
        bne -

        ldx #$008E
        
        -
        lda aDeploymentTable._Status[0],x
        bit #$0080
        beq _Next

        bit #$0040
        bne _Next

        bit #$0020
        bne _Next

        lda aDeploymentTable._XPosition[0],x
        sec
        sbc $14
        sta $02
        cmp #32
        bcs _Next

        lda aDeploymentTable._YPosition[0],x
        sec
        sbc $16
        sta $04
        cmp #32
        bcs _Next

        lda $04
        asl
        asl
        asl
        asl
        asl
        clc
        adc $02
        clc
        adc $00571
        tay
        txa
        sep #$20
        sta $0000,b,y
        rep #$20
        
        _Next
        dec x
        dec x
        bpl -

        pla
        sta $04
        pla
        sta $02
        plp
        plb
        rtl

        .databank 0

      rlGetCharacterDataROMPointer ; 84/8481

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        dec a
        bmi +

        pha
        lda aMainDataOffsets.CharacterDataOffsets
        tax

        pla
        asl
        cmp aMainDataOffsets,x
        bcs +

        clc
        adc aMainDataOffsets.CharacterDataOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.CharacterDataOffsets
        adc #<>aMainDataOffsets
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        +
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlUnknown8484B4 ; 84/84B4

        .al
        .autsiz
        .databank `aUnitRAMPointers

        ; find unit?

        phb
        phx
        ldx $4C
        phx
        ldx $4E
        phx

        sta $4C

        sep #$20
        lda #`aUnitRAMPointers
        pha
        rep #$20
        plb

        lda aUnitRAMPointers._Header.CurrentStructCount
        and #$00FF
        asl
        sta $4E

        ldx #0
        
        -
        lda aUnitRAMPointers._Entry[0],x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        cmp $4C
        beq _CLC

        inc x
        inc x
        cpx $4E
        bcc -

        stz wSelectedUnitDataRAMPointer,b
        sec
        
        -
        pla
        sta $4E
        pla
        sta $4C
        plx
        plb
        rtl
        
        _CLC
        clc
        bra -

        .databank 0

      rlGetCharacterNamePointer ; 84/84F6

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        dec a
        bmi +

        asl
        clc
        adc aMainDataOffsets.CharacterNameOffsets
        tax
        lda #(`aMainDataOffsets)<<8
        sta $0571+1,b
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.CharacterNameOffsets
        adc #<>aMainDataOffsets
        sta $0571,b

        -
        plx

        plp
        plb
        rtl

        +
        lda #(`aCharacterNameNone)<<8
        sta $0571+1,b
        lda #<>aCharacterNameNone
        sta $0571,b
        bra -

        .databank 0

      aCharacterNameNone ; 84/852C

        .text "\n"

      ; 84/852E

    .here






    * = $04861C
    .logical $84861C

      rlGetPortraitID ; 84/861C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        dec a
        asl
        tax
        lda $8B9A88,x
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84862C

    .here









    * = $048C96
    .logical $848C96

      rlUnknown848C96 ; 84/8C96

        .al
        .autsiz
        .databank `aUnitRAMPointers

        phb
        php

        sep #$20
        lda #`aUnitRAMPointers
        pha
        rep #$20
        plb

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx $00
        phx

        ldx #$002E
        lda #0
        
        -
        sta $2000,b,x
        dec x
        dec x
        bpl -
        
        lda aUnitRAMPointers
        and #$00FF
        asl
        sta $00

        ldx #0

        -
        lda aUnitRAMPointers._Entry[0],x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        cmp #Gerrard
        bcs ++

        tay
        lda wCurrentChapter,b
        cmp #6
        bcc +

        cpy #Seliph
        bcc ++
        
        +
        jsl rlGetSelectedUnitNumber
        dec a
        asl
        tay
        lda wSelectedUnitDataRAMPointer,b
        sta $2000,b,y

        +
        inc x
        inc x
        cpx $00
        bcc -

        plx
        stx $00
        plx
        stx wSelectedUnitDataRAMPointer,b

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/8CFE


    .here











    * = $048F17
    .logical $848F17

      rsCreateStaticUnitRAMData ; 84/8F17

        .al
        .autsiz
        .databank ?

        phx
        lda #(`aStaticUnitRAMArea)<<8
        sta $24+1
        lda #<>aStaticUnitRAMArea
        sta $24
        jsl rlLoadRAMAreaPointer

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda #UnitTypeStatic
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM) + size(structExtendedPersonalCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda $39+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda $39 
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda $39+1
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        lda $39
        clc
        adc #size(structPersonalCharacterDataRAM)
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x

        tya
        clc
        adc #structStaticCharacterROMEntry.CharacterID
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        jsr rsFillUnitRAMExtendedPersonalData
        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData
        jsr rsUnknown849294
        plx
        rts

        .databank 0

      rsCreateDynamicUnitRAMData ; 84/8F83

        .al
        .autsiz
        .databank ?

        ; $00 = father ram pointer
        ; $02 = mother ram pointer

        phx
        ldx wSelectedUnitDataRAMPointer,b

        lda $02 ; $28A8?
        sta wSelectedUnitDataRAMPointer,b
        lda #(`aMotherData._Personal)<<8
        sta $058D+1,b
        lda #<>aMotherData._Personal
        sta $058D,b
        jsl rlCopyParentsExtendedCharacterData

        lda #(`aMotherData._ROM)<<8
        sta $058D+1,b
        lda #<>aMotherData._ROM
        sta $058D,b
        jsl rlCopyParentsCharacterROMData

        lda $00
        sta wSelectedUnitDataRAMPointer,b
        lda #(`aFatherData._Personal)<<8
        sta $058D+1,b
        lda #<>aFatherData._Personal
        sta $058D,b
        jsl rlCopyParentsExtendedCharacterData

        lda #(`aFatherData._ROM)<<8
        sta $058D+1,b
        lda #<>aFatherData._ROM
        sta $058D,b
        jsl rlCopyParentsCharacterROMData

        stx wSelectedUnitDataRAMPointer,b

        lda $02
        pha
        lda $00
        pha

        lda #(`aDynamicUnitRAMArea)<<8
        sta $24+1
        lda #<>aDynamicUnitRAMArea
        sta $24
        jsl rlLoadRAMAreaPointer

        sep #$20
        lda #UnitTypeDynamic
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM) + size(structExtendedPersonalCharacterDataRAM) + size(structCharacterConstantData)
        jsl rlAllocateRAMArea

        lda $39+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda $39
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda $39+1
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        lda $39
        clc
        adc #size(structPersonalCharacterDataRAM)
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda $39+1
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x
        lda $39
        clc
        adc #size(structPersonalCharacterDataRAM) + size(structExtendedPersonalCharacterDataRAM)
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        jsl rlFillChildsConstantData
        jsl rsFillChildExtendedPersonalData
        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData
        jsr rsUnknown849294

        pla
        sta $00
        pla
        sta $02

        lda structDynamicCharacterROMEntry.MajorInfluence,b,y
        and #$00FF
        bne +

          lda $02
          sta $04
          bra ++

          +
          lda $00
          sta $04

        +
        jsl rlInheritInventoryToChild

        plx
        rts

        .databank 0

      rsCreateHolyUnitRAMData ; 84/9063

        .al
        .autsiz
        .databank ?

        phx
        lda #(`aHolyAndEnemyRAMArea)<<8
        sta $24+1
        lda #<>aHolyAndEnemyRAMArea
        sta $24
        jsl rlLoadRAMAreaPointer

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda #UnitTypeHoly
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda $39+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda $39
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        tya
        clc
        adc #structStaticCharacterROMEntry.HP
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x
        tya
        clc
        adc #structStaticCharacterROMEntry.CharacterID
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.LoverData+1,x
        sta $7E0000+structCharacterDataRAM.LoverData,x

        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData

        plx
        rts

        .databank 0

      rsCreateEnemyUnitRAMData ; 84/90D4

        .al
        .autsiz
        .databank ?

        phx
        lda $0574,b
        pha

        lda #(`aHolyAndEnemyRAMArea)<<8
        sta $24+1
        lda #<>aHolyAndEnemyRAMArea
        sta $24
        jsl rlLoadRAMAreaPointer

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda #UnitTypeEnemy
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda $39+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda $39
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        tya
        clc
        adc #structEnemyCharacterROMEntry.CharacterID
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.LoverData+1,x
        sta $7E0000+structCharacterDataRAM.LoverData,x

        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData

        pla
        sta $0574,b
        plx
        rts

        .databank 0

      rsFillUnitRAMPersonalData ; 84/9148

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        phy
        phy

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.PersonalData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.PersonalData,x
        tay
        plx

        lda #0
        sta structPersonalCharacterDataRAM.UnitStates,b,y
        sep #$20
        sta structPersonalCharacterDataRAM.Unknown2,b,y
        sta structPersonalCharacterDataRAM.Unknown4,b,y
        sta structPersonalCharacterDataRAM.Unknown6,b,y
        sta structPersonalCharacterDataRAM.Unknown8,b,y
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,y
        sta structPersonalCharacterDataRAM.WeaponStatBonus,b,y
        sta structPersonalCharacterDataRAM.StatusDuration,b,y
        sta structPersonalCharacterDataRAM.Status,b,y

        lda #7
        sta structPersonalCharacterDataRAM.Faction,b,y
        lda #$FF
        sta structPersonalCharacterDataRAM.Unknown3,b,y
        rep #$20

        jsl rlUnknown87ACC2

        sep #$20
        sta structPersonalCharacterDataRAM.LoverID,b,y
        rep #$20

        jsl rlGetSelectedUnitMaxHP

        sep #$20
        sta structPersonalCharacterDataRAM.CurrentHP,b,y
        rep #$20

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMoney

        sep #$20
        sta structPersonalCharacterDataRAM.ClassMoney,b,y
        rep #$20

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rsFillUnitRAMExtendedPersonalData ; 84/91B8

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        phy

        phy

        ldx wSelectedUnitDataRAMPointer,b

        sep #$20
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData,x
        tay
        plx

        sep #$20
        lda $830000+structStaticCharacterROMEntry.HP,x
        sta structExtendedPersonalCharacterDataRAM.HP,b,y
        lda $830000+structStaticCharacterROMEntry.Strength,x
        sta structExtendedPersonalCharacterDataRAM.Strength,b,y
        lda $830000+structStaticCharacterROMEntry.Magic,x
        sta structExtendedPersonalCharacterDataRAM.Magic,b,y
        lda $830000+structStaticCharacterROMEntry.Skill,x
        sta structExtendedPersonalCharacterDataRAM.Skill,b,y
        lda $830000+structStaticCharacterROMEntry.Speed,x
        sta structExtendedPersonalCharacterDataRAM.Speed,b,y
        lda $830000+structStaticCharacterROMEntry.Defense,x
        sta structExtendedPersonalCharacterDataRAM.Defense,b,y
        lda $830000+structStaticCharacterROMEntry.Resistance,x
        sta structExtendedPersonalCharacterDataRAM.Resistance,b,y
        lda $830000+structStaticCharacterROMEntry.Luck,x
        sta structExtendedPersonalCharacterDataRAM.Luck,b,y
        lda $830000+structStaticCharacterROMEntry.Class,x
        sta structExtendedPersonalCharacterDataRAM.Class,b,y
        lda $830000+structStaticCharacterROMEntry.Level,x
        sta structExtendedPersonalCharacterDataRAM.Level,b,y
        lda $830000+structStaticCharacterROMEntry.LeadershipStars,x
        sta structExtendedPersonalCharacterDataRAM.LeadershipStars,b,y

        lda #0
        sta structExtendedPersonalCharacterDataRAM.Unknown13,b,y
        sta structExtendedPersonalCharacterDataRAM.Experience,b,y
        rep #$20

        lda $830000+structStaticCharacterROMEntry.Money,x
        and #$00FF
        sta $14

        lda #1000
        sta $16
        jsl $80A0BA ; Multiply routine

        lda $18
        sta structExtendedPersonalCharacterDataRAM.Money,b,y

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rsFillUnitRAMInventoryData ; 84/9247

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        lda #(`aInventoryRAMArea)<<8
        sta $24+1
        lda #<>aInventoryRAMArea
        sta $24
        jsl rlLoadRAMAreaPointer

        lda #size(structInventoryDataRAM)
        jsl rlAllocateRAMArea

        lda $39+1
        sta $7E0000+structCharacterDataRAM.InventoryData+1,x
        lda $39
        sta $7E0000+structCharacterDataRAM.InventoryData,x

        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq _Enemy

        cmp #UnitTypeDynamic
        beq _Dynamic

        ; static or holy
        tya
        clc
        adc #structStaticCharacterROMEntry.Equipment1
        bra _End

        _Enemy
        tya
        clc
        adc #structEnemyCharacterROMEntry.Equipment1
        bra _End

        _Dynamic
        tya
        clc
        adc #structDynamicCharacterROMEntry.Equipment1
        
        _End
        jsl rlLoadEquipmentDataIntoSpecifiedInventory
        rts

        .databank 0

      rsUnknown849294 ; 84/9294

        .al
        .autsiz
        .databank ?

        phy
        lda $00
        pha
        lda $0574,b
        pha

        jsl rlUnknown848C96
        jsl rlGetSelectedUnitNumber
        bcs _9304

        cmp #Deirdre
        bcs +

        lda #0
        sta $7E0000+structCharacterDataRAM.LoverData+1,x
        sta $7E0000+structCharacterDataRAM.LoverData,x
        ldx #$002E
        lda #9
        sta $00
        bra _92EC

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda #(`aLoverRAMArea)<<8
        sta $24+1
        lda #<>aLoverRAMArea
        sta $24
        jsl rlLoadRAMAreaPointer

        lda #size(structLoverDataRAM)
        jsl rlAllocateRAMArea

        lda $39+1
        sta $7E0000+structCharacterDataRAM.LoverData+1,x
        lda $39
        sta $7E0000+structCharacterDataRAM.LoverData,x
        ldx #$001C
        lda #$0010
        sta $00
        
        _92EC
        lda $7E2000,x
        beq +

          sta $000574
          jsl rlGetUnitLoveBaseWithTarget
          jsl rlSaveUnitLoveValueWithTarget

        +
        dec x
        dec x
        dec $00
        bne _92EC

        -
        pla
        sta $0574,b
        pla
        sta $00
        ply
        rts

        _9304
        lda #0
        sta $7E0000+structCharacterDataRAM.LoverData+1,x
        sta $7E0000+structCharacterDataRAM.LoverData,x
        bra -

        .databank 0

      rlUnknown84931A ; 84/931A

        .al
        .autsiz
        .databank ?

        ; A = child ID?
        ; $00 = ? eg $29D4 father
        ; $02 = ? eg $28A8 mother

        phb
        php

        phk
        plb

        phx
        phy

        tay

        lda #(`aUnitRAMArea)<<8
        sta $24+1
        lda #<>aUnitRAMArea
        sta $24
        jsl rlBackupAndLoadNewRAMAreaPointer

        lda #size(structCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda $39
        sta wSelectedUnitDataRAMPointer,b

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b

        lda $39
        sta lStructPointer1,b

        jsl rlAppendNewStructEntry

        tya
        jsl rlCreateUnit

        inc $056D,b
        jsl $82EFA0

        ply
        plx

        plp
        plb
        rtl

        .databank 0

        ; 84/9361


    .here












    * = $049461
    .logical $849461

      rlGetUnitType ; 84/9461

        .al
        .autsiz
        .databank ?

        ; 0 = static
        ; 1 = dynamic
        ; 2 = holy
        ; 3 = enemy

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlSaveUnitType ; 84/9474

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitPersonalDataPointer ; 84/9488

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.PersonalData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.PersonalData,x
        tax
        rtl

        .databank 0

      rlSavePersonalCharacterDataStruct ; 84/949B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $24
        pha
        lda $24+1
        pha

        jsl rlGetSelectedUnitPersonalDataPointer

        lda $058D+1,b
        sta $24+1
        lda $058D,b
        sta $24

        ldy #0
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        sta [$24],y

        ldy #4
        lda structPersonalCharacterDataRAM.Unknown2,b,x
        and #$00FF
        sta [$24],y

        ldy #6
        lda structPersonalCharacterDataRAM.Unknown3,b,x
        and #$00FF
        sta [$24],y

        ldy #8
        lda structPersonalCharacterDataRAM.Unknown4,b,x
        and #$00FF
        sta [$24],y

        ldy #$0A
        lda structPersonalCharacterDataRAM.Faction,b,x
        and #$00FF
        sta [$24],y

        ldy #$0C
        lda structPersonalCharacterDataRAM.Unknown6,b,x
        and #$00FF
        sta [$24],y

        ldy #$0E
        lda structPersonalCharacterDataRAM.Status,b,x
        and #$00FF
        sta [$24],y

        ldy #$14
        lda structPersonalCharacterDataRAM.Unknown8,b,x
        and #$00FF
        sta [$24],y

        ldy #$10
        lda structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        and #$00FF
        sta [$24],y

        ldy #$12
        lda structPersonalCharacterDataRAM.WeaponStatBonus,b,x
        and #$00FF
        sta [$24],y

        ldy #$16
        lda structPersonalCharacterDataRAM.StatusDuration,b,x
        and #$00FF
        sta [$24],y

        ldy #$18
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        and #$00FF
        sta [$24],y

        ldy #$1A
        lda structPersonalCharacterDataRAM.ClassMoney,b,x
        and #$00FF
        sta [$24],y

        pla
        sta $24+1
        pla
        sta $24
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlLoadPersonalCharacterDataStruct ; 84/954C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $24
        pha
        lda $24+1
        pha

        jsl rlGetSelectedUnitPersonalDataPointer

        lda $058D+1,b
        sta $24+1
        lda $058D,b
        sta $24

        ldy #0
        lda [$24],y
        sta structPersonalCharacterDataRAM.UnitStates,b,x

        sep #$20
        ldy #2
        lda [$24],y
        sta structPersonalCharacterDataRAM.LoverID,b,x

        ldy #4
        lda [$24],y
        sta structPersonalCharacterDataRAM.Unknown2,b,x

        ldy #8
        lda [$24],y
        sta structPersonalCharacterDataRAM.Unknown4,b,x

        ldy #$0A
        lda [$24],y
        sta structPersonalCharacterDataRAM.Faction,b,x

        ldy #$0C
        lda [$24],y
        sta structPersonalCharacterDataRAM.Unknown6,b,x

        ldy #$14
        lda [$24],y
        sta structPersonalCharacterDataRAM.Unknown8,b,x

        ldy #$10
        lda [$24],y
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x

        ldy #$12
        lda [$24],y
        sta structPersonalCharacterDataRAM.WeaponStatBonus,b,x

        ldy #$16
        lda [$24],y
        sta structPersonalCharacterDataRAM.StatusDuration,b,x

        ldy #$0E
        lda [$24],y
        sta structPersonalCharacterDataRAM.Status,b,x

        ldy #6
        lda [$24],y
        sta structPersonalCharacterDataRAM.Unknown3,b,x

        ldy #$18
        lda [$24],y
        sta structPersonalCharacterDataRAM.CurrentHP,b,x

        ldy #$1A
        lda [$24],y
        sta structPersonalCharacterDataRAM.ClassMoney,b,x
        rep #$20

        pla
        sta $24+1
        pla
        sta $24
        ply
        plx
        plp
        plb
        rtl

        .databank 0
  
      rlGetSelectedUnitStates ; 84/95E5

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitStates ; 84/95F5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        ora structPersonalCharacterDataRAM.UnitStates,b,x
        sta structPersonalCharacterDataRAM.UnitStates,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlUnsetSelectedUnitStates ; 84/960A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        eor #$FFFF

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        and structPersonalCharacterDataRAM.UnitStates,b,x
        sta structPersonalCharacterDataRAM.UnitStates,b,x
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLoverID ; 84/9622

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.LoverID,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlUnknown849635 ; 84/9635

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.Unknown2,b,x
        and #$00FF
        plx

        plp
        plb

        -
        rtl

        lda #0
        plx
        plp
        plb
        bra -

        .databank 0

      rlUnknown849650 ; 84/9650

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        cmp #25
        bcs +

        sta structPersonalCharacterDataRAM.Unknown2,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        +
        .byte 0

        .databank 0

      rlUnknown84966B ; 84/966B

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.Unknown3,b,x
        and #$00FF
        cmp #$00FF
        beq +

        plx
        plp
        plb
        clc
        
        -
        rtl
        
        +
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlUnknown84968A ; 84/968A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        sep #$20
        sta structPersonalCharacterDataRAM.Unknown3,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitArenaLevel ; 84/96A0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        and #UnitStateArenaLevelMask
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitArenaLevel ; 84/96B3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx $0574,b
        phx

        and #UnitStateArenaLevelMask
        sta $0574,b

        jsl rlGetSelectedUnitPersonalDataPointer

        lda structPersonalCharacterDataRAM.UnitStates,b,x
        and #~UnitStateArenaLevelMask
        ora $0574,b
        sta structPersonalCharacterDataRAM.UnitStates,b,x

        pla
        sta $0574,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown8496DA ; 84/96DA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        bit #$8000
        bne +

        lda structPersonalCharacterDataRAM.Unknown4,b,x
        and #$00FF
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        +
        lda structPersonalCharacterDataRAM.Unknown4,b,x
        and #$00FF
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlUnknown849702 ; 84/9702

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.Unknown4,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitFaction ; 84/9716

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.Faction,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitFaction ; 84/9729

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        sep #$20
        sta structPersonalCharacterDataRAM.Faction,b,x
        rep #$20
        plx

        plp
        plb
        rtl

        .databank 0

      rlUnknown84973F ; 84/973F

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.Unknown6,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlUnknown849752 ; 84/9752

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        sep #$20
        sta structPersonalCharacterDataRAM.Unknown6,b,x
        rep #$20
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitStatus ; 84/9768

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.Status,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitStatus ; 84/977B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.Status,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown849791 ; 84/9791

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.Unknown8,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown8497A4 ; 84/97A4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        sep #$20
        sta structPersonalCharacterDataRAM.Unknown8,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetActiveRingStatBonusBitfield ; 84/97BA

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlAddRingStatBonusToSelectedUnit ; 84/97CD

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        and #$00FF
        pha

        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        ora structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlRemoveRingStatBonusFromSelectedUnit ; 84/97E5

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        and #$00FF
        eor #$FFFF
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        and structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetActiveWeaponStatBonus ; 84/9800

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.WeaponStatBonus,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlSaveActiveWeaponStatBonus ; 84/9813

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.WeaponStatBonus,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitStatusDuration ; 84/9829

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.StatusDuration,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitStatusDuration ; 84/983C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.StatusDuration,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown849852 ; 84/9852

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.StatusDuration,b,x
        and #$00FF
        beq _CLC

        dec a
        sep #$20
        sta structPersonalCharacterDataRAM.StatusDuration,b,x
        rep #$20
        bne _CLC

        lda structPersonalCharacterDataRAM.Status,b,x
        and #$00FF
        pha
        lda #StatusHealthy
        jsl rlSetSelectedUnitStatus
        pla

        cmp #StatusSleep
        bne +

          lda structPersonalCharacterDataRAM.Unknown3,b,x
          and #$00FF
          tax
          lda $7E489B,x
          and #$DFFF
          sta $7E489B,x
          lda #4
          tsb $0D79,b

        +
        plx
        plp
        plb
        sec
        bra +
        
        _CLC
        plx
        plp
        plb
        clc
        
        +
        rtl

        .databank 0

      rlUnknown8498A4 ; 84/98A4

        .al
        .autsiz
        .databank ?

        pha
        lda #$0040
        jsl rlUnsetSelectedUnitStates
        pla

        ora #0
        bne +

        lda #0
        bra ++

        +
        lda #$0040
        
        +
        jsl rlSetSelectedUnitStates

        lda #2
        jsl rlUnknown87BE7C
        rtl

        .databank 0

      rlGetSelectedUnitCurrentHP ; 84/98C6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitCurrentHP ; 84/98D9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        sep #$20
        sta structPersonalCharacterDataRAM.CurrentHP,b,x
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitExtendedPersonalDataPointer ; 84/98ED

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData,x
        tax
        rtl

        .databank 0

      rlCopyParentsExtendedCharacterData ; 84/9900

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $24
        pha
        lda $24+1
        pha

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        lda $058D+1,b
        sta $24+1
        lda $058D,b
        sta $24

        ldy #0
        lda structExtendedPersonalCharacterDataRAM.HP,b,x
        and #$00FF
        sta [$24],y
        ldy #2
        lda structExtendedPersonalCharacterDataRAM.Strength,b,x    
        and #$00FF
        sta [$24],y
        ldy #4
        lda structExtendedPersonalCharacterDataRAM.Magic,b,x
        and #$00FF
        sta [$24],y
        ldy #6
        lda structExtendedPersonalCharacterDataRAM.Skill,b,x
        and #$00FF
        sta [$24],y
        ldy #8
        lda structExtendedPersonalCharacterDataRAM.Speed,b,x
        and #$00FF
        sta [$24],y
        ldy #10
        lda structExtendedPersonalCharacterDataRAM.Defense,b,x
        and #$00FF
        sta [$24],y
        ldy #12
        lda structExtendedPersonalCharacterDataRAM.Resistance,b,x
        and #$00FF
        sta [$24],y
        ldy #$0E
        lda structExtendedPersonalCharacterDataRAM.Luck,b,x
        and #$00FF
        sta [$24],y
        ldy #$10
        lda structExtendedPersonalCharacterDataRAM.Class,b,x
        and #$00FF
        sta [$24],y
        ldy #$12
        lda structExtendedPersonalCharacterDataRAM.Level,b,x
        and #$00FF
        sta [$24],y
        ldy #$16
        lda structExtendedPersonalCharacterDataRAM.Money,b,x
        sta [$24],y
        ldy #$18
        lda structExtendedPersonalCharacterDataRAM.Experience,b,x
        and #$00FF
        sta [$24],y
        ldy #$1A
        lda structExtendedPersonalCharacterDataRAM.Unknown13,b,x
        and #$00FF
        sta [$24],y

        pla
        sta $24+1
        pla
        sta $24
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/99B5

    .here




    * = $049AE5
    .logical $849AE5

      rlGetSelectedUnitMaxHP ; 84/9AE5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedPersonalCharacterDataRAM.HP,b,x
          and #$00FF
          cmp #81
          bcc _End

            lda #80
          
          _End
          plx
          plp
          plb
          rtl

        +
        jsl rlGetEnemyMaxHP
        bra _End

        .databank 0

      rlGetSelectedUnitTotalStrength ; 84/9B15

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalStrengthEffect
        clc
        adc $4C
        rtl

        .databank 0

      rlGetSelectedUnitTotalStrengthEffect ; 84/9B1D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.StrBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta $4C

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0080
        beq +

          lda $4C
          clc
          adc #5
          sta $4C
        
        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassStrength
        clc
        adc structExtendedPersonalCharacterDataRAM.Strength,b,x
        and #$00FF
        cmp #31
        bcc _End

        lda #30
        
        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyStrength
        bra _End

        .databank 0

      rlGetSelectedUnitTotalMagic ; 84/9B70

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalMagicEffect
        clc
        adc $4C
        rtl

        .databank 0

      rlGetSelectedUnitTotalMagicEffect ; 84/9B78

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.MagBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta $4C

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0040
        beq +

          lda $4C
          clc
          adc #5
          sta $4C

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassMagic
        clc
        adc structExtendedPersonalCharacterDataRAM.Magic,b,x
        and #$00FF
        cmp #31
        bcc _End

          lda #30
        
        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyMagic
        bra _End

        .databank 0

      rlGetSelectedUnitTotalSkill ; 84/9BCB

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalSkillEffect
        clc
        adc $4C
        rtl

        .databank 0

      rlGetSelectedUnitTotalSkillEffect ; 84/9BD3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.SklBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta $4C

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0020
        beq +

          lda $4C
          clc
          adc #5
          sta $4C

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassSkill
        clc
        adc structExtendedPersonalCharacterDataRAM.Skill,b,x
        and #$00FF
        cmp #31
        bcc _End

          lda #30
        
        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemySkill
        bra _End

        .databank 0

      rlGetSelectedUnitTotalSpeed ; 84/9C26

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalSpeedEffect
        clc
        adc $4C
        rtl

        .databank 0

      rlGetSelectedUnitTotalSpeedEffect ; 84/9C2E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.SpdBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta $4C

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0010 ; speed
        beq +

          lda $4C
          clc
          adc #5
          sta $4C

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitClassDataPointer
          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          jsl rlGetClassSpeed
          clc
          adc structExtendedPersonalCharacterDataRAM.Speed,b,x
          and #$00FF
          cmp #31
          bcc _End

           lda #30

        _End
        plx
        plp
        plb
        rtl

        +
        jsl rlGetEnemySpeed
        bra _End

        .databank 0

      rlGetSelectedUnitTotalDefense ; 84/9C81

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalDefenseEffect
        clc
        adc $4C
        rtl

        .databank 0

      rlGetSelectedUnitTotalDefenseEffect ; 84/9C89

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.DefBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta $4C

        jsl rlGetActiveWeaponStatBonus
        cmp #$000E
        bne +

          lda $4C
          clc
          adc #7
          sta $4C

        +
        jsl rlGetActiveRingStatBonusBitfield
        bit #$0008
        beq +

          lda $4C
          clc
          adc #5
          sta $4C

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassDefense
        clc
        adc structExtendedPersonalCharacterDataRAM.Defense,b,x
        and #$00FF
        cmp #31
        bcc _End

        lda #30
        
        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyDefense
        bra _End

        .databank 0

      rlGetSelectedUnitTotalResistance ; 84/9CED

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalResistanceEffect
        clc
        adc $4C
        rtl

        .databank 0

      rlGetSelectedUnitTotalResistanceEffect ; 84/9CF5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.ResBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta $4C

        jsl rlGetActiveWeaponStatBonus
        cmp #$000F
        bne +

          lda $4C
          clc
          adc #7
          sta $4C
        
        +
        jsl rlGetActiveRingStatBonusBitfield
        bit #$0004
        beq +

          lda $4C
          clc
          adc #5
          sta $4C

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassResistance
        clc
        adc structExtendedPersonalCharacterDataRAM.Resistance,b,x
        and #$00FF
        cmp #31
        bcc _End

        lda #30
        
        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyResistance
        bra _End

        .databank 0

      rlUnknown849D59 ; 84/9D59

        .al
        .autsiz
        .databank ?

        jsl rlUnknown849DA9
        clc
        adc $4C
        rtl

        .databank 0

      rlUnknown849D61 ; 84/9D61

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitStates
        bit #$0800
        bne ++

          stz $4C

          jsl rlGetActiveRingStatBonusBitfield
          bit #$0002 ; move
          beq +

            lda #3
            sta $4C

          +
          jsl rlGetSelectedUnitClassDataPointer
          jsl rlGetClassMovement
          clc
          adc $4C
          tax
          lda aUnknown849D9C,x
          and #$00FF
          bra ++

        +
        jsl rlUnknown849791
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      aUnknown849D9C ; 84/9D9C

        .byte $01 ; 1
        .byte $0B ; 11
        .byte $15 ; 21
        .byte $1F ; 31
        .byte $29 ; 41
        .byte $33 ; 51
        .byte $3D ; 61
        .byte $47 ; 71
        .byte $51 ; 81
        .byte $5B ; 91
        .byte $65 ; 101
        .byte $6F ; 111
        .byte $79 ; 121

      rlUnknown849DA9 ; 84/9DA9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        stz $4C
        jsl rlGetActiveRingStatBonusBitfield
        bit #$0002
        beq +

          lda #3
          sta $4C

        +
        jsl rlGetSelectedUnitStates
        bit #$0800
        bne +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMovement
        bra ++

        +
        jsl rlUnknown849791
        sta $50
        lda #10
        sta $52
        jsl $80A17E

        lda $50
        stz $4C
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLuck ; 84/9DE8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedPersonalCharacterDataRAM.Luck,b,x
        and #$00FF
        
        -
        plx
        plp
        plb
        rtl
        
        +
        lda #$FFFF
        bra -

        .databank 0

      rlUnknown849E0F ; 84/9E0F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.Unknown6,b,x
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLevel ; 84/9E23

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedPersonalCharacterDataRAM.Level,b,x
        and #$00FF

        -
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitLevel
        bra -

        .databank 0

      rlGetSelectedUnitLeadershipStars ; 84/9E4B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedPersonalCharacterDataRAM.LeadershipStars,b,x
        and #$00FF
        
        -
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitLeadershipStars
        bra -

        .databank 0

      rlGetSelectedUnitExperience ; 84/9E73

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitFaction
        ora #0
        bne +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedPersonalCharacterDataRAM.Experience,b,x
          and #$00FF

          -
          plx
          plp
          plb
          rtl
        
        +
        lda #$FFFF
        bra -

        .databank 0

      rlUnknown849EA3 ; 84/9EA3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha
        lda $0574,b
        pha

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedPersonalCharacterDataRAM.Unknown13,b,x
          and #$00FF
          sta $0574,b
          stz $14

          lda #0
          jsl rlUnknown84BF25

          lda wSelectedUnitDataRAMPointer,b
          beq +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne +

              lda $0574,b

              -
              plx
              stx $0574,b
              plx
              stx wSelectedUnitDataRAMPointer,b
              plx
              plp
              plb
              rtl

        +
        lda #0
        bra -

        .databank 0

      rlUnknown849EF7 ; 84/9EF7

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        pla

        sep #$20
        sta structExtendedPersonalCharacterDataRAM.Unknown13,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitMoney ; 84/9F0D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeHoly
        bcs +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedPersonalCharacterDataRAM.Money,b,x
        
        -
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyClassMoney
        bra -

        .databank 0

      rlSetSelectedUnitMoney ; 84/9F32

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeHoly
        bcs +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        pla
        sta structExtendedPersonalCharacterDataRAM.Money,b,x
        
        -
        plx
        plp
        plb
        rtl
        
        +
        pla
        jsl rlSetEnemyClassMoney
        bra -

        .databank 0

        ; 84/9F5A

    .here



    * = $049FC4
    .logical $849FC4

      rlUnknown849FC4 ; 84/9FC4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $00
        pha

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        bne _A00E

        jsl rlUnknown84973F
        sta $00

        jsl rlGetSelectedUnitFaction
        cmp #0
        beq +

          jsl rlUnknown84C461
          bra _End

        +
        jsl rlGetSelectedUnitNumber
        cmp #1
        beq _A00E

        ldx wSelectedUnitDataRAMPointer,b
        phx

        lda #1
        sta $0574,b

        lda #0
        jsl rlUnknown84BF67
        jsl rlGetSelectedUnitCharacterID

        plx
        stx wSelectedUnitDataRAMPointer,b
        bra _End
        
        _A00E
        lda #0

        _End
        plx
        stx $00
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84A018 ; 84/A018

        .al
        .autsiz
        .databank ?

        jsl rlUnknown849FC4
        ora #0
        beq +

        asl
        ora #1
        bra ++  
        
        +
        jsl rlGetSelectedUnitCharacterID
        asl
        
        +
        rtl

        .databank 0

      rlGetSelectedUnitClassID ; 84/A02D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        lda structExtendedPersonalCharacterDataRAM.Class,b,x
        and #$00FF

        -
        plx

        plp 
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitClassID
        bra -

        .databank 0

      rlGetClassWeakness ; 84/A055

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitClassID
        tax
        lda aClassWeaknessTable,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitFactionNamePointer ; 84/A06A

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitFaction
        jsl rlGetFactionNamePointer
        rtl

        .databank 0

      rlGetSelectedUnitClassNamePointer ; 84/A073

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitClassID
        jsl rlGetClassNamePointer
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitClassDataPointer ; 84/A084

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitClassID
        jsl rlGetClassDataROMPointer
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitWeaponRank ; 84/A095

        .al
        .autsiz
        .databank ?

        ; A = weapon type

        phb
        php
        phk
        plb
        phx
        phy

        ldx $4C
        phx
        ldx $4E
        phx

        sta $0574,b
        jsl rlGetSelectedUnitClassDataPointer

        lda $0574,b
        jsl rlGetClassWeaponRank
        cmp #WeaponRankNone
        bcs _End

        sta $4E

        ldy #(size(aHolyBloodGrowthBoostsOffsets)/2)-1

        -
        tya
        jsl rlCheckForSpecifiedHolyBlood
        ora #0
        beq _NextBlood

        sta $4C

        tya
        asl
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        and #$00FF
        cmp $0574,b
        bne _NextBlood

        lda $4C
        cmp #MajorHolyBlood
        bcs _StarRank

        lda $4E
        sec
        sbc $4C
        beq _End
        bpl +

          lda #WeaponRankA
          bra _End
        
        +
        sta $4E
        
        _NextBlood
        dec y
        bpl -

        lda $4E
        
        _End
        plx
        stx $4E
        plx
        stx $4C

        ply
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        _StarRank
        lda #0

        plx
        stx $4E
        plx
        stx $4C
        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetSelectedUnitMovementCostPointer ; 84/A111

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMovementType
        asl
        clc
        adc aMainDataOffsets.MovementCostOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.MovementCostOffsets
        adc #<>aMainDataOffsets
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTerrainAvoidPointer ; 84/A135

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassTerrainBonusType
        asl
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        adc #<>aMainDataOffsets
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetTileTerrainAvoid ; 84/A159

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        sta $0574,b

        lda #0
        asl
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        adc #<>aMainDataOffsets
        clc
        adc $0574,b
        tax
        lda aMainDataOffsets & $FF0000,x
        bit #$0080
        bne +

        and #$007F
        bra ++
        
        +
        ora #$FF80
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitClass ; 84/A191

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        pla

        sep #$20
        sta structExtendedPersonalCharacterDataRAM.Class,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitConstantDataPointer ; 84/A1A7

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.ConstantData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.ConstantData,x
        tax
        rtl

        .databank 0

      rlCopyParentsCharacterROMData ; 84/A1BA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $24
        pha
        lda $24+1
        pha

        jsl rlGetSelectedUnitConstantDataPointer

        lda $058D+1,b
        sta $24+1
        lda $058D,b
        sta $24

        ldy #structParentCharacterROMData.CharacterID
        jsl rlGetSelectedUnitCharacterID
        sta [$24],y

        ldy #structParentCharacterROMData.CharacterName
        jsl rlGetSelectedUnitNamePointer
        sta [$24],y

        ldy #structParentCharacterROMData.Gender
        lda structStaticCharacterROMEntry.Gender - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.FatherID
        lda structStaticCharacterROMEntry.FatherID - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.HPGrowth
        lda structStaticCharacterROMEntry.HPGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.StrengthGrowth
        lda structStaticCharacterROMEntry.StrengthGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.MagicGrowth
        lda structStaticCharacterROMEntry.MagicGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.SkillGrowth
        lda structStaticCharacterROMEntry.SkillGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.SpeedGrowth
        lda structStaticCharacterROMEntry.SpeedGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.DefenseGrowth
        lda structStaticCharacterROMEntry.DefenseGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.ResistanceGrowth
        lda structStaticCharacterROMEntry.ResistanceGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.LuckGrowth
        lda structStaticCharacterROMEntry.LuckGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.Skills1
        lda structStaticCharacterROMEntry.Skills1 - structStaticCharacterROMEntry.CharacterID,b,x
        sta [$24],y
        ldy #structParentCharacterROMData.Skills3
        lda structStaticCharacterROMEntry.Skills3 - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [$24],y
        ldy #structParentCharacterROMData.HolyBlood1
        lda structStaticCharacterROMEntry.HolyBlood1 - structStaticCharacterROMEntry.CharacterID,b,x
        sta [$24],y
        ldy #structParentCharacterROMData.HolyBlood2
        lda structStaticCharacterROMEntry.HolyBlood2 - structStaticCharacterROMEntry.CharacterID,b,x
        sta [$24],y

        pla
        sta $24+1
        pla
        sta $24
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/A282

    .here










    * = $04A333
    .logical $84A333

      rlGetSelectedUnitCharacterID ; 84/A333

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.CharacterID - structStaticCharacterROMEntry.CharacterID,b,x 

        -
        plx

        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitCharacterID
        bra -

        .databank 0

      rlGetSelectedUnitNumber ; 84/A358

        .al
        .autsiz
        .databank ?

        ; Regular enemies: get number as is, and set carry
        ; Others: if flag $80 set, and #$7F and like above
        ; no flag $80, get unit dead sec, if not clc

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq _Enemy

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.UnitNumber - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        bit #$0080
        bne ++

        and #$007F
        tax

        jsl rlGetSelectedUnitStates
        bit #UnitStateDead
        bne +

        txa
        plx
        plp
        plb
        clc
        
        _End
        rtl

        _Enemy
        jsl rlGetEnemyUnitUnitNumber
        plx
        plp
        plb
        sec
        bra _End

        +
        txa

        +
        and #$007F
        plx
        plp
        plb
        sec
        bra _End

        .databank 0

      rlGetSelectedUnitNamePointer ; 84/A3A2

        .al
        .autsiz
        .databank ?

        ; In:  wSelectedUnitDataRAMPointer > unit pointer
        ; Out: $0571 > name pointer

        phb
        php

        phk
        plb

        phx

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitConstantDataPointer
          lda structStaticCharacterROMEntry.CharacterName - structStaticCharacterROMEntry.CharacterID,b,x 

          -
          pha

          asl
          clc
          adc aMainDataOffsets.CharacterNameOffsets
          tax
          lda #(`aMainDataOffsets)<<8
          sta $0571+1,b
          lda aMainDataOffsets,x
          clc
          adc aMainDataOffsets.CharacterNameOffsets
          adc #<>aMainDataOffsets
          sta $0571,b

          pla
          plx

          plp
          plb
          rtl

        +
        jsl rlGetEnemyUnitNameID
        bra -

        .databank 0

      rlGetSelectedUnitGender ; 84/A3E5

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.Gender - structStaticCharacterROMEntry.CharacterID,b,x 
        and #$00FF
        
        -
        plx

        plp
        plb

        rtl
        
        +
        jsl rlGetEnemyUnitGender
        bra -

        .databank 0

      rlGetSelectedUnitMotherID ; 84/A40D

        .al
        .autsiz
        .databank ?

        phx
        phy
        jsl rlGetSelectedUnitCharacterID
        sta $0574,b

        lda aChildrenDataOffsets
        tax

        ldy #0
        
        -
        lda aChildrenDataOffsets,x
        cmp $0574,b
        beq +

        inc x
        inc x
        inc y
        cpy #size(aChildrenDataOffsets)
        bcc -

        lda #0
        
        -
        ply
        plx
        rtl
        
        ; Is child
        +
        tya
        lsr
        clc
        adc #$0010 ; start of female character IDs
        bra -

        .databank 0

      rlGetSelectedUnitFatherID ; 84/A43D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structCharacterConstantData.FatherID,b,x
        and #$00FF

        -
        plx
        
        plp
        plb
        rtl
        
        +
        lda #0
        bra -

        .databank 0

      rlGetSelectedUnitTotalHPGrowth ; 84/A464

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #0
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.HPGrowth - structStaticCharacterROMEntry.CharacterID,b,x 
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rsFloorGrowthAtZero ; 84/A488

        .al
        .autsiz
        .databank ?

        bpl +

          lda #0
        
        +
        rts

        .databank 0

      rlGetSelectedUnitTotalStrGrowth ; 84/A48E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #1
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.StrengthGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalMagGrowth ; 84/A4B2

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #2
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.MagicGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalSklGrowth ; 84/A4D6

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #3
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.SkillGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalSpdGrowth ; 84/A4FA

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #4
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.SpeedGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalDefGrowth ; 84/A51E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #5
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.DefenseGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalResGrowth ; 84/A542

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #6
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.ResistanceGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalLuckGrowth ; 84/A566

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #7
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta $0574,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.LuckGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc $0574,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitSkills ; 84/A58A

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.Skills1 - structStaticCharacterROMEntry.CharacterID,b,x 
        sta $0571,b
        lda structStaticCharacterROMEntry.Skills2 - structStaticCharacterROMEntry.CharacterID,b,x
        sta $0571+1,b

        -
        plx
        plp
        plb
        rtl

        +
        lda #0
        sta $0571+1,b
        lda #0
        sta $0571,b
        bra -

        .databank 0

      rlCheckForSpecifiedHolyBlood ; 84/A5C0

        .al
        .autsiz
        .databank ?

        ; In:
        ; A     = holy blood index
        ; wSelectedUnitDataRAMPointer = unit pointer

        ; Out:
        ; A =
        ;     0 if no blood
        ;     1 if minor
        ;     2 if major

        phb
        php

        phk
        plb

        phx
        phy

        ldx $00
        phx

        sta $00
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq _NotPlayable

        jsl rlGetSelectedUnitConstantDataPointer
        txy

        lda $00
        asl
        tax

        tya
        clc
        adc aCharacterStructHolyBloodOffsets,x
        tay

        lda aHolyBloodBitfieldTable,x
        lsr
        ora aHolyBloodBitfieldTable,x
        and $0000,b,y
        beq _End

        cmp aHolyBloodBitfieldTable,x
        bcc +

          lda #2
          bra _End

        +
        lda #1
        bra _End
        
        _End
        plx
        stx $00

        ply
        plx

        plp
        plb
        rtl

        _NotPlayable
        lda #0
        bra _End

        .databank 0

      aCharacterStructHolyBloodOffsets ; 84/A615

        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0014
        .word $0014
        .word $0014
        .word $0014
        .word $0014

      aHolyBloodBitfieldTable ; 84/A62F

        .word $0002
        .word $0008
        .word $0020
        .word $0080
        .word $0200
        .word $0800
        .word $2000
        .word $8000
        .word $0002
        .word $0008
        .word $0020
        .word $0080
        .word $0200

      rlGetCharacterHolyBloodGrowthBoost ; 84/A649

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = stat offset, HP = 0, Str = 1, ...

        ; Out:
        ; A = total bonus granted by holy blood

        phb
        php

        phk
        plb

        phx
        phy

        ldx $00
        phx
        ldx $02
        phx

        sta $0574,b
        stz $02
        ldy #(size(aHolyBloodGrowthBoostsOffsets)/2)-1
        
        -
        tya
        jsl rlCheckForSpecifiedHolyBlood
        ora #0
        beq _HolyBloodContinue

        sta $00

        tya
        asl
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        adc $0574,b
        tax
        lda aHolyBloodGrowthBoostsOffsets+2,x
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80

        +
        dec $00
        beq +

          ; Double bonus if major
          asl
        
        +
        clc
        adc $02
        sta $02
        
        _HolyBloodContinue
        dec y
        bpl -

        lda $02

        plx
        stx $02
        plx 
        stx $00

        ply
        plx

        plp
        plb
        rtl

        .databank 0

      rlUnknown84A69F ; 84/A69F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        asl
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        tax
        lda aHolyBloodGrowthBoostsOffsets+1,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetWeaponStatBoostForSpecifiedStat ; 84/A6B6

        .al
        .autsiz
        .databank ?

        ; A = stat ID

        phb
        php
        phk
        plb
        phx
        ldx $0574,b
        phx

        dec a
        sta $0574,b

        jsl rlGetActiveWeaponStatBonus
        ora #0
        beq _End

        ; only boost IDs below $0E belong to holy weapons
        cmp #$000E
        bcs +

        dec a
        asl
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        clc
        adc $0574,b
        tax
        lda aHolyBloodGrowthBoostsOffsets+structHolyBloodDataEntry.StrBoost,x
        and #$00FF

        _End
        plx
        stx $0574,b
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        bra _End

        .databank 0

      rlGetEnemyUnitConstantDataPointer ; 84/A6F1

        .al
        .autsiz
        .databank ?

        ; Gets the rom pointer + structEnemyCharacterROMEntry.CharacterID

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+10+2,x
        pha
        rep #$20
        plb
        lda $7E0000+10,x
        tax
        rtl

        .databank 0

      rlGetEnemyUnitCharacterID ; 84/A704

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.CharacterID - structEnemyCharacterROMEntry.CharacterID,b,x 
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitNameID ; 84/A714

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.CharacterName - structEnemyCharacterROMEntry.CharacterID,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitClassID ; 84/A724

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.Class - structEnemyCharacterROMEntry.CharacterID,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitGender ; 84/A737

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.Gender - structEnemyCharacterROMEntry.CharacterID,b,x
        bit #$0080
        bne +

        and #$007F
        bra ++
        
        +
        ora #$FF80
        
        +
        plx

        plp
        plb

        rtl

        .databank 0

      rlGetEnemyUnitLevel ; 84/A754

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.Level - structEnemyCharacterROMEntry.CharacterID,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitLeadershipStars ; 84/A767

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.LeadershipStars - structEnemyCharacterROMEntry.CharacterID,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitUnitNumber ; 84/A77A

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.UnitNumber - structEnemyCharacterROMEntry.CharacterID,b,x 
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyClassHPGrowth ; 84/A78D

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassHPGrowth
        rtl

        .databank 0

      rlGetEnemyClassStrGrowth ; 84/A796

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassStrGrowth
        rtl

        .databank 0

      rlGetEnemyClassMagGrowth ; 84/A79F

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMagGrowth
        rtl

        .databank 0

      rlGetEnemyClassSklGrowth ; 84/A7A8

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSklGrowth
        rtl

        .databank 0

      rlGetEnemyClassSpdGrowth ; 84/A7B1

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSpdGrowth
        rtl

        .databank 0

      rlGetEnemyClassDefGrowth ; 84/A7BA

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassDefGrowth
        rtl

        .databank 0

      rlGetEnemyClassResGrowth ; 84/A7C3

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassResGrowth
        rtl

        .databank 0

      rlGetEnemyClassMoney ; 84/A7CC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.ClassMoney,b,x
        and #$00FF
        phk
        plb
        sep #$20
        sta WRMPYA,b
        lda #100
        sta WRMPYB,b
        nop
        nop
        nop
        rep #$20
        lda RDMPY,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetEnemyClassMoney ; 84/A7F3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        sta WRDIVA,b
        sep #$20
        lda #100
        sta WRDIVB,b
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        rep #$20
        lda RDDIV,b

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        and #$003F
        sep #$20
        sta structPersonalCharacterDataRAM.ClassMoney,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/A822

    .here





















    * = $04A87E
    .logical $84A87E

      rlUnknown84A87E ; 84/A87E

        .al
        .autsiz

        ; $0574 = inv slot

        phb
        phk
        plb
        phx
        jsl rlGetSelectedUnitFaction
        ora #0
        bne _CLC

          jsl rlGetUnitType
          cmp #UnitTypeHoly
          bcs _CLC

            lda $0574,b
            beq _End

              jsl rlGetItemRAMStructEntryByInventorySlot
              bcs _CLC

                jsl rlReduceItemCurrentDurability
                bcc _End

                  jsl rlGetItemROMPointerByItemRAMStructEntry
                  jsl rlGetItemWeaponType
                  cmp #WeaponTypeFire
                  bcc +

                    lda #0
                    sta $0574,b
                    jsl rlSaveEquippedInventorySlot

                  +
                  jsl rlSaveEquippedWeaponStatBonus
                  sec

            _End
            plx
            plb
            rtl
        
        _CLC
        clc
        bra _End

        .databank 0

      rlActionStructInflictDamage ; 84/A8C7

        .al
        .autsiz
        .databank ?

        ; A = attacker character ID
        ; $0574 = damage dealt

        ; sec if fatal

        phb
        phk
        plb
        phx
        phy
        ldx $14
        phx
        ldx $02
        phx

        sta $14

        lda $0574,b
        beq _CLC

        cmp #80
        bcc +

        lda #80
        sta $0574,b
        
        +
        jsl rlGetSelectedUnitPersonalDataPointer

        sep #$20
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        cmp $000574
        bcs +

          sta $000574

        +
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        sec
        sbc $000574
        sta structPersonalCharacterDataRAM.CurrentHP,b,x
        rep #$20

        and #$00FF
        beq +

        cmp #11
        bcs _CLC

        lda #UnitStateMiracleActive
        jsl rlSetSelectedUnitStates
        
        _CLC
        clc
        
        -
        plx
        stx $02
        plx
        stx $14
        ply
        plx
        plb
        rtl

        +
        jsl rlUnknown84B8C1
        sec
        bra -

        .databank 0

      rlHealSelectedUnitsHP ; 84/A927

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $0574,b
        pha

        lda $0574,b
        beq _CLC

        cmp #80
        bcc +

          lda #80
          sta $0574,b

        +
        jsl rlGetSelectedUnitPersonalDataPointer

        sep #$20
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        and #$FF
        clc
        adc $000574
        pha
        rep #$20

        jsl rlGetSelectedUnitMaxHP
        sta $0574,b

        sep #$20
        pla
        cmp $0574,b
        bcc +

          lda $0574,b
          sta structPersonalCharacterDataRAM.CurrentHP,b,x
          rep #$20

          pla
          sta $0574,b
          plx
          plp
          plb
          sec
          bra _End

        +
        sta structPersonalCharacterDataRAM.CurrentHP,b,x
        rep #$20
        
        _CLC
        pla
        sta $0574,b
        plx
        plp
        plb
        clc
        
        _End
        rtl

        .databank 0

      rlUnknown84A982 ; 84/A982

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $0574,b
        pha

        jsl rlUnknown84966B
        sta $0D85,b
        tax
        lda $7E489B,x
        ora #$0020
        sta $7E489B,x
        lda $7E438B,x
        ora #$0020
        sta $7E438B,x

        lda #$0200
        jsl rlSetSelectedUnitStates

        pla
        sta $0574,b
        plp
        plb
        rtl

        .databank 0

      rlUnknown84A9B6 ; 84/A9B6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitFaction
        jsl $84BE3D
        sta $0574,b

        jsl rlUnknown84966B
        tax

        lda $0574,b
        jsl $84CCB4
        lda $7E489B,x
        and #~($2000 | $20 | $8)
        sta $7E489B,x
        sta $7E438B,x

        lda #$4200
        jsl rlUnsetSelectedUnitStates

        lda #StatusHealthy
        jsl rlSetSelectedUnitStatus
        lda #0
        jsl rlSetSelectedUnitStatusDuration

        jsl rlGetSelectedUnitMaxHP
        jsl rlSetSelectedUnitCurrentHP
        jsl rlGetSelectedUnitPersonalDataPointer
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMoney

        sep #$20
        sta structPersonalCharacterDataRAM.ClassMoney,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

      rlActionStructLevelUp ; 84/AA15

        .al
        .autsiz
        .databank ?

        ; $0574 = gained exp

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeHoly
        bcc +

          jml _NoEXP

        +
        jsl rlGetSelectedUnitFaction
        ora #0
        bne _NoEXP

        jsl rlGetSelectedUnitCurrentHP
        ora #0
        beq _NoEXP

        lda $0574,b
        beq +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedPersonalCharacterDataRAM.Level,b,x
          and #$00FF
          cmp #30
          bcs _NoEXP

            sep #$20
            lda structExtendedPersonalCharacterDataRAM.Experience,b,x
            clc
            adc $000574
            cmp #100
            bcs ++

              sta structExtendedPersonalCharacterDataRAM.Experience,b,x
              rep #$20

        +
        lda #0
        plx
        plp
        plb
        clc
        rtl
        
        .as

        +
        sec
        sbc #100
        sta structExtendedPersonalCharacterDataRAM.Experience,b,x
        rep #$20

        lda structExtendedPersonalCharacterDataRAM.Level,b,x
        and #$00FF
        inc a
        cmp #30
        bcc +

          sep #$20
          lda $000574
          sec
          sbc structExtendedPersonalCharacterDataRAM.Experience,b,x
          sta $000574
          lda #0
          sta structExtendedPersonalCharacterDataRAM.Experience,b,x
          rep #$20

        +
        lda $000574
        pha
        jsl rlGetLevelUpStats
        pla
        sta $000574

        lda #1
        plx
        plp
        plb
        clc
        
        -
        rtl

        _NoEXP
        lda #0
        sta $000574
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetLevelUpStats ; 84/AABA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedPersonalCharacterDataRAM.Level,b,x
        and #$00FF
        inc a
        cmp #31
        bcc +

          jml _End

        +
        sep #$20
        sta structExtendedPersonalCharacterDataRAM.Level,b,x
        rep #$20

        lda $7E3D83
        inc a
        sta $7E3D83

        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        ldy $0571,b
        jsl rlGetSelectedUnitMaxHP
        sta structLevelUpStats.HP,b,y
        jsr rsApplyLevelUpHPGain
        sta structLevelUpStats.HPGain,b,y

        jsl rlGetSelectedUnitTotalStrengthEffect
        sta structLevelUpStats.Strength,b,y
        jsr rsApplyLevelUpStrengthGain
        sta structLevelUpStats.StrengthGain,b,y

        jsl rlGetSelectedUnitTotalMagicEffect
        sta structLevelUpStats.Magic,b,y
        jsr rsApplyLevelUpMagicGain
        sta structLevelUpStats.MagicGain,b,y

        jsl rlGetSelectedUnitTotalSkillEffect
        sta structLevelUpStats.Skill,b,y
        jsr rsApplyLevelUpSkillGain
        sta structLevelUpStats.SkillGain,b,y

        jsl rlGetSelectedUnitTotalSpeedEffect
        sta structLevelUpStats.Speed,b,y
        jsr rsApplyLevelUpSpeedGain
        sta structLevelUpStats.SpeedGain,b,y

        jsl rlGetSelectedUnitLuck
        sta structLevelUpStats.Luck,b,y
        jsr rsApplyLevelUpLuckGain
        sta structLevelUpStats.LuckGain,b,y

        jsl rlGetSelectedUnitTotalDefenseEffect
        sta structLevelUpStats.Defense,b,y
        jsr rsApplyLevelUpDefenseGain
        sta structLevelUpStats.DefenseGain,b,y

        jsl rlGetSelectedUnitTotalResistanceEffect
        sta structLevelUpStats.Resistance,b,y
        jsr rsApplyLevelUpResistanceGain
        sta structLevelUpStats.ResistanceGain,b,y
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84AB5C ; 84/AB5C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx $0574,b
        phx

        sta $0574,b
        jsl rlGetSelectedUnitFaction
        ora #0
        bne _End

          lda $0574,b
          beq _End

            jsl rlGetItemRAMStructEntryByInventorySlot
            bcs _End

              lda #1
              jsl rlAddToItemRAMKillCount
              stz $0574,b

              lda wCurrentChapter,b
              cmp #6
              bcc +

                lda #$0018
                sta $0574,b

              +
              jsl rlGetSelectedUnitNumber
              dec a
              clc
              adc $0574,b
              asl
              tax
              lda $7E3D23,x
              inc a
              sta $7E3D23,x
        
        _End
        pla
        sta $0574,b
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/ABB0

    .here




    * = $04ACE7
    .logical $84ACE7

      rsRollForStatGrowth ; 84/ACE7

        .al
        .autsiz
        .databank ?

        stz $0574,b
        cmp #100
        bcc +

          inc $0574,b
          sec
          sbc #100

        +
        jsl rlRollForChance
        bcs +

          inc $0574,b

        +
        rts

        .databank 0

      rsApplyLevelUpHPGain ; 84/AD00

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalHPGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.HP,b,x
        cmp #HPCap
        bcs ++

          clc
          adc $0574,b
          cmp #HPCap+1
          bcc +

            lda #HPCap

          +
          sta structExtendedPersonalCharacterDataRAM.HP,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpStrengthGain ; 84/AD38

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalStrGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.Strength,b,x
        cmp #StatCap
        bcs ++

          clc
          adc $0574,b
          cmp #StatCap+1
          bcc +

            lda #StatCap

          +
          sta structExtendedPersonalCharacterDataRAM.Strength,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpMagicGain ; 84/AD70

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalMagGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.Magic,b,x
        cmp #StatCap
        bcs ++

          clc
          adc $0574,b
          cmp #StatCap+1
          bcc +

            lda #StatCap

          +
          sta structExtendedPersonalCharacterDataRAM.Magic,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpSkillGain ; 84/ADA8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalSklGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.Skill,b,x
        cmp #StatCap
        bcs ++

          clc
          adc $0574,b
          cmp #StatCap+1
          bcc +

            lda #StatCap

          +
          sta structExtendedPersonalCharacterDataRAM.Skill,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpSpeedGain ; 84/ADE0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalSpdGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.Speed,b,x
        cmp #StatCap
        bcs ++

          clc
          adc $0574,b
          cmp #StatCap+1
          bcc +

            lda #StatCap

          +
          sta structExtendedPersonalCharacterDataRAM.Speed,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpDefenseGain ; 84/AE18

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalDefGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.Defense,b,x
        cmp #StatCap
        bcs ++

          clc
          adc $0574,b
          cmp #StatCap+1
          bcc +

            lda #StatCap

          +
          sta structExtendedPersonalCharacterDataRAM.Defense,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpResistanceGain ; 84/AE50

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalResGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.Resistance,b,x
        cmp #StatCap
        bcs ++

          clc
          adc $0574,b
          cmp #StatCap+1
          bcc +

            lda #StatCap

          +
          sta structExtendedPersonalCharacterDataRAM.Resistance,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpLuckGain ; 84/AE88

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalLuckGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedPersonalCharacterDataRAM.Luck,b,x
        cmp #LuckCap
        bcs ++

          clc
          adc $0574,b
          cmp #LuckCap+1
          bcc +

            lda #LuckCap

          +
          sta structExtendedPersonalCharacterDataRAM.Luck,b,x
          rep #$20
          plx
          plp
          plb
          lda $0574,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

        ; 84/AEC0

    .here




    * = $04B23C
    .logical $84B23C

      rlAddSelectedCharacterMoney ; 84/B23C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        ldy #0

        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        lda structExtendedPersonalCharacterDataRAM.Money,b,x
        clc
        adc $0574,b
        bcs +

        cmp #50001
        bcc ++
        
        +
        sec
        sbc #50000
        tay

        lda #50000
        
        +
        sta structExtendedPersonalCharacterDataRAM.Money,b,x
        tya
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlSubtractSelectedCharacterMoney ; 84/B268

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitMoney
        sec
        sbc $0574,b
        bcs +

          lda #0
        
        +
        jsl rlSetSelectedUnitMoney

        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/B282


    .here





    * = $04B321
    .logical $84B321

      rlUnknown84B321 ; 84/B321

        .al
        .autsiz
        .databank ?

        lda $057E,b
        beq +

          jsl rlFlagEquippedInventorySlotAndGetStatBonus
        
        +
        rtl

        .databank 0

        ; 84B32B

    .here


    * = $04B457
    .logical $84B457

      rlUnknown84B457 ; 84/B457

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGiveItemToUnit
        jsl rlGetSelectedUnitInventorySize
        cmp #8
        bcc +

          jsl rlUnknown84966B
          sta $0D89,b

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84B474 ; 84/B474

        .al
        .autsiz
        .databank ?

        lda #$0400
        jsl rlSetSelectedUnitStates
        rtl

        .databank 0

      rlUnknown84B47C ; 84/B47C

        .al
        .autsiz
        .databank ?

        jsl rlUnknown84966B
        jsl $84CC11
        lda #2
        sta $0D81,b
        lda #(2 | 1)
        jsl rlSetSelectedUnitStatus
        rtl

        .databank 0

      rlUnknown84B492 ; 84/B492

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda #1
        jsl rlSetSelectedUnitCurrentHP

        jsl rlUnknown84966B
        bcs +

          tax
          lda $7E489B,x
          ora #$0020
          sta $7E489B,x
          sta $7E438B,x

          lda $0D79,b
          bit #$0020
          bne +

            stx $0D85,b

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84B4C3 ; 84/B4C3

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlActionStructArenaWinResults ; 84/B4C4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $0574,b
        pha

        jsl rlGetSelectedUnitArenaLevel
        cmp #7
        bcs +

          pha
          asl
          tax
          lda aArenaMoneyRewards,x
          sta $0574,b

          jsl rlAddSelectedCharacterMoney
          pla

          inc a
          jsl rlSetSelectedUnitArenaLevel
          lda $0574,b

          -
          plx
          stx $0574,b
          plx
          plp
          plb
          rtl

        +
        lda #0
        bra -

        .databank 0

      aArenaMoneyRewards ; 84/B4FA

        .word 1000
        .word 1500
        .word 2000
        .word 2500
        .word 3000
        .word 3500
        .word 4000

        ; 84/B508

    .here

        







    * = $04B8C1
    .logical $84B8C1

      rlUnknown84B8C1 ; 84/B8C1

        .al
        .autsiz
        .databank ?

        ; attack killed the target

        phb
        php
        phk
        plb
        phx
        phy
        ldx $24
        phx
        ldx $25
        phx

        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

        lda #UnitStateGuardingCastle
        jsl rlUnsetSelectedUnitStates
        jsl rlUnknown8496DA
        bcc +

        jsl rlUnknown87E98D
        bcs +

        jsl rlUnknown87EE56

        +
        lda $0D79,b
        bit #$0010
        beq _B916

        lda wBattleType
        and #$00FF
        cmp #1
        bne _B916

        jsl rlGetSelectedUnitCurrentHP
        cmp #0
        beq +

          jml $84B9A2
        
        +
        jsl rlUnknown84B492
        jml $84B997

        _B916
        lda #$0800
        jsl rlUnsetSelectedUnitStates
        lda #0
        jsl rlUnknown8497A4
        lda #SkillIDUnknown7
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs _B94A

        lda #SkillIDUnknown6
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcc +

        lda wCurrentChapter,b
        cmp #11
        beq +

        jsl rlUnknown84B47C
        bra ++
        
        ; is final chapter
        +
        jsl rlUnknown84A982
        bra +

        _B94A
        jsl $84B1C8
        
        +
        jsl rlGetSelectedUnitCharacterID
        jsl $91AD0B
        lda #1
        jsl $84E039

        jsl rlGetSelectedUnitFaction
        ora #0
        bne _B981

        stz $24

        lda wCurrentChapter,b
        cmp #6
        bcc +

        lda #$0018
        sta $24
        
        +
        jsl rlGetSelectedUnitNumber
        dec a
        clc
        adc $24
        jsl $91EB0F
        
        _B981
        lda #$0018
        sta $0EBC,b
        jsl rlGetSelectedUnitCharacterID
        sta $0EBD,b
        lda $14
        sta $0EBF,b
        jsl $8682BC

        pla
        sta $25
        pla
        sta $24
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/B9A2

    .here






    * = $04BAA1
    .logical $84BAA1

      rlUnknown84BAA1 ; 84/BAA1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha

        ; 0 = male child, 1 = female child?
        lda $0574,b
        sta $04

        jsl rlGetSelectedUnitCharacterID
        cmp #Ethlyn
        beq +

          cmp #Deirdre
          beq +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne _End

        +
        ldx wSelectedUnitDataRAMPointer,b
        jsl rlUnknown849635
        ora #0
        beq _End

        cmp #Ethlyn
        bcs _End

        jsl rlUnknown8484B4
        bcs _End

        ; father data?
        lda wSelectedUnitDataRAMPointer,b
        sta $00

        ; mother data?
        stx wSelectedUnitDataRAMPointer,b
        lda wSelectedUnitDataRAMPointer,b
        sta $02

        jsl rlGetSelectedUnitNumber
        cmp #Deirdre
        bcc _End

          sec
          sbc #Deirdre
          asl
          tax

          lda $04
          asl
          clc
          adc aChildrenDataOffsets,x
          tax
          lda aChildrenDataOffsets,x
          beq _End

          jsl rlUnknown84931A

          lda $84BB1E,x
          bmi _End

            jsl $8680BE

        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/BB1E




    .here






    * = $04BB9A
    .logical $84BB9A

      rlInitiateFactionRAMData ; 84/BB9A

        .al
        .autsiz
        .databank ?

        ; builds its own offset table and data in ram at aFactionArea

        phb
        php
        phk
        plb
        phx

        lda #0
        sta aFactionArea

        lda #(`aFactionArea)<<8
        sta $24+1
        lda #<>aFactionArea
        sta $24
        lda #(`aDefaultFactionData)<<8
        sta $27+1
        lda #<>aDefaultFactionData
        sta $27
        lda #size(aDefaultFactionData)
        sta $00
        ldx #7

        -
        jsl rlUnknown82F567

        dec x
        bne -

        plx
        plp
        plb
        rtl

        .databank 0

      aDefaultFactionData .block ; 84/BBCD

        .byte $80
        .byte $FF
        .byte 0
        .byte 0
        .byte 0

        .bend

        ; 84/BBD2

    .here






    * = $04BD24
    .logical $84BD24

      rsGetFactionOffset ; 84/BD24

        .al
        .autsiz
        .databank ?

        cmp #7
        bcs +

          asl
          tax
          lda aFactionArea,x
          clc
          adc #<>aFactionArea
          tax
          clc
          rts
        
        +
        rts

        .databank 0

        ; 84BD37

    .here



    * = $04BD93
    .logical $84BD93

      rlGetFactionNamePointer ; 84/BD93

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        jsr rsGetFactionOffset
        bcs _None

        lda $7E0000,x
        and #$00FF
        cmp #$0080
        beq _None

        jsl rlUnknown86C55A
        lda $0000,b,y
        and #$00FF
        cmp #$0080
        beq _None

        cmp #$00FF
        beq _NPC

        asl
        clc
        adc aMainDataOffsets.FactionNameOffsets
        tax
        lda #(`aMainDataOffsets)<<8
        sta $0571+1,b
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.FactionNameOffsets
        adc #<>aMainDataOffsets
        sta $0571,b
        bra +
        
        _None
        lda #(`aFactionNameNone)<<8
        sta $0571+1,b
        lda #<>aFactionNameNone
        sta $0571,b
        bra +

        _NPC
        lda #(`aFactionNameNPC)<<8
        sta $0571+1,b
        lda #<>aFactionNameNPC
        sta $0571,b

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aFactionNameNone ; 84/BDFB

        .text "　\n"

      aFactionNameNPC ; 84/BDFF

        .text "ＮＰＣ\n"

      ; 84/BE07


    .here




    * = $04BEF4
    .logical $84BEF4

      rlUnknown84BEF4 ; 84/BEF4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsr rsGetFactionOffset
        bcs +

        lda $7E0000+4,x
        and #$00FF
        cmp $0574,b
        bcc +
        
        phx
        lda $0574,b
        dec a
        asl
        clc
        adc #1,S
        plx
        tax
        lda $7E0000+5,x
        sta wSelectedUnitDataRAMPointer,b
        
        -
        plx
        plp
        plb
        rtl
        
        +
        stz wSelectedUnitDataRAMPointer,b
        bra -

        .databank 0

      rlUnknown84BF25 ; 84/BF25

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsr rsGetFactionOffset
        bcs _End

        lda $7E0004,x
        and #$00FF
        ora #0
        beq _BF5F

        tay
        
        -
        lda $7E0005,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        cmp $0574,b
        bne +

        lda $14
        beq _End

        jsl rlGetSelectedUnitStates
        bit #UnitStateFielded
        beq _End
        
        +
        inc x
        inc x
        dec y
        bne -
        
        _BF5F
        stz wSelectedUnitDataRAMPointer,b
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84BF67 ; 84/BF67

        .al
        .autsiz
        .databank ?

        ; find target unit in table?

        phb
        php

        phk
        plb

        phx
        phy
        jsr rsGetFactionOffset
        bcs _End

        lda $7E0000+4,x
        and #$00FF
        beq +

          tay

          -
          lda $7E0000+5,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitNumber
          cmp $0574,b
          beq _End

            inc x
            inc x
            dec y
            bne -

        +
        stz wSelectedUnitDataRAMPointer,b
        
        _End
        ply
        plx

        plp
        plb
        rtl

        .databank 0

        ; 84/BF99

    .here




    * = $04C15F
    .logical $84C15F

      rlUnknown84C15F ; 84/C15F

        .al
        .autsiz
        .databank `aUnknown84C19E

        ; X = hostility?

        ; has to do something for the info window color for castles
        ; player = 0 so it branches out

        phb
        php
        phk
        plb
        phx
        phy
        cmp #3,S
        beq _Player

          txy
          jsr rsGetFactionOffset
          bcs _1

            lda aUnknown84C19E,y
            and #$00FF
            and $7E0000+2,x
            bne _1

              lda aUnknown84C19E,y
              and #$00FF
              and $7E0000+3,x
              bne _2

                lda #3
                bra +

              _2
              lda #2
              bra +

          _1 ; default
          lda #1
          bra +

        _Player
        lda #0
        
        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aUnknown84C19E ; 84/C19E

        .byte $01
        .byte $02
        .byte $04
        .byte $08
        .byte $10
        .byte $20
        .byte $40

        ; 84/C1A5

    .here




    * = $04C461
    .logical $84C461

      rlUnknown84C461 ; 84/C461

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx

        tay
        ldx #1
        
        -
        stx $0574,b
        tya
        jsl rlUnknown84BEF4

        lda wSelectedUnitDataRAMPointer,b
        beq _C496

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        beq +

        jsl rlUnknown84973F
        cmp $00
        bne +

        jsl rlGetSelectedUnitCharacterID
        bra ++
        
        +
        inc x
        bra -
        
        _C496
        lda #0

        +
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C4A2

    .here




    * = $04C8E1
    .logical $84C8E1

      rlGetTerrainIDByDeploymentNumber ; 84/C8E1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        tax
        lda aDeploymentTable._YPosition[0],x
        xba
        lsr
        lsr
        clc
        adc aDeploymentTable._XPosition[0],x
        asl
        tax
        lda $7F2400,x
        and #$03FF
        tax
        lda $7F2000,x
        and #$00FF
        cmp #$001A
        bcc +

          lda #0

        +
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C910

    .here




    * = $04C9E3
    .logical $84C9E3

      rlUnknown84C9E3 ; 84/C9E3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda aDeploymentTable,x
        bit #$0080
        beq ++

        lda aDeploymentTable,x
        bit #$2030
        bne ++

        lda $7E489B,x
        bit #$2000
        bne ++

        lda #SkillIDCanto
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda #SkillIDCanto
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc ++

        +
        jsr rsUnknown84CA22
        bcc +

        plp
        plb
        sec
        
        -
        rtl
        
        +
        plp
        plb
        clc
        bra -

        .databank 0

      rsUnknown84CA22 ; 84/CA22

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $04
        pha

        lda $7E46EB,x
        sta wSelectedUnitDataRAMPointer,b

        phx
        lda aDeploymentTable._XPosition[0],x
        sec
        sbc $7E492B
        clc
        adc #$0020
        sta $04

        lda aDeploymentTable._YPosition[0],x
        sec
        sbc $7E492D
        clc
        adc #$0020
        asl
        asl
        asl
        asl
        asl
        asl
        clc
        adc $04
        tax
        lda $7F754A,x
        plx
        and #$00FF
        beq +

          jsl rlUnknown8497A4

          lda #$0800
          jsl rlSetSelectedUnitStates

          lda $7E489B,x
          ora #$0010
          sta $7E489B,x

          lda aDeploymentTable,x
          ora #$0010
          sta aDeploymentTable,x

          lda #4
          tsb $0D79,b

          pla
          sta $04
          plp
          plb
          sec

          -
          rts
        
        +
        pla
        sta $04
        plp
        plb
        clc
        bra -

        .databank 0

      rlUnknown84CA97 ; 84/CA97

        .al
        .autsiz
        .databank ?

        lda $7E489B,x
        and #$FFF7
        sta $7E489B,x
        lda #4
        tsb $0D79,b
        rtl

        .databank 0

      rlUnknown84CAA9 ; 84/CAA9

        .al
        .autsiz
        .databank ?

        lda wSelectedUnitDataRAMPointer,b
        pha
        lda $0574,b
        pha

        lda $7E46EB,x
        bne +

          jml _End
        
        +
        lda aDeploymentTable,x
        bit #$0020
        beq +

        jml _End
        
        +
        txa
        jsl rlGetTerrainIDByDeploymentNumber
        cmp #9
        bne +

        jsl $84CFBF
        bra _CB24
        
        +
        lda $0D79,b
        bit #$0040
        bne _CB18

        lda $0580,b
        beq _CB24

        sta $0590,b

        lda aDeploymentTable,x
        bit #$0080
        beq _CB24

        jsl rlUnknown87EC42
        sta $0574,b

        lda $7E477B,x
        jsl $84BE3D
        cmp $0574,b
        bne _CB24

        jsl $84D4A2
        bcs +

        jml _End
        
        +
        lda $0574,b
        jsl $84CCB4
        bra _CB24
        
        _CB18
        lda $7E477B,x
        jsl $84BE3D
        jsl $84CD8A

        _CB24
        lda $7E489B,x
        ora #$0008
        bit #$0080
        beq +

          and #$FFBF

        +
        sta $7E489B,x

        lda #4
        tsb $0D79,b

        jsl $85E897

        lda $7E46EB,x
        sta wSelectedUnitDataRAMPointer,b

        lda #$4000
        jsl rlSetSelectedUnitStates

        lda #$1000
        tsb $0D79,b

        lda aDeploymentTable,x
        bit #$0010
        beq +

        lda #0
        jsl rlUnknown8497A4

        lda #$0800
        jsl rlUnsetSelectedUnitStates

        lda $7E489B,x
        and #$FFEF
        sta $7E489B,x
        
        +
        stx $0D8B,b
        
        _End
        pla
        sta $0574,b
        pla
        sta wSelectedUnitDataRAMPointer,b
        rtl

        .databank 0

        ; 84/CB83


    .here



    * = $04CFBF
    .logical $84CFBF

      rlUnknown84CFBF ; 84CFBF

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $00
        pha
        lda $02
        pha

        lda aDeploymentTable._XPosition[0],x
        sta $00
        lda aDeploymentTable._YPosition[0],x
        sta $02
        jsl $87EA09
        bcs +

          jsl $87EE2B
          bcs +

            jsl $87ED45
            sta $00

            lda $7E46EB,x
            sta $056F,b

            phx
            ldx $00
            jsl rlGetSelectedUnitFaction
            jsl rlUnknown84C15F
            plx

            cmp #1
            beq +

              cmp #3
              beq +

                jsr rsUnknown84D010

        +
        pla
        sta $02
        pla
        sta $00
        plp
        plb
        rtl

        .databank 0

      rsUnknown84D010 ; 84/D010

        .al
        .autsiz
        .databank ?

        lda $7E489B,x
        ora #$0004
        sta $7E489B,x
        sta aDeploymentTable._Status[0],x

        lda #$2000
        jsl rlSetSelectedUnitStates
        jsl rlUnknown87EC42
        jsl $849702
        jsl $87EE40
        jsl $87ECC1
        sta $0574,b
        jsl $84C996
        rts

        .databank 0

        ; 84/D03E


    .here






    * = $04D4C7
    .logical $84D4C7

      rlGetUnitsDistance ; 84/D4C7

        .al
        .autsiz
        .databank ?

        phx
        ldx $00
        lda aDeploymentTable._XPosition[0],x
        ldx $02
        sec
        sbc aDeploymentTable._XPosition[0],x
        bpl +

          eor #$FFFF
          inc a

        +
        sta $22

        ldx $00
        lda aDeploymentTable._YPosition[0],x
        ldx $02
        sec
        sbc aDeploymentTable._YPosition[0],x
        bpl +
        
          eor #$FFFF
          inc a

        +
        clc
        adc $22
        plx
        rtl

        .databank 0

      rlUnknown84D4F5 ; 84/D4F5

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda $7E477B,x
        tax
        jsl rlGetSelectedUnitFaction
        jsl rlUnknown84C15F
        cmp #0
        bne +

        plx
        sec
        rtl
        
        +
        plx
        clc
        rtl

        .databank 0


    .here








    * = $04D548
    .logical $84D548

      rlActionStructGetBattleStats ; 84/D548

        .al
        .autsiz
        .databank `wActionStructAttackerDeploymentNumber

        phb
        php

        sep #$20
        lda #`wActionStructAttackerDeploymentNumber
        pha
        rep #$20
        plb

        phx
        phy
        lda $00
        sta @l wActionStructAttackerDeploymentNumber
        lda $02
        sta @l wActionStructDefenderDeploymentNumber
        lda $04
        sta @l $7ECCCE
        lda $06
        sta @l $7ECCD0

        ldx #$017B
        sep #$20
        lda #0
        
        -
        sta wBattleType,x
        dec x
        bpl -

        rep #$20

        lda #$FFFF
        sta $4F31,b
        sta $4ED1,b

        ldx wActionStructAttackerDeploymentNumber
        lda aDeploymentTable._Status[0],x
        and #$0003
        cmp #DeploymentAllegiancePlayer
        beq +

        cmp #DeploymentAllegianceNPC
        beq +

        ldx wActionStructDefenderDeploymentNumber
        bmi +

        lda aDeploymentTable._Status[0],x
        and #$0003
        cmp #DeploymentAllegianceEnemy
        beq +

        cmp #DeploymentAllegianceOther
        beq +

        .databank ?

        lda wActionStructDefenderDeploymentNumber
        sta wActionStructUnit1DeploymentNumber
        lda wActionStructAttackerDeploymentNumber
        sta wActionStructUnit2DeploymentNumber
        lda #2+1
        bra ++

        +
        lda wActionStructAttackerDeploymentNumber
        sta wActionStructUnit1DeploymentNumber
        lda wActionStructDefenderDeploymentNumber
        sta wActionStructUnit2DeploymentNumber
        lda #0

        +
        sep #$20
        sta wBattleStatus
        rep #$20

        ldx #<>aActionStructUnit1
        lda wActionStructUnit1DeploymentNumber
        jsl rsActionStructGetBattleCoordinates

        ldx #<>aActionStructUnit2
        lda wActionStructUnit2DeploymentNumber
        jsl rsActionStructGetBattleCoordinates

        jsl rlGetBattleDistance

        lda wBattleStatus
        and #$0001
        sta $00
        ldx #<>aActionStructUnit1
        jsl rlActionStructGetBasicBattleData

        lda wBattleStatus
        and #$0001
        eor #$0001
        sta $00
        ldx #<>aActionStructUnit2
        jsl rlActionStructGetBasicBattleData

        jsr rsActionStructGetBattleTriggerableSkillFlags
        jsr rsBattleHandleEffectiveness
        jsl rlGetBattleSong

        lda wActionStructUnit1DeploymentNumber
        bmi +

        lda wActionStructUnit2DeploymentNumber
        bmi +

          lda wBattleStatus
          and #$0001
          sta $00
          ldx #<>aActionStructUnit1
          ldy #<>aActionStructUnit2
          jsl rlApplyWeaponTriangleBonus

          lda wBattleStatus
          and #$0001
          eor #$0001
          sta $00
          ldx #<>aActionStructUnit2
          ldy #<>aActionStructUnit1
          jsl rlApplyWeaponTriangleBonus

          ldy #<>aActionStructUnit1
          jsl rlApplyCharmAndLeadershipHitAvoidBonus
          ldy #<>aActionStructUnit2
          jsl rlApplyCharmAndLeadershipHitAvoidBonus

        +
        lda wBattleStatus
        and #$0001
        sta $00
        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        jsl rlActionStructAdjustFinalStats

        lda wBattleStatus
        and #$0001
        eor #$0001
        sta $00
        ldx #<>aActionStructUnit2
        ldy #<>aActionStructUnit1
        jsl rlActionStructAdjustFinalStats

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetBattleSong ; 84/D694

        .al
        .autsiz
        .databank `wActionStructAttackerDeploymentNumber

        jsr rsCheckForSeliphJuliaVSJuliusFight
        bcs _Julius

        ldx wActionStructUnit2DeploymentNumber
        jsr rsCheckIfFightingJulia
        bcs _Julia

        jsr rsCheckIfFightingArvis
        bcs _Arvis

        jsr rsCheckIfFightingMajorBoss
        bcs _MajorBoss

        jsr rsCheckIfFightingRecruitableEnemy
        bcs _RecruitableEnemy

        jsr rsCheckIfFightingBoss
        bcs _Boss

        ldx wActionStructAttackerDeploymentNumber
        lda aDeploymentTable._Status[0],x
        and #$0003
        cmp #DeploymentAllegianceEnemy
        beq _EnemyAttack

        cmp #DeploymentAllegianceOther
        beq _EnemyAttack

        ; Player attack
        lda #$0031
        bra _End
        
        _EnemyAttack
        lda #$0032
        bra _End
        
        _RecruitableEnemy
        lda #$003E
        bra _End

        _Boss
        lda #$0033
        bra _End
        
        _MajorBoss
        lda #$0036
        bra _End
        
        _Arvis
        lda #$0034
        bra _End

        _Julia
        lda #$0050
        bra _End
        
        _Julius
        lda #$0035

        _End
        sta wBattleSong
        rtl

        .databank 0

      rsCheckIfFightingRecruitableEnemy ; 84/D6F2

        .al
        .autsiz
        .databank `aDeploymentTable

        lda aDeploymentTable._Status[0],x
        and #$0003
        cmp #1
        bne rsCheckIfFightingBoss._CLC

        lda $46EB,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs rsCheckIfFightingBoss._CLC

        jsl rlGetSelectedUnitNumber
        sta $0574,b

        lda #0
        jsl rlUnknown84BF67
        lda wSelectedUnitDataRAMPointer,b
        bne rsCheckIfFightingBoss._CLC
        bra rsCheckIfFightingBoss._SEC

        .databank 0

      rsCheckIfFightingBoss ; 84/D721

        .al
        .autsiz
        .databank `aDeploymentTable

        lda aDeploymentTable._Status[0],x
        and #$0003
        cmp #1
        bne _CLC

          lda @l aActionStructUnit2.CharacterID
          jsl rlGetPortraitID
          cmp #$00F3
          bne _SEC

        _CLC
        clc
        rts
        
        _SEC
        sec
        rts

        .databank 0

      rsCheckIfFightingMajorBoss ; 84/D73D

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit2.CharacterID
        cmp #Chagall
        beq rsCheckIfFightingBoss._SEC

        cmp #Eldigan2
        beq rsCheckIfFightingBoss._SEC

        cmp #Chagall2
        beq rsCheckIfFightingBoss._SEC

        cmp #Lombard2
        beq rsCheckIfFightingBoss._SEC

        cmp #Travant
        beq rsCheckIfFightingBoss._SEC

        cmp #Reptor2
        beq rsCheckIfFightingBoss._SEC

        cmp #Danann
        beq rsCheckIfFightingBoss._SEC

        cmp #Bloom
        beq rsCheckIfFightingBoss._SEC

        cmp #Ishtar
        beq rsCheckIfFightingBoss._SEC

        cmp #Bloom2
        beq rsCheckIfFightingBoss._SEC

        cmp #Travant2
        beq rsCheckIfFightingBoss._SEC

        cmp #Arion1
        beq rsCheckIfFightingBoss._SEC

        cmp #Hilda1
        beq rsCheckIfFightingBoss._SEC

        cmp #Ishtar2
        beq rsCheckIfFightingBoss._SEC

        cmp #Brian
        beq rsCheckIfFightingBoss._SEC

        cmp #Hilda2
        beq rsCheckIfFightingBoss._SEC

        cmp #Manfroy
        beq rsCheckIfFightingBoss._SEC

        cmp #Arion2
        beq rsCheckIfFightingBoss._SEC

        cmp #Ishtar3
        beq rsCheckIfFightingBoss._SEC

        cmp #Julius2
        beq rsCheckIfFightingBoss._SEC
        bra rsCheckIfFightingBoss._CLC

        .databank 0

      rsCheckIfFightingArvis ; 84/D7A7

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit2.CharacterID
        cmp #Arvis3
        beq rsCheckIfFightingBoss._SEC
        bra rsCheckIfFightingBoss._CLC

        .databank 0

      rsCheckIfFightingJulia ; 84/D7B2

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit2.CharacterID
        cmp #Julia
        beq rsCheckIfFightingBoss._SEC
        jml rsCheckIfFightingBoss._CLC

        .databank 0

      rsCheckForSeliphJuliaVSJuliusFight ; 84/D7BF

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit1.CharacterID
        cmp #Seliph
        beq +

        cmp #Julia
        bne _CLC

        +
        lda aActionStructUnit2.CharacterID
        cmp #Julius
        beq _SEC

        cmp #Julius2
        beq _SEC

        _CLC
        clc
        rts
        
        _SEC
        sec
        rts

        .databank 0

      rsActionStructGetBattleCoordinates ; 84/D7DF

        .al
        .autsiz
        .databank `aDeploymentTable

        sta structActionStructEntry.DeploymentNumber,b,x
        bmi _End

        tay
        lda $46EB,b,y
        sta structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        lda aDeploymentTable._XPosition[0],y
        sta structActionStructEntry.XPosition,b,x
        lda aDeploymentTable._YPosition[0],y
        sta structActionStructEntry.YPosition,b,x

        jsl rlGetSelectedUnitStates
        bit #$0400 ; siege attack ?
        beq _End

        bit #UnitStateGuardingCastle
        bne +

        ; attacker gets shifted up a tile
        dec structActionStructEntry.YPosition,b,x
        bra ++

        ; defender one down
        +
        inc structActionStructEntry.YPosition,b,x
        lda #8
        tsb wBattleStatus
        
        +
        lda #4
        tsb wBattleStatus

        _End
        rtl

        .databank 0

      rlActionStructGetBasicBattleData ; 84/D81D

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.DeploymentNumber,b,x
        bpl +

          jml _End
        
        +
        tay
        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        jsl rlGetSelectedUnitCharacterID
        sta structActionStructEntry.CharacterID,b,x

        jsl rlGetSelectedUnitClassID
        sta structActionStructEntry.ClassID,b,x

        jsl rlGetSelectedUnitGender
        sta structActionStructEntry.Gender,b,x

        tya
        jsl rlGetTerrainIDByDeploymentNumber
        sta structActionStructEntry.TerrainID,b,x

        jsl rlGetSelectedUnitCurrentHP
        sta structActionStructEntry.CurrentHP,b,x

        jsl rlGetSelectedUnitMaxHP
        sta structActionStructEntry.MaxHP,b,x

        jsl rlGetSelectedUnitLevel
        sta structActionStructEntry.Level,b,x

        lda #0
        sta structActionStructEntry.GainedLevels,b,x

        jsl rlGetSelectedUnitExperience
        sta structActionStructEntry.StartingExperience,b,x

        lda #0
        sta structActionStructEntry.GainedExperience,b,x

        lda $00
        beq +

        jsr rsActionStructGetEnemyAutoCounterWeapon
        bra ++
        
        +
        lda $057E,b
        
        +
        sta structActionStructEntry.WeaponInventorySlot,b,x

        cmp #0
        bne +

          lda #$FFFF
          sta structActionStructEntry.WeaponID,b,x
          stz wCurrentItemDataROMPointer,b
          bra ++

        +
        jsl rlGetItemIDByInventorySlot
        sta structActionStructEntry.WeaponID,b,x

        jsr rsGetBattleRangedAlternateWeapon

        jsl rlGetItemMinimumRange
        sta structActionStructEntry.WeaponMinRange,b,x

        jsl rlGetItemMaximumRange
        sta structActionStructEntry.WeaponMaxRange,b,x

        jsl rlGetItemWeaponType
        sta structActionStructEntry.WeaponType,b,x

        +
        jsl rlGetSelectedUnitBattleAttackSpeed
        sta structActionStructEntry.BattleAttackSpeed,b,x

        jsl rlGetSelectedUnitBattleHit
        sta structActionStructEntry.BattleHit,b,x

        lda structActionStructEntry.TerrainID,b,x
        jsl rlGetSelectedUnitBattleAvoid
        sta structActionStructEntry.BattleAvoid,b,x

        jsl rlGetSelectedUnitBattleCrit
        sta structActionStructEntry.BattleCrit,b,x

        _End
        rtl

        .databank 0

      rsActionStructGetEnemyAutoCounterWeapon ; 84/D8D0

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitFaction
        ora #0
        bne +

          jsl rlGetFirstEquippableWeaponInInventory
          rts
        
        +
        lda wBattleDistance
        jsl rlGetCounterableWeaponSlot
        rts

        .databank 0

      rlGetBattleDistance ; 84/D8E7

        .al
        .autsiz
        .databank `aActionStructUnit1

        lda aActionStructUnit1.DeploymentNumber
        bmi _D917

        lda aActionStructUnit2.DeploymentNumber
        bmi _D917

        lda aActionStructUnit1.XPosition
        sec
        sbc aActionStructUnit2.XPosition
        bpl +

          eor #$FFFF
          inc a

        +
        sta wBattleDistance

        lda aActionStructUnit1.YPosition
        sec
        sbc aActionStructUnit2.YPosition
        bpl +

          eor #$FFFF
          inc a

        +
        clc
        adc @l wBattleDistance
        sta wBattleDistance
        rtl

        _D917
        lda #1
        sta wBattleDistance
        rtl

        .databank 0

      rlApplyWeaponTriangleBonus ; 84/D91E

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        bmi +

        lda structActionStructEntry.WeaponType,b,x
        sta $0574,b

        lda structActionStructEntry.WeaponID,b,y
        bmi +

        lda structActionStructEntry.WeaponType,b,y
        xba
        ora $0574,b
        jsl rlGetWeaponTriangleBonus

        ora #0
        beq +

          sta $0574,b

          lda structActionStructEntry.BattleHit,b,x
          clc
          adc $0574,b
          sta structActionStructEntry.BattleHit,b,x

          lda structActionStructEntry.BattleAvoid,b,x
          clc
          adc $0574,b
          sta structActionStructEntry.BattleAvoid,b,x

        +
        rtl

        .databank 0

      rlApplyCharmAndLeadershipHitAvoidBonus ; 84/D956

        .al
        .autsiz
        .databank ?

        ldx structActionStructEntry.DeploymentNumber,b,y
        jsl rlGetTotalCharmAndLeadershipBonus
        sta $7ECCE4

        jsr rsUnknown84D97B

        lda $7ECCE4
        clc
        adc structActionStructEntry.BattleHit,b,y
        sta structActionStructEntry.BattleHit,b,y

        lda $7ECCE4
        clc
        adc structActionStructEntry.BattleAvoid,b,y
        sta structActionStructEntry.BattleAvoid,b,y
        rtl

        .databank 0

      rsUnknown84D97B ; 84/D97B

        .al
        .autsiz
        .databank ?

        phx
        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        cmp #Sigurd
        beq +

        cmp #Seliph
        beq +

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        beq ++

        +
        jsl rlGetSelectedUnitLeadershipStars
        tax
        lda aLeaderShipBonusTable,x
        and #$00FF
        clc
        adc $7ECCE4
        sta $7ECCE4
        
        +
        plx
        rts

        .databank 0

      aLeaderShipBonusTable ; 84/D9B0

        .byte  0
        .byte  0
        .byte 10
        .byte 20
        .byte 30
        .byte 40

      rlActionStructAdjustFinalStats ; 84/D9B6

        .al
        .autsiz
        .databank ?

        lda $00
        beq _D9FF

        lda structActionStructEntry.WeaponInventorySlot,b,y
        beq +

        lda structActionStructEntry.WeaponID,b,y
        jsl rlGetItemDataROMPointer
        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne +

        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitUncounterable
        bne _D9FF

        lda #0
        sta structActionStructEntry.WeaponInventorySlot,b,x
        bra _DA0B

        +
        lda #0
        sta structActionStructEntry.WeaponInventorySlot,b,x
        lda #$00FF
        sta structActionStructEntry.BattleMight,b,x
        sta structActionStructEntry.BattleDefense,b,x
        sta structActionStructEntry.BattleAdjustedHit,b,x
        sta structActionStructEntry.BattleMight,b,y
        sta structActionStructEntry.BattleDefense,b,y
        sta structActionStructEntry.BattleAdjustedHit,b,y
        jml _End

        _D9FF
        lda structActionStructEntry.BattleMight,b,x
        cmp #$00FF
        bne _DA0B

          jml _End
        
        _DA0B
        lda structActionStructEntry.UnitRAMPointer,b,x
        bne +

          jml _End

        +
        sta wSelectedUnitDataRAMPointer,b

        lda structActionStructEntry.WeaponID,b,x
        jsr rsGetBattleRangedAlternateWeapon
        jsl rlGetSelectedUnitBattleMight
        sta structActionStructEntry.BattleMight,b,x

        jsr rsSetHalvedBattleMight

        lda structActionStructEntry.WeaponID,b,y
        bmi +

        jsr rsGetBattleRangedAlternateWeapon
        jsl rlGetItemWeaponType
        cmp #WeaponTypeStaff
        bcs ++
        
        +
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetSelectedUnitBattleDefense
        bra ++
        
        +
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetSelectedUnitBattleResistance

        +
        sta structActionStructEntry.BattleDefense,b,x

        lda structActionStructEntry.BattleHit,b,x
        sec
        sbc structActionStructEntry.BattleAvoid,b,y
        cmp #0
        bmi _FloorHit

        cmp #101
        bpl _CapHit
        bra +
        
        _FloorHit
        lda #0
        bra +
        
        _CapHit
        lda #100

        +
        sta structActionStructEntry.BattleAdjustedHit,b,x

        lda wActionStructAttackerDeploymentNumber
        cmp structActionStructEntry.DeploymentNumber,b,x
        bne _End

        sta $14
        lda wActionStructDefenderDeploymentNumber
        sta $16
        jsl rlActionStructGetScriptedCritPossibility
        sta $4F75,b
        ora #0
        beq _End

          phx
          dec a
          tax
          lda aUnknown84DAE8,x
          and #$00FF
          sta $4F77,b

          lda $7F442A
          jsr rsGetUnitCoordinatesByDeploymentNumber
          lda $14
          sta $4F79,b
          lda $16
          sta $4F7B,b

          lda $7F442C
          cmp #$00FF
          beq +

            jsr rsGetUnitCoordinatesByDeploymentNumber
            lda $14
            sta $4F7D,b
            lda $16
            sta $4F7F,b

          +
          lda aScriptedCritChanceBoosts,x
          and #$00FF
          plx

          clc
          adc structActionStructEntry.BattleCrit,b,x
          cmp #101
          bcc +

            lda #100

          +
          sta structActionStructEntry.BattleCrit,b,x
        
        _End
        rtl

        .databank 0

      rsGetUnitCoordinatesByDeploymentNumber ; 84/DADA

        .al
        .autsiz
        .databank `aDeploymentTable

        phx
        tax
        lda aDeploymentTable._XPosition[0],x
        sta $14
        lda aDeploymentTable._YPosition[0],x
        sta $16
        plx
        rts

        .databank 0

      aUnknown84DAE8 ; 84/DAE8

        ; scripted crit types?

        .byte $01 ; sibling
        .byte $01 ; lover
        .byte $02 ; triangle attack
        .byte $02 ; ?

      aScriptedCritChanceBoosts ; 84/DAEC

        .byte 20
        .byte 20
        .byte 100
        .byte 100

      rsSetHalvedBattleMight ; 84/DAF0

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        bmi _End

        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitNegateHalveAttack
        bne +

        jsl rlGetItemAlternateID
        cmp structActionStructEntry.WeaponID,b,y
        beq _End
        
        +
        lda structActionStructEntry.WeaponID,b,y
        bmi _End

        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitHalveAttack
        bne _End

        lda structActionStructEntry.BattleMight,b,x
        lsr a
        sta structActionStructEntry.BattleMight,b,x
        
        _End
        rts

        .databank 0

      rsGetBattleRangedAlternateWeapon ; 84/DB25

        .al
        .autsiz
        .databank `wBattleDistance

        ; A = item ID

        cmp #0
        bmi _DB4D

        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitRangedMagicSword
        beq +

        cmp #WeaponTraitPermanentMagicSword
        bne _End
        
        +
        lda wBattleDistance
        cmp #2
        bcc _End

        jsl rlGetItemAlternateID
        jsl rlGetItemDataROMPointer
        
        _End
        rts
        
        _DB4D
        stz wCurrentItemDataROMPointer,b
        bra _End

        .databank 0

      rlGetTotalCharmAndLeadershipBonus ; 84/DB52

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $00
        pha
        lda $02
        pha

        stx $00
        lda $7E46EB,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlUnknown849635
        sta $06
        jsl rlUnknown849FC4
        sta $08

        lda $7E477B,x
        sta $0A
        stz $04
        ldx #71 *2
        
        -
        lda aDeploymentTable,x
        bit #$0080
        beq +

          stx $02
          jsl rlGetUnitsDistance
          cmp #0
          beq +

            cmp #4
            bcs +

              ; get unit within 3 tiles
              phx
              lda $7E477B,x
              tax
              lda $0A
              jsl rlUnknown84C15F
              plx
              cmp #1
              beq +

                lda $7E46EB,x
                sta wSelectedUnitDataRAMPointer,b

                jsr rsGetCharmBonus
                jsr rsGetUnit1LeadershipBonus
                jsr rsGetUnit2LeadershipBonus

        +
        dec x
        dec x
        bpl -

        lda $04

        plx
        stx $00
        plx
        stx $02
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsGetCharmBonus ; 84/DBCA

        .al
        .autsiz
        .databank ?

        lda #SkillIDCharm
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda #SkillIDCharm
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc rsGetUnit2LeadershipBonus._SEC
        
        +
        lda #10
        bra rsGetUnit2LeadershipBonus._CLC

        .databank 0

      rsGetUnit1LeadershipBonus ; 84/DBE1

        .al
        .autsiz
        .databank ?

        lda $06
        beq rsGetUnit2LeadershipBonus._SEC

        jsl rlGetSelectedUnitNumber
        bcs rsGetUnit2LeadershipBonus._SEC

        cmp $06
        bne rsGetUnit2LeadershipBonus._SEC

        lda #10
        bra rsGetUnit2LeadershipBonus._CLC

        .databank 0

      rsGetUnit2LeadershipBonus ; 84/DBF4

        .al
        .autsiz
        .databank `_LeadershipBonus

        lda $08
        beq _SEC

        jsl rlGetSelectedUnitCharacterID
        cmp $08
        bne _SEC

        jsl rlGetSelectedUnitLeadershipStars
        tay
        lda _LeadershipBonus,y
        and #$00FF
        bra _CLC

          _LeadershipBonus
          .byte 0
          .byte 0
          .byte 10
          .byte 20
          .byte 30
          .byte 40

        _CLC
        clc
        adc $04
        sta $04
        clc
        rts
        
        _SEC
        sec
        rts

        .databank 0

       ; 84/DC1C







    .here








    * = $04DC49
    .logical $84DC49

      rlUnknown84E06C ; 84/DC49

        .al
        .autsiz
        .databank ?

        jsl rlActionStructGetBattleStats

        lda $0D79,b
        bit #$0020

        sep #$20
        bne +

        lda #0
        sta wBattleType
        bra ++
        
        +
        lda #3
        sta wBattleType
        
        +
        rep #$20
        
        lda wActionStructAttackerDeploymentNumber
        tax
        lda $7E477B,x
        bne +

          lda $7E46EB,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlUnknown84B321

        +
        jsl rlUnknown84DCA3
        rts

        .databank 0

        ; 84/DC82


    .here




    * = $04DCA3
    .logical $84DCA3

      rlUnknown84DCA3 ; 84/DCA3

        .al
        .autsiz
        .databank `aBattleRoundsData

        phb
        php

        sep #$20
        lda #`aBattleRoundsData
        pha
        rep #$20
        plb

        phx
        phy
        lda #(`aBattleRoundsData)<<8
        sta $24+1
        lda #<>aBattleRoundsData
        sta $24
        lda #len(aBattleRoundsData._Entry)
        sta $00
        lda #size(aBattleRoundsData._Entry[0])
        sta $02
        jsl rlBuildRAMStructHeader

        stz $CCE0,b

        ; Get initiator. 0=player 1=opponent
        lda @l wBattleStatus
        and #$0001
        sta @l wBattleAttackerIndex

        jsr rsActionStructGetBattleInitiatorIfArena

        lda $0D79,b
        bit #$0010
        bne _Loop

          lda #$0010
          tsb $0D79,b

          jsr rsActionStructGetBattleTriggerableSkillFlags
          jsr rsActionStructAdjustVantageRoundOrder
          jsr rsActionStructCheckForDance
          jsr rsActionStructClearMagicEquipmentIfSilenced
          stz $CCE2,b

        _Loop
        lda #2
        sta @l $7ECCD2
        
        -
        lda @l wBattleAttackerIndex
        jsr rsUnknown84DEEB
        bcs _DD37

        lda @l wBattleAttackerIndex
        eor #$0001
        sta @l wBattleAttackerIndex

        dec $CCD2,b
        bne -

        jsr rsActionStructCheckIfCombatantsCanDouble
        bcc +

        jsr rsUnknown84DEEB
        bcs _DD37
        
        +
        inc $CCE2,b

        lda @l wBattleType
        and #$00FF
        cmp #1
        bne +

          ; Arena
          jml _DDFD
        
        +
        jsr rsActionStructCheckForAccostBattleRound
        bcs _Loop

        
        _DD37
        lda #$FFFF
        sta lStructPointer1,b
        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry

        ldx #<>aActionStructUnit1
        jsr rsActionstructGetLevelUpAndDroppedItemData
        ldx #<>aActionStructUnit2
        jsr rsActionstructGetLevelUpAndDroppedItemData

        lda #$0010
        trb $0D79,b

        lda @l wBattleType
        and #$00FF
        cmp #0
        bne +

          ; normal battle
          ldx $0772,b
          lda $46EB,b,x
          sta wSelectedUnitDataRAMPointer,b
          lda #$0400
          jsl rlUnsetSelectedUnitStates
          jsl rlUnknown84C9E3
          bcs +

            jsl rlUnknown84CAA9

        +
        jsr $84DEA6
        
        lda $4F75,b
        bit #$7FFF
        beq _DDBB

        bit #$8000
        beq _DDBB

        and #$7FFF
        sta $0EBD,b

        lda wBattleStatus
        bit #$0001
        bne +

        lda aActionStructUnit1.CharacterID
        bra ++

        +
        lda aActionStructUnit2.CharacterID
        
        +
        sta $0EBF,b

        sep #$20
        lda #$1D
        sta $0EBC,b
        rep #$20

        jsl $8682BC

        _DDBB
        lda aActionStructUnit1.WeaponType
        cmp #WeaponTypeStaff
        beq _DDF7

        lda #$0014
        sta $0EBC,b
        lda aActionStructUnit1.UnitRAMPointer
        sta $056F,b
        jsl rlGetSelectedUnitFaction
        sta $0EBD,b
        jsl rlGetSelectedUnitCharacterID
        sta $0EBF,b
        lda aActionStructUnit2.UnitRAMPointer
        sta $056F,b
        jsl rlGetSelectedUnitFaction
        sta $0EC1,b

        jsl rlGetSelectedUnitCharacterID
        sta $0EC3,b

        jsl $8682BC
        bcs _End
        
        _DDF7
        jsl $84DE36
        bra _End

        _DDFD
        lda #$FEFF
        sta lStructPointer1,b
        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry

        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/DE18

    .here







    * = $04DEEB
    .logical $84DEEB

      rsUnknown84DEEB ; 84/DEEB

        .al
        .autsiz
        .databank ?

        ; acting unit in A
        ; 0 = player
        ; 1 = enemy

        asl
        tax
        lda aUnknown84DF35,x
        sta wActionStructAttacker
        lda aUnknown84DF35+2,x
        sta wActionStructDefender

        jsr rsActionStructTryProcSwordSkills
        jsr rsActionStructGetNumberOfStrikes
        sta $7ECCD4
        
          -
          lda #0
          jsr rsUnknown84E433
          bcs _CLC

            lda #(`aBattleRoundsData)<<8
            sta lStructPointer2+1,b
            lda #<>aBattleRoundsData
            sta lStructPointer2,b
            lda bBattleRoundFlags
            sta lStructPointer1,b
            jsl rlAppendNewStructEntry

            lda $7ECCE0
            bne _SEC

            dec $CCD4,b
            bne -

        _CLC
        clc
        rts

        _SEC
        sec
        rts

        .databank 0

      aUnknown84DF35 ; 84/DF35

        .word <>aActionStructUnit1
        .word <>aActionStructUnit2
        .word <>aActionStructUnit1

      rsCheckIfUnitHasWeaponEquipped ; 84/DF3B

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.DeploymentNumber,b,x
        bmi +

          jsr rsCheckForWeaponInventorySlot
          bcc +

            lda structActionStructEntry.UnitRAMPointer,b,x
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitStatus
            cmp #StatusSleep
            beq +

              lda structActionStructEntry.WeaponID,b,x
              bmi +

                jsl rlGetItemDataROMPointer
                jsl rlGetItemEquipmentType
                cmp #EquipTypeWeapon
                bne +

                  sec
                  rts

        +
        clc
        rts

        .databank 0

      rsCheckForWeaponInventorySlot ; 84/DF6A

        .al
        .autsiz
        .databank `wBattleType

        lda wBattleType
        and #$00FF
        cmp #1
        beq +

          ; normal battle
          lda structActionStructEntry.WeaponInventorySlot,b,x
          beq _CLC
          bmi _CLC
          bra _SEC
        
        +
        lda structActionStructEntry.WeaponInventorySlot,b,x
        beq _CLC
        
        _SEC
        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

        ; 84/DF87

    .here






    * = $04E05F
    .logical $84E05F

      rsActionStructGetBattleTriggerableSkillFlags ; 84/E05F

        .al
        .autsiz
        .databank ?

        ldy #<>aActionStructUnit1
        jsr rsGetUnitsBattleTriggerableSkillFlags
        ldy #<>aActionStructUnit2
        jsr rsGetUnitsBattleTriggerableSkillFlags
        rts

        .databank 0

      rsGetUnitsBattleTriggerableSkillFlags ; 84/E06C

        .al
        .autsiz
        .databank ?

        lda #0
        sta structActionStructEntry.TriggerableSkills,b,y

        lda structActionStructEntry.UnitRAMPointer,b,y
        beq _End

        sta wSelectedUnitDataRAMPointer,b
        ldx #size(aCombatSkillsTable)-2

        -
        lda aCombatSkillsTable,x
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda aCombatSkillsTable,x
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc ++

        +
        lda structActionStructEntry.TriggerableSkills,b,y
        ora aCombatSkillsFlags,x
        sta structActionStructEntry.TriggerableSkills,b,y

        +
        dec x
        dec x
        bpl -

        _End
        rts

        .databank 0

      aCombatSkillsTable .block ; 84/E0A0

        .word SkillIDWrath
        .word SkillIDPursuit
        .word SkillIDAdept
        .word SkillIDNihil
        .word SkillIDMiracle
        .word SkillIDVantage
        .word SkillIDAccost
        .word SkillIDPavise
        .word SkillIDSteal
        .word SkillIDAstra
        .word SkillIDLuna
        .word SkillIDSol
        .word SkillIDHoly
        .word SkillIDDarkness
        .word SkillIDDance

      .bend

      aCombatSkillsFlags ; 84/E0BE

        .word CombatSkillFlagWrath
        .word CombatSkillFlagPursuit
        .word CombatSkillFlagAdept
        .word CombatSkillFlagNihil
        .word CombatSkillFlagMiracle
        .word CombatSkillFlagVantage
        .word CombatSkillFlagAccost
        .word CombatSkillFlagPavise
        .word CombatSkillFlagSteal
        .word CombatSkillFlagAstra
        .word CombatSkillFlagLuna
        .word CombatSkillFlagSol
        .word CombatSkillFlagHoly
        .word CombatSkillFlagDarkness
        .word CombatSkillFlagDance
        .word CombatSkillFlagUnknown

      rsActionStructTryProcSwordSkills ; 84/E0DE

        .al
        .autsiz
        .databank ?

        lda #0
        sta wBattleActivatedSkill
        lda #0
        sta $7ECCE8

        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        jsr rsActionStructTryProcSwordSkillsEffect

        lda #1
        sta $7ECCE8

        ldx #<>aActionStructUnit2
        ldy #<>aActionStructUnit1
        jsr rsActionStructTryProcSwordSkillsEffect
        rts

        .databank 0

      rsActionStructTryProcSwordSkillsEffect ; 84/E106

        .al
        .autsiz
        .databank `wBattleAttackerIndex

        lda #0
        sta structActionStructEntry.BattleBonusAtkDef,b,x

        lda structActionStructEntry.DeploymentNumber,b,x
        bpl +

          jml _End

        +
        lda $0022,b,x
        cmp #8
        beq _End

          jsr rsCheckIfUnitHasWeaponEquipped
          bcc _End

            jsr rsCheckIfBattleDistanceInWeaponRange
            bcc _End

              lda structActionStructEntry.UnitRAMPointer,b,y
              sta wSelectedUnitDataRAMPointer,b
              lda #SkillIDNihil
              jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
              bcs _End

                lda structActionStructEntry.WeaponID,b,x
                jsl rlGetItemDataROMPointer
                jsl rlGetItemWeaponType
                cmp #WeaponTypeSword
                bne _End

                  lda structActionStructEntry.UnitRAMPointer,b,x
                  sta wSelectedUnitDataRAMPointer,b

                  ldy #SkillIDAstra

                    -
                    tya
                    jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
                    bcc + 

                    jsl rlGetSelectedUnitTotalSkill
                    jsl rlRollForChance
                    bcc ++

                    +
                    inc y
                    cpy #SkillIDRenewal
                    bcc -

                  _End
                  rts
        
        +
        cpy #SkillIDHoly
        beq +

          cpy #SkillIDDarkness
          beq +

            lda @l $7ECCE8
            cmp @l wBattleAttackerIndex
            bne _End

              sty wBattleActivatedSkill
              bra ++

        +
        lda #20
        sta structActionStructEntry.BattleBonusAtkDef,b,x

        +
        tya
        xba
        ora #$00FE
        sta lStructPointer1,b

        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry
        rts

        .databank 0

      rsActionStructCheckForDance ; 84/E19F

        .al
        .autsiz
        .databank `wBattleStatus

        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        lda structActionStructEntry.TriggerableSkills,b,x
        bit #CombatSkillFlagDance
        beq _End

          lda wBattleStatus
          and #$0001
          bne +

          ; If song would be player attack, overwrite it with dancer attack
          lda wBattleSong
          cmp #$0031
          bne +

            lda #$0038
            sta wBattleSong

          +
          lda structActionStructEntry.DeploymentNumber,b,y
          bpl _End

            jsr rsCheckIfUnitHasWeaponEquipped
            bcs _End

              lda #8
              sta $0022,b,x
              lda #1
              sta structActionStructEntry.WeaponMinRange,b,x
              sta structActionStructEntry.WeaponMaxRange,b,x

        _End
        rts

        .databank 0

      rsActionStructClearMagicEquipmentIfSilenced ; 84/E1DD

        .al
        .autsiz
        .databank ?

        ldx #<>aActionStructUnit1
        jsr rsActionStructClearMagicEquipmentIfSilencedEffect
        ldx #<>aActionStructUnit2
        jsr rsActionStructClearMagicEquipmentIfSilencedEffect
        rts

        .databank 0

      rsActionStructClearMagicEquipmentIfSilencedEffect ; 84/E1EA

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponType
        cmp #WeaponTypeStaff
        bcc +

          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitStatus
          cmp #StatusSilence
          bne +

            lda #0
            sta structActionStructEntry.WeaponInventorySlot,b,x

        +
        rts

        .databank 0

      rsActionStructAdjustVantageRoundOrder ; 84/E210

        .al
        .autsiz
        .databank ?

        ldx #<>aActionStructUnit1
        jsr rsActionStructCheckForVantageActivation
        bcc +

        lda #0
        sta wBattleAttackerIndex
        bra _End
        
        +
        ldx #<>aActionStructUnit2
        jsr rsActionStructCheckForVantageActivation
        bcc _End

        lda #1
        sta wBattleAttackerIndex
        
        _End
        rts

        .databank 0

      rsActionStructCheckForVantageActivation ; 84/E231

        .al
        .autsiz
        .databank ?

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc _CLC

        lda #SkillIDVantage
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcc _CLC

        lda structActionStructEntry.MaxHP,b,x
        lsr
        cmp structActionStructEntry.CurrentHP,b,x
        bcc _CLC

        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rsActionStructGetBattleInitiatorIfArena ; 84/E24C

        .al
        .autsiz
        .databank `aActionStructUnit1

        ; Check if arena fight

        lda wBattleType
        and #$00FF
        cmp #1
        bne _End

          lda aActionStructUnit1.BattleAttackSpeed
          cmp aActionStructUnit2.BattleAttackSpeed
          bmi +

          lda #0
          bra ++

          +
          lda #1

          +
          sta @l wBattleAttackerIndex
        
        _End
        rts

        .databank 0

      rsBattleHandleEffectiveness ; 84/E26C

        .al
        .autsiz
        .databank ?

        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        jsr rsSetBattleCritIfEffective

        ldx #<>aActionStructUnit2
        ldy #<>aActionStructUnit1
        jsr rsSetBattleCritIfEffective
        rts

        .databank 0

      rsSetBattleCritIfEffective ; 84/E27F

        .al
        .autsiz
        .databank ?

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc +

          lda structActionStructEntry.UnitRAMPointer,b,y
          beq +

            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetClassWeakness
            sta $7ECCE8

            lda structActionStructEntry.WeaponID,b,x
            jsl rlGetItemDataROMPointer
            jsl rlGetItemEffectiveness
            bit $CCE8,b
            beq +

              lda #100
              sta structActionStructEntry.BattleCrit,b,x

        +
        rts

        .databank 0

      rsActionStructGetNumberOfStrikes ; 84/E2AB

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker

        lda #1
        sta @l $7ECCE8

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc _End
        
        -
        lda @l wBattleActivatedSkill
        cmp #SkillIDAstra
        bne +

          lda #5
          sta @l $7ECCE8
          bra _E2ED

        +
        lda structActionStructEntry.TriggerableSkills,b,x
        bit #CombatSkillFlagAdept
        beq _E2ED

        lda structActionStructEntry.BattleAttackSpeed,b,x
        clc
        adc #20
        bmi -

        cmp #100
        bcs +

        jsl rlRollForChance
        bcs _E2ED
        
        +
        asl $CCE8,b
        bra _End

        _E2ED
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitBrave
        bne _End

        asl $CCE8,b
        
        _End
        lda @l $7ECCE8
        rts

        .databank 0

      rsActionStructCheckIfCombatantsCanDouble ; 84/E305

        .al
        .autsiz
        .databank `wActionStructAttacker

        ; sec if true

        lda @l wBattleStatus
        and #$0001
        sta @l $7ECCE8
        asl
        tax
        lda aUnknown84E35E,x
        sta @l wActionStructAttacker
        lda aUnknown84E35E+2,x
        sta @l wActionStructDefender

        lda @l wBattleStatus
        and #$0001
        sta @l $7ECCE8

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsActionStructCheckIfDoubling
        bcs +

        lda @l wBattleStatus
        and #$0001
        eor #$0001
        sta @l $7ECCE8

        ldx wActionStructDefender
        ldy wActionStructAttacker
        jsr rsActionStructCheckIfDoubling
        bcs +

        clc

        -
        rts

        +
        lda @l $7ECCE8
        sta @l wBattleAttackerIndex
        sec
        bra -

        .databank 0

      aUnknown84E35E ; 84/E35E

        .word <>aActionStructUnit1
        .word <>aActionStructUnit2
        .word <>aActionStructUnit1

      rsActionStructCheckIfDoubling ; 84/E364

        .al
        .autsiz
        .databank ?

        ; sec if doubling
        ; clc if not

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc +

          lda structActionStructEntry.TriggerableSkills,b,x
          bit #CombatSkillFlagPursuit
          beq +

            lda structActionStructEntry.BattleAttackSpeed,b,y
            cmp structActionStructEntry.BattleAttackSpeed,b,x
            bpl +

              sec
              rts

        +
        clc
        rts

        .databank 0

      rsActionStructCheckForAccostBattleRound ; 84/E37D

        .al
        .autsiz
        .databank `wActionStructAttacker

        lda #(`aBattleRoundsData)<<8
        sta $055C+1,b
        lda #<>aBattleRoundsData
        sta $055C,b
        jsl rlGetRAMStructCurrentStructCount
        cmp #40
        bcs _CLC

          lda @l wBattleStatus
          and #$0001
          sta @l $7ECCE8
          asl
          tax
          lda aUnknown84E3F2,x
          sta @l wActionStructAttacker
          lda aUnknown84E3F2+2,x
          sta @l wActionStructDefender
          
          lda @l wBattleStatus
          and #$0001
          sta @l $7ECCE8

          ldx wActionStructAttacker
          ldy wActionStructDefender
          jsr rsActionStructCheckForAccost
          bcs _SEC

          lda @l wBattleStatus
          and #$0001
          eor #$0001
          sta @l $7ECCE8

          ldx wActionStructDefender
          ldy wActionStructAttacker
          jsr rsActionStructCheckForAccost
          bcs _SEC

          _CLC
          clc
        
        -
        rts
        
        _SEC
        lda #2
        sta @l $7ECCD2
        lda @l $7ECCE8
        sta @l wBattleAttackerIndex
        sec
        bra -

        .databank 0

      aUnknown84E3F2 ; 84/E3F2

        .word <>aActionStructUnit1
        .word <>aActionStructUnit2
        .word <>aActionStructUnit1

      rsActionStructCheckForAccost ; 84/E3F8

        .al
        .autsiz
        .databank ?

        ; if hp =>25
        ; hp/2 + as - enemy as% chance 

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc _CLC

          jsr rsCheckIfBattleDistanceInWeaponRange
          bcc _CLC

            lda structActionStructEntry.TriggerableSkills,b,x
            bit #CombatSkillFlagAccost
            beq _CLC

              lda structActionStructEntry.UnitRAMPointer,b,x
              sta wSelectedUnitDataRAMPointer,b
              jsl rlGetSelectedUnitCurrentHP
              cmp #25
              bcc _CLC

                lsr
                clc
                adc structActionStructEntry.BattleAttackSpeed,b,x
                sec
                sbc structActionStructEntry.BattleAttackSpeed,b,y
                bmi _CLC

                  cmp #100
                  bcs +

                  jsl rlRollForChance
                  bcc +
        
        _CLC
        clc
        rts
        
        +
        sec
        rts

        .databank 0

      rsUnknown84E433 ; 84/E433

        .al
        .autsiz
        .databank `wActionStructAttacker

        phx
        phy
        sta @l $7ECCE6
        stz bBattleRoundFlags

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsCheckIfBattleDistanceInWeaponRange
        bcc _SEC

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitStatus
        cmp #StatusSleep
        beq _SEC

        lda @l wBattleAttackerIndex
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        lda $0022,b,x
        cmp #8
        bne +

          jsr rsUnknown84EA37
          bra _End

        +
        jsr rsCheckForWeaponInventorySlot
        bcc _SEC

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne +

        jsl rlGetItemWeaponTraits
        asl
        tax
        jsr (aActionStructWeaponTraitEffects,x)
        bra _End
        
        +
        jsl rlGetItemStaffEffect
        asl
        tax
        jsr (aActionStructStaffEffects,x)
        
        _End
        ply
        plx
        rts
        
        _SEC
        sec
        bra _End

        .databank 0

      aActionStructWeaponTraitEffects ; 84/E49F

        .addr rsActionStructWeaponTraitNormal       ; none
        .addr rsActionStructWeaponTraitRangedMagic  ; WeaponTraitRangedMagicSword   
        .addr rsActionStructWeaponTraitLifeSteal    ; WeaponTraitPermanentMagicSword
        .addr rsActionStructWeaponTraitLifeSteal    ; WeaponTraitLifeSteal          
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitBrave              
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitUncounterable      
        .addr rsActionStructWeaponTraitStatusSword  ; WeaponTraitStatusSword        
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitHalveAttack        
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitNegateHalveAttack  
        .addr rsActionStructWeaponTraitHel          ; WeaponTraitHelEffect          
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitFemaleOnly         

      aActionStructStaffEffects ; 84/E4B5

        .addr rsActionStructStaffEffectNone
        .addr rsActionStructStaffEffectHeal ; heal
        .addr rsActionStructStaffEffectHeal ; mend
        .addr rsActionStructStaffEffectHeal ; recover
        .addr rsActionStructStaffEffectHeal ; physic
        .addr rsActionStructStaffEffectFortify ; fortify
        .addr rsActionStructStaffEffectReturn ; return
        .addr $84EBD5 ; warp
        .addr rsActionStructStaffEffectRescue ; rescue
        .addr $84EB6F ; charm
        .addr $84EB6F ; restore
        .addr rsActionStructStaffEffectValkyrie ; valkyrie
        .addr rsActionStructStaffEffectStatus ; silence
        .addr rsActionStructStaffEffectStatus ; sleep
        .addr rsActionStructStaffEffectStatus ; berserk
        .addr rsActionStructStaffEffectThief ; thief

      rsActionStructStaffEffectNone ; 84/E4D5

        .al
        .autsiz
        .databank ?

        clc
        rts

        .databank 0

      rsCheckIfBattleDistanceInWeaponRange ; 84/E4D7

        .al
        .autsiz
        .databank ?

        sec
        lda wBattleDistance
        beq +

        cmp structActionStructEntry.WeaponMinRange,b,x
        bcc +

        lda structActionStructEntry.WeaponMaxRange,b,x
        cmp wBattleDistance
        bcc +
        
        +
        rts

        .databank 0

      rsActionStructWeaponTraitNormal ; 84/E4ED

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D
        jsr rsUnknown84E535
        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsActionStructRoundTryProcPavise
          bcc +

            jsr rsUnknown84E62C
            lda structActionStructEntry.BattleBonusAtkDef,b,x
            sta $0574,b
            jsr rsActionStructRoundTryProcWrath
            jsr rsActionStructRoundTryProcCrit
            jsr rsActionStructRoundGetDamage
            jsr rsActionStructCheckForSolHealing
            jsr rsUnknown84E6F6

        +
        clc
        rts

        .databank 0

      rsUnknown84E51D ; 84/E51D

        .al
        .autsiz
        .databank ?

        lda wBattleDistance
        cmp #2
        bcc +

          sep #$20
          lda bBattleRoundFlags
          ora #$20
          sta bBattleRoundFlags
          rep #$20

        +
        rts

        .databank 0

      rsUnknown84E535 ; 84/E535

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponType
        cmp #WeaponTypeStaff
        bcc +

          sep #$20
          lda bBattleRoundFlags
          ora #$40
          sta bBattleRoundFlags
          rep #$20

        +
        rts

        .databank 0

      rsActionStructRoundCheckIfHit ; 84/E554

        .al
        .autsiz
        .databank `bBattleRoundFlags

        lda @l $7ECCE6
        bit #$0010
        beq +

        bit #$0008
        bne _SEC
        bra _E5CF

        +
        lda @l wBattleActivatedSkill
        cmp #SkillIDLuna
        beq _SEC

        cmp #SkillIDSol
        beq _SEC

        stz $0574,b

        lda structActionStructEntry.TriggerableSkills,b,y
        bit #CombatSkillFlagMiracle
        beq +

          lda structActionStructEntry.UnitRAMPointer,b,y
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitStates
          bit #UnitStateMiracleActive
          beq +

            jsl rlGetSelectedUnitCurrentHP
            cmp #11
            bcs +

              eor #$FFFF
              inc a
              clc
              adc #10
              phx

              tax
              lda aActionStructMiracleAvoidBoostTable,x
              and #$00FF
              sta $0574,b
              plx

        +
        lda structActionStructEntry.BattleHit,b,x
        sec
        sbc structActionStructEntry.BattleAvoid,b,y
        sec
        sbc $0574,b
        cmp #0
        bmi _FloorHit

        cmp #101
        bpl _CapHit
        bra +
        
        _FloorHit
        lda #0
        bra +
        
        _CapHit
        lda #100
        
        +
        jsl rlRollForChance
        bcc _SEC
        
        _E5CF
        sep #$20
        lda #8
        tsb bBattleRoundFlags
        lda #0
        sta @l $7ECCDF
        rep #$20

        clc
        
        -
        rts
        
        _SEC
        sec
        bra -

        .databank 0

      aActionStructMiracleAvoidBoostTable ; 84/E5E3

        .byte 10
        .byte 20
        .byte 30
        .byte 40
        .byte 50
        .byte 60
        .byte 70
        .byte 80
        .byte 90
        .byte 100

      rsActionStructRoundTryProcPavise ; 84/E5ED

        .al
        .autsiz
        .databank ?

        lda $7ECCE6
        bit #$0010
        bne _SEC

          lda structActionStructEntry.TriggerableSkills,b,y
          bit #CombatSkillFlagPavise
          beq _SEC

            lda structActionStructEntry.Level,b,y
            jsl rlRollForChance
            bcs _SEC

              lda #$02FE
              sta lStructPointer1,b
              lda #(`aBattleRoundsData)<<8
              sta lStructPointer2+1,b
              lda #<>aBattleRoundsData
              sta lStructPointer2,b
              jsl rlAppendNewStructEntry

              sep #$20
              lda #0
              sta $7ECCDF
              rep #$20

              clc

              -
              rts

        _SEC
        sec
        bra -

        .databank 0

      rsUnknown84E62C ; 84/E62C

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        sta $0574,b
        jsl rlUnknown84A87E
        bcc +

          lda structActionStructEntry.WeaponInventorySlot,b,x
          ora #$8000
          sta structActionStructEntry.WeaponInventorySlot,b,x

        +
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemEquipmentType
        cmp #EquipTypeStaff
        beq +

          lda structActionStructEntry.TriggerableSkills,b,x
          bit #CombatSkillFlagSteal
          beq +

            jsr rsUnknown84EAD9

        +
        rts

        .databank 0

      rsActionStructRoundTryProcWrath ; 84/E663

        .al
        .autsiz
        .databank ?

        lda #SkillIDWrath
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcc +

          jsl rlGetSelectedUnitCurrentHP
          sta $7ECCE8
          lda structActionStructEntry.MaxHP,b,x
          lsr
          inc a
          cmp $7ECCE8
          bcc +

            lda #100
            sta structActionStructEntry.BattleCrit,b,x

        +
        rts

        .databank 0

      rsActionStructRoundTryProcCrit ; 84/E686

        .al
        .autsiz
        .databank `bBattleRoundFlags

        lda @l $7ECCE6
        bit #$0010
        beq +

        bit #$0004
        bne ++
        bra _End
        
        +
        lda structActionStructEntry.TriggerableSkills,b,y
        bit #CombatSkillFlagNihil
        bne _End

        lda structActionStructEntry.BattleCrit,b,x
        beq _End

        jsl rlRollForChance
        bcs _End
        
        +
        lda $4F75,b
        ora #$8000
        sta $4F75,b

        lda #4
        tsb bBattleRoundFlags

        lda $0574,b
        asl
        clc
        adc structActionStructEntry.BattleMight,b,x
        sta $0574,b
        
        _End
        rts

        .databank 0

      rsActionStructRoundGetDamage ; 84/E6C4

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.BattleMight,b,x
        clc
        adc $0574,b
        sta $0574,b

        lda wBattleActivatedSkill
        cmp #SkillIDLuna
        beq +

          lda $0574,b
          sec
          sbc structActionStructEntry.BattleDefense,b,y
          sec
          sbc structActionStructEntry.BattleBonusAtkDef,b,y
          cmp #1
          bpl ++

          lda #1
          bra ++

        +
        lda $0574,b

        +
        and #$00FF
        sta $0574,b

        rts

        .databank 0

      rsUnknown84E6F6 ; 84/E6F6

        .al
        .autsiz
        .databank `bBattleRoundFlags

        lda @l $7ECCE6
        bit #$0010
        beq ++

        bit #$0002
        bne +

          jml _Arena

        +
        lda #$0010
        tsb bBattleRoundFlags

        lda #80
        sta $0574,b

        +
        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.CharacterID,b,x
        jsl rlActionStructInflictDamage
        bcs +

          jml _E803

        ; fatal hit
        +
        jsl rlGetSelectedUnitStatus
        cmp #StatusCaptive
        bne +

          jsr rsUnknown84EF13

        +
        lda @l wBattleType
        and #$00FF
        cmp #1
        beq +

        lda @l aActionStructUnit2.CharacterID
        cmp #Julius2
        beq +

        lda structActionStructEntry.TriggerableSkills,b,y
        bit #CombatSkillFlagUnknown
        bne ++

        ; Is arena, vs julius or not skill1
        +
        lda #$0010
        tsb bBattleRoundFlags

        +
        lda #1
        sta @l $7ECCE0

        lda @l wBattleStatus
        ora #$0010
        sta @l wBattleStatus

        lda @l wBattleAttackerIndex
        bne +

          lda @l wBattleStatus
          ora #$0020
          sta @l wBattleStatus

        +
        lda @l wBattleAttackerIndex
        beq +

          lda #0
          sta structActionStructEntry.ObtainedStealMoney,b,y

        +
        sta structActionStructEntry.GainedExperience,b,y

        lda $0574,b
        pha

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetUniqueEquipmentOrDrops
        cmp #$00FF
        beq _E7CC

        sta $0574,b

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        jsl rlGetSelectedUnitFaction
        ora #0
        bne _E7CC

        lda $0574,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsl rlGetItemRAMStateAndOwner
        lda structActionStructEntry.UnitRAMPointer,b,y
        cmp $02
        beq +

        lda $00
        cmp #7
        bne _E7CC

        +
        lda $0574,b
        sta structActionStructEntry.ObtainedItem,b,x

        _E7CC
        pla
        sta $0574,b

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        lda @l wBattleType
        and #$00FF
        cmp #1
        beq +

        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl rlUnknown84AB5C
        bra ++

        ; Arena
        +
        jsl rlActionStructArenaWinResults
        sta structActionStructEntry.ObtainedArenaMoney,b,x

        +
        lda structActionStructEntry.Level,b,y
        sec
        sbc structActionStructEntry.Level,b,x
        asl
        clc
        adc #30
        bra +

        _E803
        lda @l wBattleType
        and #$00FF
        cmp #1
        beq _Arena

        lda structActionStructEntry.Level,b,y
        sec
        sbc structActionStructEntry.Level,b,x
        clc
        adc #10
        
        +
        bmi +

        cmp #101
        bmi ++

        lda #100
        bra ++
        
        +
        lda #0
        
        +
        sta structActionStructEntry.GainedExperience,b,x

        _Arena
        lda $0574,b

        sep #$20
        sta @l $7ECCDF
        rep #$20

        rts

        .databank 0

      rsActionStructWeaponTraitRangedMagic ; 84/E838

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D

        sep #$20
        lda @l bBattleRoundFlags
        ora #$40
        sta @l bBattleRoundFlags
        rep #$20

        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsActionStructRoundTryProcPavise
          bcc +

            jsr rsUnknown84E62C
            lda structActionStructEntry.BattleBonusAtkDef,b,x
            sta $0574,b
            jsr rsActionStructRoundTryProcWrath
            jsr rsActionStructRoundTryProcCrit
            jsr rsActionStructRoundGetDamage
            jsr rsActionStructCheckForSolHealing
            jsr rsUnknown84E6F6
        
        +
        clc
        rts

        .databank 0

      rsActionStructWeaponTraitStatusSword ; 84/E873

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D
        jsr rsUnknown84E535
        jsr rsActionStructRoundCheckIfHit
        bcc _End

          jsr rsActionStructRoundTryProcPavise
          bcc _End
          
            jsr rsUnknown84E62C
            lda structActionStructEntry.BattleBonusAtkDef,b,x
            sta $0574,b
            jsr rsActionStructRoundTryProcWrath
            jsr rsActionStructRoundTryProcCrit
            jsr rsActionStructRoundGetDamage
            jsr rsActionStructCheckForSolHealing
            jsr rsUnknown84E6F6

            lda structActionStructEntry.UnitRAMPointer,b,y
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitStatus
            sta @l $7ECCE8

            lda structActionStructEntry.WeaponID,b,x
            jsl rlGetItemDataROMPointer
            jsl rlGetItemAlternateID
            cmp @l $7ECCE8
            beq _End

              jsl rlGetSelectedUnitTotalResistance
              sta $0574,b
              lda #30
              sec
              sbc $0574,b
              jsl rlRollForChance
              bcs _End

                jsr rsUnknown84EEB1

                lda #(`aBattleRoundsData)<<8
                sta lStructPointer2+1,b
                lda #<>aBattleRoundsData
                sta lStructPointer2,b
                lda @l bBattleRoundFlags
                and #~($10)
                sta lStructPointer1,b
                jsl rlAppendNewStructEntry

                lda #0
                sep #$20
                sta @l $7ECCDF
                rep #$20

                lda #$0040
                tsb bBattleRoundFlags

        _End
        clc
        rts

        .databank 0

      rsActionStructWeaponTraitHel ; 84/E904

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D
        jsr rsUnknown84E535
        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsUnknown84E62C
          lda structActionStructEntry.UnitRAMPointer,b,y
          sta wSelectedUnitDataRAMPointer,b
          lda structActionStructEntry.CurrentHP,b,y
          dec a
          sta $0574,b

          lda #1
          jsl rlSetSelectedUnitCurrentHP

          lda $0574,b
          sep #$20
          sta @l $7ECCDF
          rep #$20
        
        +
        clc
        rts

        .databank 0

      rsActionStructStaffEffectHeal ; 84/E939

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags
        
        jsr rsUnknown84E62C

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl rlGetItemROMDataByInventorySlot
        jsl $87E86A
        sta $0574,b

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b

        lda structActionStructEntry.MaxHP,b,y
        sec
        sbc structActionStructEntry.CurrentHP,b,y
        cmp $0574,b
        bcs +

          sta $0574,b
        
        +
        jsl rlHealSelectedUnitsHP

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        lda $0574,b
        sep #$20
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        rts

        .databank 0

      rsActionStructStaffEffectFortify ; 84/E99E

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker

        lda #2
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl rlGetItemROMDataByInventorySlot
        jsl $87E89A
        jsr rsUnknown84E62C

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        rts

        .databank 0

      rsActionStructStaffEffectReturn ; 84/E9E3

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags
        
        jsr rsUnknown84E62C

        phx
        lda $0580,b
        pha

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.DeploymentNumber,b,y
        tax
        jsl rlGetSelectedUnitFaction
        jsl $84BE3D
        jsl $84CD8A

        pla
        sta $0580,b
        plx

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        rts

        .databank 0

      rsUnknown84EA37 ; 84/EA37

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags

        lda $0D79,b
        bit #$0020
        bne _EA76

        phx
        ldx #$03FF
        
        -
        lda $7F854A,x
        and #$00FF
        cmp #$00FF
        beq +

        phx
        tax
        jsl rlUnknown84CA97
        lda @l $7E46EB,x
        sta wSelectedUnitDataRAMPointer,b
        lda #$4000
        jsl rlUnsetSelectedUnitStates
        plx

        +
        dec x
        bpl -

        plx
        bra _EAC0

        _EA76
        phx
        lda structActionStructEntry.DeploymentNumber,b,x
        sta @l $7ECCE8
        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlUnknown8496DA
        jsl rlUnknown87E98D
        jsl rlUnknown87ED7F
        ldx #0
        
        -
        lda $4E75,b,x
        bmi _EABF

        cmp @l $7ECCE8
        beq +

        phx
        tax
        jsl rlUnknown84CA97
        lda @l $7E489B,x
        sta @l aDeploymentTable,x
        lda @l $7E46EB,x
        sta wSelectedUnitDataRAMPointer,b

        lda #$4000
        jsl rlUnsetSelectedUnitStates
        plx
        
        +
        inc x
        inc x
        bra -
        
        _EABF
        plx

        _EAC0
        lda #10
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$0037
        sta wBattleSong
        clc
        rts

        .databank 0

      rsUnknown84EAD8 ; 84/EAD8

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsUnknown84EAD9 ; 84/EAD9

        .al
        .autsiz
        .databank ?

        ; check if its an arena fight

        lda wBattleType
        and #$00FF
        cmp #1
        beq _End

          ; check if unit already has capped money
          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitMoney
          cmp #50000
          bcs _End

            ; check if target is broke
            lda structActionStructEntry.UnitRAMPointer,b,y
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitMoney
            ora #0
            beq _End

              sta $7ECCE8
              sta $0574,b
              jsl rlSubtractSelectedCharacterMoney

              lda structActionStructEntry.UnitRAMPointer,b,x
              sta wSelectedUnitDataRAMPointer,b
              jsl rlAddSelectedCharacterMoney

              lda structActionStructEntry.ObtainedStealMoney,b,x
              clc
              adc $7ECCE8
              sta structActionStructEntry.ObtainedStealMoney,b,x

        _End
        rts

        .databank 0

        ; 84/EB24


    .here






    * = $04EC80
    .logical $84EC80

      rsActionStructWeaponTraitLifeSteal ; 84/EC80

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D

        sep #$20
        lda @l bBattleRoundFlags
        ora #$40
        sta @l bBattleRoundFlags
        rep #$20

        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsUnknown84E62C
          lda structActionStructEntry.BattleBonusAtkDef,b,x
          sta $0574,b
          jsr rsActionStructRoundTryProcWrath
          jsr rsActionStructRoundTryProcCrit
          jsr rsActionStructRoundGetDamage
          jsr rsUnknown84E6F6
          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlHealSelectedUnitsHP
        
        +
        clc
        rts

        .databank 0

      rsActionStructStaffEffectRescue ; 84/ECBD

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags
        
        jsr rsUnknown84E62C

        lda $0D79,b
        bit #$0040
        bne _ED3A

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.XPosition,b,x
        sta @l $7EC490
        lda structActionStructEntry.YPosition,b,x
        sta @l $7EC492
        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

          inc $C492,b
          inc $C492,b

        +
        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl $87AF46
        bcc +

          jml _End
        
        +
        lda @l $7EC49C
        xba
        ora @l $7EC49A
        sta $0574,b

        phx
        lda structActionStructEntry.DeploymentNumber,b,y
        tax
        jsl $84C9BF
        plx
        jsr rsUnknown84EDAE

        lda @l $7EC49A
        sta @l $7E4F77
        lda @l $7EC49C
        sta @l $7E4F79
        phb
        phy
        jsl $88C9A6
        ply
        plb
        bra +
        
        _ED3A
        jsr rsUnknown84EDAE
        lda structActionStructEntry.DeploymentNumber,b,x
        sta $0D7F,b
        lda #9
        sta $0D81,b
        lda #0
        jsl $84BE3D
        sta $0D83,b
        jsl rlUnknown87E98D
        jsl $87ECFD
        sta @l $7E4F77
        jsl $87ED21
        sta @l $7E4F79
        
        +
        phx
        lda @l $7E4F79
        xba
        lsr
        lsr
        clc
        adc @l $7E4F77
        asl
        tax

        lda $7F2400,x
        and #$03FF
        tax
        lda $7F2000,x
        and #$00FF
        sta structActionStructEntry.TerrainID,b,y
        plx

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        
        _End
        rts

        .databank 0

      rsUnknown84EDAE ; 84/EDAE

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

          jsl $84BA6F

        +
        rts

        .databank 0

      rsActionStructStaffEffectThief ; 84/EDBC

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsr rsUnknown84EAD9

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x
        
        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        jsr rsUnknown84EE8F

        clc
        rts

        .databank 0

      rsActionStructStaffEffectValkyrie ; 84/EDED

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsr rsUnknown84E62C

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl $84A9B6

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        lda structActionStructEntry.MaxHP,b,y
        sep #$20
        sta @l $7ECCDF
        rep #$20

        lda #$003D
        sta wBattleSong
        clc
        rts

        .databank 0

      rsActionStructStaffEffectStatus ; 84/EE32

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitTotalResistance
        sta $0574,b

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitTotalMagic
        cmp $0574,b
        beq +
        bcs ++
        
        +
        sep #$20
        lda #8
        tsb bBattleRoundFlags
        rep #$20
        bra ++
        
        +
        jsr rsUnknown84E62C
        jsr rsUnknown84EEB1

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x
        
        +
        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        jsr rsUnknown84EE8F

        clc
        rts

        .databank 0

      rsUnknown84EE8F ; 84/EE8F

        .al
        .autsiz
        .databank `aDeploymentTable

        phx
        lda structActionStructEntry.DeploymentNumber,b,x
        tax
        lda aDeploymentTable,x
        and #$0003
        cmp #1
        beq +

        cmp #3
        beq +

        lda #$0031
        bra ++
        
        +
        lda #$0032
        
        +
        sta wBattleSong
        plx
        rts

        .databank 0

      rsUnknown84EEB1 ; 84/EEB1

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b

        phx
        lda structActionStructEntry.DeploymentNumber,b,y
        tax
        jsl rlGetItemAlternateID
        cmp #StatusSleep
        bne +

          lda $489B,b,x
          ora #$2000
          sta $489B,b,x
          bra ++

          +
          lda $489B,b,x
          and #$DFFF
          sta $489B,b,x

        +
        lda #4
        tsb $0D79,b
        plx

        jsl rlGetItemAlternateID
        jsl rlSetSelectedUnitStatus

        lda #3
        jsl rlGetRandomNumber100
        clc
        adc #4
        jsl rlSetSelectedUnitStatusDuration
        rts

        .databank 0

      rsActionStructCheckForSolHealing ; 84/EEFF

        .al
        .autsiz
        .databank ?

        lda wBattleActivatedSkill
        cmp #SkillIDSol
        bne +

          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlHealSelectedUnitsHP

        +
        rts

        .databank 0

      rsUnknown84EF13 ; 84/EF13

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown87EB24
        jsl rlUnknown87EC42
        sta $0D83,b
        lda $0000,b,y
        sta $0D7F,b
        lda #2
        sta $0D81,b
        plx
        rts

        .databank 0

      rsActionstructGetLevelUpAndDroppedItemData ; 84/EF2D

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.UnitRAMPointer,b,x
        beq _End

        sta wSelectedUnitDataRAMPointer,b
        lda #SkillIDParagon
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda #SkillIDParagon
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc ++
        
        +
        asl structActionStructEntry.GainedExperience,b,x
        
        +
        lda structActionStructEntry.GainedExperience,b,x
        bmi +

        cmp #101
        bmi ++

        lda #100
        bra ++
        
        +
        lda #0
        
        +
        sta $0574,b

        txa
        clc
        adc #structActionStructEntry.LevelUpData
        sta $0571,b

        jsl rlActionStructLevelUp
        bcs +

          sta structActionStructEntry.GainedLevels,b,x
          lda $0574,b
          sta structActionStructEntry.GainedExperience,b,x
          bra ++
          
          +
          lda #0
          sta structActionStructEntry.GainedExperience,b,x
          sta structActionStructEntry.GainedLevels,b,x

        +
        lda structActionStructEntry.ObtainedItem,b,x
        bmi _End

          sta $0574,b
          jsl rlUnknown84B457

          lda structActionStructEntry.ObtainedItem,b,x
          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          jsl rlGetEffectiveItemIDByItemRAMStructEntry
          sta structActionStructEntry.ObtainedItem,b,x

        _End
        rts

        .databank 0

      rlRollForChance ; 84/EF9C

        .al
        .autsiz
        .databank ?

        pha
        jsl rlUnknown80A73A
        cmp #1,S
        pla
        rtl

        .databank 0

        ; 84/EFA5

    .here


    * = $04EFD4
    .logical $84EFD4

      rlGetSelectedUnitInventoryRAMPointer ; 84/EFD4

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.InventoryData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        tax
        rtl

        .databank 0

        ; 84EFE7

    .here





    * = $04F03E
    .logical $84F03E

      rlLoadEquipmentDataIntoSpecifiedInventory ; 84/F03E

        .al
        .autsiz
        .databank ?

        ; A = character rom pointer + equip offset

        phb
        php

        phk
        plb

        phx
        phy

        ldx $00
        phx
        ldx $02
        phx
        ldx $0574,b
        phx

        tay

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        sta $24+1
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        sta $24
        lda #size(structInventoryDataRAM.Slot)
        sta $00
        lda #1
        sta $02
        jsl rlBuildRAMStructHeader

        ldx #size(structCharacterEquipmentROMEntry)

        lda #0
        sta $0574,b
        jsl rlSaveEquippedInventorySlot

        sep #$20
        lda #`aCharacterData
        pha
        rep #$20
        plb

        ; Get equipment data
        -
        lda structCharacterEquipmentROMEntry.Equipment1,b,y
        and #$00FF
        cmp #$00FF
        beq +

          sta $0574,b
          jsl rlGiveItemToUnit

        +
        inc y
        dec x
        bne -

        jsl rlGetUnitType
        cmp #UnitTypeDynamic
        beq _End

          ; Handle unique equipment
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _End

            jsl rlCheckForValidUniqueItemOrDrops
            ora #0
            bne _End

            ; Nobody has it yet.
            jsl rlGetUnitType
            ora #UnitTypeStatic
            bne +
            bcs _End

              lda $0000,b,y
              and #$00FF
              sta $0574,b

            +
            jsl rlGiveItemToUnit

        _End
        jsl rlEquipFirstWeaponInInventory

        pla
        sta $0574,b
        pla
        sta $02
        pla
        sta $00

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGiveItemToUnit ; 84/F0E9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetUnitType
        asl
        tax
        jsr (aUnitTypeItemGivingPointers,x)

        plx
        plp
        plb
        rtl

        .databank 0

      aUnitTypeItemGivingPointers ; 84/F0FB

        .addr rsGivePlayerItemIDToSelectedUnit
        .addr rsGivePlayerItemIDToSelectedUnit
        .addr rsGiveItemToSelectedEnemyUnit
        .addr rsGiveItemToSelectedEnemyUnit

      rsGivePlayerItemIDToSelectedUnit ; 84/F103

        .al
        .autsiz
        .databank ?

        jsl rlGivePlayerItemIDToSelectedUnit
        rts

        .databank 0

      rsUnknown84F108 ; 84/F108

        .al
        .autsiz
        .databank ?

        lda $0574,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsl rlGetEffectiveItemIDByItemRAMStructEntry
        sta lStructPointer1,b
        bra +

      rsGiveItemToSelectedEnemyUnit ; 84/F118

        .al
        .autsiz
        .databank ?

        lda $0574,b
        sta lStructPointer1,b

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b

        jsl rlAppendNewStructEntry

        lda $0574,b
        jsl rlGetItemDataROMPointer
        jsr rsAddItemStatBonusIfRingByItemROMPointer
        rts

        .databank 0

      rlGivePlayerItemIDToSelectedUnit ; 84/F142

        .al
        .autsiz
        .databank ?

        ; $0574 = player item ID

        phb
        php
        phk
        plb
        phx

        lda $00
        pha
        lda $02
        pha
        lda $0574,b
        pha

        lda $0574,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex

        lda $0574,b
        sta lStructPointer1,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry
        bcs +

          ; successful
          lda #1 ; item state?
          sta $00
          lda wSelectedUnitDataRAMPointer,b
          sta $02
          jsl rlSaveOwnerToItemRAMEntry
          jsr rsAddItemStatBonusIfRingByItemRAMStructEntry
          jsl rlGetSelectedUnitInventoryRAMPointer

          lda structInventoryDataRAM.EquippedWeaponBitfield,b,x
          and #$00FF
          bne +

            jsl rlEquipFirstWeaponInInventory

        +
        pla
        sta $0574,b
        pla
        sta $02
        pla
        sta $00

        plx
        plp
        plb
        rtl

        .databank 0

      rsAddItemStatBonusIfRingByItemRAMStructEntry ; 84/F1A8

        .al
        .autsiz
        .databank ?

        jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry

      rsAddItemStatBonusIfRingByItemROMPointer ; 84/F1AC

        .al
        .autsiz
        .databank ?

        jsl rlGetItemEquipmentType
        cmp #EquipTypeRing
        bne +

          jsl rlGetItemStatBonus
          ora #0
          beq +

            tax
            lda aRingStatBonusTable,x
            jsl rlAddRingStatBonusToSelectedUnit

        +
        rts

        .databank 0

      rsRemoveItemStatBonusIfRing ; 84/F1C8

        .al
        .autsiz
        .databank ?

        jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry
        jsl rlGetItemEquipmentType
        cmp #EquipTypeRing
        bne +

          jsl rlGetItemStatBonus
          ora #0
          beq +

            tax
            lda aRingStatBonusTable,x
            jsl rlRemoveRingStatBonusFromSelectedUnit

        +
        rts

        .databank 0

      aRingStatBonusTable ; 84/F1E8

        .byte $00
        .byte $10
        .byte $40
        .byte $80
        .byte $08
        .byte $04
        .byte $02
        .byte $20

      rlGivePlayerItemIDToSelectedUnitsFirstItemSlot ; 84/F1F0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda $00
        pha
        lda $02
        pha

        lda $0574,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex

        lda $0574,b
        sta lStructPointer1,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlWriteToFirstStructEntry
        bcs +

          lda #1
          sta $00
          lda wSelectedUnitDataRAMPointer,b
          sta $02
          jsl rlSaveOwnerToItemRAMEntry
          jsr rsAddItemStatBonusIfRingByItemRAMStructEntry

        +
        pla
        sta $02
        pla
        sta $00
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84F23E ; 84/F23E

        .al
        .autsiz
        .databank ?

        ; A = inv slot

        phb
        phk
        plb
        phx
        ldx $0574,b
        phx

        sta wStructIndex,b
        sta $0574,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b

        jsl rlLoadRAMStructDataByIndex
        bcs +

        jsl rlUnknown82E493
        bcs +

        lda lStructPointer1,b
        and #$00FF
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsr rsRemoveItemStatBonusIfRing
        jsr rsUnknown84F288
        clc
        
        -
        plx
        stx $0574,b
        plx
        plb
        rtl
        
        +
        sec
        bra -

        .databank 0

      rsUnknown84F288 ; 84/F288

        .al
        .autsiz
        .databank ?

        ; $0574 = inventory slot

        phb
        phx
        ldx $0574,b
        dec x
        lda aUnknown84F2BE,x
        and #$00FF
        sta $0574,b

        jsl rlGetSelectedUnitInventoryRAMPointer
        lda structInventoryDataRAM.EquippedWeaponBitfield,b,x
        and #$00FF
        cmp $0574,b
        beq +
        bcs _End

          asl
          sep #$20
          sta structInventoryDataRAM.EquippedWeaponBitfield,b,x
          rep #$20
          bra _End

        +
        jsl rlEquipFirstWeaponInInventory
        jsl rlSaveEquippedWeaponStatBonus
        
        _End
        plx
        plb
        rts

        .databank 0

      aUnknown84F2BE ; 84/F2BE

        .byte $80 
        .byte $40 
        .byte $20 
        .byte $10 
        .byte $08 
        .byte $04 
        .byte $02 
        .byte $01 

      ; 84/F2C6



    .here





    * = $04F2FE
    .logical $84F2FE

      rlSaveEquippedInventorySlot ; 84/F2FE

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitInventoryRAMPointer

        sep #$20
        lda $000574
        sta structInventoryDataRAM.EquippedWeaponBitfield,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitInventorySize ; 84/F316

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlGetRAMStructCurrentStructCount
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetPlayerItemIndexByInventorySlot ; 84/F338

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        phx

        ora #0
        beq +

          sta wStructIndex,b

          jsl rlGetUnitType
          cmp #UnitTypeHoly
          bcs +

            ldx wSelectedUnitDataRAMPointer,b
            lda $7E0000+structCharacterDataRAM.InventoryData+1,x
            sta lStructPointer2+1,b
            lda $7E0000+structCharacterDataRAM.InventoryData,x
            clc
            adc #structInventoryDataRAM.CurrentStructCount
            sta lStructPointer2,b
            jsl rlLoadRAMStructDataByIndex
            bcs +

              lda lStructPointer1,b
              and #$00FF
              clc

              -
              plx
              plb
              rtl

        +
        lda #0
        sec
        bra -

        .databank 0

      rlGetItemRAMStructEntryByInventorySlot ; 84/F378

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        stz wCurrentItemDataRAMPointer,b

        jsl rlGetPlayerItemIndexByInventorySlot
        bcs +

          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          clc
        
        +
        plb
        rtl

        .databank 0

      rlGetItemIDByInventorySlot ; 84/F38B

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        sta $0585,b

        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs +

        lda $0585,b
        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs _End

        jsl rlGetEffectiveItemIDByItemRAMStructEntry

        _End
        plb
        rtl
        
        +
        stz wCurrentItemDataRAMPointer,b
        lda $0585,b
        jsl rlGetEnemyItemIndexByInventorySlot
        bra _End

        .databank 0

      rlGetItemROMDataByInventorySlot ; 84/F3B5

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = inventory slot, 1 indexed

        ; Returns the item ROM pointer in A and wCurrentItemDataRAMPointer

        phb
        php

        phk
        plb

        sta $0585,b

        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs _NotPlayer

        lda $0585,b
        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

          jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry

          -
          plp
          plb
          rtl
        
        +
        stz wCurrentItemDataROMPointer,b
        bra -

        _NotPlayer
        stz wCurrentItemDataRAMPointer,b
        lda $0585,b
        jsl rlGetEnemyItemDataByInventorySlot
        bra -
  
      rlGetEnemyItemIndexByInventorySlot ; 84/F3E6

        .al
        .autsiz
        .databank ?
        
        phb

        phk
        plb

        phx
        sta wStructIndex,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlLoadRAMStructDataByIndex
        bcs _End

          lda lStructPointer1,b
          and #$00FF
          cmp #$00FF
          beq +

            clc
        
        _End
        plx
        plb
        rtl

        +
        sec
        bra _End

        .databank 0

      rlGetEnemyItemDataByInventorySlot ; 84/F41A

        .al
        .autsiz
        .databank ?

        jsl rlGetEnemyItemIndexByInventorySlot
        bcs +

          jsl rlGetItemDataROMPointer

          -
          rtl

        +
        stz wCurrentItemDataROMPointer,b
        bra -

        .databank 0

      rlCheckIfWeaponEquipped ; 84/F42A

        .al
        .autsiz
        .databank `aEquippedWeaponBitfield

        phb

        phk
        plb

        phx
        phy

        ldx $00
        phx

        dec a
        tay
        lda aEquippedWeaponBitfield,y
        and #$00FF
        sta $00

        jsl rlGetSelectedUnitInventoryRAMPointer

        lda structInventoryDataRAM.EquippedWeaponBitfield,b,x
        and #$00FF
        bit $00
        beq +

        sec

        -
        plx
        stx $00
        ply
        plx
        plb
        rtl
        
        +
        clc
        bra -

        .databank 0

      aEquippedWeaponBitfield ; 84/F455

        .byte $80
        .byte $40
        .byte $20
        .byte $10
        .byte $08
        .byte $04
        .byte $02
        .byte $01

      rlFlagEquippedInventorySlotAndGetStatBonus ; 84/F45D

        .al
        .autsiz
        .databank ?

        ; A = inventory slot

        phb
        phk
        plb
        phx
        phy

        tay
        jsl rlCheckWeaponInInventorySlotEquippable
        bcc _SEC

        lda #0
        sta $0574,b
        jsl rlSaveEquippedInventorySlot

        jsl rlGetSelectedUnitInventoryRAMPointer

        sep #$20
        lda #$80
        
        -
        dec y
        beq +

        lsr
        bra -

        +
        ora structInventoryDataRAM.EquippedWeaponBitfield,b,x
        sta structInventoryDataRAM.EquippedWeaponBitfield,b,x
        rep #$20

        jsl rlSaveEquippedWeaponStatBonus

        clc
        
        -
        ply
        plx
        plb
        rtl
        
        _SEC
        sec
        bra -

        .databank 0

      rlGetItemDurabilityOfInventorySlot ; 84/F495

        .al
        .autsiz
        .databank ?

        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

        jsl rlGetItemCurrentDurability
        
        -
        rtl

        +
        lda #$FFFF
        bra -

        .databank 0

      rlGetFirstEquippableWeaponInInventory ; 84/F4A5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $0574,b
        pha
        lda $0576,b
        pha

        stz wCurrentItemDataROMPointer,b
        jsl rlGetSelectedUnitInventorySize
        inc a
        sta $0576,b
        jsl rlGetSelectedUnitInventoryRAMPointer

        lda $0000,b,x
        xba
        sta $0574,b

        ldx #1

        -
        asl $0574,b
        bcc +

          ; slot is filled
          txa
          jsl rlGetItemROMDataByInventorySlot
          jsl rlGetItemEquipmentType
          cmp #EquipTypeWeapon
          beq ++

            stz wCurrentItemDataROMPointer,b

        +
        inc x
        cpx $0576,b
        bcc -

        ldx #0

        +
        pla
        sta $0576,b
        pla
        sta $0574,b
        txa
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84F4F7 ; 84/F4F7

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $057E,b
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq +

          jsl rlGetItemMinimumRange
          sta $14
          jsl rlGetItemMaximumRange
          sta $16
          jsl rlGetSelectedUnitStates
          bit #$0400
          beq +

            inc $16

        +
        plp
        plb
        rtl

        .databank 0

      rlGetInventoryWeaponsRangeFlags ; 84/F521

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $14
        pha
        lda $04
        pha

        stz $14
        stz $04
        ldx #1

        _Loop
        txa
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _End

          jsl rlCheckItemObtainable
          bcc _Next

            jsl rlGetItemEquipmentType
            cmp #EquipTypeRing
            bcs _Next

              cmp #EquipTypeStaff
              beq +

                jsl rlCheckWeaponEquippable
                bcc _Next

                  jsl rlGetItemMinimumRange
                  jsr rsGetWeaponRangeFlags
                  tsb $14
                  jsl rlGetItemMaximumRange
                  jsr rsGetWeaponRangeFlags
                  tsb $14
                  bra _Next

              +
              jsl rlGetSelectedUnitStatus
              cmp #StatusSilence
              beq _Next

                jsl rlGetItemStaffEffect
                cmp #$000C
                bcc _Next

                  ; everything but silence, sleep, berserk and thief
                  jsl rlGetItemMinimumRange
                  jsr rsGetWeaponRangeFlags
                  tsb $04
                  jsl rlGetItemMaximumRange
                  jsr rsGetWeaponRangeFlags
                  tsb $04

          _Next
          inc x
          cpx #7+1+1
          bcc _Loop

        _End
        lda $14
        ldy $04

        plx
        stx $04
        plx
        stx $14
        plx
        plp
        plb
        rtl

        .databank 0

      rsGetWeaponRangeFlags ; 84/F5A3

        .al
        .autsiz
        .databank `aWeaponRangeFlags

        asl
        tay
        lda aWeaponRangeFlags,y
        rts

        .databank 0

      aWeaponRangeFlags ; 84/F5A9

        .word $0000
        .word $0001
        .word $0002
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0004

      rlGetCounterableWeaponSlot ; 84/F5BF

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = range

        ; Out:
        ; X = inv slot

        phb
        php
        phk
        plb
        phx
        ldx $0574,b
        phx

        sta $0574,b
        ldx #1
        
        -
        txa
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _Next

          jsl rlGetItemEquipmentType
          cmp #EquipTypeWeapon
          bne _Next

            jsl rlGetItemMinimumRange
            dec a
            cmp $0574,b
            bcs _Next

              jsl rlGetItemMaximumRange
              cmp $0574,b
              bcs +

                stz wCurrentItemDataROMPointer,b

        _Next
        inc x
        cpx #size(structInventoryDataRAM.Slot)+1
        bcc -

        jsl rlGetFirstEquippableWeaponInInventory
        bra ++
        
        +
        txa
        
        +
        plx
        stx $0574,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlCheckWeaponEquippable ; 84/F60C

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx

        lda wCurrentItemDataROMPointer,b
        beq _CLC

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne _CLC

        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitFemaleOnly
        bne +

          jsl rlGetSelectedUnitGender
          cmp #GenderFemale
          bne _CLC

        +
        jsl rlGetItemWeaponType
        tax
        cmp #WeaponTypeStaff
        bcc +

          ; Is magical weapon
          jsl rlGetItemMaxDurability2
          ora #0
          beq _CLC

          jsl rlGetSelectedUnitStatus
          cmp #StatusSilence
          beq _CLC

        +
        txa
        jsl rlGetSelectedUnitWeaponRank
        cmp #WeaponRankNone
        bcs _CLC

        sta $0574,b
        jsl rlGetItemWeaponRank
        ora #0
        bmi _HolyWeapon

        cmp $0574,b
        bmi _CLC

        ; Equippable
        sec
        
        -
        plx
        plb
        rtl
        
        _CLC
        clc
        bra -

        _HolyWeapon
        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        jsl rlGetItemMaxDurability1
        ora #0
        beq _SEC

        ldx #(size(aHolyBloodGrowthBoostsOffsets)/2)-1

        -
        txa
        jsl rlUnknown84A69F
        ora #0
        beq +

          jsr rsGetItemDataROMPointer
          cmp wCurrentItemDataROMPointer,b
          bne +

            txa
            jsl rlCheckForSpecifiedHolyBlood
            cmp #MajorHolyBlood
            bcs _SEC
        
        +
        dec x
        bpl -

        clc
        bra +
        
        _SEC
        sec
        
        +
        plx
        plb
        rtl

        .databank 0

      rsGetItemDataROMPointer ; 84/F6A8

        .al
        .autsiz
        .databank ?

        phx
        asl
        clc
        adc aMainDataOffsets.ItemDataOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.ItemDataOffsets
        adc #<>aMainDataOffsets
        plx
        rts

        .databank 0

      rlCheckStaffEquippable ; 84/F6BE

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx

        lda wCurrentItemDataROMPointer,b
        beq _CLC

          jsl rlGetSelectedUnitStatus
          cmp #StatusSilence
          beq _CLC

            jsl rlGetItemEquipmentType
            cmp #EquipTypeStaff
            bne _CLC

              jsl rlGetItemMaxDurability2
              ora #0
              beq _CLC

                lda #WeaponTypeStaff
                jsl rlGetSelectedUnitWeaponRank
                cmp #WeaponRankNone
                bcs _CLC

                  sta $0574,b
                  jsl rlGetItemWeaponRank
                  ora #0
                  bpl +

                    jml rlCheckWeaponEquippable._HolyWeapon

                  +
                  cmp $0574,b
                  bmi _CLC

                    sec

                    -
                    plx
                    plb
                    rtl

        _CLC
        clc
        bra -

        .databank 0

      rlCheckItemObtainable ; 84/F70A

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx
        lda wCurrentItemDataROMPointer,b
        beq _CLC

        jsl rlGetItemEquipmentType
        cmp #EquipTypeRing
        bcs _SEC

        cmp #EquipTypeWeapon
        bne +

        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitFemaleOnly
        bne +
        
        jsl rlGetSelectedUnitGender
        cmp #GenderFemale
        bne _CLC

        +
        jsl rlGetItemWeaponType
        jsl rlGetSelectedUnitWeaponRank
        sta $0574,b

        jsl rlGetItemWeaponRank
        ora #0
        bmi _SEC

        cmp $0574,b
        bmi _CLC

        _SEC
        sec

        -
        plx
        plb
        rtl

        _CLC
        clc
        bra -

        .databank 0

      rlCheckWeaponInInventorySlotEquippable ; 84/F753

        .al
        .autsiz
        .databank ?

        ; sec if true

        jsl rlGetItemROMDataByInventorySlot
        jsl rlCheckWeaponEquippable
        rtl

        .databank 0

        ; 84/F75C

    .here





    * = $04F939
    .logical $84F939

      rlEquipFirstWeaponInInventory ; 84/F939

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phy
        lda wCurrentItemDataROMPointer,b
        pha
        lda wCurrentItemDataRAMPointer,b
        pha

        lda #0
        sta $0574,b
        jsl rlSaveEquippedInventorySlot

        ldy #1

        -
        tya
        jsl rlFlagEquippedInventorySlotAndGetStatBonus
        bcc +

        inc y
        cpy #size(structInventoryDataRAM.Slot)+1
        bcc -

        sec
        
        -
        pla
        sta wCurrentItemDataRAMPointer,b
        pla
        sta wCurrentItemDataROMPointer,b
        ply
        plb
        rtl
        
        +
        clc
        bra -

        .databank 0

        ; 84/F96E

    .here






    * = $04F9F2
    .logical $84F9F2

      rlSaveEquippedWeaponStatBonus ; 84/F9F2

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        pha
        lda wCurrentItemDataRAMPointer,b
        pha

        jsl rlGetFirstEquippableWeaponInInventory

        lda wCurrentItemDataROMPointer,b
        beq +

        jsl rlGetItemStatBonus
        jsl rlSaveActiveWeaponStatBonus
        
        -
        pla
        sta wCurrentItemDataRAMPointer,b
        pla
        sta wCurrentItemDataROMPointer,b
        plp
        plb
        rtl

        +
        lda #0
        jsl rlSaveActiveWeaponStatBonus
        bra -

        .databank 0 

      rlGetUniqueEquipmentOrDrops ; 84/FA23

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        jsl rlGetSelectedUnitFaction
        ora #0
        beq _FA5D

        jsl rlGetSelectedUnitCharacterID
        jsl rlUnknown83F7C1
        jsl rlGetCharacterDataROMPointer
        tay
        lda structCharacterROMEntry.Type,b,y
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        cmp #UnitTypeDynamic
        beq _FA5D

        lda structStaticCharacterROMEntry.UniqueEquipment,b,y
        bra _End

        +
        lda structEnemyCharacterROMEntry.Drops,b,y

        _End
        and #$00FF
        ply
        plp
        plb
        rtl

        _FA5D
        lda #$00FF
        bra _End

        .databank 0

      rlCheckForValidUniqueItemOrDrops ; 84/FA62

        .al
        .autsiz
        .databank ?

        ; check if item is already on someone or has been handed out already?

        phb
        phk
        plb
        phx
        phy
        ldx $00
        phx
        ldx $02
        phx

        ldx #0
        jsl rlGetUniqueEquipmentOrDrops
        cmp #$00FF
        beq _FAB1

        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsl rlGetEffectiveItemIDByItemRAMStructEntry
        sta $0574,b

        ldy wCurrentItemDataRAMPointer,b
        ldx #1

        -
        txa
        jsl rlGetItemIDByInventorySlot
        bcs +

        ; Inventory slot is filled
        cmp $0574,b
        beq ++

        inc x
        bra -

        +
        ldx #0

        +
        sty wCurrentItemDataRAMPointer,b
        jsl rlGetItemRAMStateAndOwner

        ; check if item owner matches this unit
        lda $02
        cmp wSelectedUnitDataRAMPointer,b
        beq _FAB1

        ; check if item state? is 7
        lda $00
        cmp #7
        bne +

        _FAB1
        txa     
        clc

        -
        plx
        stx $02
        plx
        stx $00
        ply
        plx
        plb
        rtl

        +
        txa
        sec
        bra -

        .databank 0

        ; 84/FAC1

    .here







    * = $04FAFF
    .logical $84FAFF

      rlGetWeaponTriangleBonus ; 84/FAFF

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        xba
        and #$00FF
        asl
        tax
        lda aWeaponDisadvantageOffsets,x
        tax

        pla
        and #$00FF
        sta $0574,b

        -
        lda aWeaponDisadvantageOffsets,x
        and #$00FF
        cmp #$00FF
        beq +

        cmp $0574,b
        beq ++

        inc x
        bra -
        
        +
        lda #0
        
        -
        plx
        plp
        plb
        rtl

        +
        lda #20
        bra -

        .databank 0

      aWeaponDisadvantageOffsets ; 84/FB37

        .word <>aSwordWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aLanceWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aAxeWeaponDisdvantage     - aWeaponDisadvantageOffsets
        .word <>aBowWeaponDisdvantage     - aWeaponDisadvantageOffsets
        .word <>aStaffWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aFireWeaponDisdvantage    - aWeaponDisadvantageOffsets
        .word <>aThunderWeaponDisdvantage - aWeaponDisadvantageOffsets
        .word <>aWindWeaponDisdvantage    - aWeaponDisadvantageOffsets
        .word <>aLightWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aDarkWeaponDisdvantage    - aWeaponDisadvantageOffsets

      aSwordWeaponDisdvantage   .char WeaponTypeLance, -1
      aLanceWeaponDisdvantage   .char WeaponTypeAxe, -1
      aAxeWeaponDisdvantage     .char WeaponTypeSword, -1
      aBowWeaponDisdvantage     .char -1
      aStaffWeaponDisdvantage   .char -1
      aFireWeaponDisdvantage    .char WeaponTypeThunder, WeaponTypeLight, WeaponTypeDark, -1
      aThunderWeaponDisdvantage .char WeaponTypeWind, WeaponTypeLight, WeaponTypeDark, -1
      aWindWeaponDisdvantage    .char WeaponTypeFire, WeaponTypeLight, WeaponTypeDark, -1
      aLightWeaponDisdvantage   .char -1
      aDarkWeaponDisdvantage    .char -1

      rsGetEnemyTotalSpecifiedStat ; 84/FB61

        .al
        .autsiz
        .databank ?

        phx
        lda $50
        pha
        lda $52
        pha
        lda $4E
        pha

        lda $4C
        sta $4C
        jsl rlGetEnemyUnitConstantDataPointer
        lda $0006,b,x
        and #$00FF
        sta $4E
        jsl $80A096
        lda #100
        sta $52
        jsl $80A17E

        pla
        sta $4E

        lda $50
        clc
        adc $4E

        plx
        stx $52
        plx 
        stx $50
        plx
        rts

        .databank 0

      rlGetEnemyMaxHP ; 84/FB98

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4C
        pha
        lda $4E
        pha

        jsl rlGetEnemyClassHPGrowth
        sta $4C

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassBaseHP
        sta $4E

        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx $4E
        plx
        stx $4C
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyStrength ; 84/FBC0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4C
        pha
        lda $4E
        pha

        jsl rlGetEnemyClassStrGrowth
        sta $4C
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassStrength
        sta $4E
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx $4E
        plx
        stx $4C
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyMagic ; 84/FBE8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4C
        pha
        lda $4E
        pha

        jsl rlGetEnemyClassMagGrowth
        sta $4C
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMagic
        sta $4E
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx $4E
        plx
        stx $4C
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemySkill ; 84/FC10

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4C
        pha
        lda $4E
        pha

        jsl rlGetEnemyClassSklGrowth
        sta $4C
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSkill
        sta $4E
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx $4E
        plx
        stx $4C
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemySpeed ; 84/FC38

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4C
        pha
        lda $4E
        pha

        jsl rlGetEnemyClassSpdGrowth
        sta $4C
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSpeed
        sta $4E
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx $4E
        plx
        stx $4C
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyDefense ; 84/FC60

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4C
        pha
        lda $4E
        pha

        jsl rlGetEnemyClassDefGrowth
        sta $4C
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassDefense
        sta $4E
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx $4E
        plx
        stx $4C
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyResistance ; 84/FC88

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4C
        pha
        lda $4E
        pha

        jsl rlGetEnemyClassResGrowth
        sta $4C
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassResistance
        sta $4E
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx $4E
        plx
        stx $4C
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleMight ; 84/FCB0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        beq _End

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne _NoWeapon

        jsl rlGetItemMight
        sta $0574,b

        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSaveActiveWeaponStatBonus
        jsl rlGetItemWeaponType
        cmp #WeaponTypeFire
        bcs _MagicWeapon

        jsl rlGetSelectedUnitTotalStrength
        bra +

        _MagicWeapon
        jsl rlGetSelectedUnitTotalMagic
        
        +
        clc
        adc $0574,b
        sta $0574,b

        pla
        jsl rlSaveActiveWeaponStatBonus

        lda $0574,b
        
        _End
        plp
        plb
        rtl
        
        _NoWeapon
        lda #0
        bra _End

        .databank 0

      rlGetSelectedUnitBattleHit ; 84/FD00

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        beq _End

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne _FD47

        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSaveActiveWeaponStatBonus
        jsl rlGetItemAccuracy
        sta $0574,b

        jsl rlGetSelectedUnitTotalSkill
        asl
        clc
        adc $0574,b
        cmp #0
        bmi +
        bra ++
        
        +
        lda #0
        
        +
        sta $0574,b

        pla
        jsl rlSaveActiveWeaponStatBonus
        lda $0574,b
        
        _End
        plp
        plb
        rtl
        
        _FD47
        lda #$00FF
        bra _End

        .databank 0

      rlGetSelectedUnitBattleAvoid ; 84/FD4C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        sta $0574,b
        ora #0
        bpl +

          stz $0574,b
          bra _FD7B

        +
        jsl rlGetSelectedUnitTerrainAvoidPointer
        clc
        adc $0574,b
        tax
        lda $830000,x
        bit #$0080
        bne +

        and #$007F
        bra ++
        
        +
        ora #$FF80
        
        +
        sta $0574,b
        
        _FD7B
        jsl rlGetSelectedUnitLuck
        ora #0
        bmi +

          clc
          adc $0574,b
          sta $0574,b

        +
        jsl rlGetSelectedUnitBattleAttackSpeed
        asl
        clc
        adc $0574,b

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleCrit ; 84/FD98

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        beq _End

        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs +

          jsl rlGetItemRAMKillCountAndCritAbility
          bcc +

            sec
            sbc #50
            sta $0574,b
            bra _FDD4

        +
        stz $0574,b
        lda #SkillIDCritical
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs _FDD4

        jsl rlGetItemSkills
        bit #ItemSkillCritical
        bne _FDD4

        jsl rlUnknown87E513
        beq _End

        _FDD4
        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSaveActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalSkill
        clc
        adc $0574,b
        sta $0574,b

        pla
        jsl rlSaveActiveWeaponStatBonus
        lda $0574,b
        
        _End
        plp
        plb
        rtl

        .databank 0

        ; 84/FDF7



    .here



    * = $04FDFC
    .logical $84FDFC

      rlGetSelectedUnitBattleAttackSpeed ; 84/FDFC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $4E
        pha

        lda wCurrentItemDataROMPointer,b
        beq +

          jsl rlGetItemWeight

        +
        sta $4E

        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSaveActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalSpeed
        sec
        sbc $4E
        sta $4E

        pla
        jsl rlSaveActiveWeaponStatBonus
        lda $4E

        plx
        stx $4E
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleDefense ; 84/FE33

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        bne +

        jsl rlGetSelectedUnitTotalDefense
        bra ++
        
        +
        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSaveActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalDefense
        sta $0574,b

        pla
        jsl rlSaveActiveWeaponStatBonus

        lda $0574,b
        
        +
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleResistance ; 84/FE61

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        bne +

        jsl rlGetSelectedUnitTotalResistance
        bra ++
        
        +
        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSaveActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalResistance
        sta $0574,b

        pla
        jsl rlSaveActiveWeaponStatBonus

        lda $0574,b

        +
        plp
        plb
        rtl

        .databank 0

        ; 84/FE8F





    .here










    * = $06C55A
    .logical $86C55A

      rlUnknown86C55A ; 86/C55A

        .al
        .autsiz
        .databank ?

        phx
        phk
        plb
        pha
        asl
        clc
        adc #1,S
        tax
        pla

        sep #$20
        lda aUnknown86C784+2,x
        pha
        rep #$20
        plb
        lda aUnknown86C784,x
        tay
        plx
        rtl

        .databank 0

        ; 86/C575

    .here


    * = $06C784
    .logical $86C784

      aUnknown86C784 ; 86/C784

        ; all the faction data?

        .long $908243 ; $00
        .long $90825A ; $01
        .long $908267 ; $02
        .long $90828E ; $03
        .long $86CBE4 ; $04
        .long $86CBF1 ; $05
        .long $86CC06 ; $06
        .long $86CC1B ; $07
        .long $86CC36 ; $08
        .long $86CC48 ; $09
        .long $86D231 ; $0A
        .long $86D23E ; $0B
        .long $86D250 ; $0C
        .long $86D268 ; $0D
        .long $86D286 ; $0E
        .long $86D29E ; $0F
        .long $86D70D ; $10
        .long $86D71A ; $11
        .long $86D735 ; $12
        .long $86D759 ; $13
        .long $86D77A ; $14
        .long $86DD25 ; $15
        .long $86DD32 ; $16
        .long $86DD56 ; $17
        .long $86DD7D ; $18
        .long $86DD95 ; $19
        .long $86E5F5 ; $1A
        .long $86E602 ; $1B
        .long $86E626 ; $1C
        .long $86E638 ; $1D
        .long $86E650 ; $1E
        .long $86E662 ; $1F
        .long $86E670 ; $20
        .long $86E67E ; $21
        .long $86E68C ; $22
        .long $B2836B ; $23
        .long $B28378 ; $24
        .long $B28390 ; $25
        .long $B283BA ; $26
        .long $B283E4 ; $27
        .long $86ED47 ; $28
        .long $86ED54 ; $29
        .long $86ED6F ; $2A
        .long $86ED8D ; $2B
        .long $86EDA2 ; $2C
        .long $86F3B6 ; $2D
        .long $86F3C5 ; $2E
        .long $86F3EC ; $2F
        .long $86F41C ; $30
        .long $86F97B ; $31
        .long $86F988 ; $32
        .long $86F99D ; $33
        .long $86F9B5 ; $34
        .long $86F9D0 ; $35
        .long $B083ED ; $36
        .long $B08469 ; $37
        .long $B083FA ; $38
        .long $B08412 ; $39
        .long $B08427 ; $3A
        .long $B08448 ; $3B
        .long $B1AADD ; $3C
        .long $B1AAEA ; $3D
        .long $B1AB20 ; $3E
        .long $B1AB05 ; $3F
        .long $B1AB35 ; $40
        .long $B1AB47 ; $41
        .long $B1AB65 ; $42
        .long $B1AB73 ; $43
        .long $B283A5 ; $44
        .long $B283CF ; $45
        .long $86F404 ; $46
        .long $86EDC9 ; $47

        ; 86/C85C

    .here




    * = $07A19D
    .logical $87A19D

      rlCheckIfUnitHasSpecifiedPersonalOrClassSkill ; 87/A19D

        .al
        .autsiz
        .databank `aValidPersonalSkillTable

        ; A = skill ID

        phb
        php
        phk
        plb
        phx
        ldx $0574,b
        phx

        sta $0574,b

        lda $0574,b
        asl
        clc
        adc $0574,b
        tax
        jsl rlGetSelectedUnitSkills

        lda $0571,b
        bit aValidPersonalSkillTable,x
        bne +

        lda $0571+1,b
        bit aValidPersonalSkillTable+1,x
        bne +

        lda $0574,b
        asl
        tax
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSkills
        bit aValidClassSkillTable,x
        bne +

        plx
        stx $0574,b
        plx
        plp
        plb
        clc
        rtl

        +
        plx
        stx $0574,b
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      aValidPersonalSkillTable .block ; 87/A1EA

        .long 0                               ; SkillIDUnknown1
        .long 0                               ; SkillIDCanto
        .long 0                               ; SkillIDPavise
        .long UnitSkill1Wrath
        .long UnitSkill1Pursuit
        .long UnitSkill1Adept
        .long 0                               ; SkillIDSteal
        .long 0                               ; SkillIDUnknown2
        .long 0                               ; SkillIDDance
        .long 0                               ; SkillIDUnknown3
        .long 0                               ; SkillIDUnknown4
        .long UnitSkill1Dismount
        .long UnitSkill1Charm
        .long UnitSkill1Unknown2              ; SkillIDUnknown6
        .long UnitSkill1Nihil
        .long UnitSkill1Miracle
        .long UnitSkill2Critical << 8
        .long UnitSkill2Vantage  << 8
        .long UnitSkill2Accost   << 8
        .long UnitSkill2Astra    << 8
        .long UnitSkill2Luna     << 8
        .long UnitSkill2Sol      << 8
        .long UnitSkill2Holy     << 8
        .long UnitSkill2Darkness << 8
        .long UnitSkill3Renewal  << 16
        .long UnitSkill3Paragon  << 16
        .long UnitSkill3Unknown1 << 16        ; SkillIDUnknown7
        .long UnitSkill3Recover  << 16
        .long UnitSkill3Bargain  << 16
        .long UnitSkill3Return   << 16

      .bend

      aValidClassSkillTable .block ; 87/A244

        .word 0                       ; SkillIDUnknown1
        .word ClassSkillCanto
        .word ClassSkillPavise
        .word ClassSkillWrath
        .word ClassSkillPursuit
        .word ClassSkillAdept
        .word ClassSkillSteal
        .word ClassSkillUnknown1      ; SkillIDUnknown2
        .word ClassSkillDance
        .word ClassSkillUnknown2      ; SkillIDUnknown3
        .word ClassSkillUnknown3      ; SkillIDUnknown4
        .word ClassSkillDismount
        .word ClassSkillCharm
        .word 0                       ; SkillIDUnknown6
        .word 0                       ; SkillIDNihil
        .word 0                       ; SkillIDMiracle
        .word ClassSkillCritical
        .word 0                       ; SkillIDVantage
        .word 0                       ; SkillIDAccost
        .word 0                       ; SkillIDAstra
        .word 0                       ; SkillIDLuna
        .word 0                       ; SkillIDSol
        .word 0                       ; SkillIDHoly
        .word 0                       ; SkillIDDarkness
        .word 0                       ; SkillIDRenewal
        .word 0                       ; SkillIDParagon
        .word 0                       ; SkillIDUnknown7
        .word 0                       ; SkillIDRecover
        .word 0                       ; SkillIDBargain
        .word 0                       ; SkillIDReturn

      .bend

      aValidItemSkillTable .block; 87/A280

        .word 0                 ; SkillIDUnknown1
        .word ItemSkillCanto
        .word 0                 ; SkillIDPavise
        .word 0                 ; SkillIDWrath
        .word ItemSkillPursuit
        .word 0                 ; SkillIDAdept
        .word ItemSkillSteal
        .word 0                 ; SkillIDUnknown2
        .word 0                 ; SkillIDDance
        .word 0                 ; SkillIDUnknown3
        .word ItemSkillUnknown1 ; SkillIDUnknown4
        .word 0                 ; SkillIDDismount
        .word 0                 ; SkillIDCharm
        .word 0                 ; SkillIDUnknown6
        .word 0                 ; SkillIDNihil
        .word ItemSkillMiracle
        .word ItemSkillCritical
        .word 0                 ; SkillIDVantage
        .word 0                 ; SkillIDAccost
        .word 0                 ; SkillIDAstra
        .word 0                 ; SkillIDLuna
        .word 0                 ; SkillIDSol
        .word 0                 ; SkillIDHoly
        .word 0                 ; SkillIDDarkness
        .word ItemSkillRenewal
        .word ItemSkillParagon
        .word ItemSkillUnknown2 ; SkillIDUnknown7
        .word ItemSkillRecover
        .word ItemSkillBargain
        .word ItemSkillReturn

      .bend

      rlCheckIfUnitHasSpecifiedPersonalSkill ; 87/A2BC

        .al
        .autsiz
        .databank `aValidPersonalSkillTable

        ; A = skill ID

        phb
        phk
        plb
        phx
        ldx $0574,b
        phx

        sta $0574,b
        lda $0574,b
        asl
        clc
        adc $0574,b
        tax
        jsl rlGetSelectedUnitSkills

        lda $0571,b
        bit aValidPersonalSkillTable,x
        bne +

        lda $0571+1,b
        bit aValidPersonalSkillTable+1,x
        bne +

        clc

        -
        plx
        stx $0574,b
        plx
        plb
        rtl
        
        +
        sec
        bra -

        .databank 0

      rlCheckIfInventoryItemsHaveSpecifiedSkill ; 87/A2EF

        .al
        .autsiz
        .databank `aValidItemSkillTable

        phb
        php
        phk
        plb
        phx
        phy

        asl
        tax
        ldy #1

        -
        tya
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _CLC

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne +

          tya
          jsl rlCheckIfWeaponEquipped
          bcc ++

        +
        jsl rlGetItemSkills
        bit aValidItemSkillTable,x
        bne _SEC

        +
        inc y
        bra -

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

      rlDebugGetSkillList ; 87/A32C

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #0
        sta wDebugMenuSkillCounter

        ldx #size(aDebugMenuSkillFlags)-1
        lda #0

        -
        sta aDebugMenuSkillFlags,x
        dec x
        bpl -

        jsr rsDebugGetClassSkills
        jsr rsDebugGetPersonalSkills
        jsr rsDebugGetItemSkills
        plx

        plp
        plb
        rtl

        .databank 0

      rsDebugFlagSkillPossesstion ; 87/A352

        .al
        .autsiz
        .databank ?

        ; $00 = skill ID

        phx
        ldx $00
        lda aDebugMenuSkillFlags,x
        and #$00FF
        bne +

          sep #$20
          lda #1
          sta aDebugMenuSkillFlags,x
          rep #$20

          lda wDebugMenuSkillCounter
          inc a
          sta wDebugMenuSkillCounter

        +
        plx
        rts

        .databank 0

      rsDebugGetClassSkills ; 87/A373

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSkills
        ora #0
        beq _End

          sta $02

          lda #size(aDebugMenuSkillFlags)-1
          sta $00

          ldx #size(aValidClassSkillTable)-2

          -
          lda aValidClassSkillTable,x
          bit $02
          beq +

            jsr rsDebugFlagSkillPossesstion

          +
          dec $00
          dec x
          dec x
          bpl -

        _End
        rts

        .databank 0

      rsDebugGetPersonalSkills ; 87/A39C

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitSkills

        ; ora all skills together to see if we have minimum 1

        lda $0571,b
        ora $0572,b
        beq _End

          lda #size(aDebugMenuSkillFlags)-1
          sta $00

          ldx #size(aValidPersonalSkillTable)-3

          -
          lda aValidPersonalSkillTable,x
          bit $0571,b
          bne +

          lda aValidPersonalSkillTable+1,x
          bit $0571+1,b
          beq ++

            +
            jsr rsDebugFlagSkillPossesstion
          
          +
          dec $00
          dec x
          dec x
          dec x
          bpl -
        
        _End
        rts

        .databank 0

      rsDebugGetItemSkills ; 87/A3CD

        .al
        .autsiz
        .databank ?

        ldx #1
        
        _Loop
        txa
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer
        beq _End

          jsl rlGetItemEquipmentType
          cmp #EquipTypeWeapon
          bne +

            tya
            jsl rlCheckIfWeaponEquipped
            bcc _A411
          
          +
          jsl rlGetItemSkills
          ora #0
          beq _A411

          sta $02

          lda #size(aDebugMenuSkillFlags)-1
          sta $00

          phx
          ldx #size(aValidItemSkillTable)-2
          
          -
          lda aValidItemSkillTable,x
          bit $02
          beq +

            jsr rsDebugFlagSkillPossesstion

          +
          dec $00
          dec x
          dec x
          bpl -

          plx

          _A411
          inc x
          bra _Loop
        
        _End
        rts

        .databank 0

; 87/A415


    .here






    * = $07A438
    .logical $87A438

      rlGetPromotedClassIfAvailable ; 87/A438

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda #0
        sta $7E2000

        jsl rlGetSelectedUnitStates
        bit #$1000
        bne _SEC

        jsl rlGetSelectedUnitClassID
        sta $0574,b

        jsl rlGetSelectedUnitCharacterID
        dec a
        tax
        lda aPromotionTable,x
        and #$00FF
        cmp #$00FF
        beq _SEC

        cmp $0574,b
        beq _SEC

        jsl rlGetClassDataROMPointer
        jsl rlGetSelectedUnitLevel
        sta $0574,b

        jsl rlGetClassPromotionLevel
        dec a
        cmp $0574,b
        bpl +

          lda aPromotionTable,x
          sta $7E2000+2
          lda #1
          sta $7E2000

        +
        ply
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        _SEC
        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetClassDataROMPointer ; 87/A49D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        asl
        clc
        adc aMainDataOffsets.ClassDataOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.ClassDataOffsets
        adc #<>aMainDataOffsets
        sta wCurrentClassDataROMPointer,b
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassNamePointer ; 87/A4BC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        asl
        clc
        adc aMainDataOffsets.ClassNameOffsets
        tax
        lda #(`aMainDataOffsets)<<8
        sta $0571+1,b
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.ClassNameOffsets
        adc #<>aMainDataOffsets
        sta $0571,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetClassPromotionLevel ; 87/A4E1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.PromotionLevel,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassBaseHP ; 87/A4F9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.HP,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassStrength ; 87/A511

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Strength,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMagic ; 87/A529

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Magic,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSkill ; 87/A541

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Skill,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSpeed ; 87/A559

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Speed,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassDefense ; 87/A571

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Defense,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassResistance ; 87/A589

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Resistance,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassWeaponRank ; 87/A5A1

        .al
        .autsiz
        .databank ?

        ; A = weapon type

        phb
        php

        phk
        plb

        phx

        pha

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        pla
        clc
        adc wCurrentClassDataROMPointer,b
        tax
        lda structClassROMEntry.WeaponRanks,b,x
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetClassHPGrowth ; 87/A5C9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.HPGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassStrGrowth ; 87/A5E1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.StrengthGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMagGrowth ; 87/A5F9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.MagicGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSklGrowth ; 87/A611

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.SkillGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSpdGrowth ; 87/A629

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.SpeedGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassDefGrowth ; 87/A641

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.DefenseGrowth,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassResGrowth ; 87/A659

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.ResistanceGrowth,b,x 
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMovement ; 87/A671

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Movement,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMovementType ; 87/A689

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.MovementType,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassTerrainBonusType ; 87/A6A1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.TerrainBonusType,b,x 
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassMoney ; 87/A6B9

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Money,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetClassSkills ; 87/A6D1

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aClassData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentClassDataROMPointer,b
        lda structClassROMEntry.Skills,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rsFillChildExtendedPersonalData ; 87/A6E6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $00
        pha
        lda $02
        pha
        lda $06
        pha

        jsl rlGetSelectedUnitGender
        sta $06

        phy
        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData,x
        tay

        plx
        sep #$20
        lda $830000+structDynamicCharacterROMEntry.Class,x
        sta structExtendedPersonalCharacterDataRAM.Class,b,y
        lda $830000+structDynamicCharacterROMEntry.Level,x
        sta structExtendedPersonalCharacterDataRAM.Level,b,y
        lda #0
        sta structExtendedPersonalCharacterDataRAM.LeadershipStars,b,y
        sta structExtendedPersonalCharacterDataRAM.Experience,b,y
        rep #$20

        ; So... FE4 just autopromotes player units on spawn 
        ; if they are above the needed class promo level... why?
        jsl rlGetPromotedClassIfAvailable

        lda $7E2000
        beq +

          lda $7E2000+2
          jsl rlSetSelectedUnitClass

        +
        lda aMotherData._Personal.Money
        clc
        adc aFatherData._Personal.Money
        sta $18

        ; divide total money by 10
        lda #0
        adc #0
        sta $1A
        lda #10
        sta $1C
        stz $1E
        jsl $80A1D8

        lda $18
        clc
        adc #2000
        sta structExtendedPersonalCharacterDataRAM.Money,b,y

        jsl rlGetSelectedUnitLevel
        sta $00
        jsl rlGetSelectedUnitTotalHPGrowth
        jsr rlGetAverageStatsForLevel
        clc
        adc #15
        sta aChildAverageLevelStats.HP

        jsl rlGetSelectedUnitTotalStrGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Strength

        jsl rlGetSelectedUnitTotalMagGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Magic

        jsl rlGetSelectedUnitTotalSklGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Skill

        jsl rlGetSelectedUnitTotalSpdGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Speed

        jsl rlGetSelectedUnitTotalDefGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Defense

        jsl rlGetSelectedUnitTotalResGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Resistance

        jsl rlGetSelectedUnitTotalLuckGrowth
        jsr rlGetAverageStatsForLevel
        sta aChildAverageLevelStats.Luck

        phy
        ldx #0
        
        -
        lda aMotherData._Personal.HP,x
        sta $00
        lda aFatherData._Personal.HP,x
        sta $02
        lda aChildAverageLevelStats.HP,x
        sta $04
        jsr rlGetChildAdjustedBaseStat

        sep #$20
        sta structExtendedPersonalCharacterDataRAM.HP,b,y
        rep #$20
        inc x
        inc x
        inc y
        cpx #size(aChildAverageLevelStats)
        bcc -

        ; Add a random amount of 0-10 luck to a child
        ply
        lda #10
        jsl rlGetRandomNumber100
        inc a
        clc
        adc structExtendedPersonalCharacterDataRAM.Luck,b,y
        sta structExtendedPersonalCharacterDataRAM.Luck,b,y

        pla
        sta $06
        pla
        sta $02
        pla
        sta $00
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetAverageStatsForLevel ; 87/A80A

        .al
        .autsiz
        .databank ?

        stz $18
        cmp #101
        bcc +

        sec
        sbc #100
        sta $18

        lda #100
        
        +
        jsl rlUnknown80A899
        sta $14

        lda $18
        beq +

          jsl rlUnknown80A899
          clc
          adc $14
          sta $14

        +
        lda $00
        dec a
        xba
        sta $16
        jsl $80A0BA
        lda $1A
        rts

        .databank 0

      rlGetChildAdjustedBaseStat ; 87/A83A

        .al
        .autsiz
        .databank ?

        ; $06 = gender

        phb
        php
        phk
        plb
        lda $06
        beq _Male

        asl $00
        bra +
        
        _Male
        asl $02
        
        +
        lda $00
        clc
        adc $02
        sta $4204,b
        sep #$20
        lda #10
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
        clc
        adc $04
        plp
        plb
        rts

        .databank 0

      rlFillChildsConstantData ; 87/A869

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda $00
        pha
        lda $02
        pha
        lda $04
        pha
        lda $06
        pha
        lda $08
        pha

        phy

        ldx wSelectedUnitDataRAMPointer,b

        sep #$20
        lda $7E0000+structCharacterDataRAM.ConstantData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.ConstantData,x
        tay

        plx
        phx
        phy
        lda #structDynamicCharacterROMEntry.Equipment2-structDynamicCharacterROMEntry.CharacterID
        sta $04

        sep #$20

        -
        lda $830000+structDynamicCharacterROMEntry.CharacterID,x
        sta structCharacterConstantData.CharacterID,b,y
        inc x
        inc y
        dec $04
        bne -

        rep #$20
        ply
        lda aFatherData._ROM.CharacterID
        sep #$20
        sta structCharacterConstantData.FatherID,b,y
        rep #$20
        phy
        lda structCharacterConstantData.Gender,b,y
        and #$00FF
        sta $04

        ldx #structParentCharacterROMData.HPGrowth

        -
        lda aMotherData._ROM.HPGrowth - structParentCharacterROMData.HPGrowth,x
        sta $00
        lda aFatherData._ROM.HPGrowth - structParentCharacterROMData.HPGrowth,x
        sta $02
        jsr rlGetChildGrowthRate

        sep #$20
        sta structCharacterConstantData.HPGrowth,b,y
        rep #$20
        inc x
        inc x
        inc y
        cpx #size(structCharacterConstantData.Growths)*2 + structParentCharacterROMData.HPGrowth
        bcc -

        ply
        lda structCharacterConstantData.CharacterID,b,y
        sec
        sbc #Seliph
        sta $06

        asl
        clc
        adc $06
        tax
        lda aMotherData._ROM.Skills1
        ora aFatherData._ROM.Skills1
        and aValidInheritableSkills,x
        sta structCharacterConstantData.Skills1,b,y

        lda aMotherData._ROM.Skills2
        ora aFatherData._ROM.Skills2
        and aValidInheritableSkills+1,x
        sta structCharacterConstantData.Skills2,b,y

        plx
        lda $830000+structDynamicCharacterROMEntry.MajorInfluence,x
        and #$00FF
        beq +

        ; Father influence

        lda aMotherData._ROM.HolyBlood1
        sta $00
        lda aFatherData._ROM.HolyBlood1
        sta $02
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood1,b,y

        lda aMotherData._ROM.HolyBlood2
        sta $00
        lda aFatherData._ROM.HolyBlood2
        sta $02
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood2,b,y
        bra ++

        ; Mother influence
        +
        lda aFatherData._ROM.HolyBlood1
        sta $00
        lda aMotherData._ROM.HolyBlood1
        sta $02
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood1,b,y

        lda aFatherData._ROM.HolyBlood2
        sta $00
        lda aMotherData._ROM.HolyBlood2
        sta $02
        jsr rlGetChildHolyBlood
        sta structCharacterConstantData.HolyBlood2,b,y

        +
        pla
        sta $08
        pla
        sta $06
        pla
        sta $04
        pla
        sta $02
        pla
        sta $00

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aValidInheritableSkills .binclude "../tables/ValidInheritableSkills.asm"  ; 87/A975

      rlGetChildGrowthRate ; 87/A9EA

        .al
        .autsiz
        .databank ?

        ; In: 
        ; $00 = mother growth
        ; $02 = father growth
        ; $04 = gender

        ; if male: double father growth, add mother and halve the total
        ; if female: double mother growth, add father and halve the total

        lda $04
        beq +

        asl $00
        bra ++
        
        +
        asl $02
        
        +
        lda $00
        clc
        adc $02
        lsr
        rts

        .databank 0

      rlGetChildHolyBlood ; 87/A9FB

        .al
        .autsiz
        .databank ?

        ; $00 = minor blood influence
        ; $02 = major blood influence

        lda $00
        clc
        adc #$5555
        lsr
        and #$5555
        sta $00

        stz $04
        stz $06
        stz $08

        ldx #8

        -
        lsr $00
        ror $04
        lsr $00
        ror $04
        lsr $02
        ror $06
        lsr $02
        ror $06
        lsr $08
        lsr $08

        lda $04
        clc
        adc $06
        bcc +

          lda #$8000

        +
        and #$C000
        ora $08
        sta $08
        dec x
        bne -

        rts

        .databank 0

      rlInheritInventoryToChild ; 87/AA39

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsr rsUnknown87AAC9
        jsl rlGetSelectedUnitInventorySize
        sta $06

        lda #1
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq +

          jsl rlGetItemMight

        +
        sta $08

        ldx wSelectedUnitDataRAMPointer,b

        -
        lda $04
        sta wSelectedUnitDataRAMPointer,b
        lda #1
        jsl rlGetPlayerItemIndexByInventorySlot
        bcs +

          tay
          lda #1
          jsl rlUnknown84F23E
          tya
          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry
          stx wSelectedUnitDataRAMPointer,b
          jsr rsTryInheritItemToChild
          bra -
        
        +
        stx wSelectedUnitDataRAMPointer,b
        ldy #1

        ; Also inherit all the items that are in the supply
        -
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        sty wStructIndex,b
        jsl rlGetRAMStructEntryPointerByStructIndex
        bcs _End

          lda lStructPointer1,b
          sta $0587,b
          jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry
          jsl rlGetItemRAMStateAndOwner

          lda $02
          cmp $04
          bne +

          lda $00
          cmp #2
          bne +

            jsr rsTryInheritItemToChild
          
          +
          inc y
          bra -

        _End
        jsl rlEquipFirstWeaponInInventory
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsUnknown87AAC9 ; 87/AAC9

        .al
        .autsiz
        .databank ?

        ; $04 = major influence parent ram pointer

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        lda $04
        sta wSelectedUnitDataRAMPointer,b
        ldy #1

        -
        tya
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _InventoryDone

          jsr rsCheckForInheritableWeaponRank
          bcc +

            ; is a holy weapon
            tya
            jsl rlUnknown84F23E
            jsl rlGetItemRAMStateAndOwner
            cpx $02
            beq +

              jsl rlRevertItemAquirement
              bra -

          +
          inc y
          bra -


        _InventoryDone
        ldy #1

          _Loop
          lda $04
          sta wSelectedUnitDataRAMPointer,b
          tya
          jsl rlGetItemIDByInventorySlot
          bcs _End

          sta $00
          phy
          stx wSelectedUnitDataRAMPointer,b
          ldy #1

            -
            tya
            jsl rlGetItemIDByInventorySlot
            bcs _AB2C

              cmp $00
              bne +

                tya
                jsl rlUnknown84F23E
                jsl rlRevertItemAquirement
                bra _AB2C

            +
            inc y
            bra -

          _AB2C
          ply
          inc y
          bra _Loop
        
        _End
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        rts

        .databank 0

      rsCheckIfItemObtainableByType ; 87/AB36

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetItemEquipmentType
        asl
        tax
        jsr (aItemObtainChecksByType,x)
        plx
        rts

        .databank 0

      aItemObtainChecksByType ; 87/AB42

        .addr rsCheckWeaponOrStaffObtainable
        .addr rsCheckWeaponOrStaffObtainable
        .addr rsCheckRingObtainable
        .addr rsCheckRingObtainable

      rsCheckWeaponOrStaffObtainable ; 87/AB4A

        .al
        .autsiz
        .databank ?

        jsl rlCheckItemObtainable
        rts

        .databank 0

      rsCheckRingObtainable ; 87/AB4F

        .al
        .autsiz
        .databank ?

        sec
        rts

        .databank 0

      rsCheckForInheritableWeaponRank ; 87/AB51

        .al
        .autsiz
        .databank ?

        ; Special holy weapon = 1 and clc
        ; normal weapon = 0 and clc
        ; holy weapon = $FF and sec

        jsl rlGetItemIDByItemRAMStructEntry
        cmp #Forseti
        beq +

        cmp #ValkyrieStaff
        beq +

        cmp #Yewfelle
        beq +

        jsl rlGetItemWeaponRank
        ora #0
        bmi ++

        lda #0
        clc
        
        -
        rts
        
        +
        lda #1
        clc
        bra -
        
        +
        sec
        bra -

        .databank 0

      rsTryInheritItemToChild ; 87/AB7B

        .al
        .autsiz
        .databank ?

        jsr rsCheckForInheritableWeaponRank
        bcs _NotInheritable
        bne +

        jsr rsCheckIfItemObtainableByType
        bcc _NotInheritable

        lda $06
        cmp #size(structInventoryDataRAM.Slot)-1
        bcs _SendToUnitsSupply

        +
        inc $06

        jsl rlGetItemMight
        cmp $08
        bcc +

          sta $08
          sty $0574,b
          jsl rlGivePlayerItemIDToSelectedUnitsFirstItemSlot
          bra _End

        +
        sty $0574,b
        jsl rlGivePlayerItemIDToSelectedUnit
        bra _End

        _SendToUnitsSupply
        lda #2
        sta $00
        lda wSelectedUnitDataRAMPointer,b
        sta $02
        jsl rlSaveOwnerToItemRAMEntry
        bra _End
        
        _NotInheritable
        jsl rlRevertItemAquirement
        
        _End
        rts

        .databank 0

      rlGetUnitLoveBaseWithTarget ; 87/ABC1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx $00
        phx
        ldx $02
        phx

        jsl rlGetSelectedUnitNumber
        bcs _AC3E

        cmp #$10
        bcs +

          ; male unit
          jsl rlGetSelectedUnitLoverID
          sta $00
          lda $0574,b
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitLoverID
          asl
          sta $02
          bra ++

          ; female unit
          +
          jsl rlGetSelectedUnitLoverID
          asl
          sta $02
          lda $0574,b
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitLoverID
          sta $00

        +
        ldx $02
        lda aLoveBaseOffsets,x
        clc
        adc $00
        tax
        lda aLoveBaseOffsets,x
        and #$00FF
        cmp #$00FF
        beq ++

        cmp #$00FE
        beq +

        asl
        sta $00
        asl
        asl
        clc
        adc $00
        bra _End
        
        +
        lda #499
        bra _End

        +
        lda #$FFFF
        
        _End
        plx
        stx $02
        plx
        stx $00
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        _AC3E
        lda #0
        bra _End

        .databank 0

      rlGetSelectedUnitLoverData ; 87/AC43

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.LoverData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.LoverData,x
        tax
        rtl

        .databank 0

        ; 87AC56

    .here





    * = $07ACC2
    .logical $87ACC2

      rlUnknown87ACC2 ; 87/ACC2

        .al
        .autsiz
        .databank ?

        phx
        phy
        lda $0574,b
        pha

        jsl rlGetSelectedUnitCharacterID
        cmp #Gerrard
        bcs _Enemy

        sta $0574,b

        jsl rlGetSelectedUnitGender
        cmp #GenderMale
        bmi _Enemy
        bne _Female

        ; Male
        ldx #<>aMaleLoverIDs
        bra +

        _Female
        ldx #<>aFemaleLoverIDs
        
        +
        ldy #0
        
        -
        lda $830000,x
        bmi _End

        cmp $0574,b
        beq +

        inc y
        inc x
        inc x
        bra -
        
        _End
        plx
        stx $0574,b
        ply
        plx
        rtl
        
        +
        tya
        plx
        stx $0574,b
        ply
        plx
        rtl
        
        _Enemy
        lda #$FFFF
        bra _End

        .databank 0

      rlGetUnitLoveGrowthWithTarget ; 87/AD0E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx $00
        phx
        ldx $02
        phx

        jsl rlGetSelectedUnitNumber
        bcs _AD79

        cmp #16
        bcs +

        jsl rlGetSelectedUnitLoverID
        sta $00
        lda $0574,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitLoverID
        asl
        sta $02
        bra ++


        +
        jsl rlGetSelectedUnitLoverID
        asl
        sta $02
        lda $0574,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitLoverID
        sta $00
        
        +
        ldx $02
        lda aLoveGrowthOffsets,x
        clc
        adc $00
        tax
        lda aLoveGrowthOffsets,x
        bit #$0080
        bne +

        and #$007F
        bra _End
        
        +
        ora #$FF80
        
        _End
        plx
        stx $02
        plx
        stx $00
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx

        plp
        plb
        rtl
        
        _AD79
        lda #0
        bra _End

        .databank 0

      rlGetLoverPointsWithTarget ; 87/AD7E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        ldx $0574,b
        phx

        dec a
        asl
        sta $0574,b
        jsl rlGetSelectedUnitLoverData
        cpx #0
        beq +

          txa
          clc
          adc $0574,b
          tax
          lda $0000,b,x

        +
        plx 
        stx $0574,b

        plx
        plp
        plb
        rtl

        .databank 0

      rlSaveUnitLoveValueWithTarget ; 87/ADA6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx $00
        phx
        ldx $02
        phx

        sta $00
        ldy wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitNumber
        cmp #$10
        bcs +

          ; male
          dec a
          sta $02
          lda $0574,b
          sta wSelectedUnitDataRAMPointer,b
          bra ++
          
          ; female
          +
          lda $0574,b
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitNumber
          bcs _End

          dec a
          sta $02
          sty wSelectedUnitDataRAMPointer,b

        ; male number-1 in $02, female pointer in wSelectedUnitDataRAMPointer
        +
        jsl rlGetSelectedUnitLoverData
        cpx #0
        beq _End

          txa
          asl $02
          clc
          adc $02
          tax
          lda $00
          sta $0000,b,x

        _End
        plx
        stx $02
        plx
        stx $00
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/AE05


    .here




    * = $07BB50
    .logical $87BB50

      rlActionStructGetScriptedCritPossibility ; 87/BB50

        .al
        .autsiz
        .databank ?

        ; Out:
        ; 1 = sibling crit
        ; 2 = lover crit
        ; 3 = triangle attack

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha
        lda $14
        pha
        lda $16
        pha

        ldx $14
        lda aDeploymentTable._XPosition[0],x
        sta $14
        lda aDeploymentTable._YPosition[0],x
        sta $16

        lda #(`$7F654A)<<8
        sta $0571+1,b
        lda #<>$7F654A
        sta $0571,b
        jsl rlUnknown8483F3

        pla
        sta $16
        pla
        sta $14

        lda $14
        sta $00
        lda $16
        sta $02

        jsl rlGetUnitsDistance
        sta $1A

        ldx $14
        lda aDeploymentTable._XPosition[0],x
        sta $00
        lda aDeploymentTable._YPosition[0],x
        sta $02

        ldx $16
        lda aDeploymentTable._XPosition[0],x
        sec
        sbc $00
        clc
        adc #16
        sta $00
        lda aDeploymentTable._YPosition[0],x
        sec
        sbc $02
        clc
        adc #16
        asl
        asl
        asl
        asl
        asl
        clc
        adc $00
        tax

        lda $7F652A,x
        and #$00FF
        sta $04
        lda $7F6549,x
        and #$00FF
        sta $06
        lda $7F656A,x
        and #$00FF
        sta $08
        lda $7F654B,x
        and #$00FF
        sta $0A
        lda $7F673A
        and #$00FF
        sta $0C
        lda $7F6759
        and #$00FF
        sta $0E
        lda $7F677A
        and #$00FF
        sta $10
        lda $7F675B
        and #$00FF
        sta $12

        ldx $14
        lda $7E46EB,x
        sta wSelectedUnitDataRAMPointer,b

        ldy #$000E
        
        -
        lda $0004,b,y
        cmp #$00FF
        beq ++

        cmp $14
        beq +

        jsl rlUnknown84D4F5
        bcs ++
        
        +
        lda #$00FF
        sta $0004,b,y
        
        +
        dec y
        dec y
        bpl -

        lda $1A
        cmp #2
        bcs +

        jsr rsActionStructCheckForTriangleAttack
        lda #3
        bcs _End

        ; lover crit?
        +
        jsr rsUnknown87BC5C
        lda #2
        bcs _End

        jsr rsActionStructCheckForSiblingCrit
        lda #1
        bcs _End

        lda #0

        _End
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        .databank 0

      rsUnknown87BC5C ; 87/BC5C

        .al
        .autsiz
        .databank ?

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx $00
        phx

        jsl rlUnknown849635
        ora #0
        beq _CLC

          sta $00
          lda #$00FF
          sta $7F442A
          sta $7F442C
          sta $7F442E

          lda #0
          sta $18
          ldx #0
          ldy #6

          -
          lda $000C,b,y
          cmp #$00FF
          beq +

          phx
          tax
          lda $7E46EB,x
          sta wSelectedUnitDataRAMPointer,b
          plx
          jsl rlGetSelectedUnitNumber
          bcs +

            cmp $00
            bne +

              inc $18
              lda $000C,b,y
              sta $7F442A,x
              inc x
              inc x

          +
          dec y
          dec y
          bpl -

          lda $18
          beq _CLC

            plx
            stx $00
            plx 
            stx wSelectedUnitDataRAMPointer,b
            ply
            plx
            sec
            rts

        _CLC
        plx
        stx $00
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        clc
        rts

        .databank 0

      rsActionStructCheckForSiblingCrit ; 87/BCCF

        .al
        .autsiz
        .databank ?

        lda #(`aSiblingCritEntryPointers)<<8
        sta $24+1
        lda #<>aSiblingCritEntryPointers
        sta $24
        lda #1
        jsr rsCountUnitsInSpecialCombatEffectTable
        cmp #2
        bcc +

          sec
          rts

        +
        clc
        rts

        .databank 0

      aSiblingCritEntryPointers ; 87/BCE8

        .addr aSiblingCritEntry1
        .addr aSiblingCritEntry2
        .addr aSiblingCritEntry3
        .addr aSiblingCritEntry4
        .addr aSiblingCritEntry5
        .addr aSiblingCritEntry6
        .addr aSiblingCritEntry7
        .addr aSiblingCritEntry8
        .addr aSiblingCritEntry9
        .addr aSiblingCritEntry10
        .addr aSiblingCritEntry11
        .addr aSiblingCritEntry12
        .addr aSiblingCritEntry13
        .addr aSiblingCritEntry14
        .addr aSiblingCritEntry15
        .addr aSiblingCritEntry16
        .addr aSiblingCritEntry17
        .word 0

      aSiblingCritEntry1 ; 87/BD0C

        .word Sigurd
        .word Ethlyn
        .word 0

      aSiblingCritEntry2 ; 87/BD12

        .word Dalvin
        .word Creidne
        .word 0

      aSiblingCritEntry3 ; 87/BD18

        .word Scathach
        .word Larcei
        .word 0

      aSiblingCritEntry4 ; 87/BD1E

        .word Asaello
        .word Daisy
        .word 0

      aSiblingCritEntry5 ; 87/BD24

        .word Febail
        .word Patty
        .word 0

      aSiblingCritEntry6 ; 87/BD2A

        .word Leif
        .word Altena
        .word 0

      aSiblingCritEntry7 ; 87/BD30

        .word Charlot
        .word Laylea
        .word 0

      aSiblingCritEntry8 ; 87/BD36

        .word Coirpre
        .word Lene
        .word 0

      aSiblingCritEntry9 ; 87/BD3C

        .word Hawk
        .word Hermina
        .word 0

      aSiblingCritEntry10 ; 87/BD42

        .word Ced
        .word Fee
        .word 0

      aSiblingCritEntry11 ; 87/BD48

        .word Tristan
        .word Jeanne
        .word 0

      aSiblingCritEntry12 ; 87/BD4E

        .word Diarmuid
        .word Nanna
        .word 0

      aSiblingCritEntry13 ; 87/BD54

        .word Deimne
        .word Muirne
        .word 0

      aSiblingCritEntry14 ; 87/BD5A

        .word Lester
        .word Lana
        .word 0

      aSiblingCritEntry15 ; 87/BD60

        .word Amid
        .word Linda
        .word 0

      aSiblingCritEntry16 ; 87/BD66

        .word Arthur
        .word Tine
        .word 0

      aSiblingCritEntry17 ; 87/BD6C

        .word Brigid
        .word Edainn
        .word 0

      rsActionStructCheckForTriangleAttack ; 87/BD72

        .al
        .autsiz
        .databank ?

        lda #(`aTriangleAttackEntryPointers)<<8
        sta $24+1
        lda #<>aTriangleAttackEntryPointers
        sta $24
        lda #0
        jsr rsCountUnitsInSpecialCombatEffectTable
        cmp #3
        bcc +

          sec
          rts

        +
        clc
        rts

        .databank 0

      aTriangleAttackEntryPointers ; 87/BD8B

        .word <>aTriangleAttackEntry1
        .word <>aTriangleAttackEntry2
        .word <>aTriangleAttackEntry3
        .word 0

      aTriangleAttackEntry1 ; 87/BD93

        .word Banba1
        .word Fotla1
        .word Eriu1
        .word 0

      aTriangleAttackEntry2 ; 87/BD9B

        .word Banba2
        .word Fotla2
        .word Eriu2
        .word 0

      aTriangleAttackEntry3 ; 87/BDA3

        .word Meng
        .word Mabel
        .word Bleg
        .word 0

      rsCountUnitsInSpecialCombatEffectTable ; 87/BDAB

        .al
        .autsiz
        .databank ?

        ; $24 = long pointer to a pointer table

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx $02
        phx
        ldx $14
        phx
        ldx $16
        phx

        asl
        asl
        asl
        sta $14
        stz $18

        jsl rlGetSelectedUnitCharacterID
        sta $00

        jsr rsCheckIfUnitInSpecialCombatEffectTable
        bcs _End

          stx $02
          inc $18
          lda #$00FF
          sta $7F442A
          sta $7F442C
          sta $7F442E
          ldx #0
          ldy $14
          lda #4
          sta $16

          -
          lda $0004,b,y
          cmp #$00FF
          beq _Next

            phx
            tax
            lda $7E46EB,x
            sta wSelectedUnitDataRAMPointer,b
            plx

            jsl rlGetSelectedUnitCharacterID
            sta $00

            phx
            ldx $02
            jsr rsCheckIfUnitInSpecialCombatEffectEntry
            plx
            bcs _Next

              inc $18
              lda $0004,b,y
              sta $7F442A,x
              inc x
              inc x

          _Next
          inc y
          inc y
          dec $16
          bne -

        _End
        lda $18
        plx
        stx $16
        plx
        stx $14
        plx
        stx $02
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        rts

        .databank 0

      rsCheckIfUnitInSpecialCombatEffectTable ; 87/BE2D

        .al
        .autsiz
        .databank ?

        ; In:
        ; $00 = unit ID
        ; $24 = pointer table

        ; Out:
        ; x = entry pointer
        ; clc if found
        ; sec if not

        phb
        php
        phk
        plb
        phy

        ldy $24
        sep #$20
        lda $24+2
        pha
        rep #$20
        plb

        ; branch if end of table reached
        -
        lda $0000,b,y
        beq _SEC

        tax
        phx
        jsr rsCheckIfUnitInSpecialCombatEffectEntry
        plx
        bcc _CLC

        inc y
        inc y
        bra -

        _SEC
        ply
        plp
        plb
        sec

        -
        rts

        _CLC
        ply
        plp
        plb
        clc
        bra -

        .databank 0

      rsCheckIfUnitInSpecialCombatEffectEntry ; 87/BE58

        .al
        .autsiz
        .databank ?

        ; $00 = unit ID
        ; x = entry for triangle attack or sibling crit

        ; clc = is in table
        ; sec = is not

        -
        lda $0000,b,x
        beq _SEC

        cmp $00
        beq _CLC

        inc x
        inc x
        bra -

        _SEC
        sec
        bra +

        _CLC
        clc
        
        +
        rts 

        .databank 0

        ; 87/BE6A

    .here








    * = $07BE7C
    .logical $87BE7C

      rlUnknown87BE7C ; 87/BE7C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        pha
        lda #$6000
        trb $0D6F,b

        pla
        and #$0003
        xba
        lsr
        lsr
        lsr
        ora $0D70,b
        sta $0D70,b
        plp
        plb
        rtl

        .databank 0

        ; 87/BE98

    .here





    * = $07DF12
    .logical $87DF12

      rlInitiateItemRAMData ; 87/DF12

        .al
        .autsiz
        .databank ?

        ; $0571 = PlayerItemTable

        phb
        php

        phk
        plb

        ldx #size(aItemRAMData)-1
        sep #$20
        lda #0
        
        -
        sta aItemRAMData,x
        dec x
        bpl -

        rep #$20

        lda #(`aItemRAMData)<<8
        sta $24+1
        lda #<>aItemRAMData
        sta $24
        lda #len(aItemRAMData._Entry)
        sta $00
        lda #size(aItemRAMData._Entry[0])
        sta $02
        jsl rlBuildRAMStructHeader

        ldx $0571,b

        sep #$20
        lda $0571+2,b
        pha
        rep #$20
        plb

        -
        lda #7
        sta $00
        lda #0
        sta $02
        lda $0000,b,x
        cmp #$FFFF
        beq +

        and #$00FF
        jsl rlAppendNewItemRAMEntry
        inc x
        bra -

        ; Break Tyrfing from the get go
        +
        lda #PlayerItem27
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        bcs +

          lda #0
          jsl rlSetItemRAMStructEntryDurability

        +
        plp
        plb
        rtl

        .databank 0

      rlAppendNewItemRAMEntry ; 87/DF79

        .al
        .autsiz
        .databank ?

        ; A = item ID

        phb
        php

        phk
        plb

        sta $7E2000+structItemRAMEntry.ItemID

        lda $00
        cmp #5
        beq +

          lda $7E2000+structItemRAMEntry.ItemID
          and #$00FF
          jsl rlGetItemDataROMPointer
          jsl rlGetItemMaxDurability2
          sep #$20
          sta $7E2000+structItemRAMEntry.Durability
          bra ++

        +
        sep #$20
        lda #0
        sta $7E2000+structItemRAMEntry.Durability

        +
        lda $00
        sta $7E2000+structItemRAMEntry.Unknown1
        lda #0
        sta $7E2000+structItemRAMEntry.KillCount
        rep #$20

        lda $02
        sta $7E2000+structItemRAMEntry.Owner

        ; Dest
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b

        ; source
        lda #(`$7E2000)<<8
        sta lStructPointer1+1,b
        lda #<>$7E2000
        sta lStructPointer1,b

        jsl rlAppendNewStructEntry

        plp
        plb
        rtl

        .databank 0

        ; 87/DFDA


    .here






    * = $07E01E
    .logical $87E01E

      rlGetItemRAMStructEntryByPlayerItemIndex ; 87/E01E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        sta wStructIndex,b

        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        jsl rlGetRAMStructEntryPointerByStructIndex
        bcs +

          lda lStructPointer1,b
          sta wCurrentItemDataRAMPointer,b
          plp
          plb
          clc

          -
          rtl

        +
        stz wCurrentItemDataRAMPointer,b
        plp
        plb
        sec
        bra -

        .databank 0

      rlLoadItemRAMDataByIndex ; 87/E049

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        sta wStructIndex,b
        lda #(`aItemRAMData)<<8
        sta lStructPointer2+1,b
        lda #<>aItemRAMData
        sta lStructPointer2,b
        jsl rlLoadRAMStructDataByIndex

        plp
        plb
        rtl

        .databank 0

      rlGetEffectiveItemIDByItemRAMStructEntry ; 87/E063

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.Durability,b,x
        and #$00FF
        bne +

        jsr rsGetBrokenWeaponID
        bra ++
        
        +
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemIDByItemRAMStructEntry ; 87/E088

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEffectiveItemROMPointerByItemRAMStructEntry ; 87/E0A0

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx

        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.Durability,b,x
        and #$00FF
        bne +

          jsr rsGetBrokenWeaponID
          bra ++

        +
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        
        +
        jsl rlGetItemDataROMPointer

        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemROMPointerByItemRAMStructEntry ; 87/E0C9

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        jsl rlGetItemDataROMPointer
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemCurrentDurability ; 87/E0E5

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.Durability,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlReduceItemCurrentDurability ; 87/E0FD

        .al
        .autsiz
        .databank ?

        ; Return clc if broken, sec if not

        phb
        phx
        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        ldx wCurrentItemDataRAMPointer,b
        sep #$20
        lda structItemRAMEntry.Durability,b,x
        beq _Broken

        dec a
        sta structItemRAMEntry.Durability,b,x
        bne _Broken

        rep #$20
        sec
        bra +
        
        _Broken
        rep #$20
        clc

        +
        plx
        plb
        rtl

        .databank 0

      rlSetItemRAMStructEntryDurability ; 87/E122

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        pha

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        ldx wCurrentItemDataRAMPointer,b

        pla
        sep #$20
        sta structItemRAMEntry.Durability,b,x

        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemRAMKillCountAndCritAbility ; 87/E13D

        .al
        .autsiz
        .databank ?

        ; sec if able to crit due to kills
        ; clc if not
        ; kills in A

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        beq +

        lda structItemRAMEntry.KillCount,b,x
        and #$00FF
        cmp #50
        bcs ++

        +
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        +
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlAddToItemRAMKillCount ; 87/E163

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        ldx wCurrentItemDataRAMPointer,b
        pla
        sep #$20
        clc
        adc structItemRAMEntry.KillCount,b,x
        cmp #100
        bcc +

          lda #100
        
        +
        sta structItemRAMEntry.KillCount,b,x
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemRAMStateAndOwner ; 87/E188

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        lda structItemRAMEntry.Unknown1,b,x
        and #$00FF
        sta $00
        lda structItemRAMEntry.Owner,b,x
        sta $02
        plx

        plp
        plb
        rtl

        .databank 0

      rlSaveOwnerToItemRAMEntry ; 87/E1A7

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        sep #$20
        lda $00
        sta structItemRAMEntry.Unknown1,b,x
        rep #$20

        lda $02
        sta structItemRAMEntry.Owner,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlRevertItemAquirement ; 87/E1C7

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemRAMData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataRAMPointer,b
        sep #$20
        lda #7
        sta structItemRAMEntry.Unknown1,b,x

        rep #$20
        lda #0
        sta structItemRAMEntry.Owner,b,x

        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        jsl rlGetItemDataROMPointer
        jsl rlGetItemMaxDurability2
        sep #$20
        sta structItemRAMEntry.Durability,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/E1FD

    .here




    * = $07E2B1
    .logical $87E2B1

      rsGetBrokenWeaponID ; 87/E2B1

        .al
        .autsiz
        .databank ?

        phx
        lda structItemRAMEntry.ItemID,b,x
        and #$00FF
        jsl rlGetItemDataROMPointer

        jsl rlGetItemWeaponRank
        inc a
        sta $0585,b

        jsl rlGetItemWeaponType
        asl
        tax

        lda aBrokenWeaponOffsets,x
        clc
        adc $0585,b
        tax

        lda aBrokenWeaponOffsets,x
        and #$00FF

        plx
        rts

        .databank 0

      aBrokenWeaponOffsets .include "../tables/BrokenWeaponOffsets.csv.asm" ; 87/E2DC
      aBrokenWeaponData .binclude "../tables/BrokenWeaponData.csv.asm"      ; 87/E2F0

      rlGetItemNamePointerByItemID ; 87/E314

        .al
        .autsiz
        .databank ?

        jsl rlGetItemDataROMPointer
        jsl rlGetItemNamePointer
        rtl

        .databank 0

      rlGetItemDataROMPointer ; 87/E31D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        cmp #0
        bmi +

          asl
          clc
          adc aMainDataOffsets.ItemDataOffsets
          tax
          lda aMainDataOffsets,x
          clc
          adc aMainDataOffsets.ItemDataOffsets
          adc #<>aMainDataOffsets
          sta wCurrentItemDataROMPointer,b

          -
          plx
          plp
          plb
          rtl

        +
        stz wCurrentItemDataROMPointer,b
        bra -

        .databank 0

      rlGetItemNamePointer ; 87/E346

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aMainDataOffsets.ItemNameOffsets
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

          lda structItemROMEntry.Name,b,x
          and #$00FF
          asl
          clc
          adc aMainDataOffsets.ItemNameOffsets
          tax
          lda #(`aMainDataOffsets)<<8
          sta $0571+1,b
          lda aMainDataOffsets,x
          clc
          adc aMainDataOffsets.ItemNameOffsets
          adc #<>aMainDataOffsets
          sta $0571,b

          -
          plx
          plp
          plb
          rtl
        
        +
        lda #(`aDummyItemName)<<8
        sta $0571+1,b
        lda #<>aDummyItemName
        sta $0571,b
        bra -

        .databank 0

      aDummyItemName ; 87/E38A

        .text "　\n"

        ; 87/E38E

    .here









    * = $07E38E
    .logical $87E38E

      rlGetItemEquipmentType ; 87/E38E

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structWeaponStaffROMEntry.EquipmentType,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemMaxDurability1 ; 87/E3A6

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.Durability,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemMaxDurability2 ; 87/E3BE

        .al
        .autsiz
        .databank ?

        ; Identical to the previous one

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.Durability,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

        ; 87/E3D6


    .here


    * = $07E3EB
    .logical $87E3EB

      rlGetItemStatBonus ; 87/E3EB

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.StatBonuses,b,x
        and #$00FF
        
        -
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        bra -

        .databank 0

      rlGetItemStaffEffect ; 87/E40A

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.StaffEffect,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemWeaponRank ; 87/E422

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structWeaponStaffROMEntry.WeaponRank,b,x
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemSkills ; 87/E444

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structWeaponStaffROMEntry.Skills,b,x
        plx

        plp
        plb
        rtl

        .databank 0

        ; 87/E459

    .here























    * = $07E48D
    .logical $87E48D

      rlGetItemWeaponType ; 87/E48D

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

          lda structItemROMEntry.EquipmentType,b,x
          and #$00FF
          cmp #EquipTypeRing
          bcs +

            lda structWeaponStaffROMEntry.WeaponType,b,x
            and #$00FF

            plx

            plp
            plb
            rtl

        +
        lda #0

        plx

        plp
        plb
        rtl

        .databank 0

      rlGetItemMight ; 87/E4B9

        .al
        .autsiz
        .databank ?

        phb
        php
        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

          lda structItemROMEntry.EquipmentType,b,x
          and #$00FF
          cmp #EquipTypeRing
          bcs +

            lda structWeaponStaffROMEntry.Might,b,x
            and #$00FF
            plx
            plp
            plb

            -
            rtl

        +
        lda #0
        plx
        plp
        plb
        bra -

        .databank 0

      rlGetItemAccuracy ; 87/E4E6

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.Accuracy,b,x
        and #$00FF
        plx
        plp
        plb
        
        -
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        bra -

        .databank 0

      rlUnknown87E513 ; 87/E513

        .al
        .autsiz
        .databank ?

        lda #0
        rtl

        .databank 0

      rlGetItemWeight ; 87/E517

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #2
        bcs +

        lda structWeaponStaffROMEntry.Weight,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemMinimumRange ; 87/E543

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.MinRange,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemMaximumRange ; 87/E56F

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        beq +

        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.MaxRange,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemEffectiveness ; 87/E59B

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.Effectiveness,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87E5C5 ; 87/E5C5

        .al
        .autsiz
        .databank ?

        ; This routine tries its hardest to be recursive...

        phb
        php
        phk
        plb
        phx
        jsl rlUnknown87E5C5
        ora #0
        beq +

        lda #1

        -
        lsr $0585,b
        bcs +

        inc a
        bra -

        +
        asl
        tax
        lda #>`aWeaponEffectivenessTextPointers
        sta $0571+1,b
        lda aWeaponEffectivenessTextPointers,x
        sta $0571,b
        plx
        plp
        plb
        rtl

        .databank 0

      aWeaponEffectivenessTextPointers ; 87/E5F1

        .addr aWeaponEffectivenessNoneText
        .addr aWeaponEffectivenessCavalierText
        .addr aWeaponEffectivenessFlierText
        .addr aWeaponEffectivenessDragonText
        .addr aWeaponEffectivenessKnightText
        .addr aWeaponEffectivenessMageText

      aWeaponEffectivenessNoneText      .text "\n"        ; 87/E5FD
      aWeaponEffectivenessCavalierText  .text "ナイト系\n"  ; 87/E5FF
      aWeaponEffectivenessFlierText     .text "ひこう系\n"  ; 87/E609
      aWeaponEffectivenessDragonText    .text "ドラゴン系\n" ; 87/E613
      aWeaponEffectivenessKnightText    .text "アーマー系\n" ; 87/E61F
      aWeaponEffectivenessMageText      .text "マージ系\n"  ; 87/E62B

      rlGetItemWeaponTraits ; 87/E635

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.Traits,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetItemAlternateID ; 87/E65F

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        phx
        ldx wCurrentItemDataROMPointer,b
        lda structItemROMEntry.EquipmentType,b,x
        and #$00FF
        cmp #EquipTypeRing
        bcs +

        lda structWeaponStaffROMEntry.AlternateID,b,x
        and #$00FF
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/E689

    .here




    * = $07E98D
    .logical $87E98D

      rlUnknown87E98D ; 87/E98D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx $4E
        phx
        ldx $4C
        phx

        sta $4E
        jsl $81B494
        sta $4C
        tax
        lda $0000,b,x
        and #$00FF
        cmp $4E
        beq +
        bcc +

        lda $4E
        asl
        clc
        adc $4C
        tax
        lda $0001,b,x
        sta $0590,b

        pla
        sta $4C
        pla
        sta $4E
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        +
        pla
        sta $4C
        pla
        sta $4E
        plx
        plp
        plb
        sec
        bra -

        .databank 0

        ; 87/E9D1

    .here




    * = $07EB24
    .logical $87EB24

      rlUnknown87EB24 ; 87/EB24

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $06
        pha
        lda $04
        pha

        lda $0D6C,b ; eg $81DF
        beq _End

        jsl $81B494 ; gets $81E9

        tay
        stz $04
        lda $0000,b,y
        and #$00FF
        sta $06
        
        -
        ldx $0001,b,y
        stx $0590,b
        jsl rlUnknown87EC78
        cmp #0
        bne +

        lda $0590,b
        sta $04

        +
        inc y
        inc y
        dec $06
        bne -

        lda $04
        sta $0590,b
        
        _End
        pla
        sta $04
        pla
        sta $06
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/EB6E

    .here





    * = $07EC42
    .logical $87EC42

      rlUnknown87EC42 ; 87/EC42

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx $0590,b

        sep #$20
        lda $0D6C+2,b
        pha
        rep #$20
        plb

        lda $0000,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

    .here





    * = $07EC78
    .logical $87EC78

      rlUnknown87EC78 ; 87/EC78

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx $0590,b

        sep #$20
        lda $0D6C+2,b
        pha
        rep #$20
        plb

        lda $0002,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/EC93

    .here



    * = $07ED7F
    .logical $87ED7F

      rlUnknown87ED7F ; 87/ED7F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda $00
        pha

        ldx #$002E
        lda #$FFFF
        
        -
        sta $7E4E75,x
        dec x
        dec x
        bpl -

        jsl rlUnknown87EC42
        sta $00

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b
        ldx #0
        ldy #1

        -
        sty $0550,b
        jsl rlLoadRAMStructDataByIndex
        bcs _End

        lda lStructPointer1,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlUnknown8496DA
        cmp $00
        bne +

        jsl rlGetSelectedUnitStates
        bit #(UnitStateFielded | UnitStateDead)
        bne +

        jsl rlUnknown84966B
        bcs +

        jsl rlUnknown84966B
        bcs +

        sta $7E4E75,x
        inc x
        inc x

        +
        inc y
        bra -

        _End
        pla
        sta $00
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/EDEB

    .here




    * = $07EE56
    .logical $87EE56

      rlUnknown87EE56 ; 87/EE56

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown87EC42
        tax
        sep #$20
        lda $7E4E45,x
        and #~($80)
        sta $7E4E45,x
        rep #$20
        plx
        rtl

        .databank 0

        ; 87EE6C

    .here




    * = $07F515
    .logical $87F515

      rlUnknown87F515 ; 87/F515

        .al
        .autsiz
        .databank ?

        phb
        phx
        phy
        tay

        lda #(`aUnitRAMArea)<<8
        sta $24+1
        lda #<>aUnitRAMArea
        sta $24
        jsl rlBackupAndLoadNewRAMAreaPointer

        lda #$0013
        jsl rlAllocateRAMArea

        lda $39
        sta wSelectedUnitDataRAMPointer,b

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b

        lda $39
        sta lStructPointer1,b
        jsl rlAppendNewStructEntry

        tya
        jsr $87F55A
        jsr $87FABC
        jsr $87FB94
        jsl $82EFA0

        ply
        plx
        plb
        rtl

        .databank 0

        ; 87/F559

    .here


    * = $0990DA
    .logical $8990DA

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
        asl
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

        ; 89/9109

    .here




    * = $099119
    .logical $899119

      rlClearTilemapRect ; 89/9119

        .al
        .autsiz
        .databank ?

        ; In:
        ; X = coord
        ; Y = width
        ; A = height

        stx $00
        sty $02
        sty $06
        sta $04

        -
        lda #$00FF
        sta $7E8388,x
        inc x
        inc x
        dec $02
        bne -

        lda $00
        clc
        adc #$0040
        sta $00
        tax 
        lda $06
        sta $02
        dec $04
        bne -

        rtl

        .databank 0

        ; 899140

    .here













    * = $099FDC
    .logical $899FDC

      rlUnknown899FDC ; 89/9FDC

        .al
        .autsiz
        .databank ?

        ; DMA background and border tiles based on index $0756
        ; Also gets palette
        ; Different backgrounds were probably planned at some point
        ; but regardless of the index, the code is always the same 

        lda $0756,b
        asl
        tax
        jsr (aUnknown899FEB,x)
        lda #0
        sta $0100,b
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

          .dstruct structDMAToVRAM, $DD72B0, $0600, $80, $6000

        ldx #$001E
        
        -
        lda $DE0000,x
        sta $0100,b,x
        dec x
        dec x
        bpl -

        rts

        .databank 0

      rsUnknown89A00F ; 89/A00F

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .dstruct structDMAToVRAM, $DD72B0, $0600, $80, $6000

        ldx #$001E
        
        -
        lda $DE0000,x
        sta $0100,b,x
        dec x
        dec x
        bpl -

        rts

        .databank 0

      rsUnknown89A02B ; 89/A02B

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .dstruct structDMAToVRAM, $DD72B0, $0600, $80, $6000

        ldx #$001E
        
        -
        lda $DE0000,x
        sta $0100,b,x
        dec x
        dec x
        bpl -

        rts

        .databank 0

      rsUnknown89A047 ; 89/A047

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .dstruct structDMAToVRAM, $DD72B0, $0600, $80, $6000

        ldx #$001E
        
        -
        lda $DE0000,x
        sta $0100,b,x
        dec x
        dec x
        bpl -

        rts

        .databank 0

        ; 89/A063


    .here







    * = $09A150
    .logical $89A150

      rlUnknown89A150 ; 89/A150

        .al
        .autsiz
        .databank ?

        ; portrait stuff for research

        ; A = portrait ID

        jsl rlUnknown8AB317

        lda #$0800
        sta $00

        txa
        asl
        tay
        lda #$6200
        sta $02
        phx
        jsl $80A58C

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
        jsl rlGetPortraitID
        cmp #$00F3
        beq +

          lda #$35AD
          sta $029C,b
        
        +
        rtl

        .databank 0

        ; 89/A18C

    .here
























    * = $0AB317
    .logical $8AB317

      rlUnknown8AB317 ; 8A/B317

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phk
        plb
        sta $078C,b
        cpx #0
        bne +

        jsl rlGetPortraitID
        jsr rlCheckIfUsingClassPortrait
        sta $00

        clc
        adc $00
        clc
        adc $00
        tax
        lda $8AB4F9,x   ; portrait pointer table
        sta $65
        lda $8AB4F9+1,x
        sta $65+1

        lda #(`$7E8B88)<<8
        sta $6A+1
        lda #<>$7E8B88
        clc
        adc #$4000
        sta $6A

        phx
        jsl $95A3FB
        plx

        lda #(`$7E8B88)<<8
        sta $24+1
        lda #<>$7E8B88
        sta $24

        lda $24
        clc
        adc #$4000
        sta $24
        bra ++

        +
        jsl rlGetPortraitID
        jsr rlCheckIfUsingClassPortrait
        sta $00

        clc
        adc $00
        clc
        adc $00
        tax
        lda $8AB4F9,x
        sta $65
        lda $8AB4F9+1,x
        sta $65+1

        lda #(`$7E8B88)<<8
        sta $6A+1
        lda #<>$7E8B88
        clc
        adc #$4800
        sta $6A

        phx
        jsl $95A3FB
        plx

        lda #(`$7E8B88)<<8
        sta $24+1
        lda #<>$7E8B88
        sta $24

        lda $24
        clc
        adc #$4800
        sta $24

        +
        lda $8AB7E1+1,x
        sta $27+1
        lda $8AB7E1,x
        sta $27

        plp
        plb
        rtl

        .databank 0

        ; 8A/B3BA


    .here




    * = $0AB3E8
    .logical $8AB3E8

      rlCheckIfUsingClassPortrait ; 8A/B3E8

        .al
        .autsiz
        .databank ?

        cmp #$00F3
        beq +

          rts
        
        +
        lda $078C,b
        jsl $84852E
        phx
        asl
        tax
        lda $8B9FF8,x
        plx
        rts

        .databank 0

        ; 8AB3FE

    .here





    * = $01AD1C
    .logical $C1AD1C

      rlUnknownC1AD1C ; C1/AD1C

        .al
        .autsiz
        .databank ?

        ; Stuff for looking at a units inv?
        ; Changed short pointer gets into the debug menu

        lda #$BBD9
        sta $D7

        lda #7
        sta $0304,b
        rts

        .databank 0

        ; C1/AD28

    .here




    * = $1E44C0
    .logical $DE44C0

      g4bppVariousMenuIcons .binary "../graphics/VariousMenuIcons.4bpp"

    .here




    * = $099BAB
    .logical $C99BAB

      #VRAM2TILEMAP $2400, $020C, 2, $0144

    .here





    VRAM2TILEMAP .macro BaseTileIndex, TileAddress, Size, Coordinates

        .al
        .autsiz
        .databank ?

        lda #\BaseTileIndex
        sta $02
        lda #\TileAddress
        sta $04
        lda #\Size
        sta $00
        ldx #\Coordinates
        jsl $89BECC

    .endmacro
