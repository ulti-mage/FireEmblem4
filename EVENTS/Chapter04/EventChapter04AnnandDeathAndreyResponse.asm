
  aEventChapter04AnnandDeathAndreyResponse ; 8E/9599

    PLAY_SONG $19
    YIELD

    FILL_EVENT_UNIT_SLOT AndreyCh04, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    DIALOGUE dialogueChapter04AnnandDeathAndreyResponse
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
