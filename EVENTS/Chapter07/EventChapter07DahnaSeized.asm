
  aEventChapter07DahnaSeized ; B2/8ECD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $86
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07DahnaSeized1, DIALOGUE_BG_ALLEY, 3, 2
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter07, FlagChapter07_AresDied
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Ares, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      PAUSE 15
      YIELD

      DIALOGUE dialogueChapter07DahnaSeized2
      YIELD

      PAUSE 15
      YIELD

      FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

    + ; B2/8F00
    RUN_ASM rlASMCSetChapter07FinnDaughterTalk

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCSetChapter07FinnDaughterTalk ; B2/8F0F

    .al
    .autsiz
    .databank ?

    lda wSelectedUnitDataRAMPointer,b
    pha

    phx
    phy
    ldx #0

    _Loop
    lda _FinnsDaughters,x
    beq _End

      jsl rlGetUnitRAMDataPointerByID
      bcs _Next

        jsl rlGetSelectedUnitFatherID
        cmp #Finn
        beq +

      _Next
      inc x
      inc x
      bra _Loop

    +
    lda #AdultFinn
    jsl rlGetUnitRAMDataPointerByID
    bcs _End

      lda _FinnsDaughters,x
      jsl rlSetSelectedUnitTalkTarget

    _End
    ply
    plx

    pla
    sta wSelectedUnitDataRAMPointer,b
    rtl

    .databank 0

    _FinnsDaughters ; B2/8F49
    .word Nanna
    .word Lana
    .word Larcei
    .word 0
