
  aEventChapterFinalAltenaArionTalk ; B1/E512

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $81
    YIELD

    DIALOGUE dialogueChapterFinalAltenaArionTalk
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_ChFinalThracia, FS_Player]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_ChFinalThracia, FS_ChFinalBelhalla]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_ChFinalThracia, FS_ChFinalVelthomer]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
