
  aEventChapter02AgustiSpawn ; 8E/851F

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter02Agusti

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [45, 0], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList1 := [aUNITGroupDataChapter02Agusti.ID_03]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_06]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_07]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_08]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_09]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_10]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_11]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_12]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_13]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_14]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_15]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_16]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_17]
    _UnitList1..= [aUNITGroupDataChapter02Agusti.ID_18]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter02Agusti, _Unit

    .endfor

    SET_FLAG_IF_IN_CHAPTER Chapter02, FlagChapter02_RemoveRamparts

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    DIALOGUE_WITH_BG dialogueChapter02AgustiSpawn1, DIALOGUE_BG_HALLWAY, 5, 2
    YIELD

    EVENT_3B $80
    PAUSE 2
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    _UnitList2 := [aUNITGroupDataChapter02Agusti.ID_02]
    _UnitList2..= [aUNITGroupDataChapter02Agusti.ID_05]
    _UnitList2..= [aUNITGroupDataChapter02Agusti.ID_04]
    _UnitList2..= [aUNITGroupDataChapter02Agusti.ID_01]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter02Agusti, _Unit, [48, 6], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    FADE_IN_BY_TIMER 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 15
    YIELD

    DIALOGUE dialogueChapter02AgustiSpawn2
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter02Agusti

    END_EVENT
