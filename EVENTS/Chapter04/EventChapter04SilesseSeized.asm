
  aEventChapter04SilesseSeized ; 8E/9913

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_DaccarDied
    JUMP_TRUE _DaccarDead

      DIALOGUE_WITH_BG dialogueChapter04SilesseSeizedDaccarAlive, DIALOGUE_BG_THRONE, 3, 2
      YIELD
      JUMP _Continue

    _DaccarDead ; 8E/992E
    DIALOGUE_WITH_BG dialogueChapter04SilesseSeizedDaccarDead, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    _Continue ; 8E/9936
    RUN_EVENT_CONDITION
      SET_TALK_TARGET Lewyn, Sigurd

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Erinys, Lewyn

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
