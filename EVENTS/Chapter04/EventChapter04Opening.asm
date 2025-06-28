
  aEventChapter04Opening ; 8E/9020

    SET_CAMERA_POSITION [19, 50]
    EVENT_3B $80
    FADE_IN_BY_TIMER 3
    CASTLE_NAME dialogueCastleNameSilesse, CASLTE_NAME_YELLOW, 120
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Annand, [28, 60], 4, MAP_SPRITE_YELLOW, _ScriptedMovementAnnand1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 26
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Annand, [28, 60], 4, MAP_SPRITE_YELLOW, _ScriptedMovementAnnand1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll, 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CASTLE_NAME dialogueCastleNameSailane, CASLTE_NAME_BLUE, 90
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LewynAlive
    JUMP_FALSE _LewynDead

      TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_ErinysAlive
      JUMP_FALSE _ErinysDead

        DIALOGUE_WITH_BG dialogueChapter04OpeningLewynErinysAlive, DIALOGUE_BG_THRONE, 3, 2
        YIELD
        JUMP +

      _ErinysDead ; 8E/906D
      DIALOGUE_WITH_BG dialogueChapter04OpeningErinysDead, DIALOGUE_BG_THRONE, 3, 2
      YIELD
      JUMP +

    _LewynDead ; 8E/9078
    DIALOGUE_WITH_BG dialogueChapter04OpeningLewynDead, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    + ; 8E/9080
    MOVE_TEMPORARY_BY_SCRIPT Annand, [5, 41], 4, MAP_SPRITE_YELLOW, _ScriptedMovementAnnand2
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 28
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Annand, [5, 41], 4, MAP_SPRITE_YELLOW, _ScriptedMovementAnnand2
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    TEST_PERMANENT_FLAG_SET PermanentFlagQuanEthlynDied
    JUMP_TRUE _CheckFinnSolo

    TEST_PERMANENT_FLAG_SET PermanentFlagFinnDied
    JUMP_TRUE _QuanEthlynLeave

    JUMP _QuanEthlynFinnLeave

    _CheckFinnSolo ; 8E/90A9
    TEST_PERMANENT_FLAG_SET PermanentFlagFinnDied
    JUMP_TRUE _Continue

    JUMP _FinnLeave

    _ScriptedMapScroll ; 8E/90B1
      MAP_PAUSE 45
      MAP_UP_MULTIPLE 12
      MAP_LEFT_MULTIPLE 19
      MAP_PAUSE 40
      MAP_UP_MULTIPLE 5
      MAP_END

    _ScriptedMovementAnnand1 ; 8E/90BC
      MAP_LEFT_MULTIPLE 4
      MAP_UP_MULTIPLE 15
      MAP_LEFT_MULTIPLE 19
      MAP_UP_MULTIPLE 4
      MAP_PAUSE 8
      MAP_END

    _ScriptedMovementAnnand2 ; 8E/90C7
      MAP_FACE_DOWN
      MAP_DOWN_MULTIPLE 8
      MAP_END

    _QuanEthlynFinnLeave ; 8E/90CB
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    PAUSE 30
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04OpeningQuanEthlynFinnLeave, DIALOGUE_BG_THRONE, 3, 3
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Quan, [5, 41], 4, MAP_SPRITE_BLUE, _ScriptedMovementLeavingCastle
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Ethlyn, [5, 41], 4, MAP_SPRITE_BLUE, _ScriptedMovementLeavingCastle
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 23
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Finn, [5, 41], 4, MAP_SPRITE_BLUE, _ScriptedMovementLeavingCastle
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    JUMP _Continue

    _ScriptedMovementLeavingCastle ; 8E/9116
      MAP_RIGHT_MULTIPLE 6
      MAP_DOWN_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 5
      MAP_END

    _QuanEthlynLeave ; 8E/911D
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    PAUSE 30
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04OpeningQuanEthlynLeave, DIALOGUE_BG_THRONE, 3, 3
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Quan, [5, 41], 4, MAP_SPRITE_BLUE, _ScriptedMovementLeavingCastle
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Ethlyn, [5, 41], 4, MAP_SPRITE_BLUE, _ScriptedMovementLeavingCastle
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    JUMP _Continue

    _FinnLeave ; 8E/9159
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    PAUSE 30
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04OpeningFinnLeave, DIALOGUE_BG_THRONE, 3, 3
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Finn, [5, 41], 4, MAP_SPRITE_BLUE, _ScriptedMovementLeavingCastle
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    JUMP _Continue

    _Continue ; 8E/9183

    _UnitList1 := [aUNITGroupDataChapter04Start.ID_30]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_31]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_32]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_33]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_34]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_35]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_36]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_15]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_16]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_17]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_18]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_19]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_20]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_21]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_22]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_23]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_24]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_25]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_12]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_13]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_14]
    _UnitList1..= [aUNITGroupDataChapter04Start.ID_29]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter04Start, _Unit

    .endfor

    PAUSE 30
    YIELD

    PLAY_SFX_WORD $00E4
    MAP_SCROLL [48, 2], 4
    YIELD

    PLAY_SONG $6C
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_28, [59, 9], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 12
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_27, [59, 9], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 12
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_26, [59, 9], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    CASTLE_NAME dialogueCastleNameTofa, CASLTE_NAME_RED, 120
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList2 := [aUNITGroupDataChapter04Start.ID_41]
    _UnitList2..= [aUNITGroupDataChapter04Start.ID_42]
    _UnitList2..= [aUNITGroupDataChapter04Start.ID_43]
    _UnitList2..= [aUNITGroupDataChapter04Start.ID_44]
    _UnitList2..= [aUNITGroupDataChapter04Start.ID_45]
    _UnitList2..= [aUNITGroupDataChapter04Start.ID_46]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter04Start, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter04Opening2, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_40, [59, 9], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_39, [59, 9], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_38, [59, 9], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_37, [59, 9], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [aUNITGroupDataChapter04Start.ID_11]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_10]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_09]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_08]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_07]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_06]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_05]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_04]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_03]
    _UnitList3..= [aUNITGroupDataChapter04Start.ID_02]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, _Unit, [59, 9], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter04Start, aUNITGroupDataChapter04Start.ID_01, [59, 7], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    MAP_SCROLL [0, 33], 4
    YIELD
    JUMP +

      ; 8E/92DC

      EVENT_DUMMY
      FADE_OUT_BY_TIMER 1
      YIELD

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupChapter04Start

      SET_CAMERA_POSITION [0, 33]
      EVENT_3B $01
      YIELD
      JUMP _92F0

    + ; 8E/92ED
    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter04Start

    _92F0
    UNSET_FLAG_IF_IN_CHAPTER Chapter04, FlagChapter04_ErinysAlive
    UNSET_FLAG_IF_IN_CHAPTER Chapter04, FlagChapter04_LewynAlive

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Sigurd, Claud

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Tailtiu, Azelle

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT
