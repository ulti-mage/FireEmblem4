
  aEventChapter01VerdaneSpawn ; 90/88F8

    PLAY_SONG $63
    YIELD

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter01Verdane

    MAP_SCROLL [2, 18], 4
    YIELD

    CASTLE_NAME dialogueCastleNameVerdane, CASLTE_NAME_RED, 90
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList1 := [aUNITGroupDataChapter01Verdane.ID_06]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_07]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_08]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_09]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_10]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_11]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_04]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_05]
    _UnitList1..= [aUNITGroupDataChapter01Verdane.ID_12]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter01Verdane, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter01VerdaneSpawn1, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [5, 23]
    YIELD

    PAUSE 15
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Verdane, aUNITGroupDataChapter01Verdane.ID_01, [9, 26], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 18
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Verdane, aUNITGroupDataChapter01Verdane.ID_02, [9, 26], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 14
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Verdane, aUNITGroupDataChapter01Verdane.ID_03, [9, 26], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 10
    YIELD

    MAP_SCROLL [2, 19], 2
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE_WITH_BG dialogueChapter01VerdaneSpawn2, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    _UnitList2 := [aUNITGroupDataChapter01Verdane.ID_23]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_22]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_21]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_20]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_19]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_18]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_16]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_15]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_17]
    _UnitList2..= [aUNITGroupDataChapter01Verdane.ID_14]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter01Verdane, _Unit, [9, 26], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Verdane, aUNITGroupDataChapter01Verdane.ID_13, [9, 24], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter01, FlagChapter01_OpenForest

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter01Verdane

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
