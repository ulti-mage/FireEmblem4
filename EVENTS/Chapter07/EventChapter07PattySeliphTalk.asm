
  aEventChapter07PattySeliphTalk ; 8F/F25E

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE dialogueChapter07PattySeliphTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Seliph, PI_BraveSword2

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Patty, Seliph, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Daisy, Seliph, 100

    END_EVENT
