
  aEventChapter05BelhallaConversation ; 9D/C111

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $74
    YIELD

    MAP_SCROLL [0, 50], 4
    YIELD

    CASTLE_NAME dialogueCastleNameBelhalla, CASLTE_NAME_YELLOW, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter05BelhallaConversation, DIALOGUE_BG_THRONE, 3, 1
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
