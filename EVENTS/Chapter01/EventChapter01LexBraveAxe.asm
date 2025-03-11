
  aEventChapter01LexBraveAxe ; 90/8C81

    RUN_ASM rlASMCCheckIfLexHasIronAxe
    JUMP_FALSE _NoIronAxe

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      PLAY_SONG $8E
      YIELD

      PAUSE 15
      YIELD

      RUN_EVENT_CONDITION
        GIVE_UNIT_PID Lex, PI_BraveAxe

      DIALOGUE dialogueChapter01LexBraveAxe
      YIELD

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      RESTORE_PHASE_MUSIC
      YIELD

      END_EVENT

    _NoIronAxe ; 90/8CAB
    UNSET_FLAG_IF_IN_CHAPTER Chapter01, FlagChapter01_LexOnPeninsula
    UNSET_FLAG_IF_IN_CHAPTER Chapter01, FlagChapter01_LexBraveAxe

    END_EVENT

  rlASMCCheckIfLexHasIronAxe ; 90/8CB3

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

    lda #Lex
    jsl rlGetUnitRAMDataPointerByID
    bcs _False

      stz wR0

        _Loop
        inc wR0
        lda wR0
        jsl rlGetItemIDByInventorySlot
        bcs _False

          cmp #IronAxe
          beq _True
          bra _Loop

      _True
      lda #1
      sta wEventEngineTruthFlag
      bra +

    _False
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

    ; 90/8CFA













