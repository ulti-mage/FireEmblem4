
  aEventChapter04AnnandSpawn ; 8E/945D

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter04Annand

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6B
    YIELD

    MAP_SCROLL [21, 50], 4
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    _UnitList1 := [aUNITGroupDataChapter04Annand.ID_12]
    _UnitList1..= [aUNITGroupDataChapter04Annand.ID_11]
    _UnitList1..= [aUNITGroupDataChapter04Annand.ID_08]
    _UnitList1..= [aUNITGroupDataChapter04Annand.ID_07]
    _UnitList1..= [aUNITGroupDataChapter04Annand.ID_06]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter04Annand, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter04AnnandSpawn, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter04Annand.ID_09, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Annand.ID_10, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Annand.ID_04, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Annand.ID_05, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Annand.ID_02, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Annand.ID_03, 30)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Annand, _Unit, [28, 60], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Annand, aUNITGroupDataChapter04Annand.ID_01, [28, 60], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter04Annand

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
