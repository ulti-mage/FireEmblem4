
  aEventChapter05ThraciaSpawn ; 9D/C2F5

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter05Thracia

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $85
    YIELD

    MAP_SCROLL [48, 50], 4
    YIELD

    _UnitList1 := [(aUNITGroupDataChapter05Thracia.ID_14, [61, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_13, [55, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_10, [60, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_09, [56, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_12, [61, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_11, [55, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_08, [60, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_07, [56, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_06, [59, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_05, [57, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_03, [59, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_02, [57, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_04, [58, 63])]
    _UnitList1..= [(aUNITGroupDataChapter05Thracia.ID_01, [58, 63])]

    .for _Unit, _Coordinates in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter05Thracia, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Thracia, aUNITGroupDataChapter05Thracia.ID_15, [58, 63], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 15
    YIELD

    DIALOGUE dialogueChapter05ThraciaSpawn1
    YIELD

    PAUSE 10
    YIELD

    PLAY_SFX_WORD $00E2
    FILL_EVENT_UNIT_SLOT Quan, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PLAY_SONG $6B
    YIELD

    DIALOGUE dialogueChapter05ThraciaSpawn2
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter05Thracia

    MAP_SCROLL [48, 50], 4
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
