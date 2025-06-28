
  aEventChapterFinalYngviSpawn ; B1/E1D9

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapterFinalYngvi

    PLAY_SFX_WORD $00E0
    PAUSE 40
    YIELD

    PLAY_SONG $63
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 3

    RUN_EVENT_CONDITION
      LOAD_FACTION_GROUP FS_ChFinalYngvi, FG_FinalYngvi

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_ChFinalYngvi, FS_Player]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_ChFinalYngvi, FS_ChFinalFriege]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_ChFinalYngvi, FS_ChFinalVelthomer]

    MAP_SCROLL [0, 48], 4
    YIELD

    PAUSE 20
    YIELD

    _UnitList1 := [(aUNITGroupDataChapterFinalYngvi.ID_17, [1, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_18, [5, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_15, [2, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_16, [4, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_14, [3, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_10, [1, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_11, [5, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_12, [2, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_13, [4, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_05, [3, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_08, [1, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_09, [5, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_06, [2, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_07, [4, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_02, [3, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_03, [2, 63])]
    _UnitList1..= [(aUNITGroupDataChapterFinalYngvi.ID_04, [4, 63])]

    .for _Unit, _Coordinates in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalYngvi, _Unit, _Coordinates, 5, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalYngvi, aUNITGroupDataChapterFinalYngvi.ID_01, [3, 63], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapterFinalYngviSpawn
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapterFinalYngvi

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
