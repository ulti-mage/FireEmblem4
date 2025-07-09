
    .section Code808223Section

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

    .endsection Code808223Section


    .section Code809D4FSection

      rsUnknown809D4F ; 80/9D4F

        .al
        .autsiz
        .databank ?

        ; Run every frame

        jsl rlButtonCombinationResetCheck
        jsl rlDecompressByList
        jsl $809903 ; ?
        rts

        .databank 0

      rlHardwareResetScreenPosMathHDMA ; 80/9D5C

        .al
        .autsiz
        .databank ?

        ; - set auto joypad read
        ; - disables writable controller IO port
        ; - clear math regs
        ; - clear screen scanline counters
        ; - set fast memory access

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

        lda #MEMSEL_Setting(true)
        sta MEMSEL,b
        sta bBufferMEMSEL

        plp
        plb
        rtl

        .databank 0

      rlHardwareResetScreenRegisters ; 80/9DA3

        .al
        .autsiz
        .databank ?

        ; - reset obsel/oamadd/oamdata
        ; - set BGMode1 with BG3 prio
        ; - clear mosaic/BG VRAM addresses/BG offsets
        ; - clear mode7 regs, windows
        ; - enable BG1 and OBJ layer
        ; - reset color math

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

        lda #OAMADD_Setting($010)
        sta OAMADD,b
        sta wBufferOAMADD

        lda #OAMADD_Priority_Setting(false, 0)
        sta OAMADD+1,b
        sta wBufferOAMADD+1

        stz OAMDATA,b
        stz OAMDATA,b

        lda #BGMODE_Setting(BG_Mode1, false, false, false, false, true)
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

        lda #W12SEL_Setting(false, false, false, false, false, false, false, false)
        sta W12SEL,b
        sta bBufferW12SEL

        lda #W34SEL_Setting(false, false, false, false, false, false, false, false)
        sta W34SEL,b
        sta bBufferW34SEL

        stz WOBJSEL,b
        stz bBufferWOBJSEL

        lda #0
        sta WH0,b
        sta bBufferWH0
        lda #-8
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

        lda #T_Setting(true, false, false, false, true)
        sta TM,b
        sta bBufferTM
        sta TMW,b
        sta bBufferTMW

        lda #T_Setting(false, false, false, false, false)
        sta TS,b
        sta bBufferTS
        sta TSW,b
        sta bBufferTSW

        lda #CGWSEL_Setting(false, true, CGWSEL_MathAlways, CGWSEL_BlackNever)
        sta CGWSEL,b
        sta bBufferCGWSEL

        lda #CGADSUB_Setting(CGADSUB_Subtract, false, true, false, false, false, false, true)
        sta CGADSUB,b
        sta bBufferCGADSUB

        lda #COLDATA_Setting(0, true, false, false)
        sta COLDATA,b
        sta bBufferCOLDATA_1

        lda #COLDATA_Setting(0, false, true, false)
        sta COLDATA,b
        sta bBufferCOLDATA_2

        lda #COLDATA_Setting(0, false, false, true)
        sta COLDATA,b
        sta bBufferCOLDATA_3

        lda #SETINI_Setting(false, false, false, false, false, false)
        sta SETINI,b
        sta bBufferSETINI

        plp
        plb
        rtl

        .databank 0

        ; 80/9DD9

    .endsection Code809D4FSection


    .section Code80A096Section

      rlUnsignedMultiply16By16High ; 80/A096

        .al
        .autsiz
        .databank ?

        ; Inputs:
        ; wR34: 16-bit unsigned multiplier
        ; wR35: 16-bit unsigned multiplicand

        ; Outputs:
        ; wR36: 32-bit unsigned result

        phx
        php
        phb
        phk
        plb

        rep #$30
        stz wR36
        stz wR37

        ldx #16

        -
        lsr wR34
        bcc +

          lda wR35
          clc
          adc wR37
          sta wR37

        +
        ror wR37
        ror wR36
        dec x
        bne -

        plb
        plp
        plx
        rtl

        .databank 0

      rlUnsignedMultiply16By16 ; 80/A0BA
      
        .autsiz
        .databank ?
      
        ; Multiplies two 16-bit unsigned numbers
        ; and returns a 32-bit unsigned number
      
        ; Inputs:
        ; wR10: 16-bit unsigned multiplier
        ; wR11: 16-bit unsigned multiplicand
      
        ; Outputs:
        ; wR12: 32-bit unsigned result

        phb
        phk
        plb
        phx
        phy
        pha
        php

        rep #$20
        sep #$10

        ldx wR10
        stx WRMPYA,b
        ldx wR11
        stx WRMPYB,b
        nop
        nop
        nop
        lda RDMPY,b
        sta wR12

        ldx wR10+1
        stx WRMPYA,b
        ldx wR11+1
        stx WRMPYB,b
        nop
        nop
        nop
        ldx RDMPY,b
        stx wR13

        ldy RDMPY+1,b

        ldx wR10+1
        stx WRMPYA,b
        ldx wR11
        stx WRMPYB,b
        nop
        nop
        lda wR12+1
        clc
        adc RDMPY,b
        sta wR12+1
        bcc +

          inc y

        +
        ldx wR10
        stx WRMPYA,b
        ldx wR11+1
        stx WRMPYB,b
        nop
        nop
        lda wR12+1
        clc
        adc RDMPY,b
        sta wR12+1
        bcc +

          inc y

        +
        sty wR13+1

        plp
        pla
        ply
        plx
        plb
        rtl

        .databank 0

      rlUnsignedMultiply32By32 ; 80/A122
      
        .autsiz
        .databank ?
      
        ; Multiply two 32-bit unsigned numbers
        ; and return a 64-bit unsigned number
      
        ; Inputs:
        ; wR11: 32-bit unsigned multiplier
        ; wR12: 32-bit unsigned multiplicand
      
        ; Outputs:
        ; wR14: 64-bit unsigned result

        phx
        php
        phb
        phk
        plb
        rep #$30
        stz wR14
        stz wR15
        stz wR16
        stz wR17

        ldx #32
        
        -
        lsr wR11
        ror wR10
        bcc +

          lda wR12
          clc
          adc wR16
          sta wR16
          lda wR13
          adc wR17
          sta wR17

        +
        ror wR17
        ror wR16
        ror wR15
        ror wR14
        dec x
        bne -

        plb
        plp
        plx
        rtl

        .databank 0

      rlUnsignedDivide16By8 ; 80/A156
      
        .autsiz
        .databank ?
      
        ; Divides a 16-bit number by an 8-bit number
      
        ; Inputs:
        ; wR13: 16-bit unsigned dividend
        ; wR14: 8-bit unsigned divisor
      
        ; Outputs:
        ; wR10: 16-bit unsigned remainder
        ; wR13: 16-bit unsigned result

        phb
        php
        phk
        plb
        rep #$30
        lda wR13
        sta WRDIVA,b
        sep #$20
        lda wR14
        sta WRDIVB,b
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        rep #$20
        lda RDMPY,b
        sta wR10
        lda RDDIV,b
        sta wR13
        plp
        plb
        rtl

        .databank 0

      rlUnsignedDivide16By16 ; 80/A17E

        .al
        .autsiz
        .databank ?

        ; Inputs:
        ; wR36: 16-bit unsigned dividend
        ; wR37: 16-bit unsigned divisor

        ; Outputs:
        ; wR36: 16-bit unsigned result
        ; wR34: 16-bit unsigned remainder

        phx
        php
        phb
        phk
        plb
        rep #$30
        stz wR34

        lda wR37
        bne +

          stz wR36
          bra _End

        +
        ldx #17
        clc

        -
        rol wR36
        dec x
        beq _End

        rol wR34
        lda wR34
        beq -

        sec
        sbc wR37
        bcc -

        sta wR34
        bra -
        
        _End
        plb
        plp
        plx
        rtl

        .databank 0

        ; 80/A1AB

    .endsection Code80A096Section


    .section Code80A5E9Section

      rlDecompressByList ; 80/A5E9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        sep #$20
        rep #$10
        lda bDecompressionArrayFlag,b
        beq _End

          rep #$20
          stz wDecompressionArrayPosition,b
          ldy #0
          
          _CheckNext
          cpy #$0020
          bcc +
          
          -
          bra -
          
          +
          lda aDecompressionArray + structDecompressionEntry.Source,b,y
          ora aDecompressionArray + structDecompressionEntry.Source+1,b,y
          beq _Done

          lda aDecompressionArray + structDecompressionEntry.Source,b,y
          sta DecompressionVariables.lSource
          lda aDecompressionArray + structDecompressionEntry.Source+1,b,y
          sta DecompressionVariables.lSource+1
          lda aDecompressionArray + structDecompressionEntry.Dest,b,y
          sta DecompressionVariables.lDest
          lda aDecompressionArray + structDecompressionEntry.Dest+1,b,y
          sta DecompressionVariables.lDest+1
          phy
          jsl rlDecompressor
          pla
          clc
          adc #size(structDecompressionEntry)
          tay
          bra _CheckNext

          _Done
          stz bDecompressionArrayFlag,b
          stz aDecompressionArray,b

        _End
        plp
        plb
        rtl

        .databank 0

      rlAppendDecompList ; 80/A637

        .al
        .autsiz
        .databank ?

        php
        phx
        ldx wDecompressionArrayPosition,b

        lda lR18
        sta aDecompressionArray + structDecompressionEntry.Source,b,x
        lda lR18+1
        sta aDecompressionArray + structDecompressionEntry.Source+1,b,x
        lda lR19
        sta aDecompressionArray + structDecompressionEntry.Dest,b,x
        lda lR19+1
        sta aDecompressionArray + structDecompressionEntry.Dest+1,b,x
        lda #0
        sta aDecompressionArray+6,b,x
        sta aDecompressionArray+7,b,x
        sta aDecompressionArray+8,b,x
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
        plx
        plp
        rtl

        .databank 0

        ; 80/A678

    .endsection Code80A5E9Section




    .section Code80A6C3Section

      rlButtonCombinationResetCheck ; 80/A6C3

        .al
        .autsiz
        .databank ?

        ; Quick reset

        php
        lda wJoy1Input
        and #~JOY_Start
        eor #(JOY_Select | JOY_L | JOY_R)
        bne +

          lda wJoy1New
          bit #JOY_Start
          beq +

            sep #$20
            lda #INIDISP_Setting(true, 0)
            sta INIDISP,b
            lda #NMITIMEN_Setting(true, false, false, false)
            sta NMITIMEN,b
            sta bBufferNMITIMEN
            stz bDMAPendingChannels,b
            stz bHDMAPendingChannels,b
            stz bBufferHDMAEN
            stz $0345,b
            rep #$20

            stz $0343,b
            jml $808ECC

        +
        plp
        rtl

        .databank 0

      rlIncreaseFrameCounters ; 80/A6F9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        sep #$20
        inc bFrameCounterByOnes,b

        lda bFrameCounterByThrees,b
        clc
        adc #3
        sta bFrameCounterByThrees,b

        plp
        plb
        rtl

        .databank 0

      rlGetRandomNumber100 ; 80/A70E

        .al
        .autsiz
        .databank ?

        ; Returns random value between 0 and input exclusive

        phb
        php
        phk
        plb
        and #$00FF
        beq +

          sta wR10

          jsl rlGetRandomNumber
          and #$00FF
          beq +

            sta wR11
            jsl rlUnsignedMultiply16By16
            lda wR12
            sta wR13

            lda #100
            sta wR14
            jsl rlUnsignedDivide16By8
            lda wR13

        +
        plp
        plb
        rtl

        .databank 0

      rlGetRandomNumber ; 80/A73A

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

        inc wRNIndex,b

        lda wRNIndex,b
        cmp #size(aRNArray)
        bcc ++

          jsr $80A7C5
          rep #$30

          jsl $8F8006
          bcc +

            jsr $80A7F3

        +
        lda #0
        sep #$30
        sta wRNIndex,b

        +
        tay
        lda aRNArray,b,y
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

    .endsection Code80A6C3Section


    .section Code80A899Section

      rlConvertChanceToFullByte ; 80/A899

        .al
        .autsiz
        .databank ?

        ; Enters with a percent chance from 0 to 100
        ; and exits with a chance scaled up to 0 to 256

        ora #0
        beq +

          phx
          dec a
          asl a
          tax
          lda aChanceToByteLookupTable,x
          plx

        +
        rtl

        .databank 0

      aChanceToByteLookupTable ; 80/A8A8

        .word   2,   5,   7,  10,  12,  15,  17,  20,  23,  25
        .word  28,  30,  33,  35,  38,  40,  43,  46,  48,  51
        .word  53,  56,  58,  61,  64,  66,  69,  71,  74,  76
        .word  79,  81,  84,  87,  89,  92,  94,  97,  99, 102
        .word 104, 107, 110, 112, 115, 117, 120, 122, 125, 128
        .word 130, 133, 135, 138, 140, 143, 145, 148, 151, 153
        .word 156, 158, 161, 163, 166, 168, 171, 174, 176, 179
        .word 181, 184, 186, 189, 192, 194, 197, 199, 202, 204
        .word 207, 209, 212, 215, 217, 220, 222, 225, 227, 230
        .word 232, 235, 238, 240, 243, 245, 248, 250, 253, 256

      rlBlockCopyMVNByRAM ; 80/A970

        .al
        .autsiz
        .databank ?

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

      rlBlockCopyMVPByRAM ; 80/A9A2

        .al
        .autsiz
        .databank ?

        ; lBlockCopySource = source data
        ; lBlockCopyDestination = destination

        phb
        php
        phk
        plb
        phx
        phy

        sep #$20
        lda lBlockCopyDestination+2,b
        sta rsBlockCopyMVPRAM+1,b
        lda lBlockCopySource+2,b
        sta rsBlockCopyMVPRAM+2,b
        lda #$44    ; mvp
        sta rsBlockCopyMVPRAM,b
        lda #$60    ; rts
        sta rsBlockCopyMVPRAM+3,b
        rep #$20

        ldx lBlockCopySource,b
        ldy lBlockCopyDestination,b
        lda wBlockCopySize,b
        dec a
        jsr <>rsBlockCopyMVPRAM,k

        ply
        plx
        plp
        plb
        rtl
 
        .databank 0

      rlUnknown80A9D4 ; 80/A9D4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        pha

        lda wUnknown00171A,b
        bit #$0010
        bne +

        pla
        sta wMainLoopPointer
        bra ++

        +
        pla
        sta wR26
        lda #$0010
        trb wUnknown00171A,b

        +
        plp
        plb
        rtl

        .databank 0

        ; 80/A9F2

    .endsection Code80A899Section


    .section Code80C1CBSection

      rlUnknown80C1CB ; 80/C1CB

        .al
        .autsiz
        .databank ?

        phb
        sta wR0

        lda wUnknown00171A,b
        bne _SEC

          stz wUnknown00171C,b

          lda wR0
          cmp #$0232
          bcs _SEC

            sta wUnknown001732,b
            asl a
            clc
            adc wUnknown001732,b
            tax

            lda $8FE8BF,x
            sta lR18
            lda $8FE8BF+1,x
            sta lR18+1
            jsl rlUnknown80C1FC
            clc
            bra +

        _SEC
        sec

        +
        plb
        rtl

        .databank 0

      rlUnknown80C1FC ; 80/C1FC

        .al
        .autsiz
        .databank ?

        phb
        lda lR18
        sta lActiveEventPointer,b
        lda lR18+1
        sta lActiveEventPointer+1,b

        stz wActiveEventOffset,b

        lda #9
        sta wUnknown00171A,b
        plb
        rtl

        .databank 0

        ; 80/C212

    .endsection Code80C1CBSection



    .section Code80E42BSection

      rsUnknown80E42B ; 80/E42B

        .al
        .autsiz
        .databank ?

        php
        sep #$20
        lda #$80
        sta bBufferINIDISP
        rep #$20

        lda #<>$80BB9B
        sta $D3

        jsl $80823F
        jsl rlDisableVBlank

        jsl rlHardwareResetScreenPosMathHDMA
        jsl rlHardwareResetScreenRegisters

        stz wR0
        stz wR2
        stz wR4
        stz wR7
        stz wR9

        lda #0
        sta wR5
        lda #0
        sta wR1
        lda #$4000
        sta wR3
        lda #$6000
        sta wR6
        lda #$7000
        sta wR8

        jsl $809F15
        jsl rlProcEngineResetProcEngine
        jsl rlActiveSpriteEngineReset
        jsl rlResetHDMAEngine
        jsl $82E073
        jsl $82E400
        jsl $8780AA
        jsl $82F211

        jsr rsUnknown80E4B3
        jsr rsUnknown80E4EB
        jsr $80E54D

        lda $7F8400
        sta $0304,b

        lda #$0027
        sta $0302,b
        lda #$0026
        sta $0300,b

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
        sta lMapMenuTilemapRAMEntryPointer+1,b
        lda #<>$80E422
        sta lMapMenuTilemapRAMEntryPointer,b
        jsl rlGetSelectedUnitFactionSlot
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

          .dstruct structDMAToVRAM, $DE44C0, $0400, $80, $0000

        lda #(`aUnknown80E53D)<<8
        sta lR19+1
        lda #<>aUnknown80E53D
        sta lR19
        jsl $878979
        jsl rlUnknown899FDC

        ldx #$0200  
        
        -
        lda $DDFFFE,x
        sta $FE,x
        dec x
        dec x
        bne -

        ; Clear the tilemap
        lda #0
        sta $0100,b
        jsl $8BB45D

         ; DMA clean tilemap
        jsl rlDMAByStruct

          .dstruct structDMAToVRAM, aBG3TilemapBuffer, $0800, $80, $E000

        lda #(`aUnknown80E545)<<8
        sta lR19+1
        lda #<>aUnknown80E545
        sta lR19
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
        lda bBufferBG1SC
        and #$FC
        ora #$02
        sta bBufferBG1SC

        lda bBufferBG3SC
        and #$FC
        ora #$02
        sta bBufferBG3SC

        lda #$15
        sta bBufferTM
        lda #0
        sta bBufferWH0
        sta bBufferWH2
        sta bBufferWH3
        lda #$FF
        sta bBufferWH1
        lda #0
        sta bBufferCGWSEL
        lda #$81
        sta bBufferCGADSUB
        rep #$20

        stz wBufferBG1HOFS
        stz wBufferBG1VOFS
        stz wBufferBG2HOFS
        stz wBufferBG2VOFS
        stz wBufferBG3HOFS
        stz wBufferBG3VOFS
        rts

        .databank 0

        ; 80/E586

    .endsection Code80E42BSection









