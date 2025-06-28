
  aEventSigurdDeathReaction ; 8F/EF5E

    TEST_PERMANENT_FLAG_SET PermanentFlagOifeyTacticianGone
    JUMP_TRUE _End

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      PLAY_SONG $6A
      YIELD

      PAUSE 20
      YIELD

      DIALOGUE dialogueSigurdDeathReaction
      YIELD

    _End
    END_EVENT
