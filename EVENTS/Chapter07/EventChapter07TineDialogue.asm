
  aEventChapter07TineDialogue ; B2/900B

    TEST_PERMANENT_FLAG_SET PermanentFlagTineExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Linda, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Tine, EventUnitSlot1

    +
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    macroMapDialogue dialogueChapter07TineDialogue

    END_EVENT
