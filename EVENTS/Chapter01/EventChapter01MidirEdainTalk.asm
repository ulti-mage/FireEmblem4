
  aEventChapter01MidirEdainTalk ; B2/F8BA

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter01MidirEdainTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Edain, Midir, 100

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Azelle, None

    END_EVENT
