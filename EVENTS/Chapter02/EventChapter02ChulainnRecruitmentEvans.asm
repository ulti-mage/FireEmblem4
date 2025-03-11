
  aEventChapter02ChulainnRecruitmentEvans ; 8E/8501

    PLAY_SONG $73
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Chulainn, Ch02_Evans

    DIALOGUE_WITH_BG dialogueChapter02ChulainnRecruitment, DIALOGUE_BG_ALLEY, 1, 2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $88
    YIELD

    END_EVENT
