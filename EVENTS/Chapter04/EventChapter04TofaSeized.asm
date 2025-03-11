
  aEventChapter04TofaSeized ; 8E/9A82

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7C
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04TofaSeized, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    PAUSE 20
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LowerBridgeTriggered
    JUMP_TRUE _BridgeLoweredAlready

      SET_FLAG_IF_IN_CHAPTER Chapter04, FlagChapter04_LowerBridgeTriggered
      UNSET_FLAG_IF_IN_CHAPTER Chapter04, FlagChapter04_RaiseBridge
      SET_FLAG_IF_IN_CHAPTER Chapter04, FlagChapter04_LowerBridge

      RUN_EVENT_CONDITION
        UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

      PLAY_SFX_BYTE $6A
      PAUSE 50
      YIELD

    _BridgeLoweredAlready ; 8E/9AAF
    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Silvia, Claud

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
