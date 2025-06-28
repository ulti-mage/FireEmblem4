
  aEventChapterFinalDozelSpawn ; B1/DF6C

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapterFinalDozel

    PLAY_SONG $17
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    MAP_SCROLL [24, 28], 4
    YIELD

    CASTLE_NAME dialogueCastleNameDozel, CASLTE_NAME_RED, 100
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_RemoveChalphyRampart
    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_RemoveEddaRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapterFinalDozel.ID_07]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_08]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_09]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_10]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_28]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_27]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_26]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_25]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_24]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_23]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_22]
    _UnitList1..= [aUNITGroupDataChapterFinalDozel.ID_21]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapterFinalDozel, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapterFinalDozelSpawn, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList2 := [(aUNITGroupDataChapterFinalDozel.ID_06, 25)]
    _UnitList2..= [(aUNITGroupDataChapterFinalDozel.ID_05, 25)]
    _UnitList2..= [(aUNITGroupDataChapterFinalDozel.ID_04, 25)]
    _UnitList2..= [(aUNITGroupDataChapterFinalDozel.ID_03, 25)]
    _UnitList2..= [(aUNITGroupDataChapterFinalDozel.ID_02, 20)]
    _UnitList2..= [(aUNITGroupDataChapterFinalDozel.ID_01, None)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalDozel, _Unit, [31, 36], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [(aUNITGroupDataChapterFinalDozel.ID_19, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_20, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_18, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_17, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_15, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_16, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_14, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_13, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_11, 12)]
    _UnitList3..= [(aUNITGroupDataChapterFinalDozel.ID_12, None)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalDozel, _Unit, [31, 36], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalDozel, aUNITGroupDataChapterFinalDozel.ID_29, [31, 34], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapterFinalDozel

    END_EVENT
