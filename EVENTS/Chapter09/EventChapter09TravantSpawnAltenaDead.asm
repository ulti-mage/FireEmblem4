
  aEventChapter09TravantSpawnAltenaDead ; B1/D721

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter09Travant

    PLAY_SONG $81
    YIELD

    MAP_SCROLL [45, 34], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList1 := [aUNITGroupDataChapter09Travant.ID_06]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_07]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_08]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_09]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_10]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter09Travant, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter09TravantSpawnAltenaDead, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter09Travant.ID_05, 18)]
    _UnitList2..= [(aUNITGroupDataChapter09Travant.ID_03, 18)]
    _UnitList2..= [(aUNITGroupDataChapter09Travant.ID_04, 18)]
    _UnitList2..= [(aUNITGroupDataChapter09Travant.ID_02, 28)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter09Travant, _Unit, [52, 43], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter09Travant, aUNITGroupDataChapter09Travant.ID_01, [52, 43], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter09Travant

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
