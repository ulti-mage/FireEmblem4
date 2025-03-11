
  aEventChapter05LeonsterSpawn ; 9D/C229

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter05Leonster

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    MAP_SCROLL [48, 48], 4
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter05, FlagChapter05_LubeckRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    _UnitList1 := [(aUNITGroupDataChapter05Leonster.ID_10, [59, 62])]
    _UnitList1..= [(aUNITGroupDataChapter05Leonster.ID_09, [58, 62])]
    _UnitList1..= [(aUNITGroupDataChapter05Leonster.ID_08, [59, 62])]
    _UnitList1..= [(aUNITGroupDataChapter05Leonster.ID_07, [58, 62])]

    .for _Unit, _Coordinates in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter05Leonster, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 20
      YIELD

    .endfor

    MAP_SCROLL [48, 38], 1

    _UnitList2 := [(aUNITGroupDataChapter05Leonster.ID_06, [59, 54], 20)]
    _UnitList2..= [(aUNITGroupDataChapter05Leonster.ID_05, [58, 54], 20)]
    _UnitList2..= [(aUNITGroupDataChapter05Leonster.ID_04, [59, 54], 15)]
    _UnitList2..= [(aUNITGroupDataChapter05Leonster.ID_03, [58, 54], 15)]
    _UnitList2..= [(aUNITGroupDataChapter05Leonster.ID_02, [59, 54], 15)]

    .for _Unit, _Coordinates, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter05Leonster, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Leonster, aUNITGroupDataChapter05Leonster.ID_01, [58, 54], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE dialogueChapter05LeonsterSpawn
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter05Leonster

    RUN_EVENT_CONDITION
      SEND_INVENTORY_TO_SUPPLY Quan

    RUN_EVENT_CONDITION
      SEND_INVENTORY_TO_SUPPLY Ethlyn

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_FORCED Quan, PI_GaeBolg

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_FORCED Ethlyn, PI_MendStaff3

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_FORCED Ethlyn, PI_IronSword2

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
