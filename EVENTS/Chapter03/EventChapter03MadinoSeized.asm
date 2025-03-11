
  aEventChapter03MadinoSeized ; 9D/87A5

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Manfroy

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7C
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_IN_CASTLE Sigurd, Ch03_Agusti

    DIALOGUE_WITH_BG dialogueChapter03MadinoSeized1, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [33, 25]
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Tailtiu, [40, 40], 4, MAP_SPRITE_GREEN, _ScriptedMovementTailtiuAppear
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MOVE_TEMPORARY_BY_SCRIPT Claud, [40, 40], 4, MAP_SPRITE_GREEN, _ScriptedMovementClaudAppear
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03MadinoSeized2, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Claud, [41, 32], 4, MAP_SPRITE_GREEN, _ScriptedMovementClaudTailtiuLeave
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 14
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Tailtiu, [41, 32], 4, MAP_SPRITE_GREEN, _ScriptedMovementClaudTailtiuLeave
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    RUN_ASM $81B1ED
    YIELD

    PAUSE 30
    YIELD

    PLAY_SFX_WORD $00E2
    MAP_SCROLL [28, 50], 4
    YIELD

    PLAY_SONG $54
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03MadinoSeized3, DIALOGUE_BG_THRONE, 3, 1
    SET_CAMERA_POSITION [28, 49]
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Mus, [36, 20], 4, MAP_SPRITE_GREEN, _ScriptedMovementDummy
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MOVE_TEMPORARY_BY_SCRIPT Child1, [36, 20], 4, MAP_SPRITE_GREEN, _ScriptedMovementDummy
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MOVE_TEMPORARY_BY_SCRIPT Deirdre, [36, 61], 4, MAP_SPRITE_BLUE, _ScriptedMovementDeirdre
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 2
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    PAUSE 25
    YIELD

    RUN_ASM rlASMCChapter03ManfroyWarpIn
    PAUSE 250
    YIELD

    PAUSE 9
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Manfroy, [38, 53], 3, MAP_SPRITE_RED, _ScriptedMovementManfroy
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    MAP_SCROLL [30, 45], 4
    PLAY_SFX_WORD $00E0
    PAUSE 25
    YIELD

    PLAY_SONG $7A
    YIELD

    DIALOGUE dialogueChapter03MadinoSeized4
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT

    BERSERK_CAST [35, 53]
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch03Madino]
  
    LOAD_UNIT_DIRECT Deirdre, FS_Player, [35, 53], [35, 53], 4 + $60, MAP_SPRITE_BLUE, false, 1
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    CONTINUE_FORM_MAP_SPRITE_HALT
    LOAD_UNIT_DIRECT Manfroy, FS_Ch03Madino, [36, 53], [36, 53], 4, MAP_SPRITE_RED, false, 1
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    CONTINUE_FORM_MAP_SPRITE_HALT
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    FILL_EVENT_UNIT_SLOT Deirdre, EventUnitSlot1
    RUN_ASM rlASMCChapter03WarpAway
    YIELD

    FILL_EVENT_UNIT_SLOT Manfroy, EventUnitSlot1
    RUN_ASM rlASMCChapter03WarpAway
    YIELD

    RUN_EVENT_CONDITION
      UNDEPLOY_UNIT Deirdre

    RUN_EVENT_CONDITION
      REMOVE_UNIT Manfroy

    RUN_EVENT_CONDITION
      macroSetUnitToCoordinates Sigurd, [41, 32]

    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementTailtiuAppear ; 9D/88ED
      MAP_PAUSE 22

    _ScriptedMovementClaudAppear ; 9D/88EF
      MAP_UP_MULTIPLE 4
      MAP_LEFT_MULTIPLE 1
      MAP_UP_MULTIPLE 3
      MAP_RIGHT_MULTIPLE 2
      MAP_UP_MULTIPLE 1
      MAP_PAUSE 5
      MAP_END

    _ScriptedMovementClaudTailtiuLeave ; 9D/88FC
      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 3
      MAP_RIGHT_MULTIPLE 1
      MAP_UP_MULTIPLE 5
      MAP_END

    _ScriptedMovementDeirdre ; 9D/8905
      MAP_HALT

      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 8
      MAP_RIGHT_MULTIPLE 3
      MAP_HALT

      MAP_LEFT_MULTIPLE 2
      MAP_HALT

      MAP_PAUSE 40
      MAP_FACE_DOWN
      MAP_PAUSE 40
      MAP_FACE_RIGHT
      MAP_PAUSE 120
      MAP_HALT

      MAP_END

    _ScriptedMovementManfroy ; 9D/891A
      MAP_FACE_LEFT
      MAP_HALT

      MAP_PAUSE 150
      MAP_SET_SPEED 3
      MAP_LEFT_MULTIPLE 2
      MAP_HALT

      MAP_HALT

      MAP_END

    _ScriptedMovementDummy ; 9D/8925
      MAP_HALT

      MAP_END

    rlASMCChapter03WarpAway ; 9D/8927

      .al
      .autsiz
      .databank ?

      jsl $9EF1FA
      jsl $829478
      rtl

      .databank 0

    rlASMCChapter03ManfroyWarpIn ; 9D/8930

      .al
      .autsiz
      .databank ?

      _Coordinates := [38, 53]

      ; Sprite color
      lda #1
      sta $7F4562

      lda #DarkBishop
      sta $7E4EAF

      lda #0
      sta $7E4EBD
      lda #_Coordinates[0]
      sta $7E4EAB
      lda #_Coordinates[1]
      sta $7E4EAD
      jsl $9EF353
      rtl

      .databank 0

      ; 9D/8958
