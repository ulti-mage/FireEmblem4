
  aEventGen2HomeCastleSeized ; 8F/EFAC

    TEST_PERMANENT_FLAG_SET PermanentFlagLewynTacticianArrived
    JUMP_FALSE _End

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      PLAY_SONG $6A
      YIELD

      PAUSE 20
      YIELD

      DIALOGUE dialogueGen2HomeCastleSeized
      YIELD

    _End
    END_EVENT
