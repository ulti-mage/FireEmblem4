
  aEventChapter04DonovanSpawn ; 8E/98A4

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter04Donovan

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6C
    YIELD

    MAP_SCROLL [21, 50], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04DonovanSpawn, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList1 := [aUNITGroupDataChapter04Donovan.ID_07]
    _UnitList1..= [aUNITGroupDataChapter04Donovan.ID_06]
    _UnitList1..= [aUNITGroupDataChapter04Donovan.ID_05]
    _UnitList1..= [aUNITGroupDataChapter04Donovan.ID_04]
    _UnitList1..= [aUNITGroupDataChapter04Donovan.ID_03]
    _UnitList1..= [aUNITGroupDataChapter04Donovan.ID_02]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Donovan, _Unit, [28, 60], 4, MAP_SPRITE_GREEN
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Donovan, aUNITGroupDataChapter04Donovan.ID_01, [28, 58], 4, MAP_SPRITE_GREEN
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter04Donovan

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
