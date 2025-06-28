
  aEventChapter04ZaxonSpawn ; 8E/96C2

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter04Zaxon

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [48, 38], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04ZaxonSpawn1, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList1 := [(Donovan, 16)]
    _UnitList1..= [(SilesseFighter, 16)]
    _UnitList1..= [(SilesseFighter, 16)]
    _UnitList1..= [(SilesseFighter, 30)]

    .for _Unit, _Time in _UnitList1

      MOVE_TEMPORARY_BY_SCRIPT _Unit, [59, 45], 4, MAP_SPRITE_RED, _ScriptedMovementDonovan1, true
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    MAP_SCROLL [21, 50], 4
    YIELD

    PLAY_SONG $6B
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04ZaxonSpawn2, DIALOGUE_BG_THRONE, 3, 2
    SET_CAMERA_POSITION [18, 50]
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter04Zaxon.ID_11, 26)]
    _UnitList2..= [(aUNITGroupDataChapter04Zaxon.ID_13, 24)]
    _UnitList2..= [(aUNITGroupDataChapter04Zaxon.ID_12, 28)]
    _UnitList2..= [(aUNITGroupDataChapter04Zaxon.ID_09, 25)]
    _UnitList2..= [(aUNITGroupDataChapter04Zaxon.ID_10, 22)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Zaxon, _Unit, [28, 60], 4, MAP_SPRITE_GREEN
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Zaxon, aUNITGroupDataChapter04Zaxon.ID_14, [28, 60], 4, MAP_SPRITE_GREEN
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 120
    YIELD

    _UnitList3 := [Donovan]
    _UnitList3..= [SilesseFighter]
    _UnitList3..= [SilesseFighter]

    .for _Unit in _UnitList3

      MOVE_TEMPORARY_BY_SCRIPT _Unit, [35, 53], 4, MAP_SPRITE_RED, _ScriptedMovementDonovan2
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 18
      YIELD

    .endfor

    MOVE_TEMPORARY_BY_SCRIPT SilesseFighter, [35, 53], 4, MAP_SPRITE_RED, _ScriptedMovementDonovan2
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04ZaxonSpawn3, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    _UnitList4 := [aUNITGroupDataChapter04Zaxon.ID_05]
    _UnitList4..= [aUNITGroupDataChapter04Zaxon.ID_02]
    _UnitList4..= [aUNITGroupDataChapter04Zaxon.ID_03]
    _UnitList4..= [aUNITGroupDataChapter04Zaxon.ID_01]
    _UnitList4..= [aUNITGroupDataChapter04Zaxon.ID_06]
    _UnitList4..= [aUNITGroupDataChapter04Zaxon.ID_04]

    .for _Unit in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Zaxon, _Unit, [28, 60], 4, MAP_SPRITE_GREEN
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

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

    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter04Zaxon, aUNITGroupDataChapter04Zaxon.ID_22
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter04Zaxon, aUNITGroupDataChapter04Zaxon.ID_21
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter04Zaxon, aUNITGroupDataChapter04Zaxon.ID_20

    DIALOGUE_WITH_BG dialogueChapter04ZaxonSpawn4, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList5 := [aUNITGroupDataChapter04Zaxon.ID_23]
    _UnitList5..= [aUNITGroupDataChapter04Zaxon.ID_18]
    _UnitList5..= [aUNITGroupDataChapter04Zaxon.ID_24]
    _UnitList5..= [aUNITGroupDataChapter04Zaxon.ID_15]
    _UnitList5..= [aUNITGroupDataChapter04Zaxon.ID_16]
    _UnitList5..= [aUNITGroupDataChapter04Zaxon.ID_19]

    .for _Unit in _UnitList5

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Zaxon, _Unit, [59, 45], 4, MAP_SPRITE_GREEN
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 18
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Zaxon, aUNITGroupDataChapter04Zaxon.ID_17, [59, 45], 4, MAP_SPRITE_GREEN
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter04Zaxon

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementDonovan1 ; 8E/9887
      MAP_LEFT_MULTIPLE 7
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 2
      MAP_END

    _ScriptedMovementDonovan2 ; 8E/988E
      MAP_LEFT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 4
      MAP_LEFT_MULTIPLE 3
      MAP_FACE_UP
      MAP_PAUSE 5
      MAP_END
