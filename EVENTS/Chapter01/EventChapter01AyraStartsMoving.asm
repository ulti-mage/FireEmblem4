
  aEventChapter01AyraStartsMoving ; 90/8AF1

    FILL_EVENT_UNIT_SLOT Ayra, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter01AyraStartsMoving
    YIELD

    PLAY_SFX_WORD $00E8

    END_EVENT
