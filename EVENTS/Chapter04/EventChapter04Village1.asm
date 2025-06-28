
  aEventChapter04Village1 ; 8E/9A5F

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LowerBridgeTriggered
    JUMP_TRUE _BridgeLowered

      macroMapDialogue dialogueChapter04Village1Default
      YIELD
      JUMP _End 

    _BridgeLowered ; 8E/9A74
    macroMapDialogue dialogueChapter04Village1BridgeLowered
    YIELD

    _End ; 8E/9A80
    END_EVENT
