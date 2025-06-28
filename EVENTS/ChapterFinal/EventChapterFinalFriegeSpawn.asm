
  aEventChapterFinalFriegeSpawn ; B1/E0BD

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapterFinalFriege

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $17
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 2

    MAP_SCROLL [1, 14], 4
    YIELD

    CASTLE_NAME dialogueCastleNameFriege, CASLTE_NAME_RED, 100
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_RemoveDozelRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapterFinalFriege.ID_18]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_17]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_16]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_15]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_14]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_13]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_12]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_11]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_10]
    _UnitList1..= [aUNITGroupDataChapterFinalFriege.ID_05]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapterFinalFriege, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapterFinalFriegeSpawn, DIALOGUE_BG_HALLWAY, 5, 1
    YIELD

    EVENT_3B $80

    PAUSE 2
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalFriege, aUNITGroupDataChapterFinalFriege.ID_08, [8, 22], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    FADE_IN_BY_TIMER 2
    PAUSE 10
    YIELD

    _UnitList2 := [(aUNITGroupDataChapterFinalFriege.ID_06, 14)]
    _UnitList2..= [(aUNITGroupDataChapterFinalFriege.ID_02, 14)]
    _UnitList2..= [(aUNITGroupDataChapterFinalFriege.ID_07, 14)]
    _UnitList2..= [(aUNITGroupDataChapterFinalFriege.ID_09, 14)]
    _UnitList2..= [(aUNITGroupDataChapterFinalFriege.ID_03, 14)]
    _UnitList2..= [(aUNITGroupDataChapterFinalFriege.ID_04, None)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalFriege, _Unit, [8, 22], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalFriege, aUNITGroupDataChapterFinalFriege.ID_01, [8, 22], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalFriege, aUNITGroupDataChapterFinalFriege.ID_25, [8, 20], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [(aUNITGroupDataChapterFinalFriege.ID_24, 14)]
    _UnitList3..= [(aUNITGroupDataChapterFinalFriege.ID_22, 14)]
    _UnitList3..= [(aUNITGroupDataChapterFinalFriege.ID_20, 14)]
    _UnitList3..= [(aUNITGroupDataChapterFinalFriege.ID_21, 14)]
    _UnitList3..= [(aUNITGroupDataChapterFinalFriege.ID_23, None)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalFriege, _Unit, [17, 18], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalFriege, aUNITGroupDataChapterFinalFriege.ID_19, [19, 17], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapterFinalFriege

    PAUSE 20
    YIELD

    END_EVENT
