
  aEventChapter07MelgenSpawn ; B2/8B71

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter07Melgen

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [8, 16], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch07Dahna, 1

    DIALOGUE_WITH_BG dialogueChapter07MelgenSpawn1, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [10, 17]
    YIELD

    _UnitList1 := [aUNITGroupDataChapter07Melgen.ID_23]
    _UnitList1..= [aUNITGroupDataChapter07Melgen.ID_24]
    _UnitList1..= [aUNITGroupDataChapter07Melgen.ID_25]
    _UnitList1..= [aUNITGroupDataChapter07Melgen.ID_26]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Melgen, _Unit, [11, 34], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    MAP_SCROLL [10, 50], 4
    YIELD

    CASTLE_NAME dialogueCastleNameMelgen, CASLTE_NAME_RED, 90
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    _UnitList2 := [aUNITGroupDataChapter07Melgen.ID_22]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_21]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_20]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_19]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_18]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_17]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_16]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_15]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_14]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_13]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_12]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_11]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_10]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_09]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_08]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_07]
    _UnitList2..= [aUNITGroupDataChapter07Melgen.ID_06]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter07Melgen, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter07MelgenSpawn2, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter07Melgen, aUNITGroupDataChapter07Melgen.ID_05, [17, 59], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [aUNITGroupDataChapter07Melgen.ID_03]
    _UnitList3..= [aUNITGroupDataChapter07Melgen.ID_04]
    _UnitList3..= [aUNITGroupDataChapter07Melgen.ID_02]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter07Melgen, _Unit, [17, 59], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter07Melgen, aUNITGroupDataChapter07Melgen.ID_01, [17, 57], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter07Melgen

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
