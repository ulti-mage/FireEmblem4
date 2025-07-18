
  aEventChapter06GaneishireSeized ; 91/D176

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7C
    YIELD

    UNSET_FLAG_IF_IN_CHAPTER Chapter06, FlagChapter06_SofalaTalkCheck
    UNSET_FLAG_IF_IN_CHAPTER Chapter06, FlagChapter06_IsaachTalkCheck

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Julia

    RUN_EVENT_CONDITION
      SET_PERMANENT_FLAG PermanentFlagLewynTacticianArrived

    FADE_OUT_BY_TIMER 2
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_IN_CASTLE Seliph, 0

    DIALOGUE_WITH_BG dialogueChapter06GaneishireSeized1, DIALOGUE_BG_ALLEY, 3, 2
    SET_CAMERA_POSITION [48, 8]
    YIELD

    PAUSE 15
    YIELD

    ; Game just needs a sage sprite for Lewyn
    MOVE_TEMPORARY_TO_COORDS ArvisChPrologue, [56, 16], [51, 23], 4, 0, MAP_SPRITE_GREEN, true
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Seliph, $FF, [56, 16]

    DIALOGUE_WITH_BG dialogueChapter06GaneishireSeized2, DIALOGUE_BG_ALLEY, 3, 1
    YIELD

    LOAD_UNIT_DIRECT Julia, FS_Player, [56, 16], [56, 16], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 15
    YIELD

    FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
    SET_CAMERA_TO_EVENT_UNIT_SLOT_1

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Lana, Muirne], [Julia, Julia]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
