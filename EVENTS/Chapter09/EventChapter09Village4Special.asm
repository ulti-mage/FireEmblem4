
  aEventChapter09Village4Special ; B1/DCFF

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter09Village4Special
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT AnyCharacter, Defense, 3

    RUN_ASM rlASMCChapter09DisplayStatUpOnSpecialVillage
    YIELD

    PLAY_SFX_WORD $00E8

    END_EVENT

  rlASMCChapter09DisplayStatUpOnSpecialVillage ; B1/DD1A

    .al
    .autsiz
    .databank ?

    lda #9
    sta $7E4EB7
    lda #7
    sta $7E4EB9
    jsl $91BDA9
    rtl

    .databank 0
