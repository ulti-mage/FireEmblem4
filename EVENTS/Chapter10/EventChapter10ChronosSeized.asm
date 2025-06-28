
  aEventChapter10ChronosSeized ; 8D/8874

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter10, FlagChapter10_RadosSeizedCheck
    JUMP_FALSE _RadosNotSeized

      DIALOGUE_WITH_BG dialogueChapter10ChronosSeized, DIALOGUE_BG_HALLWAY, 3, 2
      YIELD
      JUMP +

      _RadosNotSeized ; 8D/888F
      DIALOGUE_WITH_BG dialogueChapter10ChronosSeizedBeforeRados, DIALOGUE_BG_HALLWAY, 3, 2
      YIELD

    +
    RUN_EVENT_CONDITION
      SET_TALK_TARGET Oifey, Seliph

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
