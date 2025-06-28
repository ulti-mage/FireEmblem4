
  aEventChapter10MiletosSpawn ; 8D/891C

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter10Miletos

    PLAY_SONG $74
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    MAP_SCROLL [2, 20], 4
    YIELD

    CASTLE_NAME dialogueCastleNameMiletos, CASLTE_NAME_RED, 100
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter10, FlagChapter10_RemoveRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapter10Miletos.ID_24]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_23]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_22]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_21]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_20]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_19]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_18]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_17]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_16]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_15]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_14]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_13]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_12]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_11]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_09]
    _UnitList1..= [aUNITGroupDataChapter10Miletos.ID_07]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter10Miletos, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter10MiletosSpawn, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    _UnitList2 := [aUNITGroupDataChapter10Miletos.ID_10]
    _UnitList2..= [aUNITGroupDataChapter10Miletos.ID_06]
    _UnitList2..= [aUNITGroupDataChapter10Miletos.ID_08]
    _UnitList2..= [aUNITGroupDataChapter10Miletos.ID_03]
    _UnitList2..= [aUNITGroupDataChapter10Miletos.ID_02]
    _UnitList2..= [aUNITGroupDataChapter10Miletos.ID_01]
    _UnitList2..= [aUNITGroupDataChapter10Miletos.ID_05]
    _UnitList2..= [aUNITGroupDataChapter10Miletos.ID_04]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter10Miletos, _Unit, [9, 28], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Miletos, aUNITGroupDataChapter10Miletos.ID_27, [9, 26], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Miletos, aUNITGroupDataChapter10Miletos.ID_25, [9, 28], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Miletos, aUNITGroupDataChapter10Miletos.ID_26, [9, 28], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 10
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter10Miletos

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
