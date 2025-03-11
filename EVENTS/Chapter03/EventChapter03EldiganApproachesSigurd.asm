
  aEventChapter03EldiganApproachesSigurd ; 9D/8AB6

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $66
    YIELD

    FILL_EVENT_UNIT_SLOT EldiganCh03, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    DIALOGUE dialogueChapter03SigurdEldiganCloseByTalk
    YIELD

    PAUSE 15
    YIELD

    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
