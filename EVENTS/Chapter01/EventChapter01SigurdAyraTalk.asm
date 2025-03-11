
  aEventChapter01SigurdAyraTalk ; 90/86A5

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $73
    YIELD

    DIALOGUE dialogueChapter01SigurdAyraTalk
    YIELD

    RUN_EVENT_CONDITION
      CHANGE_UNITS_FACTIONSLOT Ayra, FS_Player

    SET_FLAG_IF_IN_CHAPTER Chapter01, FlagChapter01_GenoaSeizedAyraResponse

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Ayra, Quan

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
