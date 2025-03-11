
  aEventChapter03Village4 ; 9D/916E

    PLAY_SFX_WORD $7FF7
    TEST_FLAG_IN_CHAPTER_SET Chapter03, FlagChapter03_SylvaleSeized
    JUMP_TRUE _SylvaleSeized

      DIALOGUE dialogueChapter03Village4SylvaleNotSeized
      YIELD
      JUMP +

      _SylvaleSeized ; 9D/917F
      DIALOGUE dialogueChapter03Village4SylvaleSeized
      YIELD

    +
    PLAY_SFX_WORD $00E8
    END_EVENT
