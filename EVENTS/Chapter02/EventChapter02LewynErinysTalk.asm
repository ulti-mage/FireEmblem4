
  aEventChapter02LewynErinysTalk ; 8E/85B7

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $56
    YIELD

    DIALOGUE dialogueChapter02LewynErinysTalk
    YIELD

    PAUSE 2
    YIELD

    RUN_EVENT_CONDITION
      CHANGE_UNITS_FACTIONSLOT Erinys, FS_Player

    .rept 4

      FILL_EVENT_UNIT_SLOT ErinysSquadPegasusKnight, EventUnitSlot1
      MOVE_TEMPORARY_TO_COORDS ErinysSquadPegasusKnight, [-1, -1], [53, 0], 4, EventUnitSlot1, 6, true, true
      WAIT_UNIT_SPRITE_DECOMPRESSED

      RUN_EVENT_CONDITION
        REMOVE_UNIT ErinysSquadPegasusKnight

    .endrept

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_Ch02Agusti, 4

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Erinys, Sigurd

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
