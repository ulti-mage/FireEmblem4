
  aEventChapter03ChulainnAyraTalk ; B0/CB84

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $75
    YIELD

    DIALOGUE dialogueChapter03ChulainnAyraTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Ayra, PI_BraveSword1

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Ayra, Chulainn, 100

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Lex, None

    END_EVENT
