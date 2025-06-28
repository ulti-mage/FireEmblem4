
  aEventChapter10MiletosSeized ; 8D/8A04

    TEST_FLAG_IN_CHAPTER_SET Chapter10, FlagChapter10_KillingMinigameCompleted
    JUMP_TRUE _JuliusIshtarLeftAlready

      FILL_EVENT_UNIT_SLOT JuliusCh10, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      PAUSE 20
      YIELD

      DIALOGUE dialogueChapter10MiletosSeizedJuliusLeave
      YIELD

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

      MAP_SCROLL [2, 21], 4
      YIELD

      PAUSE 20
      YIELD

    _JuliusIshtarLeftAlready ; 8D/8A43
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    DIALOGUE_WITH_BG dialogueChapter10MiletosSeized, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
    SET_CAMERA_TO_EVENT_UNIT_SLOT_1

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Coirpre, Charlot], [Altena, Altena]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
