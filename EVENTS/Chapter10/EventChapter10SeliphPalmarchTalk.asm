
  aEventChapter10SeliphPalmarchTalk ; 8D/8BBD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_EQUIP Seliph, PI_Tyrfing

    DIALOGUE dialogueChapter10SeliphPalmarchTalk
    YIELD

    FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
    RUN_ASM rlASMCChapter10TyrfingObtainShine
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCChapter10TyrfingObtainShine ; 8D/8BE5

    .al
    .autsiz
    .databank ?

    jsl $9ED42A
    jsl $829478
    rtl

    .databank 0
