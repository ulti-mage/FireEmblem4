
  aEventChapter07Ending ; B2/8F53

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $76
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter07, FlagChapter07_JuliaCaptureReturn
    JUMP_FALSE _JuliaWasntCaptured

      DIALOGUE_WITH_BG dialogueDeathQuoteGen1PlayerJuliaReturn, DIALOGUE_BG_HALLWAY, 5, 2
      YIELD

      PAUSE 25
      YIELD

    _JuliaWasntCaptured ; B2/8F6F
    DIALOGUE_WITH_BG dialogueChapter07Ending, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [43, 47]
    YIELD

    RUN_EVENT_CONDITION
      ADD_CASTLE_MONEY

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT Chapter07

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    END_EVENT
