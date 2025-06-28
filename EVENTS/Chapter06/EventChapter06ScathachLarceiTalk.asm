
  aEventChapter06ScathachLarceiTalk ; 8F/F045

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $75
    YIELD

    DIALOGUE dialogueChapter06ScathachLarceiTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Larcei, Luck, 1

    FILL_EVENT_UNIT_SLOT Larcei, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
