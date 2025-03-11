
  aEventChapter01Ending ; 90/8A41

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter01, FlagChapter01_DeirdreCaptureReturn
    JUMP_FALSE _DeirdreWasntCaptured

      DIALOGUE_WITH_BG dialogueDeathQuoteGen1PlayerDeirdreReturn, DIALOGUE_BG_HALLWAY, 5, 2
      YIELD

      PAUSE 25
      YIELD

    _DeirdreWasntCaptured
    DIALOGUE_WITH_BG dialogueChapter01Ending, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [2, 17]
    YIELD

    RUN_EVENT_CONDITION
      ADD_CASTLE_MONEY

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT Chapter01

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    END_EVENT
