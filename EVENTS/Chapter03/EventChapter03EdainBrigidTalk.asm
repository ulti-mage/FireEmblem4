
  aEventChapter03EdainBrigidTalk ; B0/CC2B

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter03EdainBrigidTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_EQUIP Brigid, PI_Yewfelle

    FILL_EVENT_UNIT_SLOT Brigid, EventUnitSlot1
    RUN_ASM rlASMCHolyWeaponObtainShine
    YIELD

    END_EVENT
