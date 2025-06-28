
  aEventChapter09GrutiaSpawn ; B1/D894

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter09Grutia

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $28
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    MAP_SCROLL [11, 48], 4
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter09, FlagChapter09_SetRamparts

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapter09Grutia.ID_02]
    _UnitList1..= [aUNITGroupDataChapter09Grutia.ID_03]
    _UnitList1..= [aUNITGroupDataChapter09Grutia.ID_04]
    _UnitList1..= [aUNITGroupDataChapter09Grutia.ID_05]
    _UnitList1..= [aUNITGroupDataChapter09Grutia.ID_06]
    _UnitList1..= [aUNITGroupDataChapter09Grutia.ID_07]
    _UnitList1..= [aUNITGroupDataChapter09Grutia.ID_08]
    _UnitList1..= [aUNITGroupDataChapter09Grutia.ID_09]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter09Grutia, _Unit

    .endfor

    DIALOGUE_WITH_BG $B3A303, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter09Grutia, aUNITGroupDataChapter09Grutia.ID_01, [18, 54], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    PLAY_SFX_WORD $00E6
    MAP_SCROLL [0, 0], 4
    YIELD

    PLAY_SONG $19
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter09Grutia.ID_21, [3, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_20, [5, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_19, [4, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_18, [3, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_17, [5, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_16, [4, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_15, [3, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_14, [5, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_13, [4, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_12, [3, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_11, [5, 0])]
    _UnitList2..= [(aUNITGroupDataChapter09Grutia.ID_10, [4, 0])]

    .for _Unit, _Coordinates in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter09Grutia, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE $B3A37C
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter09Grutia

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Lene, Laylea], [Coirpre, Charlot]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
