
  aEventChapter10JuliusKilledUnit ; 8D/8C0C

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $83
    YIELD

    macroMapDialogue dialogueChapter10JuliusKilledUnit

    FILL_EVENT_UNIT_SLOT JuliusCh10, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    RUN_ASM rlASMCChapter10WarpAway
    YIELD

    FILL_EVENT_UNIT_SLOT IshtarCh10, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    RUN_ASM rlASMCChapter10WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT IshtarCh10

    RUN_EVENT_CONDITION
      REMOVE_UNIT JuliusCh10

    SET_FLAG_IF_IN_CHAPTER Chapter10, FlagChapter10_KillingMinigameCompleted

    RUN_ASM rlASMCLoadActiveUnitCoordinatesInEventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    SET_CAMERA_TO_EVENT_UNIT_SLOT_1
    PLAY_SFX_WORD $00E0
    PAUSE 40
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCChapter10WarpAway ; 8D/8C57

    .al
    .autsiz
    .databank ?

    jsl $9EF1FA
    jsl rlCreateProcHaltEvent
    rtl

    .databank 0
