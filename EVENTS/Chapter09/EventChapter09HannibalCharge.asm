
  aEventChapter09HannibalCharge ; B1/D7A1

    PLAY_SONG $81
    YIELD

    FILL_EVENT_UNIT_SLOT Hannibal, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    DIALOGUE dialogueChapter09HannibalCharge
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
