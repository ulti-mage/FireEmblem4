
    .weak

      rlFindCharacterByGenerationID             :?= address($848726)

    .endweak

    .section Code91AD0BSection

      rlGetDeathQuote ; 91/AD0B

        .al
        .autsiz
        .databank ?

        ; A = character ID

        php
        pha
        phx
        phy

        ldx wSelectedUnitDataRAMPointer,b
        phx

        jsl rlCheckUsingDefaultOverLoverDeathQuote
        bcc _End

          pha
          jsl rlGetUnitRAMDataPointerByID
          jsl rlGetSelectedUnitFactionSlot
          cmp #0
          bne +

            ldx #0
            bra ++

            +
            ldx #1

          +
          lda wCurrentChapter,b
          cmp #6
          bcc +

            inc x
            inc x

          +
          lda #(`aGen1PlayerDeathQuotes)<<8
          sta lR18+1
          txa
          asl a
          tax
          lda aDeathQuotePointers,x
          sta lR18
          pla
          jsr rsTryFindDeathQuotePointer

        _End
        plx
        stx wSelectedUnitDataRAMPointer,b

        ply
        plx
        pla
        plp
        rtl

        .databank 0

      aDeathQuotePointers ; 91/AD54

        .word <>aGen1PlayerDeathQuotes
        .word <>aGen1EnemyNPCDeathQuotes

        .word <>aGen2PlayerDeathQuotes
        .word <>aGen2EnemyNPCDeathQuotes

      rsTryFindDeathQuotePointer ; 91/AD5C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = character ID

        ; Output:
        ; CLC if found, else SEC

        pha
        sta wR0

        ldy #-4

        -
        inc y
        inc y
        inc y
        inc y
        lda [lR18],y
        beq +

          cmp wR0
          bne -

            inc y
            inc y
            lda [lR18],y
            clc
            bra ++

        +
        lda #0
        sta lR18+1
        sec

        +
        sta lR18
        pla
        rts

        .databank 0

      rlUnknown91AD7F ; 91/AD7F

        .al
        .autsiz
        .databank ?

        php
        phx
        jsl $84EFA5
        jsl rlGetDeathQuote
        plx
        plp
        rtl

        .databank 0

      rlCheckUsingDefaultOverLoverDeathQuote ; 91/AD8C

        .al
        .autsiz
        .databank ?

        ; Output:
        ; SEC if using the default quote
        ; CLC if using the lover quote

        pha
        pha
        lda #(`aLoverDeathQuotes)<<8
        sta lR18+1
        lda #<>aLoverDeathQuotes
        sta lR18
        pla

        jsr rsTryFindDeathQuotePointer
        bcs _SEC

          jsl rlGetUnitRAMDataPointerByID
          jsl rlGetSelectedUnitLoverGenerationID
          and #$FFFF
          beq _SEC

            jsl rlFindCharacterByGenerationID
            bcs _SEC

              jsl rlGetSelectedUnitCharacterID
              sta aDialogue.wUnit1,b

              jsl rlGetSelectedUnitStates
              bit #UnitStateDead
              bne _SEC

                clc
                bra +

        _SEC
        sec

        +
        pla
        rtl

        .databank 0

      rlUnknown91ADC7 ; 91/ADC7

        .al
        .autsiz
        .databank ?

        php
        phx
        phy

        sta lR19

        lda wUnknown00171A,b
        bit #$0001
        bne _End

        txa
        lda lR19
        bne +

        jsr rsUnknown91ADE5
        bra _End
        
        +
        jsr rsUnknown91AE14
        
        _End
        ply
        plx
        plp
        rtl

        .databank 0

      rsUnknown91ADE5 ; 91/ADE5

        .al
        .autsiz
        .databank ?

        php

        sep #$20
        ldx #size(aUnknown91AE49)

          -
          lda aUnknown91AE49,x
          sta aEventScriptBuffer,x
          dec x
          bpl -

        rep #$20

        lda lR18
        sta aEventScriptBuffer + 4
        lda lR18+1
        sta aEventScriptBuffer + 4 +1

        lda #(`aEventScriptBuffer)<<8
        sta lR18+1
        lda #<>aEventScriptBuffer
        sta lR18
        jsl rlUnknown80C1FC
        plp
        rts

        .databank 0

      rsUnknown91AE14 ; 91/AE14

        .al
        .autsiz
        .databank ?

        php

        sep #$20
        ldx #size(aUnknown91AE58)

          -
          lda aUnknown91AE58,x
          sta aEventScriptBuffer,x
          dec x
          bpl -

        ; Song ID
        lda lR19
        sta aEventScriptBuffer + 8
        rep #$20

        ; Dialogue pointer
        lda lR18
        sta aEventScriptBuffer + 10
        lda lR18+1
        sta aEventScriptBuffer + 10+1

        lda #(`aEventScriptBuffer)<<8
        sta lR18+1
        lda #<>aEventScriptBuffer
        sta lR18
        jsl rlUnknown80C1FC

        plp
        rts

        .databank 0

    aUnknown91AE49 .block ; 91/AE49

      PLAY_SFX_WORD $7FF7
      DIALOGUE $000000
      YIELD

      PLAY_SFX_WORD $00E8

      RUN_EVENT_CONDITION
        EC_73

      END_EVENT

      .bend

    aUnknown91AE58 .block ; 91/AE58

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      PLAY_SONG $00

      DIALOGUE $000000
      YIELD

      RUN_ASM rlASMCCheckIfAnimationsOff

      JUMP_RELATIVE_FALSE +

        PLAY_SFX_WORD $00E0
        PAUSE 35
        YIELD

        RESTORE_PHASE_MUSIC
        YIELD

      +
      RUN_EVENT_CONDITION
        EC_73

      END_EVENT

      .bend

      rlASMCCheckIfAnimationsOff ; 91/AE7A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wSelectedUnitDataRAMPointer
        pha
        lda wR0
        pha

        lda wBattleStatus
        bit #$0040
        beq +

        lda #1
        sta wEventEngineTruthFlag
        bra ++
        
        +
        lda #0
        sta wEventEngineTruthFlag
        
        +
        pla
        sta wR0
        pla
        sta wSelectedUnitDataRAMPointer
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlDialogueTryGetActiveChildPortrait ; 91/AEAE

        .al
        .autsiz
        .databank ?

        ; If its chapter 6+ and the PortraitID belongs to a child unit,
        ; get the GenerationID based on the PortraitID, and then load
        ; the portrait that belongs to that unit if found. Else load the portrait
        ; of the substitute.

        ; Input:
        ; A = PortraitID

        ; Output
        ; A = CharacterID/ input PortraitID, if CharacterID not found

        php
        phx
        pha
        sta wR0

        lda wCurrentChapter,b
        cmp #6
        bcc _End

          ; Only run for chapter 6+

          ldx #-2

            -
            inc x
            inc x
            lda aDialogueChildrenPortraits,x
            beq _End

              cmp wR0
              bne -

          txa
          lsr a
          lsr a
          tax
          lda aDialogueChildrenGenerationIDs,x
          and #$00FF
          phx
          jsl rlFindCharacterByGenerationID
          plx
          bcc _Found

            txa
            asl a
            asl a
            tax
            lda aDialogueChildrenPortraits,x
            bra +

            _Found
            jsl rlGetSelectedUnitCharacterID

          +
          plx
          bra +

        _End
        pla

        +
        plx
        plp
        rtl

        .databank 0

      aDialogueChildrenPortraits ; 91/AEF2

        .word PortraitDalvin
        .word PortraitScathach

        .word PortraitAsaello
        .word PortraitFebail

        .word PortraitCharlot
        .word PortraitCoirpre

        .word PortraitHawk
        .word PortraitCed

        .word PortraitTristan
        .word PortraitDiarmuid

        .word PortraitDeimne
        .word PortraitLester

        .word PortraitAmid
        .word PortraitArthur

        .word PortraitDaisy
        .word PortraitPatty

        .word PortraitCreidne
        .word PortraitLarcei

        .word PortraitMuirne
        .word PortraitLana

        .word PortraitHermina
        .word PortraitFee

        .word PortraitLinda
        .word PortraitTine

        .word PortraitLaylea
        .word PortraitLene

        .word PortraitJeanne
        .word PortraitNanna

        .word 0

      aDialogueChildrenGenerationIDs ; 91/AF2C

        .byte $03
        .byte $04
        .byte $07
        .byte $08
        .byte $09
        .byte $0B
        .byte $0E
        .byte $10
        .byte $11
        .byte $12
        .byte $15
        .byte $16
        .byte $17
        .byte $18

      rlDialogueTryGetActiveChildSiblingPortrait ; 91/AF3A

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = PortraitID

        php
        phx
        jsl rlDialogueTryGetActiveChildPortrait
        pha
        sta wR0

        ldx #-2

          _Loop
          inc x
          inc x
          lda _SiblingPortraits,x
          beq _End

            cmp wR0
            bne _Loop

        txa
        eor #2
        tax
        lda _SiblingPortraits,x
        plx
        bra +

        _End
        pla

        +
        plx
        plp
        rtl

        .databank 0

        _SiblingPortraits ; 91/AF62

        .word Seliph,   Julia
        .word Leif,     Altena
        .word Scathach, Larcei
        .word Dalvin,   Creidne
        .word Febail,   Patty
        .word Asaello,  Daisy
        .word Coirpre,  Lene
        .word Charlot,  Laylea
        .word Ced,      Fee
        .word Hawk,     Hermina
        .word Diarmuid, Nanna
        .word Tristan,  Jeanne
        .word Lester,   Lana
        .word Deimne,   Muirne
        .word Arthur,   Tine
        .word Amid,     Linda
        .word 0

      ; 91/AFA4


    .endsection Code91AD0BSection








