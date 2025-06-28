
  aEventChapter06Ending ; 91/D4C6

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7D
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_JuliaCaptureReturn
    JUMP_FALSE _JuliaWasntCaptured

      DIALOGUE_WITH_BG dialogueDeathQuoteGen1PlayerJuliaReturn, DIALOGUE_BG_HALLWAY, 5, 2
      YIELD

      PAUSE 25
      YIELD

    _JuliaWasntCaptured ; 91/D4E2
    DIALOGUE_WITH_BG dialogueChapter06Ending, DIALOGUE_BG_GATE, 3, 2
    SET_CAMERA_POSITION [19, 50]
    YIELD

    RUN_EVENT_CONDITION
      ADD_CASTLE_MONEY

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT Chapter06

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    END_EVENT
