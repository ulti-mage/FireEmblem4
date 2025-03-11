
    .section HDMAEngineSection

      aHDMAEngineMainActionTable ; 82/C000

        .addr rlResetHDMAEngine
        .addr rlHDMAEngineMainLoop
        .addr rlHDMAEngineStub

      rlResetHDMAEngine ; 82/C006
      
        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb

        ldx #size(aHDMASystem) - 2
        lda #0
        
        -
        sta aHDMASystem.wFlag,b,x
        dec x
        dec x
        bpl -

        ldx #7 * size(aHDMASystem.aTypeOffset)
        sep #$20

        lda #0
        sta HDMAEN,b
        sta bHDMAPendingChannels,b

          _Loop
          lda #0
          sta DMA_IO[0].DMAP,b,x
          sta DMA_IO[0].DAS+2,b,x
          sta DMA_IO[0].A1,b,x
          sta DMA_IO[0].A1+1,b,x
          sta DMA_IO[0].A1+2,b,x

          lda #BG4HOFS - PPU_REG_BASE
          sta DMA_IO[0].BBAD,b,x
          txa
          sec
          sbc #size(aHDMASystem.aTypeOffset)
          bmi +

            tax
            bra _Loop

        +
        plb
        plp
        rtl

        .databank 0

      rlHDMAEngineCreateEntry ; 82/C046

        .al
        .autsiz
        .databank ?

        php
        phb

        sep #$20
        lda lR44+2
        pha
        rep #$20
        plb

        phx
        phy

        lda #0
        sta wR41

        ldy lR44
        ldx #0
        
          _Loop
          lda aHDMASystem.aTypeOffset,b,x
          beq _AddEntry

          lda wR41
          clc
          adc #$0010
          sta wR41

          inc x
          inc x
          cpx #8 * size(word)
          bcc _Loop

        ply
        plx
        plb
        plp
        sec
        rtl

        _AddEntry
        tya
        sta aHDMASystem.aTypeOffset,b,x
        lda lR44+1
        and #$FF00
        sta aHDMASystem.lPointer+1,b
        xba
        sta aHDMASystem.aTypeBank,b,x

        lda #1
        sta aHDMASystem.aSleepTimer,b,x

        lda #0
        sta aHDMASystem.aBitfield,b,x
        sta aHDMASystem.aTimer,b,x

        lda $0000,b,y
        sta aHDMASystem.lPointer,b
        lda $0002,b,y
        sta aHDMASystem.aOnCycle,b,x
        lda $0004,b,y
        sta aHDMASystem.aCodeOffset,b,x
        lda $0006,b,y
        sta aHDMASystem.aOffset,b,x
        lda $0008,b,y
        sta aHDMASystem.aBankAndBBADx[0],b,x
        lda $000A,b,y
        sta aHDMASystem.aDMAPxAndIndirectBank[0],b,x
        stx aHDMASystem.wOffset,b

        jsl +

        ply
        plx
        plb
        plp
        clc
        rtl

        +
        jml [aHDMASystem.lPointer]

        .databank 0

      rlHDMAEngineCreateEntryByIndex ; 82/C0C9

        .al
        .autsiz
        .databank ?

        php
        phb

        sep #$20
        lda lR44+2
        pha
        rep #$20
        plb

        phx
        phy

        ldy lR44
        lda wR40
        asl a
        tax
        asl a
        asl a
        asl a
        sta wR41
        lda aHDMASystem.aTypeOffset,b,x
        bne +

          jml rlHDMAEngineCreateEntry._AddEntry

        +
        ply
        plx
        plb
        plp
        sec
        rtl

        .databank 0

      rlHDMAEngineFreeEntryByIndex ; 82/C0EF

        .al
        .autsiz
        .databank ?

        phx
        asl a
        tax
        jsl rlHDMAEngineFreeEntryByOffset
        plx
        rtl

        .databank 0

      rlHDMAEngineMainLoop ; 82/C0F8

        .al
        .autsiz
        .databank ?

        php
        phb
        phk
        plb

        sep #$20
        stz aHDMASystem.bPendingChannels,b
        rep #$20

        ldx #0
        
          _Loop
          stx aHDMASystem.wOffset,b

          lda aHDMASystem.aTypeOffset,b,x
          beq +

            jsr rsHDMAEngineRunOnCycleAndCode

          +
          ldx aHDMASystem.wOffset,b
          inc x
          inc x
          cpx #8 * size(word)
          bcc _Loop

        sep #$20
        lda aHDMASystem.bPendingChannels,b
        sta bHDMAPendingChannels,b
        stz aHDMASystem.bPendingChannels,b
        rep #$20

        plb
        plp
        rtl

        .databank 0

      rsHDMAEngineRunOnCycleAndCode ; 82/C12B

        .al
        .autsiz
        .databank ?

        lda aHDMAChannelTable,x
        ora aHDMASystem.bPendingChannels,b
        sta aHDMASystem.bPendingChannels,b

        lda aHDMASystem.aBitfield,b,x
        bit #$1000
        bne _End

          sep #$20
          lda aHDMASystem.aTypeBank,b,x
          pha
          rep #$20
          plb

          jsl rlHDMAEngineRunOnCycle

          ldx aHDMASystem.wOffset,b
          dec aHDMASystem.aSleepTimer,b,x
          bne _End

            ldy aHDMASystem.aCodeOffset,b,x
            
              _Loop
              lda $0000,b,y
              bpl +

                sta aHDMASystem.lPointer,b
                inc y
                inc y
                pea #<>_Loop - 1
                jmp (aHDMASystem.lPointer)

            +
            sta aHDMASystem.aSleepTimer,b,x

            lda $0002,b,y
            sta aHDMASystem.aOffset,b,x
            tya
            clc
            adc #4
            sta aHDMASystem.aCodeOffset,b,x
        
        _End
        rts

        .databank 0

      rlHDMAEngineRunOnCycle ; 82/C177

        .al
        .autsiz
        .databank ?

        lda aHDMASystem.aTypeBank,b,x
        xba
        sta aHDMASystem.lPointer+1,b
        lda aHDMASystem.aOnCycle,b,x
        sta aHDMASystem.lPointer,b
        jml [aHDMASystem.lPointer]

        .databank 0

      aHDMAChannelTable ; 82/C187

        .for i in range(8)

          .word 1 << i

        .next

      rlHDMAEngineStub ; 82/C197

        .al
        .autsiz
        .databank ?
      
        rtl

        .databank 0

      rlHDMAArrayEngineProcessHDMAArray ; 82/C198

        .al
        .autsiz
        .databank ?

        php
        sep #$30
        lda bBufferHDMAEN
        sta wR0
        ldx #(8 - 1) * size(word)
        ldy #7 * size(aHDMASystem.aTypeOffset)
        
          _Loop
          asl wR0
          bcc _Next

            lda aHDMASystem.aOffset,b,x
            sta DMA_IO[0].A1,b,y
            lda aHDMASystem.aOffset+1,b,x
            sta DMA_IO[0].A1+1,b,y
            lda aHDMASystem.aBankAndBBADx[0].bBank,b,x
            sta DMA_IO[0].A1+2,b,y
            lda aHDMASystem.aBankAndBBADx[0].bBBADx,b,x
            sta DMA_IO[0].BBAD,b,y
            lda aHDMASystem.aDMAPxAndIndirectBank[0].bDMAPx,b,x
            sta DMA_IO[0].DMAP,b,y
            lda aHDMASystem.aDMAPxAndIndirectBank[0].bIndirectBank,b,x
            sta DMA_IO[0].DAS+2,b,y

          _Next
          tya
          sec
          sbc #size(aHDMASystem.aTypeOffset)
          tay
          dec x
          dec x
          bpl _Loop

        plp
        rtl

        .databank 0

      rlHDMAEngineFreeEntryByOffset ; 82/C1D6

        .al
        .autsiz
        .databank ?

        stz aHDMASystem.aTypeOffset,b,x
        rtl

        .databank 0

    .endsection HDMAEngineSection

    .section HDMACodeSection

      rsHDMACodeSleep ; 82/C1DA

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aHDMASystem.aSleepTimer,b,x
        inc y
        inc y
        tya
        sta aHDMASystem.aCodeOffset,b,x

        pla
        rts

        .databank 0

      rsHDMACodeEnd ; 82/C1E8

        .al
        .autsiz
        .databank ?

        stz aHDMASystem.aTypeOffset,b,x

        lda aHDMASystem.aBitfield,b,x
        ora #$2000
        sta aHDMASystem.aBitfield,b,x

        pla
        rts

        .databank 0

      rsHDMACodeHaltSleep ; 82/C1F6

        .al
        .autsiz
        .databank ?

        lda #1
        sta aHDMASystem.aSleepTimer,b,x

      rsHDMACodeHalt ; 82/C1FC

        .al
        .autsiz
        .databank ?

        dec y
        dec y
        tya
        sta aHDMASystem.aCodeOffset,b,x

        pla
        rts

        .databank 0

      rsHDMACodeCall ; 82/C204

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aHDMASystem.lPointer,b
        lda $0001,b,y
        sta aHDMASystem.lPointer+1,b

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
        jml [aHDMASystem.lPointer]

        .databank 0

      rsHDMACodeSetOnCycle ; 82/C21F

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aHDMASystem.aOnCycle,b,x

        lda aHDMASystem.aBitfield,b,x
        ora #$0800
        sta aHDMASystem.aBitfield,b,x

        inc y
        inc y
        rts

        .databank 0

      rsHDMACodeJump ; 82/C231

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        tay
        rts

        .databank 0

      rsHDMACodeSetTimer ; 82/C236

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta aHDMASystem.aTimer,b,x

        inc y
        inc y
        rts

        .databank 0

      rsHDMACodeJumpWhileTimer ; 82/C23F

        .al
        .autsiz
        .databank ?

        dec aHDMASystem.aTimer,b,x
        bne rsHDMACodeJump

        inc y
        inc y
        rts

        .databank 0

      rsHDMACodeJumpIfBitsUnset ; 82/C247

        .al
        .autsiz
        .databank ?

        lda $0002,b,y
        bit aHDMASystem.aBitfield,b,x
        beq rsHDMACodeJump

        inc y
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsHDMACodeJumpIfBitsSet ; 82/C254

        .al
        .autsiz
        .databank ?

        lda $0002,b,y
        bit aHDMASystem.aBitfield,b,x
        bne rsHDMACodeJump

        inc y
        inc y
        inc y
        inc y
        rts

        .databank 0

      rsHDMACodeSetTableBank ; 82/C261

        .al
        .autsiz
        .databank ?

        sep #$20
        lda $0000,b,y
        sta aHDMASystem.aBankAndBBADx[0].bBank,b,x
        rep #$20

        inc y
        rts

        .databank 0

        ; 82/C26D

    .endsection HDMACodeSection
