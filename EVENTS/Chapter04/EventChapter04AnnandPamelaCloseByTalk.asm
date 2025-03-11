
  aEventChapter04AnnandPamelaCloseByTalk ; 8E/94F5

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6B
    YIELD

    FILL_EVENT_UNIT_SLOT Annand, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 3
    YIELD

    DIALOGUE dialogueChapter04AnnandPamelaCloseByTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
