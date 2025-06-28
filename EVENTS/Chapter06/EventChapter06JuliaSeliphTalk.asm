
  aEventChapter06JuliaSeliphTalk ; 8F/F12E

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $84
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_IsaachSeizedCheck
    JUMP_TRUE _IsaachSeized

      ; SofalaSeized
      DIALOGUE dialogueChapter06JuliaSeliphTalkSofalaSeized
      YIELD

      RUN_EVENT_CONDITION
        GIVE_UNIT_PID Julia, PI_Aura

      JUMP +

      _IsaachSeized ; 91/F14B
      DIALOGUE dialogueChapter06JuliaSeliphTalkIsaachSeized
      YIELD

      RUN_EVENT_CONDITION
        GIVE_UNIT_PID Julia, PI_Nosferatu

    +
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
