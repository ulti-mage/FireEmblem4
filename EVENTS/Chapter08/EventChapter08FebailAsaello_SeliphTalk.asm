
  aEventChapter08FebailAsaello_SeliphTalk ; 8F/F3CF

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $73
    YIELD

    DIALOGUE dialogueChapter08FebailAsaello_SeliphTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
