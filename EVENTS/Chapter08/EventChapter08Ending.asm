
  aEventChapter08Ending ; 8F/BE4B

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter08, FlagChapter08_JuliaCaptureReturn
    JUMP_FALSE +

      DIALOGUE_WITH_BG dialogueDeathQuoteGen1PlayerJuliaReturn, DIALOGUE_BG_HALLWAY, 5, 2
      YIELD

      PAUSE 25
      YIELD

    +
    DIALOGUE_WITH_BG dialogueChapter08Ending, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [30, 50]
    YIELD

    RUN_EVENT_CONDITION
      ADD_CASTLE_MONEY

    TEST_FLAG_IN_CHAPTER_SET Chapter08, FlagChapter08_AltenaDied
    JUMP_TRUE _End

      RUN_EVENT_CONDITION
        SET_UNIT_IN_CASTLE Altena, Ch08_Ulster

      MOVE_TEMPORARY_BY_SCRIPT Altena, [46, 40], 4, MAP_SPRITE_RED, _ScriptedMovementAltena
      WAIT_UNIT_SPRITE_DECOMPRESSED

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      MAP_SCROLL [38, 33], 3
      YIELD

      PAUSE 15
      YIELD

      DIALOGUE dialogueChapter08EndingAltena
      YIELD

      PAUSE 20
      YIELD

      CONTINUE_FORM_MAP_SPRITE_HALT
      MAP_SCROLL [38, 49], 1
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PAUSE 20
      YIELD

    _End
    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT Chapter08

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    END_EVENT

    _ScriptedMovementAltena ; 8F/BEB0
      MAP_FACE_DOWN
      MAP_HALT
      MAP_PAUSE 2
      MAP_DOWN_MULTIPLE 23
      MAP_END
