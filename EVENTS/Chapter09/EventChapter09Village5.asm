
  aEventChapter09Village5 ; B1/DCC7

    TEST_FLAG_IN_CHAPTER_SET Chapter09, FlagChapter09_MusarDiedCheck
    JUMP_TRUE _MusarDead

      macroMapDialogue dialogueChapter09Village5MusarAlive
      YIELD
      JUMP +

      _MusarDead
      macroMapDialogue dialogueChapter09Village5MusarDead
      YIELD

    +
    END_EVENT
