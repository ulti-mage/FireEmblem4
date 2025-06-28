
  aEventChapter05Ending ; 9D/C59E

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter05Belhalla

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $74
    YIELD

    MAP_SCROLL [14, 33], 3
    YIELD

    DIALOGUE dialogueChapter05Ending1
    YIELD

    PLAY_SFX_WORD $00E4
    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 5
    YIELD

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch05Friege, 1

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch05Thracia, 1

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch05Velthomer, 1

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch05Velthomer, 2

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch05Velthomer, 3

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter05Belhalla

    RUN_ASM rlASMCRefreshAllUnits
    JUMP eventLoadAliveUnitsNearVelthomer

    _LoadAliveUnitsNearVelthomerReturn ; 9D/C5DD
    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_Player, FS_Ch05Velthomer]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_Player, FS_Ch05Belhalla]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    SET_FLAG_IF_IN_CHAPTER Chapter05, FlagChapter05_BelhallaRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    SET_CAMERA_POSITION [1, 47]
    EVENT_3B $80
    PLAY_SONG $76
    YIELD

    PAUSE 20
    YIELD

    FADE_IN_BY_TIMER 4
    YIELD

    PAUSE 90
    YIELD

    MAP_SCROLL [13, 35], 3
    YIELD

    PAUSE 90
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 3

    MOVE_TEMPORARY_BY_SCRIPT Sigurd, [22, 41], 3, MAP_SPRITE_BLUE, _ScriptedMovementSigurd
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    RUN_EVENT_CONDITION
      SET_UNIT_IN_CASTLE Sigurd, Ch05_Zaxon

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll, 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Sigurd, $FF, [6, 53]

    CONTINUE_FORM_MAP_SPRITE_HALT
    JUMP eventLoadAliveUnitsNearBelhalla

    _LoadAliveUnitsNearBelhallaReturn ; 9D/C630
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter05Ending2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 40
    YIELD

    PLAY_SONG $52
    YIELD

    LOAD_UNIT_DIRECT VelthomerCh05FireMageCliff, FS_Ch05Belhalla, [4, 59], [8, 54], 3, MAP_SPRITE_GREEN, false, 1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 18
    YIELD

    LOAD_UNIT_DIRECT Deirdre, FS_Ch05Belhalla, [4, 59], [7, 54], 3, MAP_SPRITE_GREEN, false, 1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter05Ending3
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT VelthomerCh05FireMageCliff, [8, 54], 3, MAP_SPRITE_GREEN, _SciptedMovementGuard
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    RUN_EVENT_CONDITION
      REMOVE_UNIT VelthomerCh05FireMageCliff

    MOVE_TEMPORARY_BY_SCRIPT Deirdre, [7, 54], 3, MAP_SPRITE_GREEN, _SciptedMovementDeirdre
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 2
    YIELD

    RUN_EVENT_CONDITION
      UNDEPLOY_UNIT Deirdre

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    PLAY_SFX_WORD $00E7

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    RUN_ASM rlASMCCheckAnyNonPlayerLeaderAlive
    JUMP_FALSE _SigurdAlone

    DIALOGUE dialogueChapter05Ending4SigurdAndParty
    YIELD
    JUMP +

    _SigurdAlone ; 9D/C6A0
    DIALOGUE dialogueChapter05Ending4SigurdAlone
    YIELD

    +
    PLAY_SONG $78
    YIELD

    PAUSE 25
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch05Belhalla]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    PAUSE 50
    YIELD

    RUN_ASM rlASMCCheckAnyNonPlayerLeaderAlive
    JUMP_FALSE _C6C8

      ; 9D/C6BE

      MAP_SCROLL [0, 41], 2
      YIELD

      RUN_ASM rlASMCUnknown9DC735
      YIELD

    _C6C8
    MAP_SCROLL [0, 48], 2
    YIELD

    FILL_EVENT_UNIT_SLOT_BY_COORDS [6, 53], EventUnitSlot1
    FILL_EVENT_UNIT_SLOT_BY_COORDS [6, 54], EventUnitSlot2

    RUN_ASM rlASMCUnknown9DC73E
    YIELD

    RUN_ASM $8294CF
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT Chapter05

    RUN_EVENT_CONDITION
      SET_PERMANENT_FLAG PermanentFlag36

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    PLAY_SFX_WORD $00E7

    END_EVENT

    _ScriptedMovementSigurd ; 9D/C6EC
      MAP_DOWN_MULTIPLE 3
      MAP_LEFT_MULTIPLE 16
      MAP_DOWN_MULTIPLE 9
      MAP_HALT
      MAP_END

    _ScriptedMapScroll ; 9D/C6F4
      MAP_PAUSE 230
      MAP_LEFT_MULTIPLE 15
      MAP_PAUSE 140
      MAP_DOWN_MULTIPLE 12
      MAP_END

    _SciptedMovementDeirdre ; 9D/C6FD
      MAP_FACE_LEFT
      MAP_HALT

      MAP_PAUSE 80
      MAP_DOWN_MULTIPLE 2
      MAP_FACE_UP
      MAP_PAUSE 170
      MAP_FACE_LEFT
      MAP_PAUSE 15
      MAP_FACE_DOWN
      MAP_PAUSE 70
      MAP_DOWN_MULTIPLE 3
      MAP_LEFT_MULTIPLE 3
      MAP_FACE_UP
      MAP_PAUSE 10
      MAP_END

    _SciptedMovementGuard ; 9D/C714
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 1
      MAP_HALT

      MAP_FACE_UP
      MAP_PAUSE 80
      MAP_DOWN_MULTIPLE 3
      MAP_PAUSE 30
      MAP_FACE_UP
      MAP_PAUSE 40
      MAP_UP_MULTIPLE 1
      MAP_PAUSE 120
      MAP_DOWN_MULTIPLE 2
      MAP_LEFT_MULTIPLE 4
      MAP_FACE_RIGHT
      MAP_HALT

      MAP_PAUSE 14
      MAP_RIGHT_MULTIPLE 1
      MAP_FACE_UP
      MAP_PAUSE 8
      MAP_END

    rlASMCUnknown9DC735 ; 9D/C735

      .al
      .autsiz
      .databank ?

      jsl $9EF60F
      jsl $829478
      rtl

      .databank 0

    rlASMCUnknown9DC73E ; 9D/C73E

      .al
      .autsiz
      .databank ?

      jsl rlClearBattleData

      lda #(`aBattleRoundsData)<<8
      sta lR18+1
      lda #<>aBattleRoundsData
      sta lR18
      lda #32
      sta wR0
      lda #2
      sta wR1
      jsl rlBuildRAMStructHeader

      lda #$0141
      sta lStructPointer1,b
      lda #(`aBattleRoundsData)<<8
      sta lStructPointer2+1,b
      lda #<>aBattleRoundsData
      sta lStructPointer2,b
      jsl rlAppendNewStructEntry

      lda #$FFFF
      sta lStructPointer1,b
      lda #(`aBattleRoundsData)<<8
      sta lStructPointer2+1,b
      lda #<>aBattleRoundsData
      sta lStructPointer2,b
      jsl rlAppendNewStructEntry

      lda wEventUnitSlot1ID,b
      sta wR0
      lda wEventUnitSlot2ID,b
      sta wR1
      jsl $9EF0CF
      jsl $829478
      rtl

      .databank 0

    eventLoadAliveUnitsNearVelthomer ; 9D/C799

      _PlayerAtVelthomer := [(FlagChapter05EndAlive_Naoise  , Naoise,   [23, 43])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Alec    , Alec,     [24, 43])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Arden   , Arden,    [25, 43])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Midir   , Midir,    [23, 44])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Lewyn   , Lewyn,    [23, 42])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Chulainn, Chulainn, [25, 44])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Azelle  , Azelle,   [25, 42])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Jamke   , Jamke,    [24, 44])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Claud   , Claud,    [24, 42])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Beowulf , Beowulf,  [23, 45])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Lex     , Lex,      [26, 42])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Dew     , Dew,      [24, 45])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Lachesis, Lachesis, [27, 42])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Ayra    , Ayra,     [27, 44])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Erinys  , Erinys,   [26, 44])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Tailtiu , Tailtiu,  [26, 45])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Silvia  , Silvia,   [27, 45])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Edain   , Edain,    [26, 43])]
      _PlayerAtVelthomer..= [(FlagChapter05EndAlive_Brigid  , Brigid,   [27, 43])]

    .for _Flag, _Unit, _Coordinates in _PlayerAtVelthomer

      TEST_FLAG_IN_CHAPTER_SET Chapter05, _Flag
      JUMP_FALSE +

        RUN_EVENT_CONDITION
          SET_UNIT_POSITION _Unit, $FF, _Coordinates

      +

    .endfor

    JUMP aEventChapter05Ending._LoadAliveUnitsNearVelthomerReturn

    eventLoadAliveUnitsNearBelhalla ; 9D/C893

      _PlayerAtBelhalla1 := [(FlagChapter05EndAlive_Azelle,    Azelle,   [5, 50])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Claud,     Claud,    [7, 50])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Lewyn,     Lewyn,    [6, 50])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Lachesis,  Lachesis, [5, 49])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Lex,       Lex,      [7, 49])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Jamke,     Jamke,    [6, 49])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Edain,     Edain,    [5, 48])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Tailtiu,   Tailtiu,  [7, 48])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Brigid,    Brigid,   [6, 48])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Naoise,    Naoise,   [5, 47])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Alec,      Alec,     [7, 47])]
      _PlayerAtBelhalla1..= [(FlagChapter05EndAlive_Arden,     Arden,    [6, 47])]

    .for _Flag, _Unit, _Coordinates in _PlayerAtBelhalla1

      TEST_FLAG_IN_CHAPTER_SET Chapter05, _Flag
      JUMP_FALSE +

        LOAD_UNIT_DIRECT _Unit, FS_Player, [6, 46], _Coordinates, 3, MAP_SPRITE_BLUE, false, 0
        WAIT_UNIT_SPRITE_DECOMPRESSED

        PAUSE 20
        YIELD

      +

    .endfor

    _PlayerAtBelhalla2 := [(FlagChapter05EndAlive_Dew,       Dew,      [5, 46])]
    _PlayerAtBelhalla2..= [(FlagChapter05EndAlive_Midir,     Midir,    [6, 46])]
    _PlayerAtBelhalla2..= [(FlagChapter05EndAlive_Erinys,    Erinys,   [7, 46])]
    _PlayerAtBelhalla2..= [(FlagChapter05EndAlive_Chulainn,  Chulainn, [5, 45])]
    _PlayerAtBelhalla2..= [(FlagChapter05EndAlive_Silvia,    Silvia,   [6, 45])]
    _PlayerAtBelhalla2..= [(FlagChapter05EndAlive_Beowulf,   Beowulf,  [7, 45])]
    _PlayerAtBelhalla2..= [(FlagChapter05EndAlive_Ayra,      Ayra,     [6, 44])]

    .for _Flag, _Unit, _Coordinates in _PlayerAtBelhalla2

      TEST_FLAG_IN_CHAPTER_SET Chapter05, _Flag
      JUMP_FALSE +

        RUN_EVENT_CONDITION
          SET_UNIT_POSITION _Unit, $FF, _Coordinates

      +

    .endfor

    JUMP aEventChapter05Ending._LoadAliveUnitsNearBelhallaReturn

    rlASMCCheckAnyNonPlayerLeaderAlive ; 9D/C9F9

      .al
      .autsiz
      .databank ?

      ; Output:
      ; wEventEngineTruthFlag set, if at least one alive.
      ; Unset if everyone is dead.

      lda #GEN_ID_Naoise
      
        _Loop
        sta wRoutineVariable1,b
        lda #FS_Player
        jsl rlFindGenerationIDInFactionSlotData

        lda wSelectedUnitDataRAMPointer,b
        beq +

          jsl rlGetSelectedUnitStates
          bit #UnitStateDead
          beq _True

        +
        lda wRoutineVariable1,b
        inc a
        cmp #GEN_ID_Brigid + 1
        bne _Loop

      lda #0
      sta wEventEngineTruthFlag
      rtl

      _True
      lda #1
      sta wEventEngineTruthFlag
      rtl

      .databank 0
