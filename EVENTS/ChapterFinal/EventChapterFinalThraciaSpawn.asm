
  aEventChapterFinalThraciaSpawn ; B1/E46D

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapterFinalThracia

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $85
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 4

    RUN_EVENT_CONDITION
      LOAD_FACTION_GROUP FS_ChFinalThracia, FG_FinalThracia

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_ChFinalThracia, FS_Player]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_ChFinalThracia, FS_ChFinalYngvi]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_ChFinalThracia, FS_ChFinalBelhalla]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_ChFinalThracia, FS_ChFinalVelthomer]

    MAP_SCROLL [48, 50], 4
    YIELD

    PAUSE 20
    YIELD

    _UnitList1 := [(aUNITGroupDataChapterFinalThracia.ID_02, [63, 58])]
    _UnitList1..= [(aUNITGroupDataChapterFinalThracia.ID_03, [63, 59])]
    _UnitList1..= [(aUNITGroupDataChapterFinalThracia.ID_04, [63, 57])]
    _UnitList1..= [(aUNITGroupDataChapterFinalThracia.ID_05, [63, 60])]
    _UnitList1..= [(aUNITGroupDataChapterFinalThracia.ID_06, [63, 56])]

    .for _Unit, _Coordinates in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalThracia, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalThracia, aUNITGroupDataChapterFinalThracia.ID_01, [63, 58], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapterFinalThraciaSpawn
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapterFinalThracia

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
