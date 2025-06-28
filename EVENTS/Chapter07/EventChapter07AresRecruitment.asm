
  aEventChapter07AresRecruitment ; B2/8E72

    PLAY_SONG $6C
    YIELD

    MAP_SCROLL [8, 16], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07AresRecruitment1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter07, FlagChapter07_AresDied
    JUMP_TRUE +

      TEST_FLAG_IN_CHAPTER_SET Chapter07, FlagChapter07_JavarroDied
      JUMP_TRUE +

        PLAY_SONG $73
        YIELD

        FILL_EVENT_UNIT_SLOT Ares, EventUnitSlot1
        MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 3
        YIELD

        DIALOGUE dialogueChapter07AresRecruitment2
        YIELD

        RUN_EVENT_CONDITION
          CHANGE_UNITS_FACTIONSLOT Ares, FS_Player

        PAUSE 40
        YIELD


    + ; B2/8EAA
    RUN_EVENT_CONDITION
      SET_TALK_TARGET Ares, Seliph

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
