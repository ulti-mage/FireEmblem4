
  aEventChapter06IsaachSeized ; 91/D43B

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7C
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_DanannDied
    JUMP_TRUE _DanannDead

      DIALOGUE_WITH_BG dialogueChapter06IsaachSeizedDanannAlive, DIALOGUE_BG_GATE, 3, 2
      YIELD
      JUMP +

      _DanannDead ; 91/D456
      DIALOGUE_WITH_BG dialogueChapter06IsaachSeizedDanannDead, DIALOGUE_BG_GATE, 3, 2
      YIELD

    +
    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_JuliaSeliphTalk
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        SET_TALK_TARGET Julia, Seliph

    +
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
