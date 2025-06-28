
  aEventChapter07AresSeliphTalk ; 8F/F28B

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $68
    YIELD

    DIALOGUE dialogueChapter07AresSeliphTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
