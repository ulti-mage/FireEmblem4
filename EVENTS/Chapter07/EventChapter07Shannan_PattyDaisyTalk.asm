
  aEventChapter07Shannan_PattyDaisyTalk ; 8F/F160

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $82
    YIELD

    DIALOGUE dialogueChapter07Shannan_PattyDaisyTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Patty, Shannan, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Daisy, Shannan, 100

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_EQUIP Shannan, PI_Balmung

    FILL_EVENT_UNIT_SLOT Shannan, EventUnitSlot1
    RUN_ASM rlASMCHolyWeaponObtainShine
    YIELD

    END_EVENT
