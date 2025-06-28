
  aEventPrologueEdainAbduction ; B1/8168

    PLAY_SONG $6C
    YIELD

    MAP_SCROLL [26, 17], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE dialogueChapterPrologueMunnirAttackCastle
    YIELD

    ; This sets a scripted siege attack(?)
    RUN_EVENT_CONDITION_UNSKIPPABLE
      SET_SCRIPTED_ACTION Munnir, [33, 25], $0B, Midir
      .word <>_ScriptedBattle
    YIELD

    RUN_ASM rlASMC_SetMidirHidden

    PLAY_SONG $6C
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE dialogueChapterPrologueMunnirEdainCaptured
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT EvansBarbarianHandAxe, [11, 14], 4, MAP_SPRITE_RED, _BridgeGuyMovementScript
    WAIT_UNIT_SPRITE_DECOMPRESSED
    MOVE_TEMPORARY_BY_SCRIPT Munnir, [33, 25], 4, MAP_SPRITE_RED, _MunnirMovementScript
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 2
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT Munnir

    MOVE_TEMPORARY_BY_SCRIPT Edain, [33, 25], 4, MAP_SPRITE_GREEN, _EdainMovementScript
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 150
    YIELD

    MAP_SCROLL [21, 18], 1
    YIELD

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapterPrologueMunnirHurryUp
    YIELD

    PAUSE 20
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    PAUSE 100
    YIELD

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll1, 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapterPrologueMunnirLowerBridge
    YIELD

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll2, 1

    CONTINUE_FORM_MAP_SPRITE_HALT
    PAUSE 35
    YIELD

    SET_FLAG_IF_IN_CHAPTER ChapterPrologue, FlagPrologue_BridgeRaised

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    PLAY_SFX_BYTE $6A
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapterPrologueMunnirGerrardConversation
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    PAUSE 120
    YIELD

    MAP_SCROLL [26, 17], 3
    YIELD

    DIALOGUE dialogueChapterPrologueDiMaggioYngviTakeover
    YIELD

    RUN_EVENT_CONDITION
      SET_LOCATION_TAKEOVER FS_PrologueEvans, ChP_Yngvi

    RUN_EVENT_CONDITION_UNSKIPPABLE
      SET_SCRIPTED_ACTION DiMaggio, [33, 25], $06, $FFFF
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _MunnirMovementScript ; B1/8228
      MAP_DOWN
      MAP_PAUSE 25
      MAP_LEFT
      MAP_PAUSE 25
      MAP_LEFT
      MAP_PAUSE 25
      MAP_LEFT
      MAP_PAUSE 35
      MAP_LEFT
      MAP_PAUSE 50
      MAP_SET_SPEED 3
      MAP_LEFT
      MAP_PAUSE 30
      MAP_FACE_RIGHT
      MAP_HALT
      MAP_SET_SPEED 4
      MAP_UP_MULTIPLE 1
      MAP_LEFT_MULTIPLE 1
      MAP_UP_MULTIPLE 5
      MAP_LEFT_MULTIPLE 7
      MAP_UP_MULTIPLE 3
      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 2
      MAP_LEFT_MULTIPLE 7
      MAP_FACE_UP
      MAP_HALT
      MAP_LEFT_MULTIPLE 6
      MAP_FACE_UP
      MAP_HALT
      MAP_DOWN_MULTIPLE 3
      MAP_RIGHT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 3
      MAP_RIGHT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 5
      MAP_END

    _EdainMovementScript ; B1/8265
      MAP_PAUSE 35
      MAP_DOWN
      MAP_FACE_UP
      MAP_PAUSE 23
      MAP_LEFT
      MAP_FACE_RIGHT
      MAP_PAUSE 23
      MAP_LEFT
      MAP_FACE_RIGHT
      MAP_PAUSE 33
      MAP_LEFT
      MAP_FACE_RIGHT
      MAP_PAUSE 50
      MAP_SET_SPEED 3
      MAP_LEFT
      MAP_HALT
      MAP_SET_SPEED 4
      MAP_PAUSE 4
      MAP_LEFT
      MAP_UP
      MAP_LEFT
      MAP_UP_MULTIPLE 5
      MAP_LEFT_MULTIPLE 7
      MAP_UP_MULTIPLE 3
      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 2
      MAP_LEFT_MULTIPLE 6
      MAP_HALT
      MAP_PAUSE 3
      MAP_LEFT_MULTIPLE 6
      MAP_HALT
      MAP_PAUSE 3
      MAP_LEFT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 3
      MAP_RIGHT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 3
      MAP_RIGHT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 5
      MAP_END

    _BridgeGuyMovementScript ; B1/82A7
      MAP_FACE_DOWN
      MAP_HALT
      MAP_HALT
      MAP_PAUSE 60
      MAP_DOWN
      MAP_FACE_RIGHT
      MAP_HALT
      MAP_PAUSE 20
      MAP_LEFT_MULTIPLE 6
      MAP_FACE_UP
      MAP_PAUSE 8
      MAP_END

    _ScriptedBattle ; B1/82B7
      SCRIPTED_BATTLE Midir, 1, Munnir, dialogueChapterPrologueMunnirMidirBattleQuote, dialogueChapterPrologueMidirCutsceneDeath
      .byte (SB_AttackerFirst | SB_Unknown02 | SB_GuaranteedCrit | SB_GuaranteedHit)
      SB_END

    _ScriptedMapScroll1 ; B1/82C7
      MAP_LEFT_MULTIPLE 2
      MAP_UP_LEFT_MULTIPLE 11
      MAP_LEFT_MULTIPLE 4
      MAP_END

    _ScriptedMapScroll2 ; B1/82CE
      MAP_LEFT_MULTIPLE 4
      MAP_END

  rlASMC_SetMidirHidden ; B1/82D1

    .al
    .autsiz
    .databank ?

    lda #Midir
    jsl rlGetUnitRAMDataPointerByID
    jsl rlGetSelectedUnitDeploymentOffset
    tax
    jsl rlDeployedUnitSetHidden
    rtl

    .databank 0
