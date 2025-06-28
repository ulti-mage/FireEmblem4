
  aEventChapter07Opening ; B2/87DC

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter07Opening

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Leif

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE AdultFinn

    TEST_PERMANENT_FLAG_SET PermanentFlagNannaExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Jeanne

      JUMP ++

      +
      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Nanna

    +
    TEST_PERMANENT_FLAG_SET PermanentFlagPattyExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Daisy

      JUMP ++

      +
      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Patty

    +
    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Shannan

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Leif, $FF, [0, 0]

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION AdultFinn, $FF, [0, 0]

    TEST_PERMANENT_FLAG_SET PermanentFlagNannaExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Jeanne, $FF, [0, 0]

      JUMP ++

      +
      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Nanna, $FF, [0, 0]

    +
    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Shannan, $FF, [0, 0]

    TEST_PERMANENT_FLAG_SET PermanentFlagPattyExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Daisy, $FF, [0, 0]

      JUMP ++

      +
      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Patty, $FF, [0, 0]

    +
    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_FORCED AdultFinn, PI_IronLance4

    SET_CAMERA_POSITION [48, 21]
    EVENT_3B $80
    PAUSE 2
    YIELD

    FADE_IN_BY_TIMER 4
    MOVE_TEMPORARY_BY_SCRIPT AdultFinn, [55, 35], 4, MAP_SPRITE_BLUE, _ScriptedMovementFinn
    WAIT_UNIT_SPRITE_DECOMPRESSED

    CASTLE_NAME dialogueCastleNameLeonster, CASLTE_NAME_GREEN, 130
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07Opening1, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_DIRECT AdultFinn, FS_Player, [56, 28], [55, 29], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 12
    YIELD

    TEST_PERMANENT_FLAG_SET PermanentFlagNannaExists
    JUMP_TRUE +

      LOAD_UNIT_DIRECT Jeanne, FS_Player, [56, 28], [57, 29], 4, MAP_SPRITE_BLUE
      WAIT_UNIT_SPRITE_DECOMPRESSED
      JUMP ++

      +
      LOAD_UNIT_DIRECT Nanna, FS_Player, [56, 28], [57, 29], 4, MAP_SPRITE_BLUE
      WAIT_UNIT_SPRITE_DECOMPRESSED

    +
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 12
    YIELD

    LOAD_UNIT_DIRECT Leif, FS_Player, [56, 28], [56, 29], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E3
    MAP_SCROLL [43, 47], 4
    YIELD

    PLAY_SONG $63
    YIELD

    CASTLE_NAME dialogueCastleNameUlster, CASLTE_NAME_RED, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07Opening2, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    _UnitList1 := [(aUNITGroupDataChapter07Opening.ID_11, 25)]
    _UnitList1..= [(aUNITGroupDataChapter07Opening.ID_12, 25)]
    _UnitList1..= [(aUNITGroupDataChapter07Opening.ID_09, 25)]
    _UnitList1..= [(aUNITGroupDataChapter07Opening.ID_10, 22)]
    _UnitList1..= [(aUNITGroupDataChapter07Opening.ID_07, 22)]
    _UnitList1..= [(aUNITGroupDataChapter07Opening.ID_08, 16)]
    _UnitList1..= [(aUNITGroupDataChapter07Opening.ID_05, 16)]
    _UnitList1..= [(aUNITGroupDataChapter07Opening.ID_06, None)]

    .for _Unit, _Time in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Opening, _Unit, [51, 57], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList2 := [aUNITGroupDataChapter07Opening.ID_15]
    _UnitList2..= [aUNITGroupDataChapter07Opening.ID_16]
    _UnitList2..= [aUNITGroupDataChapter07Opening.ID_14]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Opening, _Unit, [51, 57], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter07Opening, aUNITGroupDataChapter07Opening.ID_13, [51, 55], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    PLAY_SFX_WORD $00E6
    MAP_SCROLL [13, 0], 4
    YIELD

    PLAY_SONG $7A
    YIELD

    CASTLE_NAME dialogueCastleNameAed, CASLTE_NAME_RED, 90
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Daisy, [20, 5], 4, MAP_SPRITE_BLUE, _ScriptedMovementDaisy
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE dialogueChapter07Opening3
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Shannan, [20, 5], 5, MAP_SPRITE_BLUE, _ScriptedMovementShannan
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MAP_SCROLL [7, 0], 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE dialogueChapter07Opening4
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Shannan, $FF, [15, 2]

    TEST_PERMANENT_FLAG_SET PermanentFlagPattyExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Daisy, $FF, [13, 2]

      JUMP ++

      +
      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Patty, $FF, [13, 2]

    +
    CONTINUE_FORM_MAP_SPRITE_HALT
    PAUSE 20
    YIELD

    MAP_SCROLL [13, 0], 3
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList3 := [aUNITGroupDataChapter07Opening.ID_23]
    _UnitList3..= [aUNITGroupDataChapter07Opening.ID_25]
    _UnitList3..= [aUNITGroupDataChapter07Opening.ID_26]
    _UnitList3..= [aUNITGroupDataChapter07Opening.ID_27]
    _UnitList3..= [aUNITGroupDataChapter07Opening.ID_28]
    _UnitList3..= [aUNITGroupDataChapter07Opening.ID_37]
    _UnitList3..= [aUNITGroupDataChapter07Opening.ID_38]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter07Opening, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter07Opening5, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 15
    YIELD

    _UnitList4 := [(aUNITGroupDataChapter07Opening.ID_36, 8)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_35, 8)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_33, 8)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_34, 8)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_32, 8)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_31, 15)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_03, None)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_04, None)]
    _UnitList4..= [(aUNITGroupDataChapter07Opening.ID_02, None)]

    .for _Unit, _Time in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Opening, _Unit, [20, 5], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter07Opening, aUNITGroupDataChapter07Opening.ID_01, [20, 3], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E3
    MAP_SCROLL [48, 0], 4
    YIELD

    PLAY_SONG $68
    YIELD

    CASTLE_NAME dialogueCastleNameRibaut, CASLTE_NAME_BLUE, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07Opening6, DIALOGUE_BG_THRONE, 3, 1
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter07Opening

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Shannan, Shannan], [Patty, Daisy]

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Seliph, Shannan

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Oifey, Oifey], [Diarmuid, Tristan]

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Larcei, Creidne], [Shannan, Shannan]

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Leif, Seliph

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Diarmuid, Nanna

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Tristan, Jeanne

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT

    _ScriptedMovementFinn ; B2/8ACB
      MAP_UP_MULTIPLE 2
      MAP_RIGHT_MULTIPLE 1
      MAP_UP_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 1
      MAP_UP_MULTIPLE 3
      MAP_LEFT_MULTIPLE 1
      MAP_UP_MULTIPLE 1
      MAP_PAUSE 10
      MAP_END

    _ScriptedMovementDaisy ; B2/8ADC
      MAP_FACE_DOWN
      MAP_HALT

      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 2
      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 1
      MAP_LEFT_MULTIPLE 2
      MAP_PAUSE 20
      MAP_FACE_RIGHT
      MAP_HALT

      MAP_LEFT_MULTIPLE 1
      MAP_HALT

      MAP_END

    _ScriptedMovementShannan ; B2/8AF0
      MAP_FACE_DOWN
      MAP_PAUSE 18
      MAP_FACE_RIGHT
      MAP_PAUSE 18
      MAP_FACE_LEFT
      MAP_PAUSE 14
      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 3
      MAP_LEFT_MULTIPLE 3
      MAP_HALT

      MAP_HALT

      MAP_END
