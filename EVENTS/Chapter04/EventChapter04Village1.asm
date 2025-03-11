
  aEventChapter04Village1 ; 8E/9A5F

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LowerBridgeTriggered
    JUMP_TRUE _BridgeLowered

      PLAY_SFX_WORD $7FF7
      DIALOGUE dialogueChapter04Village1Default
      YIELD

      PLAY_SFX_WORD $00E8
      YIELD
      JUMP _End 

    _BridgeLowered ; 8E/9A74
    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter04Village1BridgeLowered
    YIELD

    PLAY_SFX_WORD $00E8
    YIELD

    _End ; 8E/9A80
    END_EVENT
