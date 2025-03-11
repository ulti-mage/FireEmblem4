
  aEventChapter03LachesisEldiganTalk ; 9D/8B03

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_LachesisChagallBattleQuoteAddition
    UNSET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_LachesisChagallBattleQuote
    SET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_SigurdChagallBattleQuoteAddition
    UNSET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_SigurdChagallBattleQuote

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Lachesis, PI_EarthSword

    FILL_EVENT_UNIT_SLOT EldiganCh03, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    DIALOGUE dialogueChapter03LachesisEldiganTalk1
    YIELD

    FILL_EVENT_UNIT_SLOT EldiganCh03, EventUnitSlot1
    MOVE_TEMPORARY_TO_COORDS_FOLLOW EldiganCh03, [-1, -1], [7, 45], 4, EventUnitSlot1, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    RUN_EVENT_CONDITION
      REMOVE_UNIT EldiganCh03

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 25
    YIELD

    PLAY_SONG $66
    YIELD

    PAUSE 15
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT EldiganCh03

    SET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_EldiganGone
    DIALOGUE_WITH_BG dialogueChapter03LachesisEldiganTalk2, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 30
    YIELD

    FILL_EVENT_UNIT_SLOT Lachesis, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    UNSET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_LachesisChagallBattleQuote
    UNSET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_SigurdChagallBattleQuote
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
