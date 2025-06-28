
  aEventChapter08Opening ; 8F/B81D

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter08Opening

    SET_CAMERA_POSITION [41, 2]
    EVENT_3B $80

    _UnitList1 := [aUNITGroupDataChapter08Opening.ID_02]
    _UnitList1..= [aUNITGroupDataChapter08Opening.ID_03]
    _UnitList1..= [aUNITGroupDataChapter08Opening.ID_04]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter08Opening, _Unit

    .endfor

    PAUSE 2
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter08Opening.ID_01, [47,  8])]
    _UnitList2..= [(aUNITGroupDataChapter08Opening.ID_06, [47, 10])]
    _UnitList2..= [(aUNITGroupDataChapter08Opening.ID_07, [48, 10])]
    _UnitList2..= [(aUNITGroupDataChapter08Opening.ID_05, [49, 10])]

    .for _Unit, _Coordinates in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter08Opening, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    FADE_IN_BY_TIMER 2

    CASTLE_NAME dialogueCastleNameConnacht, CASLTE_NAME_RED, 180
    YIELD

    DIALOGUE_WITH_BG dialogueChapter08Opening1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    _UnitList3 := [(aUNITGroupDataChapter08Opening.ID_13, 10)]
    _UnitList3..= [(aUNITGroupDataChapter08Opening.ID_12, 10)]
    _UnitList3..= [(aUNITGroupDataChapter08Opening.ID_14, None)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter08Opening, _Unit, [49, 10], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList4 := [aUNITGroupDataChapter08Opening.ID_10]
    _UnitList4..= [aUNITGroupDataChapter08Opening.ID_11]
    _UnitList4..= [aUNITGroupDataChapter08Opening.ID_09]

    .for _Unit in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter08Opening, _Unit, [49, 10], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter08Opening, aUNITGroupDataChapter08Opening.ID_08, [49, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    MAP_SCROLL [37, 22], 4
    YIELD

    CASTLE_NAME dialogueCastleNameMunster, CASLTE_NAME_RED, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter08Opening2, DIALOGUE_BG_FOUNTAIN, 3, 2
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E3
    MAP_SCROLL [30, 50], 4
    YIELD

    PLAY_SONG $85
    YIELD

    CASTLE_NAME dialogueCastleNameMeath, CASLTE_NAME_RED, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter08Opening3, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E3
    MAP_SCROLL [0, 29], 4
    YIELD

    PLAY_SONG $66
    YIELD

    CASTLE_NAME dialogueCastleNameUlster, CASLTE_NAME_BLUE, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter08Opening4, DIALOGUE_BG_THRONE, 3, 1
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter08, FlagChapter08_LeifAlive
    JUMP_FALSE +

      PAUSE 20
      YIELD

      MOVE_TEMPORARY_BY_SCRIPT Leif, [3, 37], 4, 2, _ScriptedMovement
      WAIT_UNIT_SPRITE_DECOMPRESSED

      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Leif, $FF, [8, 6]

    + ; 8F/B92B
    TEST_FLAG_IN_CHAPTER_SET Chapter08, FlagChapter08_FinnAlive
    JUMP_FALSE +

      PAUSE 18
      YIELD

      MOVE_TEMPORARY_BY_SCRIPT AdultFinn, [3, 37], 4, 2, _ScriptedMovement
      WAIT_UNIT_SPRITE_DECOMPRESSED

      RUN_EVENT_CONDITION
        SET_UNIT_POSITION AdultFinn, $FF, [7, 8]

    + ; 8F/B947
    TEST_PERMANENT_FLAG_SET PermanentFlagNannaExists
    JUMP_FALSE +

      TEST_FLAG_IN_CHAPTER_SET Chapter08, FlagChapter08_NannaAlive
      JUMP_FALSE +

        PAUSE 18
        YIELD

        MOVE_TEMPORARY_BY_SCRIPT Nanna, [3, 37], 4, 2, _ScriptedMovement
        WAIT_UNIT_SPRITE_DECOMPRESSED

        RUN_EVENT_CONDITION
          SET_UNIT_POSITION Nanna, $FF, [9, 8]

        JUMP _LeonsterMovingFinished

    + ; 8F/B96B
    TEST_FLAG_IN_CHAPTER_SET Chapter08, FlagChapter08_JeanneAlive
    JUMP_FALSE _LeonsterMovingFinished

      PAUSE 18
      YIELD

      MOVE_TEMPORARY_BY_SCRIPT Jeanne, [3, 37], 4, 2, _ScriptedMovement
      WAIT_UNIT_SPRITE_DECOMPRESSED

        RUN_EVENT_CONDITION
          SET_UNIT_POSITION Jeanne, $FF, [9, 8]

    _LeonsterMovingFinished ; 8F/B987
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 40
    YIELD

    JUMP _B9F5

      ; 8F/B990

      EVENT_DUMMY

      FADE_OUT_BY_TIMER 1
      YIELD

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupChapter08Opening

      _UnitList := [(FlagChapter08_LeifAlive,  PermanentFlagSeliphExists, Leif,       Quan,   [8, 6])]
      _UnitList..= [(FlagChapter08_FinnAlive,  PermanentFlagSeliphExists, AdultFinn,  Finn,   [7, 8])]
      _UnitList..= [(FlagChapter08_NannaAlive, PermanentFlagNannaExists,  Nanna,      Jeanne, [9, 8])]

      .for _ChapterFlag, _PermanentFlag, _Unit, _Replacement, _Coordinates in _UnitList

        TEST_FLAG_IN_CHAPTER_SET Chapter08, _ChapterFlag
        JUMP_FALSE ++

          TEST_PERMANENT_FLAG_SET _PermanentFlag
          JUMP_TRUE +

            RUN_EVENT_CONDITION
              SET_UNIT_POSITION _Replacement, $FF, _Coordinates

            JUMP ++

            +
            RUN_EVENT_CONDITION
              SET_UNIT_POSITION _Unit, $FF, _Coordinates

        +

      .endfor

      ; 8F/B9EC
      SET_CAMERA_POSITION [0, 29]
      EVENT_3B $01
      YIELD

      JUMP +

    _B9F5
    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter08Opening

    +
    RUN_EVENT_CONDITION
      SET_TALK_TARGET Julia, Seliph

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Arthur, Amid], [Fee, Hermina]

    RUN_EVENT_CONDITION
      SET_TALK_TARGET AdultFinn, Leif

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT

    _ScriptedMovement ; 8F/BA0F
      MAP_RIGHT_MULTIPLE 2
      MAP_UP_MULTIPLE 4
      MAP_LEFT_MULTIPLE 1
      MAP_UP_MULTIPLE 6
      MAP_END
