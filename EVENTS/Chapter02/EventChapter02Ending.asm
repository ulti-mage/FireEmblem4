
  aEventChapter02Ending ; 8E/862C

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter02, FlagChapter02_DeirdreCaptureReturn
    JUMP_FALSE _DeirdreWasntCaptured

      DIALOGUE_WITH_BG dialogueDeathQuoteGen1PlayerDeirdreReturn, DIALOGUE_BG_HALLWAY, 5, 2
      YIELD

      PAUSE 25
      YIELD

    _DeirdreWasntCaptured ; 8E/8648
    TEST_FLAG_IN_CHAPTER_SET Chapter02, FlagChapter02_KnightRingObtainable
    JUMP_FALSE _Continue

      FADE_OUT_BY_TIMER 4
      YIELD

      PAUSE 35
      YIELD

      _UnitList := [Sigurd]
      _UnitList..= [Lachesis]
      _UnitList..= [Eve]
      _UnitList..= [Eva]
      _UnitList..= [Alva]

      .for _Unit in _UnitList

        RUN_EVENT_CONDITION
          SET_UNIT_IN_CASTLE _Unit, Ch02_Evans

      .endfor

      RUN_EVENT_CONDITION
        GIVE_UNIT_PID Lachesis, PI_KnightRing

      DIALOGUE_WITH_BG dialogueChapter02EndingKnightRing, DIALOGUE_BG_HALLWAY, 3, 3
      SET_CAMERA_POSITION [45, 1]
      YIELD

      RUN_ASM rlASMCShowItemPopUpBox
      YIELD

      RUN_ASM rlASMCGiveToSupplyMenuIfInventoryFull
      YIELD

      PAUSE 30
      YIELD

    _Continue ; 8E/868C
    DIALOGUE_WITH_BG dialogueChapter02Ending, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [45, 1]
    YIELD

    RUN_EVENT_CONDITION
      ADD_CASTLE_MONEY

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT Chapter02

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    END_EVENT
