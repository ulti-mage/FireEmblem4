
  aEventChapter07LeifSeliphTalk ; 8F/F2A5

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $68
    YIELD

    DIALOGUE dialogueChapter07LeifSeliphTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
