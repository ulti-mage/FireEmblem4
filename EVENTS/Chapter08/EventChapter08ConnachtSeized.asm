
  aEventChapter08ConnachtSeized ; 8F/BC2D

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7C
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter08, FlagChapter08_FeeOnMountainCheck
    SET_FLAG_IF_IN_CHAPTER Chapter08, FlagChapter08_Unknown53

    DIALOGUE_WITH_BG dialogueChapter08ConnachtSeized, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Nanna, Ares

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Seliph, Seliph], [Tine, Linda]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
