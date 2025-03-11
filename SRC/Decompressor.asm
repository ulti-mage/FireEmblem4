
    .section DecompressorSection

      rlDecompressor ; 80/AA02

        .al
        .autsiz
        .databank ?

        ; Input:
        ; DecompressionVariables.lSource

        php
        phb
        rep #$30

        ldy DecompressionVariables.lSource
        bmi _ROMSource

        tya
        clc
        adc #$8000
        tay

        lda #$8000
        sta DecompressionVariables.lSource
        sep #$20
        dec DecompressionVariables.lSource+2
        bra +

        _ROMSource
        stz DecompressionVariables.lSource
        sep #$20

        +
        stz DecompressionVariables.bFlag

        stz DecompressionVariables.bCount
        lda DecompressionVariables.lDest+2
        pha
        plb

        ldx DecompressionVariables.lDest
        jml _GetNextMethod

        _DecCount ; 80/AA2D
        dec a
        sta DecompressionVariables.bCount
        bne +

        _SetSource ; 80/AA32
        lda DecompressionVariables.lTemp+2
        sta DecompressionVariables.lSource+2
        ldy DecompressionVariables.lTemp

        +
        rts

        _BankBoundary ; 80/AA39
        inc DecompressionVariables.lSource+2
        ldy DecompressionVariables.lSource
        bne _End

          pha
          lda DecompressionVariables.bFlag
          bne +

            ldy #$8000

          +
          pla
        
        _End
        rts

        _ORR80Plus ; 80/AA49
        sta DecompressionVariables.bVar0
        asl a
        bpl _LessThanC0

        and #$20
        beq +

          lda DecompressionVariables.bVar0
          asl a
          asl a
          asl a
          asl a
          ora #$0F
          sta $0000,b,x
          inc x
          lda #$1F
          bra _ORRHandler

        +
        lda DecompressionVariables.bVar0
        and #$0F
        ora #$F0
        sta $0000,b,x
        inc x
        lda #$0F
        bra _ORRHandler

        _LessThanC0 ; 80/AA70
        and #$20
        beq +

          lda DecompressionVariables.bVar0
          asl a
          asl a
          asl a
          asl a
          sta $0000,b,x
          inc x
          lda #$10
          bra _ORRHandler

        +
        lda DecompressionVariables.bVar0
        and #$0F
        sta $0000,b,x
        inc x
        lda #0
        bra _ORRHandler

        _ORR ; 80/AA8E
        and #$0F
        inc a
        sta DecompressionVariables.bMethodCount
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        pha
        lda DecompressionVariables.bCount
        beq +

          dec a
          sta DecompressionVariables.bCount
          bne +

            jsr _SetSource

        +
        pla
        cmp #$80
        bcs _ORR80Plus
        
        _ORRHandler ; 80/AAAD
        cmp #$10
        bcc _LowerNybbleData

        and #$0F
        sta DecompressionVariables.bVar0
        
        _UpperDataLoop ; 80/AAB5
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        sta DecompressionVariables.bVar1
        and #$F0
        ora DecompressionVariables.bVar0
        sta $0000,b,x
        inc x
        lda DecompressionVariables.bCount
        beq +

          jsr _DecCount

        +
        dec DecompressionVariables.bMethodCount
        bmi _ORREnd

        lda DecompressionVariables.bVar1
        asl a
        asl a
        asl a
        asl a
        ora DecompressionVariables.bVar0
        sta $0000,b,x
        inc x
        dec DecompressionVariables.bMethodCount
        bpl _UpperDataLoop

        jml _GetNextMethod
        
        _LowerNybbleData ; 80/AAE6
        asl a
        asl a
        asl a
        asl a
        sta DecompressionVariables.bVar0
        
        _LowerDataLoop ; 80/AAEC
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        sta DecompressionVariables.bVar1
        lsr a
        lsr a
        lsr a
        lsr a
        ora DecompressionVariables.bVar0
        sta $0000,b,x
        inc x
        lda DecompressionVariables.bCount
        beq +

          jsr _DecCount

        +
        dec DecompressionVariables.bMethodCount
        bmi _ORREnd

        lda DecompressionVariables.bVar1
        and #$0F
        ora DecompressionVariables.bVar0
        sta $0000,b,x
        inc x
        dec DecompressionVariables.bMethodCount
        bpl _LowerDataLoop

        _ORREnd ; 80/AB19
        jml _GetNextMethod
        
        _DupOrORR ; 80/AB1D
        cmp #$50
        bcs +

          jml _ORR

        +
        and #$0F
        sta DecompressionVariables.bMethodCount
        
        _DupLoop ; 80/AB29
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        sta $0000,b,x
        inc x
        sta $0000,b,x
        inc x
        lda DecompressionVariables.bCount
        beq +

          jsr _DecCount

        +
        dec DecompressionVariables.bMethodCount
        bpl _DupLoop

        jml _GetNextMethod
        
        _DupCheckOrAppend ; 80/AB48
        lsr a
        cmp #$60
        bcc _DupOrORR

        xba
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        pha
        lda DecompressionVariables.bCount
        beq +

          dec a
          sta DecompressionVariables.bCount
          bne +

            jsr _SetSource

        +
        pla
        sta DecompressionVariables.bVar0
        xba
        cmp #$70
        and #$0F
        inc a
        sta DecompressionVariables.bMethodCount
        bcs _Postappend
        
        _Preappend ; 80/AB70
        lda DecompressionVariables.bVar0
        sta $0000,b,x
        inc x
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        sta $0000,b,x
        inc x
        lda DecompressionVariables.bCount
        beq +

          jsr _DecCount

        +
        dec DecompressionVariables.bMethodCount
        bpl _Preappend
        bra _GetNextMethod

        _Postappend ; 80/AB8F
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        sta $0000,b,x
        inc x
        lda DecompressionVariables.bCount
        beq +

          jsr _DecCount

        +
        lda DecompressionVariables.bVar0
        sta $0000,b,x
        inc x
        dec DecompressionVariables.bMethodCount
        bpl _Postappend
        bra _GetNextMethod
        
        _DupAppendOrLiteral ; 80/ABAE
        bmi _DupCheckOrAppend

        lsr a
        sta DecompressionVariables.bMethodCount
        
        _LiteralLoop ; 80/ABB3
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        sta $0000,b,x
        inc x
        lda DecompressionVariables.bCount
        beq +

          jsr _DecCount

        +
        dec DecompressionVariables.bMethodCount
        bpl _LiteralLoop

        _GetNextMethod ; 80/ABCA
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        pha
        lda DecompressionVariables.bCount
        beq +

          dec a
          sta DecompressionVariables.bCount
          bne +

            jsr _SetSource

        +
        pla
        asl a
        bcc _DupAppendOrLiteral
        bmi _UpperMethodOrLZLong
        
        _LZ77 ; 80/ABE5
        lsr a
        pha
        lsr a
        lsr a
        inc a
        sta DecompressionVariables.bMethodCount
        pla
        and #$03
        xba
        
        _LZGetLowerDistByte ; 80/ABF0
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        phy
        rep #$20
        sta DecompressionVariables.lDest
        txa
        sec
        sbc DecompressionVariables.lDest
        tay
        sep #$20
        
        _LZLoop ; 80/AC04
        lda $0000,b,y
        sta $0000,b,x
        inc y
        inc x
        dec DecompressionVariables.bMethodCount
        bpl _LZLoop

        ply
        
        _NextLookbackOrEnd ; 80/AC11
        lda DecompressionVariables.bCount
        beq _GetNextMethod

        jsr _DecCount
        bra _GetNextMethod
        
        _UpperMethodOrLZLong ; 80/AC1A
        ror a
        cmp #$E0
        bcs _RLEOrSpecial

        and #$1F
        xba
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        pha
        lda DecompressionVariables.bCount
        beq +

          dec a
          sta DecompressionVariables.bCount
          bne +

            jsr _SetSource

        +
        pla
        rep #$20
        asl a
        sep #$20
        lsr a
        xba
        inc a
        sta DecompressionVariables.bMethodCount
        bra _LZGetLowerDistByte
        
        _RLEOrSpecial ; 80/AC44
        cmp #$F0
        bcs _DetermineSpecialMethod

        and #$0F
        sta DecompressionVariables.bVar1
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        sta DecompressionVariables.bVar0
        lda DecompressionVariables.bCount
        beq +

          jsr _DecCount

        +
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        phy
        pha
        pha
        rep #$20
        lda DecompressionVariables.bVar0
        clc
        adc #3
        lsr a
        tay
        pla
        
        _RLELoop ; 80/AC73
        sta $0000,b,x
        inc x
        inc x
        dec y
        bne _RLELoop

        sep #$20
        bcc +

          sta $0000,b,x
          inc x

        +
        ply
        bra _NextLookbackOrEnd

        _DetermineSpecialMethod ; 80/AC86
        cmp #$F8
        bcs +

          and #$07
          adc #2
          sta DecompressionVariables.bMethodCount
          lda [DecompressionVariables.lSource],y
          inc y
          bne _ShortRLELoop

            jsr _BankBoundary

          _ShortRLELoop ; 80/AC98
          sta $0000,b,x
          inc x
          dec DecompressionVariables.bMethodCount
          bpl _ShortRLELoop

            jml _NextLookbackOrEnd

        +
        cmp #$FC
        bcs _CheckForEndFlag

        and #$03
        xba
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        rep #$20
        asl a
        asl a
        asl a
        sep #$20
        lsr a
        lsr a
        lsr a
        xba
        pha
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        rep #$20
        clc
        adc #3
        
        _SetReadposAndCount ; 80/ACCD
        sty DecompressionVariables.lTemp
        sta DecompressionVariables.lDest
        sep #$20
        lda DecompressionVariables.lSource+2
        sta DecompressionVariables.lTemp+2
        lda DecompressionVariables.bFlag
        rep #$20
        beq _GetPreviousBankOffset

        tya
        sec
        sbc DecompressionVariables.lDest
        bcs _SetCountAndDecomp
        bra _GetPreviousBank

        _GetPreviousBankOffset ; 80/ACE5
        tya
        sec
        sbc DecompressionVariables.lDest
        bmi _SetCountAndDecomp

        clc
        adc #$8000
        
        _GetPreviousBank ; 80/ACEF
        dec DecompressionVariables.lSource+2

        _SetCountAndDecomp ; 80/ACF1
        tay
        sep #$20
        pla
        clc
        adc #3
        sta DecompressionVariables.bCount
        jml _GetNextMethod

        _CheckForEndFlag ; 80/ACFE
        cmp #$FE
        bcs _EndDecomp

        and #$01
        xba
        lda [DecompressionVariables.lSource],y
        inc y
        bne +

          jsr _BankBoundary

        +
        rep #$20
        asl a
        asl a
        sep #$20
        xba
        pha
        xba
        lsr a
        lsr a
        rep #$20
        and #$003F
        inc a
        inc a
        bra _SetReadposAndCount

        _EndDecomp ; 80/AD21
        plb
        plp
        rtl

        .databank 0

        ; 80/AD24

    .endsection DecompressorSection
