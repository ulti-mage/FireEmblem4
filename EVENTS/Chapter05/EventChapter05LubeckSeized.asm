
  aEventChapter05LubeckSeized ; 9D/C13A

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $59
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter05, FlagChapter05_ByronAliveWhenSeizingLubeck
    JUMP_FALSE _ByronDead

      FILL_EVENT_UNIT_SLOT Byron, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      DIALOGUE dialogueChapter05LubeckSeizedByronDies
      YIELD

      FACTION_UNIT_DEATH FS_Ch05Byron
      YIELD

      RUN_EVENT_CONDITION
        REMOVE_UNIT Byron

      PAUSE 30
      YIELD

    _ByronDead ; 9D/C164
    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    DIALOGUE dialogueChapter05LubeckSeized1
    YIELD

    PAUSE 15
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT ChildOifey, [55, 8], 3, MAP_SPRITE_BLUE, _ScriptedMovementShannanOifey
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 26
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT ChronosChildMale, [55, 8], 3, MAP_SPRITE_BLUE, _ScriptedMovementShannanOifey
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    RUN_EVENT_CONDITION
      SET_PERMANENT_FLAG PermanentFlagOifeyTacticianGone

    DIALOGUE dialogueChapter05LubeckSeized2
    YIELD

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Edain, None

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Dew, Jamke

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Lex, Azelle

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Sigurd, Ayra

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementShannanOifey ; 9D/C1B7
      MAP_RIGHT_MULTIPLE 8
      MAP_END
