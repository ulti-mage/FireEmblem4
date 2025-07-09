
  aEventChapter05BrigidMidirTalk ; B0/CFC4

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter05BrigidMidirTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCHolyWeaponObtainShine ; B0/CFDE

    .al
    .autsiz
    .databank ?

    jsl $9ED42A
    jsl rlCreateProcHaltEvent
    rtl

    .databank 0

