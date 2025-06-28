
  aEventChapterFinalEddaSeized ; B1/DF3E

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET ChapterFinal, FlagChapterFinal_ClaudsChildAlive
    JUMP_FALSE _Default

      ; At least one of Clauds children is alive
      DIALOGUE_WITH_BG dialogueChapterFinalEddaSeizedClaudsChildren, DIALOGUE_BG_THRONE, 3, 2
      YIELD
      JUMP +

      _Default
      DIALOGUE_WITH_BG dialogueChapterFinalEddaSeizedNoInheritor, DIALOGUE_BG_THRONE, 3, 2
      YIELD

    +
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
