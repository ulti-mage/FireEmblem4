
  aEventChapter07UlsterSpawn ; B2/8CA3

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $63
    YIELD

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter07Ulster

    SET_FLAG_IF_IN_CHAPTER Chapter07, FlagChapter07_DahnaArmyTalkCheck

    MAP_SCROLL [8, 16], 4
    YIELD

    PAUSE 15
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch07Dahna]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    DIALOGUE_WITH_BG dialogueChapter07UlsterSpawn1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $41
    YIELD

    PAUSE 15
    YIELD

    _UnitList1 := [(aUNITGroupDataChapter07Ulster.ID_12, 30)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_11, 30)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_10, 30)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_09, 30)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_08, 25)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_07, 25)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_06, 25)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_05, 25)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_04, 20)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_03, 20)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_02, 20)]
    _UnitList1..= [(aUNITGroupDataChapter07Ulster.ID_01, None)]

    .for _Unit, _Time in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Ulster, _Unit, [15, 24], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07UlsterSpawn2, DIALOGUE_BG_GATE, 3, 2
    YIELD

    PAUSE 15
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter07Ulster, aUNITGroupDataChapter07Ulster.ID_26, [15, 24], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MAP_SCROLL [8, 21], 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 15
    YIELD

    MAP_SCROLL [8, 16], 3
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07UlsterSpawn3, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    _UnitList2 := [aUNITGroupDataChapter07Ulster.ID_15]
    _UnitList2..= [aUNITGroupDataChapter07Ulster.ID_16]
    _UnitList2..= [aUNITGroupDataChapter07Ulster.ID_14]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Ulster, _Unit, [15, 24], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter07Ulster, aUNITGroupDataChapter07Ulster.ID_13, [15, 22], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 30
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 2

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 3

    PLAY_SFX_WORD $00E5
    MAP_SCROLL [43, 47], 4
    YIELD

    PLAY_SONG $63
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    _UnitList3 := [aUNITGroupDataChapter07Ulster.ID_23]
    _UnitList3..= [aUNITGroupDataChapter07Ulster.ID_24]
    _UnitList3..= [aUNITGroupDataChapter07Ulster.ID_25]
    _UnitList3..= [aUNITGroupDataChapter07Ulster.ID_21]
    _UnitList3..= [aUNITGroupDataChapter07Ulster.ID_22]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter07Ulster, _Unit

    .endfor

    UNSET_FLAG_IF_IN_CHAPTER Chapter07, FlagChapter07_SetUlsterRampart
    SET_FLAG_IF_IN_CHAPTER Chapter07, FlagChapter07_RemoveUlsterRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    DIALOGUE_WITH_BG dialogueChapter07UlsterSpawn4, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList4 := [(aUNITGroupDataChapter07Ulster.ID_20, 42)]
    _UnitList4..= [(aUNITGroupDataChapter07Ulster.ID_19, 3)]
    _UnitList4..= [(aUNITGroupDataChapter07Ulster.ID_17, 3)]
    _UnitList4..= [(aUNITGroupDataChapter07Ulster.ID_18, None)]

    .for _Unit, _Time in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Ulster, _Unit, [51, 57], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    RUN_EVENT_CONDITION
      REVIVE_FACTIONS_AI FS_Ch07Ulster, 1

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP_CHILD UNITGroupChapter07Ulster

      .byte PermanentFlagTineExists
      .word [Linda, Tine]

    PLAY_SFX_WORD $00E2
    MAP_SCROLL [8, 16], 5
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
