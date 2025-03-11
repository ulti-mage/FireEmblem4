
  aEventChapter04SilviaClaudTalk ; B0/CCFD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter04SilviaClaudTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Silvia, Claud, 100

    END_EVENT
