
  aEventChapter04AndreySpawn ; 8E/9518

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter04Andrey

    PLAY_SONG $19
    YIELD

    PAUSE 16
    YIELD

    MAP_SCROLL [48, 38], 4
    YIELD

    _UnitList1 := [(aUNITGroupDataChapter04Andrey.ID_09, [63, 47])]
    _UnitList1..= [(aUNITGroupDataChapter04Andrey.ID_08, [63, 49])]
    _UnitList1..= [(aUNITGroupDataChapter04Andrey.ID_07, [63, 48])]

    .for _Unit, _Coordinates in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Andrey, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 8
      YIELD

    .endfor

    _UnitList2 := [(aUNITGroupDataChapter04Andrey.ID_06, [63, 47])]
    _UnitList2..= [(aUNITGroupDataChapter04Andrey.ID_05, [63, 49])]
    _UnitList2..= [(aUNITGroupDataChapter04Andrey.ID_04, [63, 48])]
    _UnitList2..= [(aUNITGroupDataChapter04Andrey.ID_03, [63, 47])]
    _UnitList2..= [(aUNITGroupDataChapter04Andrey.ID_02, [63, 49])]
    _UnitList2..= [(aUNITGroupDataChapter04Andrey.ID_01, [63, 48])]

    .for _Unit, _Coordinates in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Andrey, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter04AndreySpawn
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter04Andrey

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
