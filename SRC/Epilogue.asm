
    .weak

      rlFillEventUnitSlot1                          :?= address($91C947)
      rlEventEngineFreeProc                         :?= address($91A47D)
      rlEventEngineCreateProc                       :?= address($91A455)

    .endweak


    .section EpilogueDialogueWorldMapCodeSection

      rlASMCEpilogueWorldMapSilesseCheckNoInheritors ; 8D/B63D

        .al
        .autsiz
        .databank ?

        ldx #LewnysSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _End

          ldx #LewnysDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _End

            lda #(`dialogueChapterEpilogueWorldMap_Silesse_NoInheritors)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Silesse_NoInheritors
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilesseCheckInherited ; 8D/B664

        .al
        .autsiz
        .databank ?

        ldx #LewnysSonEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue

          ldx #LewnysDaughterEpilogueID
          txa
          sta $7F547E
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne _Dialogue
          bra _End

        _Dialogue
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Silesse_Inherited)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Silesse_Inherited
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceStart ; 8D/B6A4

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _Dialogue

        lda $7F547E
        cmp #LewnysDaughterEpilogueID
        beq +

          ldx #LewnysDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

        +
        ldx #CedEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #HawkEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #FeeEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #HerminaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue
        bra _End

        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_Start)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_Start
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceEnd ; 8D/B708

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _Dialogue

        lda $7F547E
        cmp #LewnysDaughterEpilogueID
        beq +

          ldx #LewnysDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

        +
        ldx #CedEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #HawkEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #FeeEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #HerminaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue
        bra _End

        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_End)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_End
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceRulerNoLover ; 8D/B76C

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _End

          lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_RulerNoLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_RulerNoLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceRulersLover ; 8D/B789

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_RulersLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_RulersLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceRulersSister ; 8D/B7B2

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #LewnysDaughterEpilogueID
        beq _End

          ldx #LewnysDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #2
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_RulersSister)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_RulersSister
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceCedHawk ; 8D/B7E0

        .al
        .autsiz
        .databank ?

        ldx #CedEpilogueID
        txa
        sta $7F5480
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue

          ldx #HawkEpilogueID
          txa
          sta $7F5480
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne _Dialogue

            lda #0
            sta $7F5480
            bra _End

        _Dialogue
        lda aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_CedHawk)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_CedHawk
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceCedHawksLover ; 8D/B82A

        .al
        .autsiz
        .databank ?

        lda $7F5480
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_CedHawksLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_CedHawksLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapSilessePieceFeeHerimna ; 8D/B853

        .al
        .autsiz
        .databank ?

        ldx #FeeEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue

          ldx #HerminaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

        _Dialogue
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Silesse_Piece_FeeHermina)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Silesse_Piece_FeeHermina
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaCheckNoInheritors ; 8D/B887

        .al
        .autsiz
        .databank ?

        ldx #LeifEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _End

          ldx #AltenaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne _End

            lda #(`dialogueChapterEpilogueWorldMap_NewThracia_NoInheritors)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_NewThracia_NoInheritors
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaCheckInherited ; 8D/B8B4

        .al
        .autsiz
        .databank ?

        stz $078C,b

        ldx #LeifEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne +

          ldx #AltenaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne +
          bra _End

        +
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_NewThracia_Inherited)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_NewThracia_Inherited
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceEndCheckLeifAndAltenaAlive ; 8D/B8ED

        .al
        .autsiz
        .databank ?

        ldx #LeifEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #AltenaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndLeifAndAltenaAlive)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndLeifAndAltenaAlive
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceLeifNoLover ; 8D/B91A

        .al
        .autsiz
        .databank ?

        ldx #LeifEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _End

          lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_LeifNoLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_LeifNoLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceStart ; 8D/B935

        .al
        .autsiz
        .databank ?

        ldx #LeifEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne +

        ldx #FinnEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #HannibalEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #CharlotEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #CoirpreEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #AsaelloEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #DaisyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +
        bra _End

        +
        lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_Start)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_Start
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceLeifsLover ; 8D/B99A

        .al
        .autsiz
        .databank ?

        ldx #LeifEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq +

          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_LeifsLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_LeifsLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        +
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceFinn ; 8D/B9BF

        .al
        .autsiz
        .databank ?

        ldx #FinnEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_Finn)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_Finn
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceHannibal ; 8D/B9E4

        .al
        .autsiz
        .databank ?

        ldx #HannibalEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_Hannibal)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_Hannibal
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceCharlotCoirpre ; 8D/BA09

        .al
        .autsiz
        .databank ?

        ldx #CharlotEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne +

          ldx #CoirpreEpilogueID
          txa
          sta $7F547E
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne +

            lda #0
            sta $7F547E
            bra _End

        +
        lda aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_CharlotCoirpre)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_CharlotCoirpre
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceCharlotCoirpresLover ; 8D/BA53

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_CharlotCoirpresLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_CharlotCoirpresLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceAsaello ; 8D/BA7C

        .al
        .autsiz
        .databank ?

        ldx #AsaelloEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_Asaello)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_Asaello
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceAsaellosLover ; 8D/BAA1

        .al
        .autsiz
        .databank ?

        ldx #AsaelloEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_AsaellosLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_AsaellosLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceDaisy ; 8D/BAC6

        .al
        .autsiz
        .databank ?

        ldx #DaisyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_Daisy)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_Daisy
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceEndNoInheritors ; 8D/BAEB

        .al
        .autsiz
        .databank ?

        ldx #FinnEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #HannibalEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #CharlotEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #CoirpreEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #AsaelloEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #DaisyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +
        bra _End

        +
        lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndNoInheritors)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndNoInheritors
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapNewThraciaPieceEndInherited ; 8D/BB44

        .al
        .autsiz
        .databank ?

        ldx #LeifEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne +

        ldx #FinnEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #HannibalEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #CharlotEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #CoirpreEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #AsaelloEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

        ldx #DaisyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +
        bra _End

        +
        lda #(`dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndInherited)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndInherited
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachCheckNoInheritors ; 8D/BBA9

        .al
        .autsiz
        .databank ?

        ldx #ShannanEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _End

          ldx #ScathachEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _End

            ldx #LarceiEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne _End

              lda #(`dialogueChapterEpilogueWorldMap_Isaach_NoInheritors)<<8
              sta lR18+1
              lda #<>dialogueChapterEpilogueWorldMap_Isaach_NoInheritors
              sta lR18
              jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachCheckInherited ; 8D/BBDC

        .al
        .autsiz
        .databank ?

        ldx #ShannanEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

          ldx #ScathachEpilogueID
          txa
          sta $7F547E
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne +

            ldx #LarceiEpilogueID
            txa
            sta $7F547E
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne +

              lda #0
              sta $7F547E
              bra _End

        +
        sta aDialogue.wUnit1,b
        sta $7F547C

        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Isaach_Inherited)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Isaach_Inherited
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceNoInheritorsSubstitutes ; 8D/BC35

        .al
        .autsiz
        .databank ?

        ; Checks if Scathach was never recruited

        lda #Scathach
        asl a
        tax
        lda aEpilogueUnitStates,x
        bit #$4000
        beq _End

          lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_NoInheritorsSubstitutes)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_NoInheritorsSubstitutes
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceNoInheritorsChildren ; 8D/BC52

        .al
        .autsiz
        .databank ?

        ; Checks if Scathach was recruited

        lda #Scathach
        asl a
        tax
        lda aEpilogueUnitStates,x
        bit #$4000
        bne _End

          lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_NoInheritorsChildren)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_NoInheritorsChildren
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceRulerNoLover ; 8D/BC6F

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _End

          lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_RulerNoLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_RulerNoLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceRulersLover ; 8D/BC8C

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_RulersLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_RulersLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceScathachDalvin ; 8D/BCB5

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #ScathachEpilogueID
        beq +

          ldx #ScathachEpilogueID
          txa
          sta $7F5480
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne ++

        +
        ldx #DalvinEpilogueID
        txa
        sta $7F5480
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne +

          lda #0
          sta $7F5480
          bra _End

        +
        lda aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_ScathachDalvin)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_ScathachDalvin
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        
        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceScathachDalvinsLover ; 8D/BD08

        .al
        .autsiz
        .databank ?

        lda $7F5480
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_ScathachDalvinsLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_ScathachDalvinsLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceLarceiCreidne ; 8D/BD31

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #LarceiEpilogueID
        beq +

          ldx #LarceiEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne ++

        +
        ldx #CreidneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

        +
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_LarceiCreidne)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_LarceiCreidne
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceDeimne ; 8D/BD6E

        .al
        .autsiz
        .databank ?

        ldx #DeimneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_Deimne)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_Deimne
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceDeimnesLover ; 8D/BD93

        .al
        .autsiz
        .databank ?

        ldx #DeimneEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_DeimnesLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_DeimnesLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceMuirne ; 8D/BDB8

        .al
        .autsiz
        .databank ?

        ldx #MuirneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_Muirne)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_Muirne
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceEndNoInheritors ; 8D/BDDD

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #ScathachEpilogueID
        beq +

          ldx #ScathachEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne _Dialogue

        +
        lda $7F547E
        cmp #LarceiEpilogueID
        beq +

          ldx #LarceiEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne _Dialogue

        +
        ldx #DalvinEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue 

        ldx #CreidneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue

        ldx #DeimneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue

        ldx #MuirneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue
        bra _End
        
        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_EndNoInheritors)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_EndNoInheritors
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        
        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapIsaachPieceEndInherited ; 8D/BE5A

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _Dialogue

        lda $7F547E
        cmp #ScathachEpilogueID
        beq +

          ldx #ScathachEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

        +
        lda $7F547E
        cmp #LarceiEpilogueID
        beq +

          ldx #LarceiEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

        +
        ldx #DalvinEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #CreidneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #DeimneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue

        ldx #MuirneEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue
        bra _End
        
        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Isaach_Piece_EndInherited)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Isaach_Piece_EndInherited
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        lda $7F547C
        sta aDialogue.wUnit1,b
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaCheckNoInheritors ; 8D/BEE0

        .al
        .autsiz
        .databank ?

        ldx #AresEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _End

          ldx #DiarmuidEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne _End

            ldx #NannaEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            sta aDialogue.wUnit1,b
            bne _End

              lda #(`dialogueChapterEpilogueWorldMap_Agustria_NoInheritors)<<8
              sta lR18+1
              lda #<>dialogueChapterEpilogueWorldMap_Agustria_NoInheritors
              sta lR18
              jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaCheckInherited ; 8D/BF1C

        .al
        .autsiz
        .databank ?

        ldx #AresEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

          ldx #DiarmuidEpilogueID
          txa
          sta $7F547E
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne +

            ldx #NannaEpilogueID
            txa
            sta $7F547E
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne +

              lda #0
              sta $7F547E
              bra _End

        +
        sta aDialogue.wUnit1,b
        sta $7F547C

        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Agustria_Inherited)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Agustria_Inherited
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceRulerNoLover ; 8D/BF75

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _End

          lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_RulerNoLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_RulerNoLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceStart ; 8D/BF92

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _Dialogue

          lda $7F547E
          cmp #DiarmuidEpilogueID
          beq +

            ldx #DiarmuidEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne _Dialogue

          +
          lda $7F547E
          cmp #NannaEpilogueID
          beq +

            ldx #NannaEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne _Dialogue

          +
          ldx #LayleaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

          ldx #LeneEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

          ldx #TristanEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

          ldx #JeanneEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue
          bra _End

        _Dialogue
        lda aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_Start)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_Start
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceRulersLover ; 8D/C015

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_RulersLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_RulersLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceLayleaLene ; 8D/C03E

        .al
        .autsiz
        .databank ?

        ldx #LayleaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne +

          ldx #LeneEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

        +
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_LayleaLene)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_LayleaLene
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceDiarmuidTristan ; 8D/C072

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #DiarmuidEpilogueID
        beq +

          ldx #DiarmuidEpilogueID
          txa
          sta $7F5480
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne _Dialogue

        +
        ldx #TristanEpilogueID
        txa
        sta $7F5480
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        bne _Dialogue

          lda #0
          sta $7F5480
          bra _End

        _Dialogue
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_DiarmuidTristan)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_DiarmuidTristan
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceDiarmuidTristansLover ; 8D/C0C2

        .al
        .autsiz
        .databank ?

        lda $7F5480
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_DiarmuidTristansLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_DiarmuidTristansLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceNannaJeanne ; 8D/C0EB

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #NannaEpilogueID
        beq _End

          ldx #NannaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          bne +

            ldx #JeanneEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            sta aDialogue.wUnit1,b
            beq _End

          +
          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_NannaJeanne)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_NannaJeanne
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapAgustriaPieceEnd ; 8D/C128

        .al
        .autsiz
        .databank ?

        lda $7F547E
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _Dialogue

          lda $7F547E
          cmp #DiarmuidEpilogueID
          beq +

            ldx #DiarmuidEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne _Dialogue

          +
          lda $7F547E
          cmp #NannaEpilogueID
          beq +

            ldx #NannaEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne _Dialogue

          +
          ldx #LayleaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

          ldx #LeneEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

          ldx #TristanEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue

          ldx #JeanneEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue
          bra _End

        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Agustria_Piece_End)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Agustria_Piece_End
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        
        _End
        lda $7F547C
        sta aDialogue.wUnit1,b
        rtl

        .databank 0

      rlASMCEpilogueWorldMapVerdaneCheckNoInheritors ; 8D/C1A8

        .al
        .autsiz
        .databank ?

        ldx #JamkesSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _End

          ldx #JamkesDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _End

            lda #(`dialogueChapterEpilogueWorldMap_Verdane_NoInheritors)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Verdane_NoInheritors
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapVerdaneCheckInherited ; 8D/C1CF

        .al
        .autsiz
        .databank ?

        ldx #JamkesSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        sta $7F547C
        beq +
        bra _Dialogue

          +
          ldx #JamkesDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          sta $7F547C
          beq _End

        _Dialogue
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Verdane_Inherited)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Verdane_Inherited
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        
        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapVerdanePieceJamkesSonNoLover ; 8D/C20D

        .al
        .autsiz
        .databank ?

        ldx #JamkesSonEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _End

          lda #(`dialogueChapterEpilogueWorldMap_Verdane_Piece_JamkesSonNoLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Verdane_Piece_JamkesSonNoLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapVerdanePieceJamkesSonLover ; 8D/C228

        .al
        .autsiz
        .databank ?

        ldx #JamkesSonEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Verdane_Piece_JamkesSonLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Verdane_Piece_JamkesSonLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapVerdaneLoadRuler ; 8D/C24D

        .al
        .autsiz
        .databank ?

        lda $7F547C
        sta aDialogue.wUnit1,b
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceSoloQueen ; 8D/C255

        .al
        .autsiz
        .databank ?

        ; Seliphs wife is Julia OR Seliph has wife and Julia doesn't go to Grannvale.

        ldx #SeliphEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          cmp #Julia
          beq _Dialogue

            ldx #JuliaEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            bne _End

          _Dialogue
          lda aDialogue.wUnit1,b
          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_SoloQueen)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_SoloQueen
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceQueenAndJulia ; 8D/C28E

        .al
        .autsiz
        .databank ?

        ; Seliph has wife thats not Julia and Julia goes to Grannvale.

        ldx #SeliphEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          cmp #Julia
          beq _End

            ldx #JuliaEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            beq _End

              lda aDialogue.wUnit1,b
              ldx #4
              jsl rlLoadPortraitIntoSlot

              lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_QueenAndJulia)<<8
              sta lR18+1
              lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_QueenAndJulia
              sta lR18
              jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceNoQueenAndJulia ; 8D/C2C7

        .al
        .autsiz
        .databank ?

        ; Seliph has no wife and Julia goes to Grannvale.

        ldx #SeliphEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _End

          ldx #JuliaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          beq _End

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_NoQueenAndJulia)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_NoQueenAndJulia
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePiecePrepareQueen ; 8D/C2EE

        .al
        .autsiz
        .databank ?

        ldx #SeliphEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        bne _Dialogue

          ldx #JuliaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne _Dialogue
          bra _End

        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_PrepareQueen)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_PrepareQueen
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceStart ; 8D/C317

        .al
        .autsiz
        .databank ?

        ldx #AzellesSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP

        ldx #AzellesDaughterEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP

        ldx #ArthurEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP

        ldx #AmidEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP

        ldx #TineEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP

        ldx #LindaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP

        ldx #ClaudsSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP

        ldx #ClaudsDaughterEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _DialogueJMP
        bra +

        _DialogueJMP
        jml _Dialogue

        +
        ldx #LexSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #LexDaughterEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #IucharEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #IucharbaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #FebailEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #PattyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #LesterEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #LanaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #OifeyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue
        bra _End

        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Start)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Start
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceVelthomerRuler ; 8D/C403

        .al
        .autsiz
        .databank ?

        ldx #AzellesSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

          ldx #AzellesDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          beq _End

        _Dialogue
        sta aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_Ruler)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_Ruler
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceVelthomerAzellesSonLover ; 8D/C434

        .al
        .autsiz
        .databank ?

        ldx #AzellesSonEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        beq _End

          sta aDialogue.wUnit1,b
          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_AzellesSonLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_AzellesSonLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceVelthomerAzellesChildren ; 8D/C459

        .al
        .autsiz
        .databank ?

        ldx #AzellesSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        beq _End

          ldx #AzellesDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          beq _End

            sta aDialogue.wUnit1,b
            ldx #2
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_AzellesChildren)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_AzellesChildren
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceFriegeRuler ; 8D/C48A

        .al
        .autsiz
        .databank ?

        ldx #ArthurEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #AmidEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #TineEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #LindaEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        lda #0
        sta $7F547E
        bra _End

        _Dialogue
        sta aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_Ruler)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_Ruler
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceFriegeRulersLover ; 8D/C4F0

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          beq _End

            sta aDialogue.wUnit1,b
            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_RulersLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_RulersLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceFriegeRulersSister ; 8D/C519

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

        cmp #ArthurEpilogueID
        beq _Arthur

        cmp #AmidEpilogueID
        beq _Amid
        bra _End

        _Arthur
        ldx #TineEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue
        bra _End

        _Amid
        ldx #LindaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue
        bra _End

        _Dialogue
        sta aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_RulersSister)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_RulersSister
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceEddaRuler ; 8D/C560

        .al
        .autsiz
        .databank ?

        ldx #ClaudsSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

          ldx #ClaudsDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          beq _End

        +
        sta aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_Ruler)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_Ruler
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceEddaRulersLover ; 8D/C591

        .al
        .autsiz
        .databank ?

        ldx #ClaudsSonEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        beq _End

          sta aDialogue.wUnit1,b
          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_RulersLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_RulersLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceEddaRulersSister ; 8D/C5B6

        .al
        .autsiz
        .databank ?

        ldx #ClaudsSonEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        beq _End

          ldx #ClaudsDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          beq _End

            sta aDialogue.wUnit1,b
            ldx #2
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_RulersSister)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_RulersSister
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceDozelRuler ; 8D/C5E7

        .al
        .autsiz
        .databank ?

        ldx #LexSonEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #LexDaughterEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #IucharEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #IucharbaEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        lda #0
        sta $7F547E
        bra _End

        _Dialogue
        sta aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Ruler)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Ruler
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceDozelRulersLover ; 8D/C64D

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          bne _Dialogue
          bra _End

          _Dialogue
          sta aDialogue.wUnit1,b
          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_RulersLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_RulersLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack
        
        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceDozelRulersSister ; 8D/C678

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #LexSonEpilogueID
        bne _End

          ldx #LexDaughterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          beq _End

            sta aDialogue.wUnit1,b
            ldx #2
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_RulersSister)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_RulersSister
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceDozelIuchar ; 8D/C6A6

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #IucharEpilogueID
        beq _End

          ldx #IucharEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #2
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Iuchar)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Iuchar
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceDozelIucharsLover ; 8D/C6D4

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #IucharEpilogueID
        beq _End

          ldx #IucharEpilogueID
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_IucharsLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_IucharsLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceDozelIucharba ; 8D/C702

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #IucharbaEpilogueID
        beq _End

          ldx #IucharbaEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #2
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Iucharba)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Iucharba
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceDozelIucharbasLover ; 8D/C730

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #IucharbaEpilogueID
        beq _End

          ldx #IucharbaEpilogueID
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_IucharbasLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_IucharbasLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceYngviRuler ; 8D/C75E

        .al
        .autsiz
        .databank ?

        ldx #FebailEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #PattyEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #LesterEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        ldx #LanaEpilogueID
        txa
        sta $7F547E
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue

        lda #0
        sta $7F547E
        bra _End

        _Dialogue
        sta aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Ruler)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Ruler
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        
        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceYngviRulersLover ; 8D/C7C4

        .al
        .autsiz
        .databank ?

        lda $7F547E
        beq _End

          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          bne _Dialogue
          bra _End

            _Dialogue
            sta aDialogue.wUnit1,b
            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_RulersLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_RulersLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceYngviRulersSister ; 8D/C7EF

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #FebailEpilogueID
        beq _Febail

        cmp #LesterEpilogueID
        beq _Lester
        bra _End

        _Febail
        ldx #PattyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue
        bra _End

        _Lester
        ldx #LanaEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne _Dialogue
        bra _End

        _Dialogue
        sta aDialogue.wUnit1,b
        ldx #2
        jsl rlLoadPortraitIntoSlot

        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_RulersSister)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_RulersSister
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceYngviLester ; 8D/C834

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #LesterEpilogueID
        beq _End

          ldx #LesterEpilogueID
          lda aEpilogueMainCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #2
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Lester)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Lester
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceYngviLestersLover ; 8D/C862

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #LesterEpilogueID
        beq _End

          ldx #LesterEpilogueID
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aDialogue.wUnit1,b
          beq _End

            ldx #4
            jsl rlLoadPortraitIntoSlot

            lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_LestersLover)<<8
            sta lR18+1
            lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_LestersLover
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceYngviLana ; 8D/C890

        .al
        .autsiz
        .databank ?

        lda $7F547E
        cmp #LesterEpilogueID
        beq _End

          lda $7F547E
          cmp #LanaEpilogueID
          beq _End

            ldx #LanaEpilogueID
            lda aEpilogueMainCharacters,x
            and #$00FF
            sta aDialogue.wUnit1,b
            beq _End

              ldx #2
              jsl rlLoadPortraitIntoSlot

              lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Lana)<<8
              sta lR18+1
              lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Lana
              sta lR18
              jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceChalphyOifey ; 8D/C8C7

        .al
        .autsiz
        .databank ?

        ldx #OifeyEpilogueID
        lda aEpilogueMainCharacters,x
        and #$00FF
        beq _End

          ldx #2
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Chalphy_Oifey)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Chalphy_Oifey
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCEpilogueWorldMapGrannvalePieceChalphyOifeysLover ; 8D/C8E9

        .al
        .autsiz
        .databank ?

        ldx #OifeyEpilogueID
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aDialogue.wUnit1,b
        beq _End

          ldx #4
          jsl rlLoadPortraitIntoSlot

          lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Chalphy_OifeysLover)<<8
          sta lR18+1
          lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Chalphy_OifeysLover
          sta lR18
          jsl rlDialoguePushToActivePointerStack

        _End
        rtl

        .databank 0

      rlASMCUnknown8DC90E ; 8D/C90E

        .al
        .autsiz
        .databank ?

        ; This and the next asmc call a proc to the Aed cutscene, this one doesn't
        ; fade out the song properly and fades in the graphics faster?

        lda aDialogue.lActivePointer,b
        sec
        sbc #5
        sta aDialogue.lActivePointer,b

        lda $0AD3,b
        cmp #$556E
        bcs _C938

        cmp #$0708
        bcc _Dialogue

        cmp #$4F1A
        bcc +
        bra _Dialogue

        +
        lda aDialogue.lActivePointer,b
        clc
        adc #5
        sta aDialogue.lActivePointer,b
        bra _Dialogue

        _C938
        jsl $8B80F3

        lda aDialogue.lActivePointer,b
        clc
        adc #5
        sta aDialogue.lActivePointer,b

        _Dialogue
        lda #(`dialogueChapterEpilogueWorldMap_Grannvale_Piece_Unknown8DF329)<<8
        sta lR18+1
        lda #<>dialogueChapterEpilogueWorldMap_Grannvale_Piece_Unknown8DF329
        sta lR18
        jsl rlDialoguePushToActivePointerStack
        rtl

        .databank 0

      rlASMCUnknown8DC955 ; 8D/C955

        .al
        .autsiz
        .databank ?

        ; This and the previous asmc call a proc to the Aed cutscene, this one is the
        ; proper one?

        lda $0AD3,b
        cmp #$556E
        bcs _End

          jsl $8B80CB
          bra _End

        _End
        rtl

        .databank 0

        ; 8D/C964

    .endsection EpilogueDialogueWorldMapCodeSection

    .section EpilogueDialogueCodeSection

      rlASMCSetBelhallaEpilogue ; 91/BA9C

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionBelhalla
        bra +

      rlASMCSetIsaachEpilogue ; 91/BAA1

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionIsaach
        bra +

      rlASMCSetNewThraciaEpilogue ; 91/BAA6

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionNewThracia
        bra +

      rlASMCSetAgustriaEpilogue ; 91/BAAB

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionAgustria
        bra +

      rlASMCSetVerdaneEpilogue ; 91/BAB0

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionVerdane
        bra +

      rlASMCSetYngviEpilogue ; 91/BAB5

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionYngvi
        bra +

      rlASMCSetFriegeEpilogue ; 91/BABA

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionFriege
        bra +

      rlASMCSetDozelEpilogue ; 91/BABF

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionDozel
        bra +

      rlASMCSetEddaEpilogue ; 91/BAC4

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionEdda
        bra +

      rlASMCSetVelthomerEpilogue ; 91/BAC9

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionVelthomer
        bra +

      rlASMCSetChalphyEpilogue ; 91/BACE

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionChalphy
        bra +

      rlASMCSetSilesseEpilogue ; 91/BAD3

        .al
        .autsiz
        .databank ?

        lda #EpilogueRegionSilesse

        +
        sta aEpilogue.wRegionID,b
        asl a
        tax
        lda aEpilogueRegions,x
        and #$00FF

        sta aEpilogue.wCurrentEpilogueID,b

        lda aEpilogueRegions+1,x
        and #$00FF
        sta aEpilogue.wNextEpilogueID,b

        lda #3
        sta aDialogue.wTextSound,b
        lda #6
        sta aDialogue.wTextSpeed,b

        stz aEpilogue.wUnknown00174B,b

        lda #DialogueStatusPreventASpeedUp
        tsb aDialogue.wStatus,b
        rtl

        .databank 0

      aEpilogueRegions .include "../TABLES/SYSTEM/EpilogueRegions.csv.asm" ; 91/BB05

      rlASMCLoadEpilogueDialogue ; 91/BB1D

        .al
        .autsiz
        .databank ?

        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b
        dec aDialogue.lActivePointer,b

        lda aEpilogue.wCurrentEpilogueID,b
        cmp aEpilogue.wNextEpilogueID,b
        bne +

          jml _BBFD

        +
        bcc +

          jml _EndDialogue

        +
        lda #$FFFE
        sta wEventUnit1Pointer,b

        ldx aEpilogue.wCurrentEpilogueID,b
        lda aEpilogueMainCharacters,x
        and #$00FF
        bne +

          jml _SetNextDialogue

        +
        sta aDialogue.wUnit2,b
        sta aEpilogue.wUnknown00174D,b
        asl a
        tax
        lda aEpilogueUnitStates,x
        bit #$0100
        beq +

          lda #$0001
          tsb aEpilogue.wUnknown00174B,b

        +
        lda #(`dialogueEpiloge_PullDialogueStack)<<8
        sta lR18+1
        lda #<>dialogueEpiloge_PullDialogueStack
        sta lR18
        jsl rlDialoguePushToActivePointerStack

        lda aEpilogue.wCurrentEpilogueID,b
        bne +

          lda wEpilogueOtherUnitsExistFlag
          beq +

            lda #(`dialogueEpilogue_BelhallaEnd)<<8
            sta lR18+1
            lda #<>dialogueEpilogue_BelhallaEnd
            sta lR18
            jsl rlDialoguePushToActivePointerStack

        +
        lda #(`aEpiloguePointers)<<8
        sta lR19+1
        lda aEpilogue.wCurrentEpilogueID,b
        asl a
        tax
        lda aEpiloguePointers,x
        sta lR19

        ldx aEpilogue.wCurrentEpilogueID,b
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        sta aEpilogue.wUnknown00174F,b
        beq +

          pha
          lda aEpilogue.wRegionEpilogueCounter,b
          clc
          adc #$0100
          sta aEpilogue.wRegionEpilogueCounter,b
          pla
          bra ++

          +
          phx
          lda aDialogue.wUnit2,b
          asl a
          tax
          lda aEpilogueUnitStates,x
          and #$00FF
          plx

        +
        sta aDialogue.wUnit1,b

        lda aEpilogueChosenDialogueID,x
        and #$000F
        sta aEpilogue.wChosenDialogueID,b
        dec a
        sta wR0
        asl a
        clc
        adc wR0
        tay

        lda [lR19],y
        sta lR18
        inc y
        lda [lR19],y
        sta lR18+1

        _End
        jsl rlDialoguePushToActivePointerStack
        lda aEpilogue.wRegionEpilogueCounter,b
        clc
        adc #$0100
        sta aEpilogue.wRegionEpilogueCounter,b

        _SetNextDialogue
        inc aEpilogue.wCurrentEpilogueID,b
        rtl

        _BBFD
        lda aEpilogue.wUnknown00174B,b
        bit #$0001
        beq _EndDialogue

          lda aEpilogue.wRegionID,b
          and #$00FF
          sta wR0
          asl a
          clc
          adc wR0
          asl a
          tax

          lda aEpilogue.wRegionEpilogueCounter,b
          and #$FF00
          cmp #$0100
          beq +

            inc x
            inc x
            inc x

          +
          lda aEpilogueRegionEndDialoguePointers,x
          beq _EndDialogue

            sta lR18
            lda aEpilogueRegionEndDialoguePointers+1,x
            sta lR18+1
            bra _End

        _EndDialogue
        lda aDialogue.lActivePointer,b
        clc
        adc #5
        sta aDialogue.lActivePointer,b
        rtl

        .databank 0

      dialogueEpiloge_PullDialogueStack .include "../TEXT/DIALOGUE/Epilogue/PullDialogueStack.dialogue.txt" ; 91/BC3C

      rlASMCEpilogueSeliphLoverCallJuliaDead ; 91/BC40

        .al
        .autsiz
        .databank ?

        lda #0
        brl +

      rlASMCEpilogueSeliphLoverCallJuliaAlive ; 91/BC46

        .al
        .autsiz
        .databank ?

        lda #1
        brl +

      rlASMCEpilogueShannanLoverCall ; 91/BC4C

        .al
        .autsiz
        .databank ?

        lda #2
        brl +

      rlASMCEpilogueScathachDalvinLoverCallShannanDead ; 91/BC52

        .al
        .autsiz
        .databank ?

        lda #3
        brl +

      rlASMCEpilogueScathachDalvinLoverCallShannanAlive ; 91/BC58

        .al
        .autsiz
        .databank ?

        lda #4
        brl +

      rlASMCEpilogueDeimneLoverCallMuirneDead ; 91/BC5E

        .al
        .autsiz
        .databank ?

        lda #5
        bra +

      rlASMCEpilogueDeimneLoverCallMuirneAlive ; 91/BC63

        .al
        .autsiz
        .databank ?

        lda #6
        bra +

      rlASMCEpilogueLeifLoverCallAltenaDead ; 91/BC68

        .al
        .autsiz
        .databank ?

        lda #7
        bra +

      rlASMCEpilogueLeifLoverCallAltenaAlive ; 91/BC6D

        .al
        .autsiz
        .databank ?

        lda #8
        bra +

      rlASMCEpilogueCharlotCoirpreLoverCallHannibalDead ; 91/BC72

        .al
        .autsiz
        .databank ?

        lda #9
        bra +

      rlASMCEpilogueCharlotCoirpreLoverCallHannibalAlive ; 91/BC77

        .al
        .autsiz
        .databank ?

        lda #10
        bra +

      rlASMCEpilogueAsaelloLoverCallDaisyDead ; 91/BC7C

        .al
        .autsiz
        .databank ?

        lda #11
        bra +

      rlASMCEpilogueAsaelloLoverCallDaisyAlive ; 91/BC81

        .al
        .autsiz
        .databank ?

        lda #12
        bra +

      rlASMCEpilogueAresLoverCall ; 91/BC86

        .al
        .autsiz
        .databank ?

        lda #13
        bra +

      rlASMCEpilogueDiarmuidLoverCallAresDead ; 91/BC8B

        .al
        .autsiz
        .databank ?

        lda #14
        bra +

      rlASMCEpilogueDiarmuidLoverCallAresAlive ; 91/BC90

        .al
        .autsiz
        .databank ?

        lda #15
        bra +

      rlASMCEpilogueTristanLoverCallAresDead ; 91/BC95

        .al
        .autsiz
        .databank ?

        lda #16
        bra +

      rlASMCEpilogueTristanLoverCallAresAlive ; 91/BC9A

        .al
        .autsiz
        .databank ?

        lda #17
        bra +

      rlASMCEpilogueJamkesSonLoverCall ; 91/BC9F

        .al
        .autsiz
        .databank ?

        lda #18
        bra +

      rlASMCEpilogueFebailLoverCall ; 91/BCA4

        .al
        .autsiz
        .databank ?

        lda #19
        bra +

      rlASMCEpilogueLesterLoverCallBrigidsChildrenDead ; 91/BCA9

        .al
        .autsiz
        .databank ?

        lda #20
        bra +

      rlASMCEpilogueLesterLoverCallBrigidsChildrenAlive ; 91/BCAE

        .al
        .autsiz
        .databank ?

        lda #21
        bra +

      rlASMCEpilogueAmidArthurLoverCall ; 91/BCB3

        .al
        .autsiz
        .databank ?

        lda #22
        bra +

      rlASMCEpilogueLexSonLoverCall ; 91/BCB8

        .al
        .autsiz
        .databank ?

        lda #23
        bra +

      rlASMCEpilogueIucharLoverCall ; 91/BCBD

        .al
        .autsiz
        .databank ?

        lda #24
        bra +

      rlASMCEpilogueIucharbaLoverCall ; 91/BCC2

        .al
        .autsiz
        .databank ?

        lda #25
        bra +

      rlASMCEpilogueClaudsSonLoverCall ; 91/BCC7

        .al
        .autsiz
        .databank ?

        lda #26
        bra +

      rlASMCEpilogueAzellesSonLoverCall ; 91/BCCC

        .al
        .autsiz
        .databank ?

        lda #27
        bra +

      rlASMCEpilogueOifeyLoverCall ; 91/BCD1

        .al
        .autsiz
        .databank ?

        lda #28
        bra +

      rlASMCEpilogueCedLoverCall ; 91/BCD6

        .al
        .autsiz
        .databank ?

        lda #29
        bra +

      rlASMCEpilogueLewynsSonLoverCall ; 91/BCDB

        .al
        .autsiz
        .databank ?

        lda #30

        +
        pha

        lda aEpilogue.wUnknown00174F,b
        sta wR0
        ldx #-2

        -
        inc x
        inc x
        lda aEpilogueLoverPartners,x
        beq +

        cmp wR0
        bne -

        txa
        lsr a
        lsr a
        bra ++

        +
        lda #0

        +
        sta wR0
        asl a
        clc
        adc wR0
        tax

        lda aEpilogueLoverGroups,x
        sta lR19
        lda aEpilogueLoverGroups+1,x
        sta lR19+1

        pla
        sta wR0
        asl a
        clc
        adc wR0
        tay

        lda [lR19],y
        sta lR18
        inc y
        lda [lR19],y
        sta lR18+1
        jsl rlDialoguePushToActivePointerStack
        rtl

        .databank 0

      aEpilogueLoverPartners ; 91/BD24

        .word Daisy, Patty
        .word Creidne, Larcei
        .word Muirne, Lana
        .word Hermina, Fee
        .word Linda, Tine
        .word Laylea, Lene
        .word Jeanne, Nanna
        .word 0

        ; 91bd42

    .endsection EpilogueDialogueCodeSection

    .section EpilogueMovementSection

      rlASMCSetUpEpilogue ; B2/9396

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsl rlSetSaveSlotCompletionFlag
        jsl rlEvaluateEpilogueEndings
        jsl rlASMCRefreshAllUnits

        lda #0
        sta wEpilogueOtherUnitsExistFlag

        ; Sets units positions for the ending scene

        ; wR12 = max unit offset
        ; wR13 = position (in group) offset
        ; wR14 = group offset
        ; wR15 = current unit offset

        phk
        plb
        stz wR14
        stz wR15

          _OuterLoop
          ldx wR14
          lda _NextEpilogueRegion,x
          and #$00FF
          sta wR12
          stz wR13

            _InnerLoop
            ldx wR15
            lda aEpilogueMainCharacters,x
            and #$00FF
            beq +

              jsr rsEpiloguePlaceUnitOnMap

              ldx wR15
              lda aEpilogueSupportingCharacters,x
              and #$00FF
              beq +

                jsr rsEpiloguePlaceUnitOnMap

            +
            inc wR15

            lda wR15
            cmp wR12
            bne _InnerLoop

          inc wR14

          lda wR14
          cmp #EpilogueRegionSilesse + 1
          bne _OuterLoop

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        _NextEpilogueRegion ; B2/93F4
        .byte ShannanEpilogueID
        .byte LeifEpilogueID
        .byte AresEpilogueID
        .byte JamkesSonEpilogueID
        .byte FebailEpilogueID
        .byte ArthurEpilogueID
        .byte LexSonEpilogueID
        .byte ClaudsSonEpilogueID
        .byte AzellesSonEpilogueID
        .byte OifeyEpilogueID
        .byte CedEpilogueID
        .byte 50
        .byte 0

      rsEpiloguePlaceUnitOnMap ; B2/9401

        .al
        .autsiz
        .databank ?

        ; A = CharacterID

        sta wR10

        lda wR14
        asl a
        tax
        lda aEpilogueUnitPositionPointers,x
        sta wR11

        ldy wR13
        lda (wR11),y
        sta wRoutineVariable1,b

        ldx #FS_Player
        lda wR10
        jsl rlUnknown84C87A
        tax
        jsl rlDeployedUnitUnsetHiddenIfAlive
        inc wR13
        inc wR13

        lda wR14
        beq +

          lda #1
          sta wEpilogueOtherUnitsExistFlag

        +
        rts

        .databank 0

      aEpilogueUnitPositionPointers ; B2/9432

        .addr aEpilogueBelhallaUnitPositions
        .addr aEpilogueIsaachUnitPositions
        .addr aEpilogueNewThraciaUnitPositions
        .addr aEpilogueAgustriaUnitPositions
        .addr aEpilogueVerdaneUnitPositions
        .addr aEpilogueYngviUnitPositions
        .addr aEpilogueFriegeUnitPositions
        .addr aEpilogueDozelUnitPositions
        .addr aEpilogueEddaUnitPositions
        .addr aEpilogueVelthomerUnitPositions
        .addr aEpilogueChalphyUnitPositions
        .addr aEpilogueSilesseUnitPositions

      aEpilogueBelhallaUnitPositions ; B2/944A

        .word pack([42, 24])
        .word pack([42, 25])
        .word pack([41, 25])

      aEpilogueIsaachUnitPositions ; B2/9450

        .word pack([46, 24])
        .word pack([47, 24])
        .word pack([46, 23])
        .word pack([47, 23])
        .word pack([46, 22])
        .word pack([47, 22])
        .word pack([46, 21])
        .word pack([47, 21])

      aEpilogueNewThraciaUnitPositions ; B2/9460

        .word pack([44, 26])
        .word pack([44, 27])
        .word pack([45, 26])
        .word pack([45, 27])
        .word pack([46, 26])
        .word pack([46, 27])
        .word pack([47, 26])
        .word pack([47, 27])
        .word pack([48, 26])
        .word pack([48, 27])

      aEpilogueAgustriaUnitPositions ; B2/9474

        .word pack([39, 23])
        .word pack([38, 23])
        .word pack([39, 22])
        .word pack([38, 22])
        .word pack([39, 21])
        .word pack([38, 21])

      aEpilogueVerdaneUnitPositions ; B2/9480

        .word pack([41, 26])
        .word pack([40, 26])
        .word pack([41, 27])

      aEpilogueYngviUnitPositions ; B2/9486

        .word pack([42, 26])
        .word pack([43, 26])
        .word pack([42, 27])
        .word pack([43, 27])
        .word pack([42, 28])
        .word pack([43, 28])

      aEpilogueFriegeUnitPositions ; B2/9492

        .word pack([39, 24])
        .word pack([38, 24])
        .word pack([37, 24])

      aEpilogueDozelUnitPositions ; B2/9498

        .word pack([39, 26])
        .word pack([38, 26])
        .word pack([39, 27])
        .word pack([38, 27])
        .word pack([37, 27])

      aEpilogueEddaUnitPositions ; B2/94A2

        .word pack([46, 25])
        .word pack([47, 25])
        .word pack([48, 25])

      aEpilogueVelthomerUnitPositions ; B2/94A8

        .word pack([46, 20])
        .word pack([47, 20])
        .word pack([46, 19])

      aEpilogueChalphyUnitPositions ; B2/94AE

        .word pack([39, 25])
        .word pack([38, 25])

      aEpilogueSilesseUnitPositions ; B2/94B2

        .word pack([41, 20])
        .word pack([42, 20])
        .word pack([41, 19])
        .word pack([42, 19])
        .word pack([43, 20])
        .word pack([43, 19])
        .word pack([44, 19])

      rlASMCEpilogueHideSeliphWifeAndJulia ; B2/94C0

        .al
        .autsiz
        .databank ?

        lda aEpilogueMainCharacters + SeliphEpilogueID
        and #$00FF
        jsr rsEpilogueHideUnitInCastle

        lda aEpilogueSupportingCharacters + SeliphEpilogueID
        and #$00FF
        beq +

          jsr rsEpilogueHideUnitInCastle

        +
        lda aEpilogueMainCharacters + JuliaEpilogueID
        and #$00FF
        beq +

          jsr rsEpilogueHideUnitInCastle

        +
        rtl

        .databank 0

      rsEpilogueHideUnitInCastle ; B2/94E3

        .al
        .autsiz
        .databank ?

        jsl rlGetUnitRAMDataPointerByID
        jsl rlGetSelectedUnitDeploymentOffset
        tax
        lda #0
        jsl rlSetUnitResidingInCastle
        rts

        .databank 0

      procEpilogueUnitMovement .block ; B2/94F4

          .structProcInfo "ED", rlProcEpilogueUnitMovementInit, rlProcEpilogueUnitMovementCycle1, aProcEpilogueUnitMovementCode
          .word 0

          wCurrentTimer       = aProcSystem.aBody0
          wNextEpilogueID     = aProcSystem.aBody1
          wMaxTimer           = aProcSystem.aBody2
          wCurrentEpilogueID  = aProcSystem.aBody3

        .bend

      rlProcEpilogueUnitMovementInit ; B2/94FE

        .al
        .autsiz
        .databank ?

        lda #0
        sta procEpilogueUnitMovement.wCurrentTimer,b,x
        lda aProcSystem.wInput1,b
        sta procEpilogueUnitMovement.wNextEpilogueID,b,x
        lda aProcSystem.wInput2,b
        sta procEpilogueUnitMovement.wMaxTimer,b,x
        lda aProcSystem.wInput0,b
        sta procEpilogueUnitMovement.wCurrentEpilogueID,b,x
        rtl

        .databank 0

      rlProcEpilogueUnitMovementCycle1 ; B2/9517

        .al
        .autsiz
        .databank ?

        lda procEpilogueUnitMovement.wCurrentTimer,b,x
        beq _Instantiate

          jml _End

        _Instantiate
        lda procEpilogueUnitMovement.wMaxTimer,b,x
        bpl +

          _Loop
          phx
          lda procEpilogueUnitMovement.wMaxTimer,b,x
          and #$00FF
          sta procEpilogueUnitMovement.wMaxTimer,b,x

          lda procEpilogueUnitMovement.wCurrentEpilogueID,b,x
          and #$00FF
          tax
          lda aEpilogueSupportingCharacters,x
          and #$00FF
          sta aEpilogueUnitMovement.wCharacterID
          bra _LoadUnit

        +
        phx
        lda procEpilogueUnitMovement.wCurrentEpilogueID,b,x
        and #$00FF
        tax
        lda aEpilogueMainCharacters,x
        and #$00FF
        beq _CheckNextUnit

        sta aEpilogueUnitMovement.wCharacterID
        cmp #Seliph
        bne +

          lda aEpilogueSupportingCharacters,x
          and #$00FF
          beq _CheckNextUnit

          plx
          bra _Loop

        +
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        beq _LoadUnit

          plx
          lda procEpilogueUnitMovement.wMaxTimer,b,x
          ora #$8000
          sta procEpilogueUnitMovement.wMaxTimer,b,x
          phx

        _LoadUnit
        lda aEpilogueUnitMovement.wCharacterID
        jsl rlFillEventUnitSlot1
        bcs _BRK

        ; Handle the unit movement to coords
        lda #(`aEpilogueUnitMovement)<<8
        sta lR18+1
        lda #<>aEpilogueUnitMovement
        sta lR18
        jsl $91B03F
        plx
        bcs _95D3

        lda procEpilogueUnitMovement.wMaxTimer,b,x
        bmi +

          lda procEpilogueUnitMovement.wCurrentEpilogueID,b,x
          inc a
          sta procEpilogueUnitMovement.wCurrentEpilogueID,b,x

        +
        lda procEpilogueUnitMovement.wMaxTimer,b,x
        and #$00FF
        sta procEpilogueUnitMovement.wCurrentTimer,b,x
        lda #<>rlProcEpilogueUnitMovementCycle2
        sta aProcSystem.aHeaderOnCycle,b,x

        _End
        lda procEpilogueUnitMovement.wCurrentTimer,b,x
        beq +

          dec a
          sta procEpilogueUnitMovement.wCurrentTimer,b,x

        +
        rtl

        _CheckNextUnit
        plx
        lda procEpilogueUnitMovement.wCurrentEpilogueID,b,x
        inc a
        sta procEpilogueUnitMovement.wCurrentEpilogueID,b,x
        cmp procEpilogueUnitMovement.wNextEpilogueID,b,x
        beq +

          jml _Instantiate

        +
        jsl rlEventEngineFreeProc
        rtl

        _95D3
        txy
        lda procEpilogueUnitMovement.wCurrentEpilogueID,b,x
        and #$00FF
        tax
        lda aEpilogueSupportingCharacters,x
        and #$00FF
        cmp aEpilogueUnitMovement.wCharacterID
        beq +

          tyx
          lda procEpilogueUnitMovement.wMaxTimer,b,x
          and #$00FF
          sta procEpilogueUnitMovement.wMaxTimer,b,x
          rtl

        +
        tyx
        lda procEpilogueUnitMovement.wMaxTimer,b,x
        ora #$8000
        sta procEpilogueUnitMovement.wMaxTimer,b,x
        rtl

        _BRK
        brk

        .databank 0

      rlProcEpilogueUnitMovementCycle2 ; B2/95FF

        .al
        .autsiz
        .databank ?

        lda bDecompressionArrayFlag,b
        bne _End

          lda aMovingMapSprites.wState,b
          cmp #0
          bne _End

            phx
            jsl rlGetSelectedUnitDeploymentOffset
            tax
            lda #0
            jsl rlSetUnitResidingInCastle
            plx
            lda procEpilogueUnitMovement.wCurrentEpilogueID,b,x
            cmp procEpilogueUnitMovement.wNextEpilogueID,b,x
            beq _FreeProc

              lda #<>rlProcEpilogueUnitMovementCycle1
              sta aProcSystem.aHeaderOnCycle,b,x

        _End
        lda procEpilogueUnitMovement.wCurrentTimer,b,x
        beq +

          dec a
          sta procEpilogueUnitMovement.wCurrentTimer,b,x

        +
        rtl

        _FreeProc
        jsl rlEventEngineFreeProc
        rtl

        .databank 0

      aProcEpilogueUnitMovementCode ; B2/9637

        PROC_HALT

      rlEpilogueCheckIfRegionHasEpilogues ; B2/9639

        .al
        .autsiz
        .databank ?

        phx
        lda aProcSystem.wInput0,b
        tax

          -
          lda aEpilogueMainCharacters,x
          and #$00FF
          bne +

            inc x
            txa
            cmp aProcSystem.wInput1,b
            bne -

        lda #0

        -
        sta wEventEngineTruthFlag

        plx
        rtl

        +
        lda #1
        bra -

        .databank 0

      rlASMCEpilogueSeliphEntrance ; B2/965C

        .al
        .autsiz
        .databank ?

        lda #SeliphEpilogueID
        sta aProcSystem.wInput0,b
        lda #ShannanEpilogueID
        sta aProcSystem.wInput1,b
        lda #20
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueIsaachEntrance ; B2/9673

        .al
        .autsiz
        .databank ?

        lda #ShannanEpilogueID
        sta aProcSystem.wInput0,b
        lda #LeifEpilogueID
        sta aProcSystem.wInput1,b
        lda #25
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueIsaachExit ; B2/968A

        .al
        .autsiz
        .databank ?

        lda #ShannanEpilogueID
        sta aProcSystem.wInput0,b
        lda #LeifEpilogueID
        sta aProcSystem.wInput1,b
        lda #45
        sta aProcSystem.wInput2,b
        lda #pack([45, 16])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueNewThraciaEntrance ; B2/96A8

        .al
        .autsiz
        .databank ?

        lda #LeifEpilogueID
        sta aProcSystem.wInput0,b
        lda #AresEpilogueID
        sta aProcSystem.wInput1,b
        lda #30
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueNewThraciaExit ; B2/96BF

        .al
        .autsiz
        .databank ?

        lda #LeifEpilogueID
        sta aProcSystem.wInput0,b
        lda #AresEpilogueID
        sta aProcSystem.wInput1,b
        lda #55
        sta aProcSystem.wInput2,b
        lda #pack([48, 31])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueAgustriaEntrance ; B2/96DD

        .al
        .autsiz
        .databank ?

        lda #AresEpilogueID
        sta aProcSystem.wInput0,b
        lda #JamkesSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #32
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueAgustriaExit ; B2/96F4

        .al
        .autsiz
        .databank ?

        lda #AresEpilogueID
        sta aProcSystem.wInput0,b
        lda #JamkesSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #40
        sta aProcSystem.wInput2,b
        lda #pack([34, 22])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueVerdaneEntrance ; B2/9712

        .al
        .autsiz
        .databank ?

        lda #JamkesSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #FebailEpilogueID
        sta aProcSystem.wInput1,b
        lda #20
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueVerdaneExit ; B2/9729

        .al
        .autsiz
        .databank ?

        lda #JamkesSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #FebailEpilogueID
        sta aProcSystem.wInput1,b
        lda #45
        sta aProcSystem.wInput2,b
        lda #pack([34, 22])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueYngviEntrance ; B2/9747

        .al
        .autsiz
        .databank ?

        lda #FebailEpilogueID
        sta aProcSystem.wInput0,b
        lda #ArthurEpilogueID
        sta aProcSystem.wInput1,b
        lda #25
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueYngviExit ; B2/975E

        .al
        .autsiz
        .databank ?

        lda #FebailEpilogueID
        sta aProcSystem.wInput0,b
        lda #ArthurEpilogueID
        sta aProcSystem.wInput1,b
        lda #45
        sta aProcSystem.wInput2,b
        lda #pack([39, 31])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueFriegeEntrance ; B2/977C

        .al
        .autsiz
        .databank ?

        lda #ArthurEpilogueID
        sta aProcSystem.wInput0,b
        lda #LexSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #20
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueFriegeExit ; B2/9793

        .al
        .autsiz
        .databank ?

        lda #ArthurEpilogueID
        sta aProcSystem.wInput0,b
        lda #LexSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #30
        sta aProcSystem.wInput2,b
        lda #pack([34, 22])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueDozelEntrance ; B2/97B1

        .al
        .autsiz
        .databank ?

        lda #LexSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #ClaudsSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #25
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueDozelExit ; B2/97C8

        .al
        .autsiz
        .databank ?

        lda #LexSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #ClaudsSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #45
        sta aProcSystem.wInput2,b
        lda #pack([39, 31])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueEddaEntrance ; B2/97E6

        .al
        .autsiz
        .databank ?

        lda #ClaudsSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #AzellesSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #20
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueEddaExit ; B2/97FD

        .al
        .autsiz
        .databank ?

        lda #ClaudsSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #AzellesSonEpilogueID
        sta aProcSystem.wInput1,b
        lda #35
        sta aProcSystem.wInput2,b
        lda #pack([48, 31])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueVelthomerEntrance ; B2/981B

        .al
        .autsiz
        .databank ?

        lda #AzellesSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #OifeyEpilogueID
        sta aProcSystem.wInput1,b
        lda #25
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueVelthomerExit ; B2/9832

        .al
        .autsiz
        .databank ?

        lda #AzellesSonEpilogueID
        sta aProcSystem.wInput0,b
        lda #OifeyEpilogueID
        sta aProcSystem.wInput1,b
        lda #35
        sta aProcSystem.wInput2,b
        lda #pack([45, 16])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueChalphyEntrance ; B2/9850

        .al
        .autsiz
        .databank ?

        lda #OifeyEpilogueID
        sta aProcSystem.wInput0,b
        lda #CedEpilogueID
        sta aProcSystem.wInput1,b
        lda #20
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueChalphyExit ; B2/9867

        .al
        .autsiz
        .databank ?

        lda #OifeyEpilogueID
        sta aProcSystem.wInput0,b
        lda #CedEpilogueID
        sta aProcSystem.wInput1,b
        lda #45
        sta aProcSystem.wInput2,b
        lda #pack([39, 31])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlASMCEpilogueSilesseEntrance ; B2/9885

        .al
        .autsiz
        .databank ?

        lda #CedEpilogueID
        sta aProcSystem.wInput0,b
        lda #LewnysDaughterEpilogueID + 1
        sta aProcSystem.wInput1,b
        lda #20
        sta aProcSystem.wInput2,b
        jsl rlEpilogueMoveUnitsIntoBelhalla
        rtl

        .databank 0

      rlASMCEpilogueSilesseExit ; B2/989C

        .al
        .autsiz
        .databank ?

        lda #CedEpilogueID
        sta aProcSystem.wInput0,b
        lda #LewnysDaughterEpilogueID + 1
        sta aProcSystem.wInput1,b
        lda #45
        sta aProcSystem.wInput2,b
        lda #pack([45, 16])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        jsl rlEpilogueMoveUnitsOutOfBelhalla
        rtl

        .databank 0

      rlEpilogueMoveUnitsIntoBelhalla ; B2/98BA

        .al
        .autsiz
        .databank ?

        jsl rlEpilogueCheckIfRegionHasEpilogues

        lda #pack([$FF, $FF])
        sta aEpilogueUnitMovement.wStartingCoordinates
        lda #pack([42, 24])
        sta aEpilogueUnitMovement.wDestinationCoordinates
        lda #MAP_SPRITE_BLUE << 8 | EventUnitSlot1 << 5 | 4
        sta aEpilogueUnitMovement.wMovementData

        lda #(`procEpilogueUnitMovement)<<8
        sta lR44+1
        lda #<>procEpilogueUnitMovement
        sta lR44
        jsl rlEventEngineCreateProc
        rtl

        .databank 0

      rlEpilogueMoveUnitsOutOfBelhalla ; B2/98E2

        .al
        .autsiz
        .databank ?

        lda #pack([42, 24])
        sta aEpilogueUnitMovement.wStartingCoordinates
        lda #MAP_SPRITE_BLUE << 8 | int(true) << 4 | 4
        sta aEpilogueUnitMovement.wMovementData

        lda #(`procEpilogueUnitMovement)<<8
        sta lR44+1
        lda #<>procEpilogueUnitMovement
        sta lR44
        jsl rlEventEngineCreateProc
        rtl

        .databank 0

      rlASMCRefreshAllUnits ; B2/98FF

        .al
        .autsiz
        .databank ?

        ldx #len(aDeploymentTable._State)

          _Loop
          lda aDeploymentTable._StateBuffer-2,x
          and #~(DeploymentStateGrayed | DeploymentStateAsleep)
          sta aDeploymentTable._State-2,x
          sta aDeploymentTable._StateBuffer-2,x
          dec x
          dec x
          bne _Loop

        rtl

        .databank 0

        ; B2/9916

    .endsection EpilogueMovementSection

    .section EpilogueDialoguePointersSection

      aSeliphEpiloguePointers ; B2/D0C1

        .long dialogueEpilogue_Seliph_JuliaDead
        .long dialogueEpilogue_Seliph_JuliaDead_WithLover
        .long dialogueEpilogue_Seliph_JuliaAlive
        .long dialogueEpilogue_Seliph_JuliaAlive_WithLover

      aShannanEpiloguePointers ; B2/D0CD

        .long dialogueEpilogue_Shannan
        .long dialogueEpilogue_Shannan_WithLover

      aScathachEpiloguePointers ; B2/D0D3

        .long dialogueEpilogue_Scathach_ShannanDead  
        .long dialogueEpilogue_Scathach_ShannanDead_WithLover
        .long dialogueEpilogue_Scathach_ShannanAlive
        .long dialogueEpilogue_Scathach_ShannanAlive_WithLover

      aDalvinEpiloguePointers ; B2/D0DF

        .long dialogueEpilogue_Dalvin_ShannanDead
        .long dialogueEpilogue_Dalvin_ShannanDead_WithLover
        .long dialogueEpilogue_Dalvin_ShannanAlive
        .long dialogueEpilogue_Dalvin_ShannanAlive_WithLover

      aLarceiEpiloguePointers ; B2/D0EB

        .long dialogueEpilogue_Larcei_ShannanDead                       ; priority, lover dead
        .long dialogueEpilogue_Larcei_ShannanDead                       ; priority, no lover
        .long dialogueEpilogue_CreidneLarcei_LoverDead                  ; no priority
        .long dialogueEpilogue_Larcei_ShannanAlive_ScathachDead         ; no priority
        .long dialogueEpilogue_CreidneLarcei_ShannanAlive_BrotherAlive  ; no priority

      aCreidneEpiloguePointers ; B2/D0FA

        .long dialogueEpilogue_Creidne_LoverDead
        .long dialogueEpilogue_Creidne_ShannanAlive_DalvinDead
        .long dialogueEpilogue_Creidne_ShannanAlive_DalvinAlive

      aDeimneEpiloguePointers ; B2/D103

        .long dialogueEpilogue_Deimne_MuirneDead
        .long dialogueEpilogue_Deimne_MuirneDead_WithLover
        .long dialogueEpilogue_Deimne_MuirneAlive
        .long dialogueEpilogue_Deimne_MuirneAlive_WithLover

      aMuirneEpiloguePointers ; B2/D10F

        .long dialogueEpilogue_Muirne_LoverDead
        .long dialogueEpilogue_Muirne_DeimneDead
        .long dialogueEpilogue_Muirne_DeimneAlive

      aLeifEpiloguePointers ; B2/D118

        .long dialogueEpilogue_Leif_AltenaDead
        .long dialogueEpilogue_Leif_AltenaDead_WithLover
        .long dialogueEpilogue_Leif_AltenaAlive
        .long dialogueEpilogue_Leif_AltenaAlive_WithLover

      aAltenaEpiloguePointers ; B2/D124

        .long dialogueEpilogue_Altena_LeifDead_ArionDead
        .long dialogueEpilogue_Altena_LeifDead_ArionAlive
        .long dialogueEpilogue_Altena_LeifAlive_ArionDead
        .long dialogueEpilogue_Altena_LeifAlive_ArionAlive

      aFinnEpiloguePointers ; B2/D130

        .long dialogueEpilogue_Finn_LeifDead  ; no lover
        .long dialogueEpilogue_Finn_LeifDead  ; has lover
        .long dialogueEpilogue_Finn_LeifAlive ; no lover
        .long dialogueEpilogue_Finn_LeifAlive ; has lover

      aHannibalEpiloguePointers ; B2/D13C

        .long dialogueEpilogue_Hannibal_CharlotDead
        .long dialogueEpilogue_Hannibal_CharlotAlive
        .long dialogueEpilogue_Hannibal_CoirpreDead
        .long dialogueEpilogue_Hannibal_CoirpreAlive

      aCharlotEpiloguePointers ; B2/D148

        .long dialogueEpilogue_CharlotCoirpre_HannibalDead
        .long dialogueEpilogue_CharlotCoirpre_HannibalDead_WithLover
        .long dialogueEpilogue_CharlotCoirpre_HannibalAlive
        .long dialogueEpilogue_CharlotCoirpre_HannibalAlive_WithLover

      aCoirpreEpiloguePointers ; B2/D154

        .long dialogueEpilogue_CharlotCoirpre_HannibalDead
        .long dialogueEpilogue_CharlotCoirpre_HannibalDead_WithLover
        .long dialogueEpilogue_CharlotCoirpre_HannibalAlive
        .long dialogueEpilogue_CharlotCoirpre_HannibalAlive_WithLover

      aAsaelloEpiloguePointers ; B2/D160

        .long dialogueEpilogue_Asaello_DaisyDead
        .long dialogueEpilogue_Asaello_DaisyDead_WithLover
        .long dialogueEpilogue_Asaello_DaisyAlive
        .long dialogueEpilogue_Asaello_DaisyAlive_WithLover

      aDaisyEpiloguePointers ; B2/D16C

        .long dialogueEpilogue_Daisy_LoverDead
        .long dialogueEpilogue_Daisy_AsaelloDead
        .long dialogueEpilogue_Daisy_AsaelloAlive

      aAresEpiloguePointers ; B2/D175

        .long dialogueEpilogue_Ares
        .long dialogueEpilogue_Ares_WithLover

      aLeneEpiloguePointers ; B2/D17B

        .long dialogueEpilogue_LayleaLene_LoverDead
        .long dialogueEpilogue_LayleaLene_AresDead
        .long dialogueEpilogue_LayleaLene_AresAlive

      aLayleaEpiloguePointers ; B2/D184

        .long dialogueEpilogue_LayleaLene_LoverDead
        .long dialogueEpilogue_LayleaLene_AresDead
        .long dialogueEpilogue_LayleaLene_AresAlive

      aDiarmuidEpiloguePointers ; B2/D18D

        .long dialogueEpilogue_Diarmuid_AresDead
        .long dialogueEpilogue_Diarmuid_AresDead_WithLover
        .long dialogueEpilogue_Diarmuid_AresAlive
        .long dialogueEpilogue_Diarmuid_AresAlive_WithLover

      aTristanEpiloguePointers ; B2/D199

        .long dialogueEpilogue_Tristan_AresDead
        .long dialogueEpilogue_Tristan_AresDead_WithLover
        .long dialogueEpilogue_Tristan_AresAlive
        .long dialogueEpilogue_Tristan_AresAlive_WithLover

      aNannaEpiloguePointers ; B2/D1A5

        .long dialogueEpilogue_Nanna_AresDead                 ; priority, lover dead
        .long dialogueEpilogue_Nanna_AresDead                 ; priority, no lover
        .long dialogueEpilogue_Nanna_LoverDead                ; no priority
        .long dialogueEpilogue_Nanna_AresAlive_DiarmuidDead   ; no priority
        .long dialogueEpilogue_Nanna_AresAlive_DiarmuidAlive  ; no priority

      aJeanneEpiloguePointers ; B2/D1B4

        .long dialogueEpilogue_Jeanne_LoverDead
        .long dialogueEpilogue_Jeanne_TristanDead
        .long dialogueEpilogue_Jeanne_TristanAlive

      aJamkesSonEpiloguePointers ; B2/D1BD

        .long dialogueEpilogue_JamkesSon
        .long dialogueEpilogue_JamkesSon_WithLover

      aJamkesDaughterEpiloguePointers ; B2/D1C3

        .long dialogueEpilogue_JamkesDaughter_BrotherDead
        .long dialogueEpilogue_JamkesDaughter_BrotherDead ; lover dead
        .long dialogueEpilogue_JamkesDaughter_BrotherAlive
        .long dialogueEpilogue_JamkesDaughter_BrotherAlive_LoverDead

      aFebailEpiloguePointers ; B2/D1CF

        .long dialogueEpilogue_Febail
        .long dialogueEpilogue_Febail_WithLover

      aPattyEpiloguePointers ; B2/D1D5

        .long dialogueEpilogue_Patty_FebailDead
        .long dialogueEpilogue_Patty_FebailDead ; lover dead
        .long dialogueEpilogue_Patty_FebailAlive
        .long dialogueEpilogue_Patty_LoverDead ; febail alive

      aLesterEpiloguePointers ; B2/D1E1

        .long dialogueEpilogue_Lester_BrigidsChildrenDead
        .long dialogueEpilogue_Lester_BrigidsChildrenDead_WithLover
        .long dialogueEpilogue_Lester_BrigidsChildrenAlive
        .long dialogueEpilogue_Lester_BrigidsChildrenAlive_WithLover

      aLanaEpiloguePointers ; B2/D1ED

        .long dialogueEpilogue_Lana_YngviChildrenDead               ; priority, lover dead
        .long dialogueEpilogue_Lana_YngviChildrenDead               ; priority, no lover
        .long dialogueEpilogue_Lana_YngviChildrenAlive_LoverDead    ; no priority
        .long dialogueEpilogue_Lana_YngviChildrenAlive_LesterDead   ; no priority
        .long dialogueEpilogue_Lana_YngviChildrenAlive_LesterAlive  ; no priority

      aArthurEpiloguePointers ; B2/D1FC

        .long dialogueEpilogue_AmidArthur
        .long dialogueEpilogue_AmidArthur_WithLover

      aAmidEpiloguePointers ; B2/D202

        .long dialogueEpilogue_AmidArthur
        .long dialogueEpilogue_AmidArthur_WithLover

      aTineEpiloguePointers ; B2/D208

        .long dialogueEpilogue_LindaTine_BrotherDead
        .long dialogueEpilogue_LindaTine_BrotherDead ; lover dead
        .long dialogueEpilogue_LindaTine_BrotherAlive
        .long dialogueEpilogue_LindaTine_BrotherAlive_LoverDead

      aLindaEpiloguePointers ; B2/D214

        .long dialogueEpilogue_LindaTine_BrotherDead
        .long dialogueEpilogue_LindaTine_BrotherDead ; lover dead
        .long dialogueEpilogue_LindaTine_BrotherAlive
        .long dialogueEpilogue_LindaTine_BrotherAlive_LoverDead

      aLexSonEpiloguePointers ; B2/D220

        .long dialogueEpilogue_LexSon
        .long dialogueEpilogue_LexSon_WithLover

      aLexDaughterEpiloguePointers ; B2/D226

        .long dialogueEpilogue_LexDaughter_BrotherDead
        .long dialogueEpilogue_LexDaughter_BrotherDead ; lover dead
        .long dialogueEpilogue_LexDaughter_BrotherAlive
        .long dialogueEpilogue_LexDaughter_BrotherAlive_LoverDead

      aIucharEpiloguePointers ; B2/D232

        .long dialogueEpilogue_Iuchar           ; priority
        .long dialogueEpilogue_Iuchar_WithLover ; priority
        .long dialogueEpilogue_Iuchar           ; no priority
        .long dialogueEpilogue_Iuchar_WithLover ; no priority

      aIucharbaEpiloguePointers ; B2/D23E

        .long dialogueEpilogue_Iucharba           ; priority
        .long dialogueEpilogue_Iucharba_WithLover ; priority
        .long dialogueEpilogue_Iucharba           ; no priority
        .long dialogueEpilogue_Iucharba_WithLover ; no priority

      aClaudsSonEpiloguePointers ; B2/D24A

        .long dialogueEpilogue_ClaudsSon
        .long dialogueEpilogue_ClaudsSon_WithLover

      aClaudsDaughterEpiloguePointers ; B2/D250

        .long dialogueEpilogue_ClaudsDaughter_BrotherDead
        .long dialogueEpilogue_ClaudsDaughter_BrotherDead ; lover dead
        .long dialogueEpilogue_ClaudsDaughter_BrotherAlive
        .long dialogueEpilogue_ClaudsDaughter_BrotherAlive_LoverDead

      aAzellesSonEpiloguePointers ; B2/D25C

        .long dialogueEpilogue_AzellesSon
        .long dialogueEpilogue_AzellesSon_WithLover

      aAzellesDaughterEpiloguePointers ; B2/D262

        .long dialogueEpilogue_AzellesDaughter_BrotherDead
        .long dialogueEpilogue_AzellesDaughter_BrotherDead ; lover dead
        .long dialogueEpilogue_AzellesDaughter_BrotherAlive
        .long dialogueEpilogue_AzellesDaughter_BrotherAlive_LoverDead

      aOifeyEpiloguePointers ; B2/D26E

        .long dialogueEpilogue_Oifey
        .long dialogueEpilogue_Oifey_WithLover

      aCedEpiloguePointers ; B2/D274

        .long dialogueEpilogue_HawkCed
        .long dialogueEpilogue_HawkCed_WithLover

      aHawkEpiloguePointers ; B2/D27A

        ; The dialogue isnt modular so the dialogue engine has to fix hawks portrait

        .long dialogueEpilogue_HawkCed
        .long dialogueEpilogue_HawkCed_WithLover

      aFeeEpiloguePointers ; B2/D280

        .long dialogueEpilogue_HerminaFee_LoverDead
        .long dialogueEpilogue_HerminaFee ; Ced dead
        .long dialogueEpilogue_HerminaFee ; Ced alive

      aHerminaEpiloguePointers ; B2/D289

        ; The dialogue isnt modular so the dialogue engine has to herminas hawks portrait

        .long dialogueEpilogue_HerminaFee_LoverDead
        .long dialogueEpilogue_HerminaFee ; Hawk dead
        .long dialogueEpilogue_HerminaFee ; Hawk alive

      aLewynsSonEpiloguePointers ; B2/D292

        .long dialogueEpilogue_LewynsSon_SisterDead
        .long dialogueEpilogue_LewynsSon_SisterDead_WithLover
        .long dialogueEpilogue_LewynsSon_SisterAlive
        .long dialogueEpilogue_LewynsSon_SisterAlive_WithLover

      aLewynsDaughterEpiloguePointers ; B2/D29E

        .long dialogueEpilogue_LewynsDaughter_Priority   ; brother dead
        .long dialogueEpilogue_LewynsDaughter_Priority   ; brother alive
        .long dialogueEpilogue_LewynsDaughter_NoPriority ; brother dead
        .long dialogueEpilogue_LewynsDaughter_NoPriority ; brother alive

      ; B2D2AA

    .endsection EpilogueDialoguePointersSection
