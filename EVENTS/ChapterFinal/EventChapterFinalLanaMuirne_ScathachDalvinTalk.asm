
  aEventChapterFinalLanaMuirne_ScathachDalvinTalk ; 8F/FAAF

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $60
    YIELD

    DIALOGUE dialogueChapterFinalLanaMuirne_ScathachDalvinTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Scathach, Resistance, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Dalvin, Resistance, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagScathachExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Dalvin, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Scathach, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
