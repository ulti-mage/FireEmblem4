
  aEventChapter06LarceiIucharTalk ; 91/D3DE

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $64
    YIELD

    DIALOGUE dialogueChapter06LarceiIucharTalk
    YIELD

    RUN_EVENT_CONDITION
      CHANGE_UNITS_FACTIONSLOT Iuchar, FS_Player

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_Player, FS_Ch06Isaach]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Ch06Isaach, FS_Ch06Sofala]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Ch06Isaach, FS_Ch06Ribaut]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    RUN_EVENT_CONDITION
      SET_FACTION_GROUP FS_Ch06Isaach, FG_Ch06Isaach2

    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_IucharbaDied
    JUMP_TRUE _IucharbaDead

      PAUSE 40
      YIELD

      FILL_EVENT_UNIT_SLOT Iucharba, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      DIALOGUE dialogueChapter06LarceiIucharTalkIucharbaResponse
      YIELD

      TEST_PERMANENT_FLAG_SET PermanentFlagLarceiExists
      JUMP_TRUE +

        FILL_EVENT_UNIT_SLOT Creidne, EventUnitSlot1
        JUMP ++

        +
        FILL_EVENT_UNIT_SLOT Larcei, EventUnitSlot1

      +
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

    _IucharbaDead ; 91/D430
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
