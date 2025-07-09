
    .weak

      FlagChapter07_AedSeizedCheck                  :=  0
      FlagChapter07_MelgenSeizedCheck               :=  1
      FlagChapter07_DahnaSeizedCheck                :=  2
      FlagChapter07_UlsterSeizedCheck               :=  3
      FlagChapter07_BramselWaiting                  :=  4

      FlagChapter07_MelgenSpawn                     :=  6
      FlagChapter07_AresThreatensBramsel            :=  7

      FlagChapter07_UlsterSpawn                     := 10
      FlagChapter07_BloomCharge                     := 11
      FlagChapter07_AresRecruitment                 := 12
      FlagChapter07_BanbaDialogue                   := 13

      FlagChapter07_TineLinda_Dialogue              := 20

      FlagChapter07_KutuzovBattleQuote              := 24
      FlagChapter07_LizaBattleQuote                 := 25
      FlagChapter07_IshtoreBattleQuoteCheck         := 26
      FlagChapter07_JavarroBattleQuote              := 27
      FlagChapter07_BramselBattleQuote              := 28
      FlagChapter07_BanbaBattleQuote                := 29
      FlagChapter07_BanbaTriangleAttackQuote        := 30
      FlagChapter07_FotlaBattleQuote                := 31
      FlagChapter07_FotlaTriangleAttackQuote        := 32
      FlagChapter07_EriuBattleQuote                 := 33
      FlagChapter07_EriuTriangleAttackQuote         := 34
      FlagChapter07_TineLinda_BattleQuote           := 35
      FlagChapter07_BloomBattleQuote                := 36

      FlagChapter07_AresDahnaVisitCheck             := 38

      FlagChapter07_ArthurAmid_TineLindaTalkCheck   := 40

      FlagChapter07_JuliaCaptureReturn              := 42
      FlagChapter07_AresDied                        := 43
      FlagChapter07_SetUlsterRampart                := 44
      FlagChapter07_JavarroDied                     := 45

      FlagChapter07_LeonsterSeizedCheck             := 47
      FlagChapter07_KutuzovFenrirFound              := 48
      FlagChapter07_IshtoreBattleQuote              := 49
      FlagChapter07_LizaDied                        := 50
      FlagChapter07_IshtoreDied                     := 51
      FlagChapter07_IshtoreDeathQuoteLizaAlive      := 52
      FlagChapter07_DahnaArmyTalkCheck              := 53
      FlagChapter07_DaisyShannanAdjacentCheck       := 54
      FlagChapter07_RemoveUlsterRampart             := 55
      FlagChapter07_DalvinTristanAdjacentCheck      := 56
      FlagChapter07_DalvinTristanAdjacent           := 57
      FlagChapter07_ArthurAmid_TineLindaBattleQuote := 58
      FlagChapter07_AresBramselBattleQuote          := 59
      FlagChapter07_AresJavarroBattleQuote          := 60
      FlagChapter07_TineLinda_BloomBattleQuote      := 61
      FlagChapter07_ArthurAmid_BloomBattleQuote     := 62
      FlagChapter07_LeifBloomBattleQuote            := 63

      FS_Player                                     :=  0
      FS_Ch07Aed                                    :=  1
      FS_Ch07Dahna                                  :=  2
      FS_Ch07Melgen                                 :=  3
      FS_Ch07Ulster                                 :=  4
      FS_Ch07Leif                                   :=  5

    .endweak

    .section Chapter07EventsSection

      aChapter07EventHeader ; 86/E6FF

        .word Chapter07
        .long aChapter07OpeningEvent
        .long aChapter07MapEvents

      aChapter07OpeningEvent ; 86/E707

        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter07Start

        LOAD_FACTION_GROUP FS_Player,     FG_Ch07Seliph
        LOAD_FACTION_GROUP FS_Ch07Aed,    FG_Ch07Aed
        LOAD_FACTION_GROUP FS_Ch07Dahna,  FG_Ch07Dahna
        LOAD_FACTION_GROUP FS_Ch07Melgen, FG_Ch07Melgen
        LOAD_FACTION_GROUP FS_Ch07Ulster, FG_Ch07Ulster
        LOAD_FACTION_GROUP FS_Ch07Leif,   FG_Ch07Leif

        macroSetFactionsEnemies [FS_Player,     FS_Ch07Aed]
        macroSetFactionsNeutral [FS_Player,     FS_Ch07Dahna]
        macroSetFactionsEnemies [FS_Player,     FS_Ch07Melgen]
        macroSetFactionsEnemies [FS_Player,     FS_Ch07Ulster]
        macroSetFactionsAllies  [FS_Player,     FS_Ch07Leif]
        macroSetFactionsAllies  [FS_Ch07Aed,    FS_Ch07Dahna]
        macroSetFactionsAllies  [FS_Ch07Aed,    FS_Ch07Melgen]
        macroSetFactionsAllies  [FS_Ch07Aed,    FS_Ch07Ulster]
        macroSetFactionsEnemies [FS_Ch07Aed,    FS_Ch07Leif]
        macroSetFactionsNeutral [FS_Ch07Dahna,  FS_Ch07Melgen]
        macroSetFactionsAllies  [FS_Ch07Dahna,  FS_Ch07Ulster]
        macroSetFactionsEnemies [FS_Ch07Dahna,  FS_Ch07Leif]
        macroSetFactionsAllies  [FS_Ch07Melgen, FS_Ch07Ulster]
        macroSetFactionsEnemies [FS_Ch07Melgen, FS_Ch07Leif]
        macroSetFactionsEnemies [FS_Ch07Ulster, FS_Ch07Leif]

        DEPLOY_UNIT_GROUP UNITGroupChapter07Start

        SET_FLAG FlagChapter07_DaisyShannanAdjacentCheck
        SET_FLAG FlagChapter07_SetUlsterRampart

        UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

        EVENT FlagAlways, EventChapter07Opening

        END_CHAPTER_EVENTS

      aChapter07MapEvents ; 86/E764

        CHECK_SEIZING_CASTLE FlagChapter07_AedSeizedCheck, FS_Player, Ch07_Aed
          EVENT FlagAlways, EventChapter07AedSeized

        CHECK_SEIZING_CASTLE FlagChapter07_MelgenSeizedCheck, FS_Player, Ch07_Melgen
          EVENT FlagAlways, EventChapter07MelgenSeized

        CHECK_SEIZING_CASTLE FlagChapter07_DahnaSeizedCheck, FS_Player, Ch07_Dahna
          EVENT FlagAlways, EventChapter07DahnaSeized

        CHECK_SEIZING_CASTLE FlagChapter07_LeonsterSeizedCheck, FS_Player, Ch07_Leonster
          EVENT FlagAlways, EventChapter07LeonsterSeized

        CHECK_SEIZING_CASTLE FlagChapter07_UlsterSeizedCheck, FS_Player, Ch07_Ulster
          EVENT FlagAlways, EventChapter07Ending

        CHECK_UNIT_DIED FlagAlways, AnyCharacter, FS_Player
          SET_PERMANENT_FLAG PermanentFlagPlayerDeathInGen2
        
        CHECK_CHILD_TALK FlagChapter07_ArthurAmid_TineLindaTalkCheck, Arthur, Tine
          EVENT FlagAlways, EventChapter07ArthurAmid_TineLindaTalk

        CHECK_CHILD_TALK FlagAlways, Shannan, Patty
          EVENT FlagAlways, EventChapter07Shannan_PattyDaisyTalk

        CHECK_TALK FlagAlways, Seliph, Shannan
          EVENT FlagAlways, EventChapter07SeliphShannanTalk

        CHECK_CHILD_TALK FlagAlways, Oifey, Diarmuid
          EVENT FlagAlways, EventChapter07Oifey_DiarmuidTristanTalk

        CHECK_CHILD_TALK FlagAlways, Larcei, Shannan
          EVENT FlagAlways, EventChapter07LarceiCreidne_ShannanTalk

        CHECK_CHILD_TALK FlagAlways, Patty, Seliph
          EVENT FlagAlways, EventChapter07PattyDaisy_SeliphTalk

        CHECK_TALK FlagAlways, Ares, Seliph
          EVENT FlagAlways, EventChapter07AresSeliphTalk

        CHECK_TALK FlagAlways, Leif, Seliph
          EVENT FlagAlways, EventChapter07LeifSeliphTalk

        CHECK_TALK FlagAlways, Diarmuid, Nanna
          EVENT FlagAlways, EventChapter07DiarmuidNannaTalk

        CHECK_TALK FlagAlways, Tristan, Jeanne
          EVENT FlagAlways, EventChapter07TristanJeanneTalk

        CHECK_CHILD_TALK FlagAlways, Tine, Seliph
          EVENT FlagAlways, EventChapter07TineLinda_SeliphTalk

        CHECK_CHILD_TALK FlagAlways, Lene, Seliph
          EVENT FlagAlways, EventChapter07LeneLaylea_SeliphTalk

        CHECK_TALK FlagAlways, AdultFinn, Nanna
          EVENT FlagAlways, EventChapter07FinnNannaTalk

        CHECK_TALK FlagAlways, AdultFinn, Lana
          EVENT FlagAlways, EventChapter07FinnLanaTalk

        CHECK_TALK FlagAlways, AdultFinn, Larcei
          EVENT FlagAlways, EventChapter07FinnLarceiTalk

        CHECK_ENTERING_CASTLE_MENU FlagChapter07_AresDahnaVisitCheck, Ares, Ch07_Dahna
          EVENT FlagAlways, EventChapter07AresDahnaVisit

        CHECK_UNIT_DIED FlagChapter07_LizaDied, Liza
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter07_AresDied, Ares
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapter07_JavarroDied, Javarro
          EC_NOP_00

        CHECK_UNIT_DIED_TO FlagAlways, BanbaCh07, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, BanbaCh07
          EVENT FlagAlways, EventChapter07BanbaDied

        CHECK_UNIT_DIED_TO FlagAlways, FotlaCh07, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, FotlaCh07
          EVENT FlagAlways, EventChapter07FotlaDied

        CHECK_UNIT_DIED_TO FlagAlways, EriuCh07, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, EriuCh07
          EVENT FlagAlways, EventChapter07EriuDied

        CHECK_UNIT_DIED_TO FlagAlways, BloomCh07, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, BloomCh07
          EVENT FlagAlways, EventChapter07BloomDied

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter07_DaisyShannanAdjacentCheck, Daisy, Shannan, 1
          EVENT FlagAlways, EventChapter07DaisyShannanAdjacent

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter07_DalvinTristanAdjacentCheck, Dalvin, Tristan, 1
          EC_NOP_00

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter07_DalvinTristanAdjacentCheck, Tristan, Dalvin, 1
          EC_NOP_00

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING FlagChapter07_JuliaCaptureReturn, Julia
          EC_NOP_00

        CHECK_TALK FlagChapter07_DahnaArmyTalkCheck, AnyCharacter, DahnaBlockadeMyrmidon
          EVENT FlagAlways, EventChapter07DahnaArmyTalk

        VISIT_VILLAGE FlagAlways, Laylea, Ch07_VillageBarrierBlade
          EVENT FlagAlways, EventChapter07VillageBarrierBladeLaylea

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch07_VillageSpeedRing
          EVENT FlagAlways, EventChapter07VillageSpeedRing

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch07_VillageBarrierBlade
          EVENT FlagAlways, EventChapter07VillageBarrierBladeAnyone

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch07_Village1
          EVENT FlagAlways, EventChapter07Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch07_Village2
          EVENT FlagAlways, EventChapter07Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch07_Village3
          EVENT FlagAlways, EventChapter07Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch07_VillageShieldRing
          EVENT FlagAlways, EventChapter07VillageShieldRing

        CHECK_SPECIAL_CRIT FlagAlways, 3, BanbaCh07
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_BanbaTriangleAttackQuote, dialogueChapter07BanbaTriangleAttack, 0

        CHECK_SPECIAL_CRIT FlagAlways, 3, FotlaCh07
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_FotlaTriangleAttackQuote, dialogueChapter07FotlaTriangleAttack, 0

        CHECK_SPECIAL_CRIT FlagAlways, 3, EriuCh07
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_EriuTriangleAttackQuote, dialogueChapter07EriuTriangleAttack, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Arthur, AnyFactionSlot, Tine
          SET_PRECOMBAT_DIALOGUE FlagChapter07_ArthurAmid_TineLindaBattleQuote, dialogueChapter07ArthurAmid_TineLindaBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Amid, AnyFactionSlot, Linda
          SET_PRECOMBAT_DIALOGUE FlagChapter07_ArthurAmid_TineLindaBattleQuote, dialogueChapter07ArthurAmid_TineLindaBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Ares, AnyFactionSlot, Bramsel
          SET_PRECOMBAT_DIALOGUE FlagChapter07_AresBramselBattleQuote, dialogueChapter07AresBramselBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Ares, AnyFactionSlot, Javarro
          SET_PRECOMBAT_DIALOGUE FlagChapter07_AresJavarroBattleQuote, dialogueChapter07AresJavarroBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Tine, AnyFactionSlot, BloomCh07
          SET_PRECOMBAT_DIALOGUE FlagChapter07_TineLinda_BloomBattleQuote, dialogueChapter07TineLinda_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Linda, AnyFactionSlot, BloomCh07
          SET_PRECOMBAT_DIALOGUE FlagChapter07_TineLinda_BloomBattleQuote, dialogueChapter07TineLinda_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Arthur, AnyFactionSlot, BloomCh07
          SET_PRECOMBAT_DIALOGUE FlagChapter07_ArthurAmid_BloomBattleQuote, dialogueChapter07ArthurAmid_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Amid, AnyFactionSlot, BloomCh07
          SET_PRECOMBAT_DIALOGUE FlagChapter07_ArthurAmid_BloomBattleQuote, dialogueChapter07ArthurAmid_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Leif, AnyFactionSlot, BloomCh07
          SET_PRECOMBAT_DIALOGUE FlagChapter07_LeifBloomBattleQuote, dialogueChapter07LeifBloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagChapter07_IshtoreBattleQuoteCheck, FS_Player, AnyCharacter, AnyFactionSlot, Ishtore
          EC_NOP_00

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Kutuzov
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_KutuzovBattleQuote, dialogueChapter07KutuzovBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, KutuzovFenrir
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_KutuzovBattleQuote, dialogueChapter07KutuzovBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Liza
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_LizaBattleQuote, dialogueChapter07LizaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Javarro
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_JavarroBattleQuote, dialogueChapter07JavarroBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Bramsel
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_BramselBattleQuote, dialogueChapter07BramselBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, BanbaCh07
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_BanbaBattleQuote, dialogueChapter07BanbaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, FotlaCh07
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_FotlaBattleQuote, dialogueChapter07FotlaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, EriuCh07
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_EriuBattleQuote, dialogueChapter07EriuBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Tine
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_TineLinda_BattleQuote, dialogueChapter07TineLinda_BattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Linda
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_TineLinda_BattleQuote, dialogueChapter07TineLinda_BattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, BloomCh07
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_BloomBattleQuote, dialogueChapter07BloomBattleQuote, 0

        CHECK_UNIT_DIED_TO FlagChapter07_IshtoreDied, Ishtore, AnyCharacter
          EC_NOP_00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_IshtoreBattleQuote
          CHECK_FLAG_SET FlagChapter07_IshtoreBattleQuoteCheck
            CHECK_FLAG_UNSET FlagChapter07_LizaDied
              SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_IshtoreBattleQuote, dialogueChapter07IshtoreBattleQuoteLizaAlive, 0
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_IshtoreBattleQuote
          CHECK_FLAG_SET FlagChapter07_IshtoreBattleQuoteCheck
            CHECK_FLAG_SET FlagChapter07_LizaDied
              SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_IshtoreBattleQuote, dialogueChapter07IshtoreBattleQuoteLizaDead, 0
        BREAK_STATE_CHECKS

        UNSET_FLAG FlagChapter07_IshtoreBattleQuoteCheck

        CHECK_FLAG_SET FlagChapter07_IshtoreDied
          CHECK_FLAG_UNSET FlagChapter07_IshtoreDeathQuoteLizaAlive
            CHECK_FLAG_UNSET FlagChapter07_LizaDied
              SET_BATTLE_OR_DEATH_QUOTE FlagChapter07_IshtoreDeathQuoteLizaAlive, dialogueDeathQuoteGen2EnemyNPCIshtoreLizaAlive, 1
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_TineLinda_BattleQuote
          CHECK_FLAG_SET FlagChapter07_ArthurAmid_TineLindaBattleQuote
            SET_FLAG FlagChapter07_TineLinda_BattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_BramselBattleQuote
          CHECK_FLAG_SET FlagChapter07_AresBramselBattleQuote
            SET_FLAG FlagChapter07_BramselBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_JavarroBattleQuote
          CHECK_FLAG_SET FlagChapter07_AresJavarroBattleQuote
            SET_FLAG FlagChapter07_JavarroBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_BloomBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter07_TineLinda_BloomBattleQuote, FlagChapter07_ArthurAmid_BloomBattleQuote, FlagChapter07_LeifBloomBattleQuote]
            SET_FLAG FlagChapter07_BloomBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_BanbaBattleQuote
          CHECK_FLAG_SET FlagChapter07_BanbaTriangleAttackQuote
            SET_FLAG FlagChapter07_BanbaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_FotlaBattleQuote
          CHECK_FLAG_SET FlagChapter07_FotlaTriangleAttackQuote
            SET_FLAG FlagChapter07_FotlaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter07_EriuBattleQuote
          CHECK_FLAG_SET FlagChapter07_EriuTriangleAttackQuote
            SET_FLAG FlagChapter07_EriuBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 2, FS_Ch07Dahna
          EVENT FlagChapter07_BramselWaiting, EventChapter07BramselWaiting
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 12, FS_Ch07Aed, AnyAI, AnyCharacter
          CHECK_UNIT_ALIVE Kutuzov
            EVENT FlagChapter07_KutuzovFenrirFound, EventChapter07KutuzovFenrirFound
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch07Dahna
          CHECK_FLAG_SET FlagChapter07_MelgenSpawn
            EVENT FlagChapter07_AresThreatensBramsel, EventChapter07AresThreatensBramsel
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch07Dahna
          CHECK_FLAG_SET FlagChapter07_AedSeizedCheck
            EVENT FlagChapter07_MelgenSpawn, EventChapter07MelgenSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch07Ulster, 1, AnyCharacter
          CHECK_FLAG_SET FlagChapter07_UlsterSpawn
            EVENT FlagChapter07_BloomCharge, EventChapter07BloomCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch07Dahna
          CHECK_FLAG_SET FlagChapter07_MelgenSeizedCheck
            EVENT FlagChapter07_UlsterSpawn, EventChapter07UlsterSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapter07_UlsterSpawn
            EVENT FlagChapter07_AresRecruitment, EventChapter07AresRecruitment
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch07Ulster, 3, AnyCharacter
          EVENT FlagChapter07_BanbaDialogue, EventChapter07BanbaDialogue
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch07Ulster, 4, AnyCharacter
          EVENT FlagChapter07_TineLinda_Dialogue, EventChapter07TineLinda_Dialogue
        BREAK_TURN_EVENT_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter07_DalvinTristanAdjacentCheck, FlagChapter07_MelgenSeizedCheck]
          EVENT FlagChapter07_DalvinTristanAdjacent, EventChapter07DalvinTristanAdjacent
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter07_DalvinTristanAdjacentCheck
          CHECK_FLAG_UNSET FlagChapter07_DalvinTristanAdjacent
            UNSET_FLAG FlagChapter07_DalvinTristanAdjacentCheck
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter07ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter07ClearTalksIfMarriedTable ; 86/EBC6

        .byte Patty, Shannan
        .byte Daisy, Shannan
        .byte Shannan, Larcei
        .byte Shannan, Creidne
        .byte Seliph, Patty
        .byte Seliph, Daisy
        .word $FFFF

    .endsection Chapter07EventsSection

    .section Chapter07EventDataSection

      aChapter07EventData ; 86/EBD4

        .structChapterEventData aChapter07LocationData, aChapter07MapChangeData, aUnknown86ED23, aChapter07TalkEvents, aUnknown86EDF0

      aChapter07LocationData ; 86/EBDE

        .byte size(aChapter07LocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/Chapter07LocationData.csv.asm"

      aChapter07RibautCastle ; 86/EBF7

        .structChapterCastleLocationEntry Ch07_Ribaut, RibautName, [58, 1], $FC, aChapter07ShopData

      aChapter07AedCastle ; 86/EBFF

        .structChapterCastleLocationEntry Ch07_Aed, AedName, [20, 3], $FC, None

      aChapter07DahnaCastle ; 86/EC07

        .structChapterCastleLocationEntry Ch07_Dahna, DahnaName, [15, 22], $FC, None

      aChapter07MelgenCastle ; 86/EC0F

        .structChapterCastleLocationEntry Ch07_Melgen, MelgenName, [17, 57], $FC, None

      aChapter07LeonsterCastle ; 86/EC17

        .structChapterCastleLocationEntry Ch07_Leonster, LeonsterName, [56, 26], $20, None

      aChapter07UlsterCastle ; 86/EC1F

        .structChapterCastleLocationEntry Ch07_Ulster, UlsterName, [51, 55], $00, None

      aChapter07VillageSpeedRing ; 86/EC27

        .structChapterVillageLocationEntry Ch07_VillageSpeedRing, [60, 39]

      aChapter07VillageBarrierBlade ; 86/EC2C

        .structChapterVillageLocationEntry Ch07_VillageBarrierBlade, [52, 34]

      aChapter07Village1 ; 86/EC31

        .structChapterVillageLocationEntry Ch07_Village1, [48, 37]

      aChapter07Village2 ; 86/EC36

        .structChapterVillageLocationEntry Ch07_Village2, [44, 37]

      aChapter07Village3 ; 86/EC3B

        .structChapterVillageLocationEntry Ch07_Village3, [41, 39]

      aChapter07VillageShieldRing ; 86/EC40

        .structChapterVillageLocationEntry Ch07_VillageShieldRing, [3, 22]

      aChapter07ShopData ; 86/EC45

        .byte PI_SteelSword1
        .byte PI_SteelBlade1
        .byte PI_SlimSword2
        .byte PI_FireSword
        .byte PI_IronLance1
        .byte PI_IronLance2
        .byte PI_IronLance3
        .byte PI_SlimLance1
        .byte PI_IronAxe1
        .byte PI_SteelAxe1
        .byte PI_HandAxe
        .byte PI_SteelBow1
        .byte PI_Fire2
        .byte PI_Thunder1
        .byte PI_HealStaff1
        .byte PI_HealStaff2
        .byte PI_RecoverStaff2
        .byte PI_ReturnStaff

        ; 86/EC57

        .byte PI_IronSword5
        .byte PI_IronBlade3
        .byte PI_IronBlade4
        .byte PI_SlimSword4
        .byte PI_SlimLance2
        .word $FFFF

      aChapter07MapChangeData ; 86/EC5E

        .structChapterMapChangeEntry Chapter07, FlagChapter07_AedSeizedCheck, [18, 6],  aChapter07MapChangeAedPassage
        .structChapterMapChangeEntry Chapter07, FlagChapter07_SetUlsterRampart, [44, 55], aChapter07MapChangeUlsterLeftRampart
        .structChapterMapChangeEntry Chapter07, FlagChapter07_SetUlsterRampart, [51, 52], aChapter07MapChangeUlsterTopRampart
        .structChapterMapChangeEntry Chapter07, FlagChapter07_SetUlsterRampart, [56, 55], aChapter07MapChangeUlsterRightRampart
        .structChapterMapChangeEntry Chapter07, FlagChapter07_RemoveUlsterRampart, [44, 55], aChapter07MapChangeUlsterRemoveLeftRampart
        .structChapterMapChangeEntry Chapter07, FlagChapter07_RemoveUlsterRampart, [51, 52], aChapter07MapChangeUlsterRemoveTopRampart
        .structChapterMapChangeEntry Chapter07, FlagChapter07_RemoveUlsterRampart, [56, 55], aChapter07MapChangeUlsterRemoveRightRampart
        .word $FFFF

      aChapter07MapChangeAedPassage ; 86/EC91

        .byte 6
        .byte 9

        .word $02BB, $03F9, $0086, $03F9, $02BC, $0235
        .word $0234, $02BB, $023A, $0291, $0233, $0255
        .word $01DA, $02BD, $02B0, $02B1, $029B, $01F2
        .word $029E, $029D, $029D, $029E, $029D, $02BC
        .word $0234, $029D, $02BB, $029D, $029D, $0235
        .word $0040, $029D, $0290, $0291, $029E, $0041
        .word $0212, $029D, $02B0, $02B1, $029D, $0290
        .word $025C, $0291, $029D, $029E, $0290, $025B
        .word $023E, $025C, $0291, $0290, $025B, $023E

      aChapter07MapChangeUlsterLeftRampart ; 86/ECFF

        .byte 1
        .byte 2

        .word $13DF
        .word $1310

      aChapter07MapChangeUlsterTopRampart ; 86/ED05

        .byte 2
        .byte 1

        .word $13B7, $13B8

      aChapter07MapChangeUlsterRightRampart ; 86/ED0B

        .byte 1
        .byte 2

        .word $1311
        .word $13B9

      aChapter07MapChangeUlsterRemoveLeftRampart ; 86/ED11

        .byte 1
        .byte 2

        .word $133B
        .word $135B

      aChapter07MapChangeUlsterRemoveTopRampart ; 86/ED17

        .byte 2
        .byte 1

        .word $135B, $13FB

      aChapter07MapChangeUlsterRemoveRightRampart ; 86/ED1D

        .byte 1
        .byte 2

        .word $133A
        .word $1332

      aUnknown86ED23 ; 86/ED23

        .word <>aUnknown86ED27
        .word <>aUnknown86ED37

      aUnknown86ED27 ; 86/ED27

        .word $020D
        .word $020E
        .word $020F
        .word $0210
        .word $0212
        .word $0213
        .word $0214
        .word $FFFF

      aUnknown86ED37 ; 86/ED37

        .word $020D
        .word $020E
        .word $020F
        .word $0211
        .word $0212
        .word $0213
        .word $0214
        .word $FFFF

      aFactionGroupData28 ; 86/ED47

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData28._Locations, None

        _Locations ; 86/ED50
        .word Ch07_Ribaut
        .word $FFFF

      aFactionGroupData29 ; 86/ED54

        .structFactionGroupData FactionAed, BattleHUDColorOrange, BattleBannerLoptr, None, aFactionGroupData29._Locations, aFactionGroupData29._GroupAI

        _Locations ; 86/ED5D
        .word Ch07_Aed
        .word $FFFF

        _GroupAI ; 86/ED61
        .long aFactionGroup29AI1
        .long aFactionGroup29AI2
        .long aFactionGroup29AI3
        .long aFactionGroup29AI4
        .word $FFFF

      aFactionGroupData2A ; 86/ED6F

        .structFactionGroupData FactionDahna, BattleHUDColorOrange, BattleBannerDefault, None, aFactionGroupData2A._Locations, aFactionGroupData2A._GroupAI

        _Locations ; 86/ED78
        .word Ch07_Dahna
        .word $FFFF

        _GroupAI ; 86/ED7C
        .long aFactionGroup2AAI1
        .long aFactionGroup2AAI2
        .long aFactionGroup2AAI3
        .long aFactionGroup2AAI1
        .long aFactionGroup2AAI5
        .word $FFFF

      aFactionGroupData2B ; 86/ED8D

        .structFactionGroupData FactionMelgen, BattleHUDColorBrown, BattleBannerFreege, None, aFactionGroupData2B._Locations, aFactionGroupData2B._GroupAI

        _Locations ; 86/ED96
        .word Ch07_Melgen
        .word $FFFF

        _GroupAI ; 86/ED9A
        .long aFactionGroup2BAI1
        .long aFactionGroup2BAI2
        .word $FFFF

      aFactionGroupData2C ; 86/EDA2

        .structFactionGroupData FactionUlster, BattleHUDColorBrown, BattleBannerFreege, None, aFactionGroupData2C._Locations, aFactionGroupData2C._GroupAI

        _Locations ; 86/EDAB
        .word Ch07_Ulster
        .word $FFFF

        _GroupAI ; 86/EDAF
        .long aFactionGroup2CAI1
        .long aFactionGroup2CAI2
        .long aFactionGroup2CAI3
        .long aFactionGroup2CAI4
        .long aFactionGroup2CAI5
        .long aFactionGroup2CAI6
        .long aFactionGroup2CAI7
        .long aFactionGroup2CAI8
        .word $FFFF

      aFactionGroupData47 ; 86/EDC9

        .structFactionGroupData $FF, BattleHUDColorOrange, BattleBannerDefault, None, aFactionGroupData47._Locations, None

        _Locations ; 86/EDD2
        .word Ch07_Leonster
        .word $FFFF

      aChapter07TalkEvents ; 86/EDD6

        .structChapterTalkEventEntry Chapter07, FlagChapter07_ArthurAmid_TineLindaTalkCheck, Arthur, Tine
        .structChapterTalkEventEntry Chapter07, FlagChapter07_ArthurAmid_TineLindaTalkCheck, Amid, Linda
        .structChapterTalkEventEntry Chapter07, FlagChapter07_DahnaArmyTalkCheck, AnyCharacter, DahnaBlockadeMyrmidon
        .word $FFFF

      aUnknown86EDF0 ; 86/EDF0

        .word $FFFF
        .word $FFFF
        .word $0A07
        .word $FFFF
        .word $FFFF
        .word $FFFF

      aFactionGroup29AI1 ; 86/EDFC

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_INTERACT_WITH_UNIT Tine, $01
        AI_INTERACT_WITH_UNIT Daisy, $01
        AI_END

      aFactionGroup29AI2 ; 86/EE07

        AI_CHECK_GROUP_COMPLETE_BY_TURN_DIVISIBLE 8
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup29AI3 ; 86/EE0B

        AI_JUMP_IF_TURN_REACHED 12, +

          AI_END

        +
        AI_07 Ch07_Aed, $05
        AI_END

      aFactionGroup29AI4 ; 86/EE14

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2AAI1 ; 86/EE16

        AI_0B
        AI_END

      aFactionGroup2AAI2 ; 86/EE18

        AI_SET_FORMATION $08, $02
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2AAI3 ; 86/EE23

        AI_07 Ch07_Dahna, $05
        AI_END

      aFactionGroup2AAI5 ; 86/EE27

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2BAI1 ; 86/EE2F

        AI_SET_FORMATION $0A, $00
        AI_0A
        AI_END

      aFactionGroup2BAI2 ; 86/EE34

        AI_07 Ch07_Melgen, $05
        AI_END

      aFactionGroup2CAI1 ; 86/EE38

        AI_SET_FORMATION $08, $00
        AI_CHECK_GROUP_COMPLETE_BY_TURN_DIVISIBLE $01
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD 0.5 * 256, 1 * 256
        AI_06 Ch07_Leonster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2CAI2 ; 86/EE46

        AI_SET_FORMATION $08, $00
        AI_06 Ch07_Leonster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2CAI3 ; 86/EE4E

        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_1D
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2CAI4 ; 86/EE57

        AI_SET_FORMATION $09, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2CAI5 ; 86/EE62

        AI_END

      aFactionGroup2CAI6 ; 86/EE63

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2CAI7 ; 86/EE66

        AI_07 Ch07_Ulster, $05
        AI_END

      aFactionGroup2CAI8 ; 86/EE6A

        AI_JUMP_IF_TURN_REACHED 15, +

          AI_0B
          AI_END

        +
        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

    .endsection Chapter07EventDataSection
