
  aEventChapter09CoirpreCharlot_HannibalTalk ; B1/D864

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $73
    YIELD

    DIALOGUE dialogueChapter09CoirpreCharlot_HannibalTalk
    YIELD

    RUN_EVENT_CONDITION
      CHANGE_UNITS_FACTIONSLOT Hannibal, FS_Player

    FACTION_UNIT_DEATH FS_Ch09Kapathogia
    YIELD

    RUN_EVENT_CONDITION
      SET_LOCATION_TAKEOVER FS_Player, Ch09_Kapathogia

    SET_FLAG_IF_IN_CHAPTER Chapter09, FlagChapter09_KapathogiaSeizedCheck

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Seliph, Hannibal

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
