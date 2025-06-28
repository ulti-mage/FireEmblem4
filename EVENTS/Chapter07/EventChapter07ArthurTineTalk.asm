
  aEventChapter07ArthurTineTalk ; B2/8F83

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter07ArthurTineTalk
    YIELD

    TEST_PERMANENT_FLAG_SET PermanentFlagTineExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        CHANGE_UNITS_FACTIONSLOT Linda, FS_Player

      JUMP ++

      +
      RUN_EVENT_CONDITION
        CHANGE_UNITS_FACTIONSLOT Tine, FS_Player

    +
    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Tine, Linda], [Seliph, Seliph]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
