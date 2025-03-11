
  aEventChapter03Ending ; 9D/8EEC

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter03DozelFriege

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $76
    YIELD

    RUN_EVENT_CONDITION
      LOAD_FACTION_GROUP FS_Ch03DozelFriege, FG_Ch03DozelFriege

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch03DozelFriege]

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList1 := [Sigurd]
    _UnitList1..= [Naoise]
    _UnitList1..= [Alec]
    _UnitList1..= [Arden]
    _UnitList1..= [Quan]
    _UnitList1..= [Ethlyn]
    _UnitList1..= [Finn]
    _UnitList1..= [Midir]
    _UnitList1..= [Azelle]
    _UnitList1..= [Lex]
    _UnitList1..= [Edain]
    _UnitList1..= [Jamke]
    _UnitList1..= [Ayra]
    _UnitList1..= [Dew]
    _UnitList1..= [Lachesis]
    _UnitList1..= [Lewyn]
    _UnitList1..= [Erinys]
    _UnitList1..= [Beowulf]
    _UnitList1..= [Chulainn]
    _UnitList1..= [Silvia]
    _UnitList1..= [Tailtiu]
    _UnitList1..= [Claud]
    _UnitList1..= [Brigid]

    .for _Unit in _UnitList1

      RUN_EVENT_CONDITION
        SET_UNIT_IN_CASTLE _Unit, Ch03_Agusti

    .endfor

    DIALOGUE_WITH_BG dialogueChapter03Ending1, DIALOGUE_BG_HALLWAY, 5, 2
    SET_CAMERA_POSITION [44, 0]
    YIELD

    EVENT_3B $80
    PAUSE 2
    YIELD

    FADE_IN_BY_TIMER 5
    YIELD

    PAUSE 25
    YIELD

    PLAY_SFX_WORD $00E5

    _UnitList2 := [aUNITGroupDataChapter03DozelFriege.ID_01]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_02]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_03]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_04]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_05]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_06]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_07]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_08]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_09]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_10]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_11]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_12]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_13]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_14]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_15]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_16]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_17]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_18]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_34]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_31]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_29]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_33]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_35]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_36]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_37]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_32]
    _UnitList2..= [aUNITGroupDataChapter03DozelFriege.ID_30]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter03DozelFriege, _Unit

    .endfor

    MAP_SCROLL [34, 50], 4
    YIELD

    PLAY_SONG $63
    YIELD

    _UnitList3 := [(aUNITGroupDataChapter03DozelFriege.ID_27, [40, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_28, [44, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_25, [40, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_26, [44, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_23, [41, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_24, [43, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_20, [41, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_21, [43, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_22, [42, 63])]
    _UnitList3..= [(aUNITGroupDataChapter03DozelFriege.ID_19, [42, 63])]

    .for _Unit, _Coordinates in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter03DozelFriege, _Unit, _Coordinates, 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter03DozelFriege

    MAP_SCROLL [39, 50], 2
    YIELD

    DIALOGUE dialogueChapter03Ending2
    YIELD

    PAUSE 15
    YIELD

    MAP_SCROLL [34, 50], 2
    YIELD

    DIALOGUE dialogueChapter03Ending3
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E5
    MAP_SCROLL [44, 0], 5
    YIELD

    PLAY_SONG $6B
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03Ending4, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    MAP_SCROLL [49, 0], 3
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Annand, [63, 7], 4, MAP_SPRITE_GREEN, _ScriptedMovement1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 30
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT AnnandSquad, [63, 7], 4, MAP_SPRITE_GREEN, _ScriptedMovement1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 35
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT AnnandSquad, [63, 6], 4, MAP_SPRITE_GREEN, _ScriptedMovement2
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 15
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT AnnandSquad, [63, 8], 4, MAP_SPRITE_GREEN, _ScriptedMovement3
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03Ending5, DIALOGUE_BG_HALLWAY, 3, 3
    SET_CAMERA_POSITION [44, 0]
    YIELD

    RUN_EVENT_CONDITION
      ADD_CASTLE_MONEY

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT Chapter03

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    END_EVENT

    _ScriptedMovement1 ; 9D/90F4
      MAP_LEFT_MULTIPLE 11
      MAP_UP_MULTIPLE 1
      MAP_PAUSE 8
      MAP_END

    _ScriptedMovement2 ; 9D/90FB
      MAP_LEFT_MULTIPLE 11
      MAP_FACE_UP
      MAP_PAUSE 8
      MAP_END

    _ScriptedMovement3 ; 9D/9101
      MAP_LEFT_MULTIPLE 11
      MAP_UP_MULTIPLE 2
      MAP_PAUSE 8
      MAP_END
