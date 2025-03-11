
  aEventChapter03ThraciaSpawn ; 9D/8BA0

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter03Thracia

    PLAY_SONG $28
    YIELD

    MAP_SCROLL [0, 36], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03ThraciaSpawn1, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    MAP_SCROLL [0, 0], 4
    YIELD

    _UnitList := [(aUNITGroupDataChapter03Thracia.ID_06, [7, 0])]
    _UnitList..= [(aUNITGroupDataChapter03Thracia.ID_07, [9, 0])]
    _UnitList..= [(aUNITGroupDataChapter03Thracia.ID_08, [5, 0])]
    _UnitList..= [(aUNITGroupDataChapter03Thracia.ID_04, [9, 0])]
    _UnitList..= [(aUNITGroupDataChapter03Thracia.ID_05, [5, 0])]
    _UnitList..= [(aUNITGroupDataChapter03Thracia.ID_03, [6, 0])]
    _UnitList..= [(aUNITGroupDataChapter03Thracia.ID_02, [8, 0])]
    _UnitList..= [(aUNITGroupDataChapter03Thracia.ID_01, [7, 0])]

    .for _Unit, _Coordinates in _UnitList

      LOAD_UNIT_BY_GROUP UNITGroupChapter03Thracia, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter03ThraciaSpawn2
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter03Thracia

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
