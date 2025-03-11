
    .section ProcEngineSection

      aProcEngineMainProcActionTable ; 82/8000

        .addr rlProcEngineResetProcEngine
        .addr rlProcEngineMainProcLoop
        .addr rlProcEngineStub

      rlProcEngineResetProcEngine ; 82/8006

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb

        ldx #size(aProcSystem) - 1
        sep #$20

        lda #0

          -
          sta aProcSystem.wFlag,b,x
          dec x
          bpl -

        rep #$20
        plb
        plp
        rtl

        .databank 0

      rlProcEngineCreateProc ; 82/801C

        .al
        .autsiz
        .databank ?

        php
        phb
        phx
        phy

        sep #$20
        lda lR44+2
        pha
        rep #$20
        plb

        ldy lR44
        ldx #(16 - 1) * 2
        
          _Loop
          lda aProcSystem.wFlag,b
          bpl +

            cpx aProcSystem.wOffset,b
            beq _Next

          +
          lda aProcSystem.aHeaderTypeOffset,b,x
          beq _InitProc

          _Next
          dec x
          dec x
          bpl _Loop

        ply
        plx
        plb
        plp

        sec
        rtl

        _InitProc
        tya
        sta aProcSystem.aHeaderTypeOffset,b,x
        lda lR44+1
        and #$FF00
        sta aProcSystem.lPointer+1,b
        xba
        sta aProcSystem.aHeaderTypeBank,b,x

        lda #1
        sta aProcSystem.aHeaderSleepTimer,b,x

        lda #0
        sta aProcSystem.aHeaderBitfield,b,x
        sta aProcSystem.aHeaderUnknownTimer,b,x
        sta aProcSystem.aBody0,b,x
        sta aProcSystem.aBody1,b,x
        sta aProcSystem.aBody2,b,x
        sta aProcSystem.aBody3,b,x
        sta aProcSystem.aBody4,b,x
        sta aProcSystem.aBody5,b,x
        sta aProcSystem.aBody6,b,x
        sta aProcSystem.aBody7,b,x

        lda $0000,b,y
        sta aProcSystem.aHeaderName,b,x
        lda $0002,b,y
        sta aProcSystem.lPointer,b
        lda $0004,b,y
        sta aProcSystem.aHeaderOnCycle,b,x
        lda $0006,b,y
        sta aProcSystem.aHeaderCodeOffset,b,x

        phx
        lda aProcSystem.wOffset,b
        pha
        stx aProcSystem.wOffset,b
        jsl rlProcEngineRunProcInit

        ldx aProcSystem.wOffset,b
        jsr rsProcEngineRunProcOnCycleAndCode

        lda aProcSystem.aHeaderBitfield,b,x
        ora #$4000
        sta aProcSystem.aHeaderBitfield,b,x

        pla
        sta aProcSystem.wOffset,b
        pla
        ply
        plx
        plb
        plp
        clc
        rtl

        .databank 0

      rlProcEngineRunProcInit ; 82/80BB
      
        .al
        .autsiz
        .databank ?

        jml [aProcSystem.lPointer]

        .databank 0

      rlProcEngineCreateProcByIndex ; 82/80BE
      
        .al
        .autsiz
        .databank ?
          
        php
        phb
        phx
        phy

        asl a
        tax
        ldy lR44

        sep #$20
        lda lR44+2
        pha
        rep #$20
        plb

        lda aProcSystem.aHeaderTypeOffset,b,x
        beq +

        ply
        plx
        plb
        plp
        sec
        rtl

        +
        jml rlProcEngineCreateProc._InitProc

        .databank 0

      rlProcEngineFreeProcByIndex ; 82/80DD
      
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
        lda aProcSystem.aHeaderTypeOffset,b,x
        bne +

          plx
          plp
          plb
          sec

          -
          rtl

        +
        jsl rlProcEngineFreeProc
        plx 
        plp
        plb
        clc
        bra -

        .databank 0

      rlUnknown8280F8 ; 82/80F8
      
        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        tax
        lda aProcSystem.aUnknownBitfield,b,x
        bit #$2000
        beq +

          plx
          plp
          plb
          sec

          -
          rtl

        +
        plx
        plp
        plb
        clc
        bra -

        .databank 0

      rlProcEngineFindProc ; 82/8111
      
        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        ldx #(16 - 1) * 2
        
          _Loop
          rep #$20
          lda aProcSystem.aHeaderTypeOffset,b,x
          cmp lR44
          bne _Next

            sep #$20
            lda aProcSystem.aHeaderTypeBank,b,x
            cmp lR44+2
            beq _SEC

          _Next
          dec x
          dec x
          bpl _Loop

        plp
        plb
        clc
        rtl
        
        _SEC
        plp
        plb
        sec
        rtl

        .databank 0

      rlProcEngineFreeProc ; 82/8136
      
        .al
        .autsiz
        .databank ?

        stz aProcSystem.aHeaderTypeOffset,b,x
        lda aProcSystem.aHeaderBitfield,b,x
        ora #$2000
        sta aProcSystem.aHeaderBitfield,b,x
        rtl

        .databank 0

      rlProcEngineMainProcLoop ; 82/8143
      
        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb

        lda #$8000
        tsb aProcSystem.wFlag,b

        ldx #(16 - 1) * 2
        
          _loop
          stx aProcSystem.wOffset,b
          lda aProcSystem.aHeaderTypeOffset,b,x
          beq +

            jsr rsProcEngineRunProcOnCycleAndCode

          +
          ldx aProcSystem.wOffset,b
          dec x
          dec x
          bpl _loop

        jsr rsProcEngineUnblockAllProcs

        lda #$8000
        trb aProcSystem.wFlag,b

        plb
        plp
        rtl

        .databank 0

      rsProcEngineRunProcOnCycleAndCode ; 82/816E
      
        .al
        .autsiz
        .databank ?

        sep #$20
        lda aProcSystem.aHeaderTypeBank,b,x
        pha
        rep #$20
        plb

        lda aProcSystem.aHeaderBitfield,b,x
        bit #$1000
        bne _End

          bit #$4000
          beq +

            rts

          +
          jsl rlProcEngineRunProcOnCycle

          ldx aProcSystem.wOffset,b
          dec aProcSystem.aHeaderSleepTimer,b,x
          bne _End

            ldy aProcSystem.aHeaderCodeOffset,b,x

            _Loop
            lda $0000,b,y
            bpl +

              sta aProcSystem.lPointer,b
              inc y
              inc y
              pea #<>_Loop - 1
              jmp (aProcSystem.lPointer)

            +
            sta aProcSystem.aHeaderSleepTimer,b,x
            tya
            clc
            adc #2
            sta aProcSystem.aHeaderCodeOffset,b,x

        _End
        rts

        .databank 0

      rlProcEngineRunProcOnCycle ; 82/81B0
      
        .al
        .autsiz
        .databank ?

        lda aProcSystem.aHeaderTypeBank,b,x
        xba
        sta aProcSystem.lPointer+1,b
        lda aProcSystem.aHeaderOnCycle,b,x
        sta aProcSystem.lPointer,b
        jml [aProcSystem.lPointer]

        .databank 0

      rsProcEngineUnblockAllProcs ; 82/81C0
      
        .al
        .autsiz
        .databank ?

        ldx #(16 - 1) * 2
        
          _Loop
          lda aProcSystem.aHeaderBitfield,b,x
          and #~$4000
          sta aProcSystem.aHeaderBitfield,b,x
          sta aProcSystem.aUnknownBitfield,b,x
          dec x
          dec x
          bpl _Loop

        rts

        .databank 0

      rlProcEngineStub ; 82/81D4

        .al
        .autsiz
        .databank ?

        rtl

    .endsection ProcEngineSection

    .section ProcCodeSection

      rsProcCodeEnd ; 82/81D5

        .al
        .autsiz
        .databank ?

        stz aProcSystem.aHeaderTypeOffset,b,x

        lda aProcSystem.aHeaderBitfield,b,x
        ora #$2000
        sta aProcSystem.aHeaderBitfield,b,x

        pla
        rts

        .databank 0

      rsProcCodeHaltSleep ; 82/81E3

        .al
        .autsiz
        .databank ?

        lda #1
        sta aProcSystem.aHeaderSleepTimer,b,x

      rsProcCodeHalt ; 82/81E9

        .al
        .autsiz
        .databank ?

        dec y
        dec y
        tya
        sta aProcSystem.aHeaderCodeOffset,b,x

        pla
        rts

        .databank 0

      rsProcCodeCall ; 82/81F1

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aProcSystem.lPointer,b
        lda $0001,b,y
        sta aProcSystem.lPointer+1,b

        phy
        phx
        jsl +
        plx
        ply

        inc y
        inc y
        inc y
        rts

        +
        jml [aProcSystem.lPointer]

        .databank 0

      rsProcCodeCallWithArgs ; 82/820C

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aProcSystem.lPointer,b
        lda $0001,b,y
        sta aProcSystem.lPointer+1,b

        lda $0003,b,y
        and #$00FF
        pha

        inc y
        inc y
        inc y
        inc y

        phy
        phx
        jsl +
        plx
        ply

        pla
        sta wR0
        tya
        clc
        adc wR0
        tay
        rts
        
        +
        jml [aProcSystem.lPointer]

        .databank 0

      rsProcCodeSetOnCycle ; 82/8237

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aProcSystem.aHeaderOnCycle,b,x

        lda aProcSystem.aHeaderBitfield,b,x
        ora #$0800
        sta aProcSystem.aHeaderBitfield,b,x

        inc y
        inc y
        rts

        .databank 0

      rsProcCodeJump ; 82/8249

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        tay
        rts

        .databank 0

      rsProcCodeSetUnknownTimer ; 82/824E

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aProcSystem.aHeaderUnknownTimer,b,x

        inc y
        inc y
        rts

        .databank 0

      rsProcCodeJumpWhileUnknownTimer ; 82/8257

        .al
        .autsiz
        .databank ?

        dec aProcSystem.aHeaderUnknownTimer,b,x
        bne rsProcCodeJump

        inc y
        inc y
        rts

        .databank 0

      rsProcCodeJumpIfBitsUnset ; 82/825F

        .al
        .autsiz
        .databank ?

        lda $0002,b,y
        bit aProcSystem.aHeaderBitfield,b,x
        beq rsProcCodeJump

        inc y
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsProcCodeJumpIfBitsSet ; 82/826C

        .al
        .autsiz
        .databank ?

        lda $0002,b,y
        bit aProcSystem.aHeaderBitfield,b,x
        bne rsProcCodeJump

        inc y
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsProcCodeUnknown828179 ; 82/8279

        .al
        .autsiz
        .databank ?

        phy
        lda $0000,b,y
        sta lR44
        lda $0001,b,y
        sta lR44+1

        lda $0003,b,y
        pha
        lda $0005,b,y
        pha

        ply
        plx
        jsl $818087

        pla
        clc
        adc #7
        tay
        rts

        .databank 0

        ; 82/8299

    .endsection ProcCodeSection
