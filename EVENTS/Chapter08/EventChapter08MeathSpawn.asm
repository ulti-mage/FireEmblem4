
  aEventChapter08MeathSpawn ; 8F/BC5C

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter08Meath

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $85
    YIELD

    MAP_SCROLL [30, 50], 4
    YIELD

    PAUSE 20
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter08, FlagChapter08_ConnachtBridgeLowered

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    FADE_OUT_BY_TIMER 1
    YIELD

    _UnitList1 := [aUNITGroupDataChapter08Meath.ID_29]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_30]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_31]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_32]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_33]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_34]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_35]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_36]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_37]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_39]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_40]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_41]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_42]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_43]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_44]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_08]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_09]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_10]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_11]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_12]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_13]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_14]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_15]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_16]
    _UnitList1..= [aUNITGroupDataChapter08Meath.ID_17]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter08Meath, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter08MeathSpawn1, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 15
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter08Meath, aUNITGroupDataChapter08Meath.ID_28, [37, 59], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 30
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    _UnitList2 := [aUNITGroupDataChapter08Meath.ID_27]
    _UnitList2..= [aUNITGroupDataChapter08Meath.ID_25]
    _UnitList2..= [aUNITGroupDataChapter08Meath.ID_22]
    _UnitList2..= [aUNITGroupDataChapter08Meath.ID_26]
    _UnitList2..= [aUNITGroupDataChapter08Meath.ID_23]
    _UnitList2..= [aUNITGroupDataChapter08Meath.ID_24]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter08Meath, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter08MeathSpawn2, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT $0161, [37, 59], 4, MAP_SPRITE_RED, _SciptedMovement
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 25
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT $0161, [37, 59], 4, MAP_SPRITE_RED, _SciptedMovement
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [(aUNITGroupDataChapter08Meath.ID_20, 10)]
    _UnitList3..= [(aUNITGroupDataChapter08Meath.ID_21, 10)]
    _UnitList3..= [(aUNITGroupDataChapter08Meath.ID_19, 10)]
    _UnitList3..= [(aUNITGroupDataChapter08Meath.ID_18, None)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter08Meath, _Unit, [37, 59], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter08Meath, aUNITGroupDataChapter08Meath.ID_38, [37, 57], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 30
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6B
    YIELD

    MAP_SCROLL [37, 22], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_Player, FS_Ch08Ced]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Ch08Ced, FS_Ch08Meath]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    RUN_EVENT_CONDITION
      SET_FACTION_GROUP FS_Ch08Ced, FG_Ch08Munster2

    DIALOGUE_WITH_BG dialogueChapter08MeathSpawn3, DIALOGUE_BG_GATE, 3, 2
    YIELD

    _UnitList4 := [(aUNITGroupDataChapter08Meath.ID_02, 20)]
    _UnitList4..= [(aUNITGroupDataChapter08Meath.ID_04, 16)]
    _UnitList4..= [(aUNITGroupDataChapter08Meath.ID_06, 18)]
    _UnitList4..= [(aUNITGroupDataChapter08Meath.ID_05, None)]
    _UnitList4..= [(aUNITGroupDataChapter08Meath.ID_03, None)]
    _UnitList4..= [(aUNITGroupDataChapter08Meath.ID_07, None)]

    .for _Unit, _Time in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter08Meath, _Unit, [44, 30], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter08Meath, aUNITGroupDataChapter08Meath.ID_01, [44, 28], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP_CHILD UNITGroupChapter08Meath

      .byte PermanentFlagCedExists
      .word [Hawk, Ced]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _SciptedMovement ; 8F/BE10
      MAP_DOWN_MULTIPLE 4
      MAP_END
