
  aEventChapter01GenoaSeized ; 90/865D

    PLAY_SFX_WORD $00E0

    PAUSE 35
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter01, FlagChapter01_AyraDied
    JUMP_TRUE _AyraDied

    PLAY_SONG $7C
    YIELD

    DIALOGUE_WITH_BG dialogueChapter01GenoaSeizedAyraAlive, DIALOGUE_BG_HALLWAY, 3, 2

    SET_CAMERA_POSITION [48, 34]
    YIELD
    JUMP _Continue

    _AyraDied ; 90/867B
    PLAY_SONG $77
    YIELD

    DIALOGUE_WITH_BG dialogueChapter01GenoaSeizedAyraDead, DIALOGUE_BG_HALLWAY, 3, 2

    SET_CAMERA_POSITION [48, 34]
    YIELD

    _Continue ; 90/8689
    UNSET_FLAG_IF_IN_CHAPTER Chapter01, FlagChapter01_SigurdAyraTalk
    SET_FLAG_IF_IN_CHAPTER Chapter01, FlagChapter01_GenoaOrMarphaSeized

    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    SET_CAMERA_TO_EVENT_UNIT_SLOT_1

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Dew, Edain

    PLAY_SFX_WORD $00E0

    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
