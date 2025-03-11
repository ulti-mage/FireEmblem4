
  aEventChapter04AnnandDeathPlayerResponses ; 8E/95B3

    PLAY_SONG $5D
    YIELD

    MAP_SCROLL [20, 50], 4
    YIELD

    PAUSE 15
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04AnnandDeathLahnaResponse, DIALOGUE_BG_THRONE, 3, 1
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LewynAlive
    JUMP_FALSE _LewynDead

      FILL_EVENT_UNIT_SLOT Lewyn, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      DIALOGUE dialogueChapter04AnnandDeathLewynResponse
      YIELD

    _LewynDead ; 8E/95D9
    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_ErinysAlive
    JUMP_FALSE _ErinysDead

      FILL_EVENT_UNIT_SLOT Erinys, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      DIALOGUE dialogueChapter04AnnandDeathErinysResponse
      YIELD

    _ErinysDead ; 8E/95EB
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
