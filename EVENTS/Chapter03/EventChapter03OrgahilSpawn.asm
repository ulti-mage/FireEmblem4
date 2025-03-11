
  aEventChapter03OrgahilSpawn ; 9D/8D1C

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter03Orgahil

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Brigid

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6C
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 2

    MAP_SCROLL [44, 1], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03OrgahilSpawn1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Brigid, Ch03_Agusti

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, aUNITGroupDataChapter03Orgahil.ID_01, [52, 6], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 60
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Pizare, [52, 6], 4, MAP_SPRITE_RED, _ScriptedMovementPizare
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 16
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Duvall, [52, 6], 4, MAP_SPRITE_RED, _ScriptedMovementDuvall
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MAP_SCROLL [32, 1], 1
    YIELD

    PAUSE 50
    YIELD

    DIALOGUE dialogueChapter03OrgahilSpawn2
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    MAP_SCROLL [44, 1], 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, aUNITGroupDataChapter03Orgahil.ID_19, [52, 4], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, aUNITGroupDataChapter03Orgahil.ID_20, [52, 6], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, aUNITGroupDataChapter03Orgahil.ID_22, [52, 6], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, aUNITGroupDataChapter03Orgahil.ID_21, [52, 6], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList1 := [aUNITGroupDataChapter03Orgahil.ID_34] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_33] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_32] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_31] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_30] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_29] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_28] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_27] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_26] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_25] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_24] 
    _UnitList1..= [aUNITGroupDataChapter03Orgahil.ID_23] 

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter03Orgahil, _Unit

    .endfor

    _UnitList2 := [(aUNITGroupDataChapter03Orgahil.ID_17, [43, 10])]
    _UnitList2..= [(aUNITGroupDataChapter03Orgahil.ID_11, [43,  9])]
    _UnitList2..= [(aUNITGroupDataChapter03Orgahil.ID_15, [43, 10])]
    _UnitList2..= [(aUNITGroupDataChapter03Orgahil.ID_13, [43,  9])]

    .for _Unit, _Coordinates in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    MAP_SCROLL [33, 5], 5

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, aUNITGroupDataChapter03Orgahil.ID_07, [48, 9], 5, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    _UnitList3 := [(aUNITGroupDataChapter03Orgahil.ID_04, 25)]
    _UnitList3..= [(aUNITGroupDataChapter03Orgahil.ID_09, 20)]
    _UnitList3..= [(aUNITGroupDataChapter03Orgahil.ID_02, 20)]
    _UnitList3..= [(aUNITGroupDataChapter03Orgahil.ID_06, 15)]
    _UnitList3..= [(aUNITGroupDataChapter03Orgahil.ID_10, 15)]
    _UnitList3..= [(aUNITGroupDataChapter03Orgahil.ID_03, 10)]
    _UnitList3..= [(aUNITGroupDataChapter03Orgahil.ID_08, 10)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, _Unit, [48, 9], 5, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    _UnitList4 := [aUNITGroupDataChapter03Orgahil.ID_05]
    _UnitList4..= [aUNITGroupDataChapter03Orgahil.ID_16]
    _UnitList4..= [aUNITGroupDataChapter03Orgahil.ID_14]
    _UnitList4..= [aUNITGroupDataChapter03Orgahil.ID_18]
    _UnitList4..= [aUNITGroupDataChapter03Orgahil.ID_12]

    .for _Unit in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter03Orgahil, _Unit, [48, 9], 5, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE dialogueChapter03OrgahilSpawn3
    YIELD

    PAUSE 10
    YIELD

    MAP_SCROLL [33, 10], 4
    YIELD

    PAUSE 20
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_BridgeLowered

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    PLAY_SFX_BYTE $6B
    PAUSE 50
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter03Orgahil

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Sigurd, Brigid

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Midir, Brigid

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Edain, Brigid

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementDuvall ; 9D/8ED8
      MAP_DOWN_MULTIPLE 3
      MAP_LEFT_MULTIPLE 12
      MAP_HALT

      MAP_RIGHT_MULTIPLE 12
      MAP_UP_MULTIPLE 3
      MAP_END

    _ScriptedMovementPizare ; 9D/8EE2
      MAP_DOWN_MULTIPLE 3
      MAP_LEFT_MULTIPLE 13
      MAP_HALT

      MAP_DOWN_MULTIPLE 6
      MAP_END
