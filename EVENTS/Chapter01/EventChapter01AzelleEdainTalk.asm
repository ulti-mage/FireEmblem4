
  aEventChapter01AzelleEdainTalk ; B2/F8F9

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $60
    YIELD

    DIALOGUE dialogueChapter01AzelleEdainTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Edain, Azelle, 100

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Midir, None

    END_EVENT
