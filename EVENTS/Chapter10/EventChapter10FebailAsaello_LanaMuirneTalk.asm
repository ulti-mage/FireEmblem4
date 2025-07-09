
  aEventChapter10FebailAsaello_LanaMuirneTalk ; 8F/F861

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $5B
    YIELD

    DIALOGUE dialogueChapter10FebailAsaello_LanaMuirneTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Lana, Febail, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Lana, Asaello, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Muirne, Febail, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Muirne, Asaello, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lana, HP, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Muirne, HP, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagLanaExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Muirne, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Lana, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
