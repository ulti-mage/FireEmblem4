
  aEventChapter09GrutiaSeized ; B1/D97E

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch09Thracia, 1

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch09Thracia, 2

    TEST_FLAG_IN_CHAPTER_SET Chapter09, FlagChapter09_AltenaDiedCheck
    JUMP_TRUE _NoAltena

      TEST_FLAG_IN_CHAPTER_SET Chapter09, FlagChapter09_SeliphAltenaTalk
      JUMP_FALSE _NoAltena

        DIALOGUE_WITH_BG dialogueChapter09GrutiaSeizedAltenaRecruited, DIALOGUE_BG_HALLWAY, 3, 2
        YIELD

        JUMP +

      _NoAltena ; B1/D9AA
      DIALOGUE_WITH_BG dialogueChapter09GrutiaSeized, DIALOGUE_BG_HALLWAY, 3, 2
      YIELD

    +
    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED AdultFinn, Altena

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Hannibal, Altena

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Julia, Seliph

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
