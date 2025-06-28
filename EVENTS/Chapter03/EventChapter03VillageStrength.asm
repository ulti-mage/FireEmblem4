
  aEventChapter03VillageStrength ; 9D/9197

    PLAY_SFX_WORD $7FF7

    macroMapDialogue dialogueChapter03VillageStrength
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT AnyCharacter, Strength, 3

    RUN_ASM rlASMCChapter03DisplayStatUpOnStrengthVillage
    YIELD

    PLAY_SFX_WORD $00E8
    END_EVENT

  rlASMCChapter03DisplayStatUpOnStrengthVillage ; 9D/91B9

    .al
    .autsiz
    .databank ?

    lda #33
    sta aActionStructUnit1.XPosition
    lda #36
    sta aActionStructUnit1.YPosition
    jsl $91BDA9
    rtl

    .databank 0

