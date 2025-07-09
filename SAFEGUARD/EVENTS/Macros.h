
  macroSetFactionsEnemies .segment FactionSlots
    SET_FACTION_HOSTILITY HOSTILITY_ENEMIES, \FactionSlots
  .endsegment

  macroSetFactionsAllies .segment FactionSlots
    SET_FACTION_HOSTILITY HOSTILITY_ALLIES, \FactionSlots
  .endsegment

  macroSetFactionsNeutral .segment FactionSlots
    SET_FACTION_HOSTILITY HOSTILITY_NEUTRAL, \FactionSlots
  .endsegment

  macroMapDialogue .segment DialoguePointer
    PLAY_SFX_WORD $7FF7
    DIALOGUE \DialoguePointer
    YIELD

    PLAY_SFX_WORD $00E8
  .endsegment
