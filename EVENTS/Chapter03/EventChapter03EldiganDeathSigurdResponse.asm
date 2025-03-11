
  aEventChapter03EldiganDeathSigurdResponse ; 9D/8B7A

    PLAY_SONG $5D
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_LachesisChagallBattleQuoteAddition
    UNSET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_LachesisChagallBattleQuote
    SET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_SigurdChagallBattleQuoteAddition
    UNSET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_SigurdChagallBattleQuote

    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    DIALOGUE dialogueChapter03EldiganDeathSigurdResponse
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
