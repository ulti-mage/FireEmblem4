
  aEventChapter09ThraciaSpawn ; B1/D9CD

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter09Thracia

    PLAY_SONG $85
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 2

    MAP_SCROLL [44, 36], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter09, FlagChapter09_RemoveRamparts

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapter09Thracia.ID_35]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_36]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_37]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_25]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_26]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_27]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_45]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_46]
    _UnitList1..= [aUNITGroupDataChapter09Thracia.ID_47]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter09Thracia, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter09ThraciaSpawn, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    _UnitList2 := [aUNITGroupDataChapter09Thracia.ID_34]
    _UnitList2..= [aUNITGroupDataChapter09Thracia.ID_33]
    _UnitList2..= [aUNITGroupDataChapter09Thracia.ID_32]
    _UnitList2..= [aUNITGroupDataChapter09Thracia.ID_31]
    _UnitList2..= [aUNITGroupDataChapter09Thracia.ID_30]
    _UnitList2..= [aUNITGroupDataChapter09Thracia.ID_29]
    _UnitList2..= [aUNITGroupDataChapter09Thracia.ID_28]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter09Thracia, _Unit, [52, 43], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    PAUSE 20
    YIELD

    _UnitList3 := [aUNITGroupDataChapter09Thracia.ID_24]
    _UnitList3..= [aUNITGroupDataChapter09Thracia.ID_23]
    _UnitList3..= [aUNITGroupDataChapter09Thracia.ID_22]
    _UnitList3..= [aUNITGroupDataChapter09Thracia.ID_21]
    _UnitList3..= [aUNITGroupDataChapter09Thracia.ID_20]
    _UnitList3..= [aUNITGroupDataChapter09Thracia.ID_19]
    _UnitList3..= [aUNITGroupDataChapter09Thracia.ID_18]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter09Thracia, _Unit, [52, 43], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    PAUSE 20
    YIELD

    _UnitList4 := [aUNITGroupDataChapter09Thracia.ID_44]
    _UnitList4..= [aUNITGroupDataChapter09Thracia.ID_43]
    _UnitList4..= [aUNITGroupDataChapter09Thracia.ID_42]
    _UnitList4..= [aUNITGroupDataChapter09Thracia.ID_41]
    _UnitList4..= [aUNITGroupDataChapter09Thracia.ID_40]
    _UnitList4..= [aUNITGroupDataChapter09Thracia.ID_39]
    _UnitList4..= [aUNITGroupDataChapter09Thracia.ID_38]

    .for _Unit in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter09Thracia, _Unit, [52, 43], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    PAUSE 35
    YIELD

    _UnitList5 := [(aUNITGroupDataChapter09Thracia.ID_17, 16)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_16, 12)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_15, 14)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_14, 12)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_13, 16)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_12, 14)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_11, 16)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_10, 10)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_09, 15)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_08, None)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_07, None)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_06, None)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_05, None)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_04, None)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_03, None)]
    _UnitList5..= [(aUNITGroupDataChapter09Thracia.ID_02, None)]

    .for _Unit, _Time in _UnitList5

      LOAD_UNIT_BY_GROUP UNITGroupChapter09Thracia, _Unit, [52, 43], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    PAUSE 25
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter09Thracia, aUNITGroupDataChapter09Thracia.ID_01, [52, 43], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter09Thracia

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
