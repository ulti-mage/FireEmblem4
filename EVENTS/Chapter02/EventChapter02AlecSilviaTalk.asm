
  aEventChapter02AlecSilviaTalk ; B2/FA38

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $48
    YIELD

    DIALOGUE dialogueChapter02AlecSilviaTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Silvia, Alec, 100

    END_EVENT
