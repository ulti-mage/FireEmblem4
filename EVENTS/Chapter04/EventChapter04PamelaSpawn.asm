
  aEventChapter04PamelaSpawn ; 8E/9396

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter04Pamela

    SET_FLAG_IF_IN_CHAPTER Chapter04, FlagChapter04_ErinysSilviaAdjacentEvent
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [48, 38], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    _UnitList1 := [aUNITGroupDataChapter04Pamela.ID_16]
    _UnitList1..= [aUNITGroupDataChapter04Pamela.ID_15]
    _UnitList1..= [aUNITGroupDataChapter04Pamela.ID_12]
    _UnitList1..= [aUNITGroupDataChapter04Pamela.ID_11]
    _UnitList1..= [aUNITGroupDataChapter04Pamela.ID_10]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter04Pamela, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter04PamelaSpawn, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter04Pamela.ID_14, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Pamela.ID_13, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Pamela.ID_09, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Pamela.ID_08, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Pamela.ID_07, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Pamela.ID_06, 30)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Pamela, _Unit, [59, 45], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Pamela, aUNITGroupDataChapter04Pamela.ID_05, [59, 45], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Pamela, aUNITGroupDataChapter04Pamela.ID_02, [59, 45], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Pamela, aUNITGroupDataChapter04Pamela.ID_03, [59, 45], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Pamela, aUNITGroupDataChapter04Pamela.ID_04, [59, 45], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Pamela, aUNITGroupDataChapter04Pamela.ID_01, [59, 43], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter04Pamela

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
