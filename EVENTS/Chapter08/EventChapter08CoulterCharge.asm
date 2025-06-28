
  aEventChapter08CoulterCharge ; 8F/BE13

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $85
    YIELD

    FILL_EVENT_UNIT_SLOT Altena, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PAUSE 15
    YIELD

    DIALOGUE dialogueChapter08CoulterCharge
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
