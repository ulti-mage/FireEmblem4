
  aEventChapter10ChalphySpawn ; 8D/8A6B

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter10Chalphy

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $66
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 2

    MAP_SCROLL [7, 0], 4
    YIELD

    CASTLE_NAME dialogueCastleNameChalphy, CASLTE_NAME_RED, 100
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter10, FlagChapter10_LowerBridge

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapter10Chalphy.ID_08]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_09]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_10]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_11]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_12]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_13]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_14]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_15]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_16]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_17]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_18]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_19]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_20]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_21]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_22]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_23]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_24]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_25]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_26]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_27]
    _UnitList1..= [aUNITGroupDataChapter10Chalphy.ID_28]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter10Chalphy, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter10ChalphySpawn1, DIALOGUE_BG_HALLWAY, 5, 2
    YIELD

    PAUSE 10
    YIELD

    EVENT_3B $80
    PAUSE 5
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Chalphy, aUNITGroupDataChapter10Chalphy.ID_34, [15, 6], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    FADE_IN_BY_TIMER 2
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter10Chalphy.ID_36, 25)]
    _UnitList2..= [(aUNITGroupDataChapter10Chalphy.ID_32, 25)]
    _UnitList2..= [(aUNITGroupDataChapter10Chalphy.ID_30, 20)]
    _UnitList2..= [(aUNITGroupDataChapter10Chalphy.ID_31, 15)]
    _UnitList2..= [(aUNITGroupDataChapter10Chalphy.ID_33, 10)]
    _UnitList2..= [(aUNITGroupDataChapter10Chalphy.ID_35, 10)]
    _UnitList2..= [(aUNITGroupDataChapter10Chalphy.ID_29, None)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter10Chalphy, _Unit, [15, 6], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [aUNITGroupDataChapter10Chalphy.ID_05]
    _UnitList3..= [aUNITGroupDataChapter10Chalphy.ID_06]
    _UnitList3..= [aUNITGroupDataChapter10Chalphy.ID_07]
    _UnitList3..= [aUNITGroupDataChapter10Chalphy.ID_02]
    _UnitList3..= [aUNITGroupDataChapter10Chalphy.ID_03]
    _UnitList3..= [aUNITGroupDataChapter10Chalphy.ID_04]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter10Chalphy, _Unit, [15, 6], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Chalphy, aUNITGroupDataChapter10Chalphy.ID_01, [15, 4], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter10Chalphy

    MAP_SCROLL [29, 0], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE dialogueChapter10ChalphySpawn2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
