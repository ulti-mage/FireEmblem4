
  aEventChapter04SilesseSeizedDaccarResponse ; 8E/994B

    PLAY_SONG $6C
    YIELD

    MAP_SCROLL [48, 38], 4
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_PamelaDied
    JUMP_TRUE _PamelaDead

      TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LamiaDied
      JUMP_TRUE _PamelaAliveLamiaDead

        DIALOGUE dialogueChapter04DaccarResponsePamelaAliveLamiaAlive
        YIELD
        JUMP _End

      _PamelaAliveLamiaDead ; 8E/9967
      DIALOGUE dialogueChapter04DaccarResponsePamelaAliveLamiaDead
      YIELD
      JUMP _End

    _PamelaDead ; 8E/996F
    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LamiaDied
    JUMP_TRUE _PamelaDeadLamiaDead

      DIALOGUE dialogueChapter04DaccarResponsePamelaDeadLamiaAlive
      YIELD
      JUMP _End

    _PamelaDeadLamiaDead ; 8E/997D
    DIALOGUE dialogueChapter04DaccarResponsePamelaDeadLamiaDead
    YIELD

    _End ; 8E/9982
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
