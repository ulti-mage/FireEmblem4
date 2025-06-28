
  aEventChapter08PattyFebailTalk ; 8F/BEB7

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $73
    YIELD

    DIALOGUE dialogueChapter08PattyFebailTalk
    YIELD

    TEST_PERMANENT_FLAG_SET PermanentFlagFebailExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        CHANGE_UNITS_FACTIONSLOT Asaello, FS_Player

      JUMP ++

      +
      RUN_EVENT_CONDITION
        CHANGE_UNITS_FACTIONSLOT Febail, FS_Player

    +
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
