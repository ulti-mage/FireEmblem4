
  aEventChapter02MackilySpawn ; 8E/839D

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter02Mackily

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [35, 23], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch02Mackily]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_Ch02Mackily, FS_Ch02Agusti]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Ch02Nordion, FS_Ch02Mackily]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_12
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_13
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_14
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_15
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_16

    DIALOGUE_WITH_BG dialogueChapter02MackilySpawn1, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    _UnitList1 := [(aUNITGroupDataChapter02Mackily.ID_10,10)]
    _UnitList1..= [(aUNITGroupDataChapter02Mackily.ID_11,10)]
    _UnitList1..= [(aUNITGroupDataChapter02Mackily.ID_06,10)]
    _UnitList1..= [(aUNITGroupDataChapter02Mackily.ID_07,15)]

    .for _Unit, _Time in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter02Mackily, _Unit, [43, 31], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    MAP_SCROLL [45, 1], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter02MackilySpawn2, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 10
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter02Mackily.ID_32,28)]
    _UnitList2..= [(aUNITGroupDataChapter02Mackily.ID_33,28)]
    _UnitList2..= [(aUNITGroupDataChapter02Mackily.ID_34,28)]
    _UnitList2..= [(aUNITGroupDataChapter02Mackily.ID_35,30)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter02Mackily, _Unit, [53, 8], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_36, [53, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList3 := [aUNITGroupDataChapter02Mackily.ID_22]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_23]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_24]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_25]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_26]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_21]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_27]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_28]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_29]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_30]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_31]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_38]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_39]
    _UnitList3..= [aUNITGroupDataChapter02Mackily.ID_40]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter02Mackily, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter02MackilySpawn3, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    _UnitList4 := [(aUNITGroupDataChapter02Mackily.ID_19,25)]
    _UnitList4..= [(aUNITGroupDataChapter02Mackily.ID_17,28)]
    _UnitList4..= [(aUNITGroupDataChapter02Mackily.ID_18,24)]

    .for _Unit, _Time in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter02Mackily, _Unit, [53, 8], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_20, [53, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter02Mackily, aUNITGroupDataChapter02Mackily.ID_37, [53, 6], 3, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter02Mackily

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
