
  aEventSeliphDeathReaction ; 8F/EF92

    TEST_PERMANENT_FLAG_SET PermanentFlagLewynTacticianArrived
    JUMP_FALSE _End

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      PLAY_SONG $6A
      YIELD

      PAUSE 20
      YIELD

      DIALOGUE dialogueSeliphDeathReaction
      YIELD

    _End
    END_EVENT
