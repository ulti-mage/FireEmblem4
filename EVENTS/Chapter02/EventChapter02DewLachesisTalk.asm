
  aEventChapter02DewLachesisTalk ; B2/F97D

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE dialogueChapter02DewLachesisTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Lachesis, Dew, 50

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Lachesis, PI_ThiefSword

    END_EVENT
