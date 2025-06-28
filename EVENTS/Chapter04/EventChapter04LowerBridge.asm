
  aEventChapter04LowerBridge ; 8E/9377

    FILL_EVENT_UNIT_SLOT Dew, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    macroMapDialogue dialogueChapter04LowerBridge

    SET_FLAG_IF_IN_CHAPTER Chapter04, FlagChapter04_LowerBridge

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    PLAY_SFX_BYTE $6A
    PAUSE 50
    YIELD

    END_EVENT
