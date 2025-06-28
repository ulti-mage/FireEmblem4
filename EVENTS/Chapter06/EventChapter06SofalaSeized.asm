
  aEventChapter06SofalaSeized ; 91/D473

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7C
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_DanannDied
    JUMP_TRUE _DanannDead

      DIALOGUE_WITH_BG dialogueChapter06SofalaSeizedDanannAlive, DIALOGUE_BG_GATE, 3, 2
      YIELD
      JUMP +

      _DanannDead ; 91/D48E
      DIALOGUE_WITH_BG dialogueChapter06SofalaSeizedDanannDead, DIALOGUE_BG_GATE, 3, 2
      YIELD

    +
    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_JuliaSeliphTalk
    JUMP_TRUE _D4A0

      RUN_EVENT_CONDITION
        SET_TALK_TARGET Julia, Seliph

    _D4A0
    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Seliph, Seliph], [Lana, Muirne]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
