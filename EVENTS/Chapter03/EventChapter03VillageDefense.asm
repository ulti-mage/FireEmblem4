
  aEventChapter03VillageDefense ; 9D/9140

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter03VillageDefense
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT AnyCharacter, Defense, 1

    RUN_ASM rlASMCChapter03DisplayStatUpOnDefenseVillage
    YIELD

    PLAY_SFX_WORD $00E8
    END_EVENT

  rlASMCChapter03DisplayStatUpOnDefenseVillage ; 9D/915B

    .al
    .autsiz
    .databank ?

    lda #8
    sta aActionStructUnit1.XPosition
    lda #40
    sta aActionStructUnit1.YPosition
    jsl $91BDA9
    rtl

    .databank 0
