
  aEventChapter09HannibalAltenaTalk ; 8F/F64A

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter09HannibalAltenaTalk
    YIELD

    RUN_EVENT_CONDITION
      SET_TALK_TARGET AdultFinn, None

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Altena, Hannibal, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Altena, Hannibal, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Altena, HP, 3

    FILL_EVENT_UNIT_SLOT Altena, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
