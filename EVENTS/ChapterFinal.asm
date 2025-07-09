
    .weak

      FlagChapterFinal_EddaSeizedCheck                  :=  0
      FlagChapterFinal_DozelSeizedCheck                 :=  1
      FlagChapterFinal_FriegeSeizedCheck                :=  2
      FlagChapterFinal_VelthomerSeizedCheck             :=  3
      FlagChapterFinal_BelhallaSeizedCheck              :=  4
      FlagChapterFinal_EddaSeized                       :=  5
      FlagChapterFinal_DozelSpawn                       :=  6
      FlagChapterFinal_IucharBrianBattleQuote           :=  7
      FlagChapterFinal_FriegeSpawn                      :=  8
      FlagChapterFinal_YngviSpawn                       :=  9
      FlagChapterFinal_IucharbaBrianBattleQuote         := 10
      FlagChapterFinal_BelhallaSpawn                    := 11
      FlagChapterFinal_ThraciaSpawn                     := 12
      FlagChapterFinal_TineLinda_HildaBattleQuote       := 13
      FlagChapterFinal_SeliphJuliaTalkManfroyDead       := 14
      FlagChapterFinal_AltenaArionTalk                  := 15
      FlagChapterFinal_ArthurHildaBattleQuote           := 16
      FlagChapterFinal_FebailScipioBattleQuote          := 17
      FlagChapterFinal_LesterScipioBattleQuote          := 18
      FlagChapterFinal_TineLinda_IshtarBattleQuote      := 19
      FlagChapterFinal_SeliphManfroyBattleQuote         := 20
      FlagChapterFinal_SeliphJuliaTalkManfroyAlive      := 21
      FlagChapterFinal_AltenaArionBattleQuote           := 22
      FlagChapterFinal_JuliusDied                       := 23

      FlagChapterFinal_DaisyLoverTalkSet                := 25
      FlagChapterFinal_LarceiCreidneLoverTalkSet        := 26
      FlagChapterFinal_PattyLoverTalkSet                := 27
      FlagChapterFinal_JeanneLoverTalkSet               := 28
      FlagChapterFinal_LanaMuirneLoverTalkSet           := 29
      FlagChapterFinal_NannaJeanneLoverTalkSet          := 30
      FlagChapterFinal_TineLindaLoverTalkSet            := 31
      FlagChapterFinal_FeeHerimnaLoverTalkSet           := 32

      FlagChapterFinal_RobertoBattleQuote               := 35
      FlagChapterFinal_BoyceBattleQuote                 := 36
      FlagChapterFinal_RodanBattleQuote                 := 37
      FlagChapterFinal_JuphielBattleQuote               := 38
      FlagChapterFinal_FisherBattleQuote                := 39
      FlagChapterFinal_BrianBattleQuote                 := 40
      FlagChapterFinal_DagonBattleQuote                 := 41
      FlagChapterFinal_HildaBattleQuote                 := 42
      FlagChapterFinal_ScipioBattleQuote                := 43
      FlagChapterFinal_BaranBattleQuote                 := 44
      FlagChapterFinal_MengBattleQuote                  := 45
      FlagChapterFinal_MabelBattleQuote                 := 46
      FlagChapterFinal_BlegBattleQuote                  := 47
      FlagChapterFinal_ArionBattleQuote                 := 48
      FlagChapterFinal_IshtarBattleQuote                := 49
      FlagChapterFinal_ManfroyBattleQuote               := 50
      FlagChapterFinal_JuliaBattleQuote                 := 51
      FlagChapterFinal_JuliusBattleQuote                := 52
      FlagChapterFinal_JuliaJuliusBattleQuote           := 53
      FlagChapterFinal_SeliphJuliusBattleQuote          := 54
      FlagChapterFinal_JuliaVelthomerVisitCheck         := 55
      FlagChapterFinal_JuliaDied                        := 56

      FlagChapterFinal_ManfroyDiedCheck                 := 58

      FlagChapterFinal_SeliphJuliaTalkManfroyDeadCheck  := 60
      FlagChapterFinal_AltenaArionTalkCheck             := 61
      FlagChapterFinal_FriegeEngaged                    := 62
      FlagChapterFinal_RemoveChalphyRampart             := 63
      FlagChapterFinal_RemoveEddaRampart                := 64
      FlagChapterFinal_RemoveDozelRampart               := 65
      FlagChapterFinal_RemoveFriegeRampart              := 66
      FlagChapterFinal_RemoveBelhallaRampart            := 67
      FlagChapterFinal_ClaudsChildAlive                 := 68
      FlagChapterFinal_JuliaDeathQuote                  := 69
      FlagChapterFinal_JuliusDeathQuote                 := 70
      FlagChapterFinal_SeliphKilledJulius               := 71
      FlagChapterFinal_JuliaKilledJulius                := 72
      FlagChapterFinal_SeliphJuliaTalkManfroyAliveCheck := 73
      FlagChapterFinal_SeliphJuliaTalkSwap              := 74
      FlagChapterFinal_JuliaMarried                     := 75

      FlagChapterFinal_HildaDiedCheck                   := 78

      FS_Player                                         :=  0
      FS_ChFinalEdda                                    :=  1
      FS_ChFinalDozel                                   :=  2
      FS_ChFinalFriege                                  :=  3
      FS_ChFinalYngvi                                   :=  4
      FS_ChFinalVelthomer                               :=  5
      FS_ChFinalBelhalla                                :=  6

      FS_ChFinalThracia                                 :=  1


    .endweak

    .section ChapterFinalEventsSection

      aChapterFinalEventHeader ; B1/A378

        .word ChapterFinal
        .long aChapterFinalOpeningEvent
        .long aChapterFinalMapEvents

      aChapterFinalOpeningEvent ; B1/A380

        LOAD_FACTION_GROUP FS_Player,           FG_FinalSeliph
        LOAD_FACTION_GROUP FS_ChFinalEdda,      FG_FinalEdda
        LOAD_FACTION_GROUP FS_ChFinalDozel,     FG_FinalDozel
        LOAD_FACTION_GROUP FS_ChFinalFriege,    FG_FinalFriege
        LOAD_FACTION_GROUP FS_ChFinalVelthomer, FG_FinalVelthomer
        LOAD_FACTION_GROUP FS_ChFinalBelhalla,  FG_FinalBelhalla

        macroSetFactionsEnemies [FS_Player,           FS_ChFinalEdda]
        macroSetFactionsEnemies [FS_Player,           FS_ChFinalDozel]
        macroSetFactionsEnemies [FS_Player,           FS_ChFinalFriege]
        macroSetFactionsEnemies [FS_Player,           FS_ChFinalVelthomer]
        macroSetFactionsEnemies [FS_Player,           FS_ChFinalBelhalla]
        macroSetFactionsAllies  [FS_ChFinalEdda,      FS_ChFinalDozel]
        macroSetFactionsAllies  [FS_ChFinalEdda,      FS_ChFinalFriege]
        macroSetFactionsAllies  [FS_ChFinalEdda,      FS_ChFinalVelthomer]
        macroSetFactionsAllies  [FS_ChFinalEdda,      FS_ChFinalBelhalla]
        macroSetFactionsAllies  [FS_ChFinalFriege,    FS_ChFinalDozel]
        macroSetFactionsAllies  [FS_ChFinalFriege,    FS_ChFinalVelthomer]
        macroSetFactionsAllies  [FS_ChFinalFriege,    FS_ChFinalBelhalla]
        macroSetFactionsAllies  [FS_ChFinalDozel,     FS_ChFinalVelthomer]
        macroSetFactionsAllies  [FS_ChFinalDozel,     FS_ChFinalBelhalla]
        macroSetFactionsAllies  [FS_ChFinalVelthomer, FS_ChFinalBelhalla]

        SET_FLAG FlagChapterFinal_SeliphJuliaTalkManfroyDeadCheck

        EVENT FlagAlways, EventChapterFinalOpening

        END_CHAPTER_EVENTS

      aChapterFinalMapEvents ; B1/A3D6

        CHECK_SEIZING_CASTLE FlagChapterFinal_EddaSeizedCheck, FS_Player, ChFinal_Edda
          EC_NOP_00

        CHECK_SEIZING_CASTLE FlagChapterFinal_DozelSeizedCheck, FS_Player, ChFinal_Dozel
          EVENT FlagAlways, EventChapterFinalDozelSeized

        CHECK_SEIZING_CASTLE FlagChapterFinal_FriegeSeizedCheck, FS_Player, ChFinal_Friege
          EVENT FlagAlways, EventChapterFinalFriegeSeized

        CHECK_SEIZING_CASTLE FlagChapterFinal_VelthomerSeizedCheck, FS_Player, ChFinal_Velthomer
          EVENT FlagAlways, EventChapterFinalVelthomerSeized

        CHECK_SEIZING_CASTLE FlagChapterFinal_BelhallaSeizedCheck, FS_Player, ChFinal_Belhalla
          EVENT FlagAlways, EventChapterFinalEnding

        CHECK_UNIT_IN_AREA FlagChapterFinal_FriegeEngaged, AnyCharacter, pack([1, 17]), pack([13, 30])
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapterFinal_FriegeEngaged, AnyCharacter, pack([1, 19]), pack([17, 28])
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapterFinal_FriegeEngaged, AnyCharacter, pack([1, 31]), pack([7, 35])
          EC_NOP_00

        CHECK_TALK FlagChapterFinal_SeliphJuliaTalkManfroyDeadCheck, Seliph, Julia
          EVENT FlagChapterFinal_SeliphJuliaTalkManfroyDead, EventChapterFinalSeliphJuliaTalkManfroyDead

        CHECK_TALK FlagChapterFinal_SeliphJuliaTalkManfroyAliveCheck, Seliph, Julia
          EVENT FlagChapterFinal_SeliphJuliaTalkManfroyAlive, EventChapterFinalSeliphJuliaTalkManfroyAlive

        CHECK_TALK FlagChapterFinal_AltenaArionTalkCheck, Altena, ArionChFinal
          EVENT FlagChapterFinal_AltenaArionTalk, EventChapterFinalAltenaArionTalk

        CHECK_UNIT_DIED FlagChapterFinal_HildaDiedCheck, HildaChFinal
          EC_NOP_00

        CHECK_UNIT_DIED FlagChapterFinal_ManfroyDiedCheck, Manfroy
          EC_NOP_00

        CHECK_UNIT_DIED FlagAlways, ArionChFinal
          SET_PERMANENT_FLAG PermanentFlagChapterFinalArionDied

        CHECK_ENTERING_CASTLE_MENU FlagChapterFinal_JuliaVelthomerVisitCheck, Julia, ChFinal_Velthomer
          EVENT FlagAlways, EventChapterFinalJuliaVelthomerVisit

        CHECK_UNIT_DIED_TO FlagChapterFinal_JuliaDied, Julia, AnyCharacter
          EC_NOP_00

        CHECK_UNIT_DIED_TO FlagChapterFinal_SeliphKilledJulius, JuliusChFinal, Seliph
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED_TO FlagChapterFinal_JuliaKilledJulius, JuliusChFinal, Julia
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED_TO FlagAlways, JuliusChFinal, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, JuliusChFinal
          EVENT FlagChapterFinal_JuliusDied, EventChapterFinalJuliusDied

        CHECK_TALK FlagAlways, Arthur, Tine
          EVENT FlagAlways, EventChapterFinalArthurTineTalk

        CHECK_TALK FlagAlways, Amid, Linda
          EVENT FlagAlways, EventChapterFinalAmidLindaTalk

        CHECK_CHILD_TALK FlagAlways, Tine, Seliph
          EVENT FlagAlways, EventChapterFinalTineLinda_SeliphTalk

        CHECK_CHILD_TALK FlagAlways, Tine, Ced
          EVENT FlagAlways, EventChapterFinalTineLinda_CedHawkTalk

        CHECK_CHILD_TALK FlagAlways, Tine, Leif
          EVENT FlagAlways, EventChapterFinalTineLinda_LeifTalk

        CHECK_TALK FlagAlways, Daisy, Deimne
          EVENT FlagAlways, EventChapterFinalDaisyDeimneTalk

        CHECK_TALK FlagAlways, Jeanne, Leif
          EVENT FlagAlways, EventChapterFinalJeanneLeifTalk

        CHECK_TALK FlagAlways, Muirne, Asaello
          EVENT FlagAlways, EventChapterFinalMuirneAsaelloTalk

        CHECK_CHILD_TALK FlagAlways, Lana, Seliph
          EVENT FlagAlways, EventChapterFinalLanaMuirne_SeliphTalk

        CHECK_TALK FlagAlways, Lana, Febail
          EVENT FlagAlways, EventChapterFinalLanaFebailTalk

        CHECK_CHILD_TALK FlagAlways, Lana, Scathach
          EVENT FlagAlways, EventChapterFinalLanaMuirne_ScathachDalvinTalk

        CHECK_CHILD_TALK FlagAlways, Larcei, Seliph
          EVENT FlagAlways, EventChapterFinalLarceiCreidne_SeliphTalk

        CHECK_CHILD_TALK FlagAlways, Larcei, Iuchar
          EVENT FlagAlways, EventChapterFinalLarceiCreidne_IucharTalk

        CHECK_CHILD_TALK FlagAlways, Larcei, Iucharba
          EVENT FlagAlways, EventChapterFinalLarceiCreidne_IucharbaTalk

        CHECK_CHILD_TALK FlagAlways, Larcei, Shannan
          EVENT FlagAlways, EventChapterFinalLarceiCreidne_ShannanTalk

        CHECK_CHILD_TALK FlagAlways, Patty, Seliph
          EVENT FlagAlways, EventChapterFinalPattyDaisy_SeliphTalk

        CHECK_CHILD_TALK FlagAlways, Patty, Shannan
          EVENT FlagAlways, EventChapterFinalPattyDaisy_ShannanTalk

        CHECK_TALK FlagAlways, Patty, Lester
          EVENT FlagAlways, EventChapterFinalPattyLesterTalk

        CHECK_CHILD_TALK FlagAlways, Nanna, Seliph
          EVENT FlagAlways, EventChapterFinalNannaJeanne_SeliphTalk

        CHECK_TALK FlagAlways, Nanna, Ares
          EVENT FlagAlways, EventChapterFinalNannaAresTalk

        CHECK_TALK FlagAlways, Nanna, Leif
          EVENT FlagAlways, EventChapterFinalNannaLeifTalk

        CHECK_CHILD_TALK FlagAlways, Fee, Seliph
          EVENT FlagAlways, EventChapterFinalFeeHermina_SeliphTalk

        CHECK_CHILD_TALK FlagAlways, Fee, Arthur
          EVENT FlagAlways, EventChapterFinalFeeHermina_ArthurAmidTalk

        CHECK_TALK FlagAlways, Fee, Oifey
          EVENT FlagAlways, EventChapterFinalFeeOifeyTalk

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, Seliph, AnyFactionSlot, JuliusChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_SeliphJuliusBattleQuote, dialogueChapterFinalSeliph_JuliusBattleQuote, $83

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, Julia, AnyFactionSlot, JuliusChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_JuliaJuliusBattleQuote, dialogueChapterFinalJulia_JuliusBattleQuote, $83

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Iuchar, AnyFactionSlot, Brian
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_IucharBrianBattleQuote, dialogueChapterFinalIuchar_BrianBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Iucharba, AnyFactionSlot, Brian
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_IucharbaBrianBattleQuote, dialogueChapterFinalIucharba_BrianBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Tine, AnyFactionSlot, HildaChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_TineLinda_HildaBattleQuote, dialogueChapterFinalTineLinda_HildaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Linda, AnyFactionSlot, HildaChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_TineLinda_HildaBattleQuote, dialogueChapterFinalTineLinda_HildaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Arthur, AnyFactionSlot, HildaChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_ArthurHildaBattleQuote, dialogueChapterFinalArthur_HildaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Febail, AnyFactionSlot, Scipio
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_FebailScipioBattleQuote, dialogueChapterFinalFebail_ScipioBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Lester, AnyFactionSlot, Scipio
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_LesterScipioBattleQuote, dialogueChapterFinalLester_ScipioBattleQuote, $43

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Tine, AnyFactionSlot, IshtarChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_TineLinda_IshtarBattleQuote, dialogueChapterFinalTineLinda_IshtarBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Linda, AnyFactionSlot, IshtarChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_TineLinda_IshtarBattleQuote, dialogueChapterFinalTineLinda_IshtarBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Seliph, AnyFactionSlot, Manfroy
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_SeliphManfroyBattleQuote, dialogueChapterFinalSeliph_ManfroyBattleQuote, $7A

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Altena, AnyFactionSlot, ArionChFinal
          SET_PRECOMBAT_DIALOGUE FlagChapterFinal_AltenaArionBattleQuote, dialogueChapterFinalAltena_ArionBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Roberto
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_RobertoBattleQuote, dialogueChapterFinalRobertoBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Boyce
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_BoyceBattleQuote, dialogueChapterFinalBoyceBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Rodan
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_RodanBattleQuote, dialogueChapterFinalRodanBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Juphiel
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_JuphielBattleQuote, dialogueChapterFinalJuphielBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Fisher
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_FisherBattleQuote, dialogueChapterFinalFisherBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Brian
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_BrianBattleQuote, dialogueChapterFinalBrianBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Dagon
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_DagonBattleQuote, dialogueChapterFinalDagonBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, HildaChFinal
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_HildaBattleQuote, dialogueChapterFinalHildaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Scipio
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_ScipioBattleQuote, dialogueChapterFinalScipioBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Baran
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_BaranBattleQuote, dialogueChapterFinalBaranBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Meng
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_MengBattleQuote, dialogueChapterFinalMengBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Mabel
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_MabelBattleQuote, dialogueChapterFinalMabelBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Bleg
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_BlegBattleQuote, dialogueChapterFinalBlegBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, ArionChFinal
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_ArionBattleQuote, dialogueChapterFinalArionBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, IshtarChFinal
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_IshtarBattleQuote, dialogueChapterFinalIshtarBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Julia
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_JuliaBattleQuote, dialogueChapterFinalJuliaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Manfroy
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_ManfroyBattleQuote, dialogueChapterFinalManfroyBattleQuote, 0

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, JuliusChFinal
          SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_JuliusBattleQuote, dialogueChapterFinalJuliusBattleQuote, 0

        VISIT_VILLAGE FlagAlways, AnyCharacter, ChFinal_Village1
          EVENT FlagAlways, EventChapterFinalVillage1

        VISIT_VILLAGE FlagAlways, AnyCharacter, ChFinal_Village2
          EVENT FlagAlways, EventChapterFinalVillage2

        BREAK_ACTION_EVENT_CHECKS

        CHECK_UNITS_FIGHTING FlagChapterFinal_FriegeEngaged, FS_Player, AnyCharacter, FS_ChFinalFriege, AnyCharacter
          EC_NOP_00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_BrianBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapterFinal_IucharBrianBattleQuote, FlagChapterFinal_IucharbaBrianBattleQuote]
            SET_FLAG FlagChapterFinal_BrianBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_HildaBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapterFinal_TineLinda_HildaBattleQuote, FlagChapterFinal_ArthurHildaBattleQuote]
            SET_FLAG FlagChapterFinal_HildaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_ScipioBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapterFinal_FebailScipioBattleQuote, FlagChapterFinal_LesterScipioBattleQuote]
            SET_FLAG FlagChapterFinal_ScipioBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_IshtarBattleQuote
          CHECK_FLAG_SET FlagChapterFinal_TineLinda_IshtarBattleQuote
            SET_FLAG FlagChapterFinal_IshtarBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_ManfroyBattleQuote
          CHECK_FLAG_SET FlagChapterFinal_SeliphManfroyBattleQuote
            SET_FLAG FlagChapterFinal_ManfroyBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_ArionBattleQuote
          CHECK_FLAG_SET FlagChapterFinal_AltenaArionBattleQuote
            SET_FLAG FlagChapterFinal_ArionBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_JuliusBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapterFinal_JuliaJuliusBattleQuote, FlagChapterFinal_SeliphJuliusBattleQuote]
            SET_FLAG FlagChapterFinal_JuliusBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_ManfroyDiedCheck
          CHECK_FLAG_UNSET FlagChapterFinal_SeliphJuliaTalkSwap
            UNSET_FLAG FlagChapterFinal_SeliphJuliaTalkManfroyDeadCheck
            SET_FLAG FlagChapterFinal_SeliphJuliaTalkManfroyAliveCheck
            SET_FLAG FlagChapterFinal_SeliphJuliaTalkSwap
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapterFinal_JuliaDeathQuote
          CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapterFinal_JuliaDied, FlagChapterFinal_SeliphJuliaTalkManfroyDead]
            CHECK_FLAG_UNSET FlagChapterFinal_JuliaMarried
              SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_JuliaDeathQuote, dialogueDeathQuoteLoverJulia, 1
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_JuliaDied
          CHECK_FLAG_UNSET FlagChapterFinal_JuliaDeathQuote
            CHECK_FLAG_UNSET FlagChapterFinal_SeliphJuliaTalkManfroyDead
              SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_JuliaDeathQuote, dialogueDeathQuoteGen2PlayerJuliaEvil, 1
        BREAK_STATE_CHECKS

        CHECK_UNITS_MARRIED Julia, AnyCharacter
          SET_FLAG FlagChapterFinal_JuliaMarried
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_SeliphKilledJulius
          CHECK_FLAG_UNSET FlagChapterFinal_JuliusDeathQuote
            SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_JuliusDeathQuote, dialogueDeathQuoteGen2EnemyNPCJuliusChFinalSeliph, 1
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_JuliaKilledJulius
          CHECK_FLAG_UNSET FlagChapterFinal_JuliusDeathQuote
            SET_BATTLE_OR_DEATH_QUOTE FlagChapterFinal_JuliusDeathQuote, dialogueDeathQuoteGen2EnemyNPCJuliusChFinalJulia, 1
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_EddaSeizedCheck
          CHECK_FLAG_UNSET FlagChapterFinal_EddaSeized
            CHECK_FATHERS_CHILD_ALIVE Claud
              SET_FLAG FlagChapterFinal_ClaudsChildAlive
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_EddaSeizedCheck
          EVENT FlagChapterFinal_EddaSeized, EventChapterFinalEddaSeized
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_ChFinalDozel
          CHECK_FLAG_SET FlagChapterFinal_EddaSeizedCheck
            EVENT FlagChapterFinal_DozelSpawn, EventChapterFinalDozelSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_ChFinalFriege
          CHECK_FLAG_SET FlagChapterFinal_DozelSeizedCheck
            EVENT FlagChapterFinal_FriegeSpawn, EventChapterFinalFriegeSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_ChFinalYngvi
          CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapterFinal_FriegeEngaged, FlagChapterFinal_FriegeSpawn]
            CHECK_FLAG_UNSET FlagChapterFinal_FriegeSeizedCheck
              EVENT FlagChapterFinal_YngviSpawn, EventChapterFinalYngviSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_ChFinalEdda
          CHECK_FLAG_SET FlagChapterFinal_BelhallaSpawn
            EVENT FlagChapterFinal_ThraciaSpawn, EventChapterFinalThraciaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_ChFinalVelthomer
          CHECK_FLAG_SET FlagChapterFinal_FriegeSeizedCheck
            EVENT FlagChapterFinal_BelhallaSpawn, EventChapterFinalBelhallaSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_UNIT_ALIVE Julia
          UNSET_FLAG FlagChapterFinal_JuliaDied
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_DaisyLoverTalkSet, Daisy, Deimne
          SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_PattyLoverTalkSet, [Patty, Patty], [Seliph, Seliph]
          SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_PattyLoverTalkSet, [Patty, Patty], [Shannan, Shannan]
          SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_PattyLoverTalkSet, Patty, Lester
          SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_TineLindaLoverTalkSet, [Tine, Linda], [Seliph, Seliph]
          SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_TineLindaLoverTalkSet, [Tine, Linda], [Ced, Hawk]
          SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_TineLindaLoverTalkSet, [Tine, Linda], [Leif, Leif]
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapterFinal_EddaSeizedCheck
            SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_JeanneLoverTalkSet, Jeanne, Leif
            SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_LanaMuirneLoverTalkSet, Muirne, Asaello
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_NannaJeanneLoverTalkSet, [Nanna, Jeanne], [Seliph, Seliph]
            SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_NannaJeanneLoverTalkSet, Nanna, Ares
            SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_NannaJeanneLoverTalkSet, Nanna, Leif
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapterFinal_DozelSeizedCheck
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_LanaMuirneLoverTalkSet, [Lana, Muirne], [Seliph, Seliph]
            SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_LanaMuirneLoverTalkSet, Lana, Febail
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_LanaMuirneLoverTalkSet, [Lana, Muirne], [Scathach, Dalvin]
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_LarceiCreidneLoverTalkSet, [Larcei, Creidne], [Seliph, Seliph]
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_LarceiCreidneLoverTalkSet, [Larcei, Creidne], [Iuchar, Iuchar]
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_LarceiCreidneLoverTalkSet, [Larcei, Creidne], [Iucharba, Iucharba]
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_LarceiCreidneLoverTalkSet, [Larcei, Creidne], [Shannan, Shannan]
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CHECK_FLAG_SET FlagChapterFinal_FriegeSeizedCheck
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_FeeHerimnaLoverTalkSet, [Fee, Hermina], [Seliph, Seliph]
            SET_TALK_TARGET_IF_CHILDREN_MARRIED FlagChapterFinal_FeeHerimnaLoverTalkSet, [Fee, Hermina], [Arthur, Amid]
            SET_TALK_TARGET_IF_MARRIED FlagChapterFinal_FeeHerimnaLoverTalkSet, Fee, Oifey
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_HildaDiedCheck
          SET_TALK_TARGET Arthur, None
          SET_TALK_TARGET Amid, None
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapterFinal_JuliusDied
          SET_TALK_TARGET Tine, None
          SET_TALK_TARGET Linda, None
          SET_TALK_TARGET Patty, None
          SET_TALK_TARGET Daisy, None
          SET_TALK_TARGET Lana, None
          SET_TALK_TARGET Muirne, None
          SET_TALK_TARGET Larcei, None
          SET_TALK_TARGET Creidne, None
          SET_TALK_TARGET Fee, None
          SET_TALK_TARGET Hermina, None
          SET_TALK_TARGET Nanna, None
          SET_TALK_TARGET Jeanne, None
        BREAK_STATE_CHECKS

        END_CHAPTER_EVENTS

    .endsection ChapterFinalEventsSection

    .section ChapterFinalEventDataSection

      aChapterFinalEventData ; B1/A9A1

        .structChapterEventData aChapterFinalLocationData, aChapterFinalMapChangeData, aUnknownB1AA9F, aChapterFinalTalkEvents, None

      aChapterFinalLocationData ; B1/A9AB

        .byte size(aChapterFinalLocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/ChapterFinalLocationData.csv.asm"

      aChapterFinalChalphyCastle ; B1/A9BC

        .structChapterCastleLocationEntry ChFinal_Chalphy, ChalphyName, [33, 57], $FC, None

      aChapterFinalEddaCastle ; B1/A9C4

        .structChapterCastleLocationEntry ChFinal_Edda, EddaName, [60, 43], $FC, None

      aChapterFinalDozelCastle ; B1/A9CC

        .structChapterCastleLocationEntry ChFinal_Dozel, DozelName, [31, 34], $FC, None

      aChapterFinalFriegeCastle ; B1/A9D4

        .structChapterCastleLocationEntry ChFinal_Friege, FriegeName, [8, 20], $FC, None

      aChapterFinalVelthomerCastle ; B1/A9DC

        .structChapterCastleLocationEntry ChFinal_Velthomer, VelthomerName, [61, 4], $FC, None

      aChapterFinalBelhallaCastle ; B1/A9E4

        .structChapterCastleLocationEntry ChFinal_Belhalla, BelhallaName, [42, 22], $00, None

      aChapterFinalVillage1 ; B1/A9EC

        .structChapterVillageLocationEntry ChFinal_Village1, [13, 48]

      aChapterFinalVillage2 ; B1/A9F1

        .structChapterVillageLocationEntry ChFinal_Village2, [21, 54]

      aChapterFinalMapChangeData ; B1/A9F6

        .structChapterMapChangeEntry ChapterFinal, FlagChapterFinal_RemoveChalphyRampart, [28, 50], aChapter10MapChangeChalphyRampart
        .structChapterMapChangeEntry ChapterFinal, FlagChapterFinal_RemoveEddaRampart, [51, 36], aChapter10MapChangeEddaRampart
        .structChapterMapChangeEntry ChapterFinal, FlagChapterFinal_RemoveDozelRampart, [4, 37], aChapter10MapChangeDozelRampart
        .structChapterMapChangeEntry ChapterFinal, FlagChapterFinal_RemoveFriegeRampart, [14, 19], aChapter10MapChangeFriegeLeftRampart
        .structChapterMapChangeEntry ChapterFinal, FlagChapterFinal_RemoveFriegeRampart, [24, 12], aChapter10MapChangeFriegeRightRampart
        .structChapterMapChangeEntry ChapterFinal, FlagChapterFinal_RemoveBelhallaRampart, [37, 28], aChapter10MapChangeBelhallaLeftPath
        .structChapterMapChangeEntry ChapterFinal, FlagChapterFinal_RemoveBelhallaRampart, [46, 27], aChapter10MapChangeBelhallaRightPath
        .word $FFFF

      aChapter10MapChangeChalphyRampart ; B1/AA29

        .byte 2
        .byte 2

        .word $00AF, $033B
        .word $033B, $033B

      aChapter10MapChangeEddaRampart ; B1/AA33

        .byte 1
        .byte 3

        .word $0143
        .word $033C
        .word $035C

      aChapter10MapChangeDozelRampart ; B1/AA3B

        .byte 2
        .byte 2

        .word $035A, $0362
        .word $033A, $033B

      aChapter10MapChangeFriegeLeftRampart ; B1/AA45

        .byte 2
        .byte 3

        .word $01BC, $01BD
        .word $01DC, $01DD
        .word $0062, $0069

      aChapter10MapChangeFriegeRightRampart ; B1/AA53

        .byte 1
        .byte 3

        .word $033A
        .word $033A
        .word $035A

      aChapter10MapChangeBelhallaLeftPath ; B1/AA5B

        .byte 4
        .byte 4

        .word $033B, $00AE, $00A7, $033B
        .word $0230, $008A, $0087, $01BC
        .word $0250, $008E, $0066, $01DC
        .word $0088, $0067, $033B, $00A8

      aChapter10MapChangeBelhallaRightPath ; B1/AA7D

        .byte 4
        .byte 4

        .word $0068, $03F9, $0087, $0251
        .word $033C, $00A8, $023C, $0087
        .word $01B6, $01B6, $0080, $008D
        .word $0061, $0119, $00A8, $008D

      aUnknownB1AA9F ; B1/AA9F

        .word <>aUnknownB1AAA3
        .word <>aUnknownB1AAB3

      aUnknownB1AAA3 ; B1/AAA3

        .word $0230
        .word $0231
        .word $0233
        .word $0235
        .word $0237
        .word $0238
        .word $0239
        .word $FFFF

      aUnknownB1AAB3 ; B1/AAB3

        .word $0230
        .word $0232
        .word $0234
        .word $0236
        .word $0237
        .word $0238
        .word $0239
        .word $FFFF

      aChapterFinalTalkEvents ; B1/AAC3

        .structChapterTalkEventEntry ChapterFinal, FlagChapterFinal_SeliphJuliaTalkManfroyDeadCheck, Seliph, Julia
        .structChapterTalkEventEntry ChapterFinal, FlagChapterFinal_SeliphJuliaTalkManfroyAliveCheck, Seliph, Julia
        .structChapterTalkEventEntry ChapterFinal, FlagChapterFinal_AltenaArionTalkCheck, Altena, ArionChFinal
        .word $FFFF

      aFactionGroupData3C ; B1/AADD

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData3C._Locations, None

        _Locations ; B1/AAE6
        .word ChFinal_Chalphy
        .word $FFFF

      aFactionGroupData3D ; B1/AAEA

        .structFactionGroupData FactionEdda2, BattleHUDColorDarkBlue, BattleBannerEdda, None, aFactionGroupData3D._Locations, aFactionGroupData3D._GroupAI

        _Locations ; B1/AAF3
        .word ChFinal_Edda
        .word $FFFF

        _GroupAI ; B1/AAF7
        .long aFactionGroup3DAI1
        .long aFactionGroup3DAI2
        .long aFactionGroup3DAI3
        .long aFactionGroup3DAI4
        .word $FFFF

      aFactionGroupData3F ; B1/AB05

        .structFactionGroupData FactionDozel2, BattleHUDColorDarkBlue, BattleBannerDozel, None, aFactionGroupData3F._Locations, aFactionGroupData3F._GroupAI

        _Locations ; B1/AB0E
        .word ChFinal_Dozel
        .word $FFFF

        _GroupAI ; B1/AB12
        .long aFactionGroup3FAI1
        .long aFactionGroup3FAI2
        .long aFactionGroup3FAI3
        .long aFactionGroup3FAI4
        .word $FFFF

      aFactionGroupData3E ; B1/AB20

        .structFactionGroupData FactionFriege2, BattleHUDColorDarkBlue, BattleBannerFreege, None, aFactionGroupData3E._Locations, aFactionGroupData3E._GroupAI

        _Locations ; B1/AB29
        .word ChFinal_Friege
        .word $FFFF

        _GroupAI ; B1/AB2D
        .long aFactionGroup3EAI1
        .long aFactionGroup3EAI2
        .word $FFFF

      aFactionGroupData40 ; B1/AB35

        .structFactionGroupData FactionVelthomer2, BattleHUDColorDarkBlue, BattleBannerLoptr, None, aFactionGroupData40._Locations, aFactionGroupData40._GroupAI

        _Locations ; B1/AB3E
        .word ChFinal_Velthomer
        .word $FFFF

        _GroupAI ; B1/AB42
        .long aFactionGroup40AI1
        .word $FFFF

      aFactionGroupData41 ; B1/AB47

        .structFactionGroupData FactionBelhalla2, BattleHUDColorDarkBlue, BattleBannerLoptr, None, aFactionGroupData41._Locations, aFactionGroupData41._GroupAI

        _Locations ; B1/AB50
        .word ChFinal_Belhalla
        .word $FFFF

        _GroupAI ; B1/AB54
        .long aFactionGroup41AI1
        .long aFactionGroup41AI2
        .long aFactionGroup41AI3
        .long aFactionGroup41AI4
        .long aFactionGroup41AI5
        .word $FFFF

      aFactionGroupData42 ; B1/AB65

        .structFactionGroupData FactionYngvi2, BattleHUDColorDarkBlue, BattleBannerYngvi, None, None, aFactionGroupData42._GroupAI

        _GroupAI ; B1/AB6E
        .long aFactionGroup42AI1
        .word $FFFF

      aFactionGroupData43 ; B1/AB73

        .structFactionGroupData FactionThracia, BattleHUDColorDarkRed, BattleBannerThracia, None, None, aFactionGroupData43._GroupAI

        _GroupAI ; B1/AB7C
        .long aFactionGroup43AI1
        .word $FFFF

      aFactionGroup3DAI1 ; B1/AB81

        AI_SET_FORMATION $02, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3DAI2 ; B1/AB8C

        AI_SET_FORMATION $05, $03
        AI_0A
        AI_END

      aFactionGroup3DAI3 ; B1/AB91

        AI_0B
        AI_END

      aFactionGroup3DAI4 ; B1/AB93

        AI_07 ChFinal_Edda, $04
        AI_END

      aFactionGroup3FAI1 ; B1/AB97

        AI_0B
        AI_END

      aFactionGroup3FAI2 ; B1/AB99

        AI_SET_FORMATION $08, $01
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 ChFinal_Edda, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3FAI3 ; B1/ABA7

        AI_SET_FORMATION $0B, $02
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3FAI4 ; B1/ABB2

        AI_07 ChFinal_Dozel, $04
        AI_END

      aFactionGroup3EAI1 ; B1/ABB6

        AI_SET_FORMATION $01, $02
        AI_0A
        AI_END

      aFactionGroup3EAI2 ; B1/ABBB

        AI_07 ChFinal_Friege, $04
        AI_END

      aFactionGroup42AI1 ; B1/ABBF

        AI_SET_FORMATION $01, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup40AI1 ; B1/ABC4

        AI_07 ChFinal_Velthomer, $04
        AI_END

      aFactionGroup41AI1 ; B1/ABC8

        AI_SET_FORMATION $0B, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup41AI2 ; B1/ABD3

        AI_1D
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup41AI3 ; B1/ABD6

        AI_SET_FORMATION $0E, $00
        AI_07 ChFinal_Belhalla, $04
        AI_END

      aFactionGroup41AI4 ; B1/ABDD

        AI_0B
        AI_END

      aFactionGroup41AI5 ; B1/ABDF

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup43AI1 ; B1/ABE1

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $05, $03
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET ChapterFinal, FlagChapterFinal_AltenaArionTalkCheck, +

          AI_SET_IGNORED_GENERATION_ID GEN_ID_Altena
          AI_06 ChFinal_Chalphy, $01
          AI_TARGET_ALL_FOES
          AI_END

        +
        AI_02 $07
        AI_22 +

          AI_TARGET_SPECIFIED_UNIT Altena
          AI_END

        +
        AI_05
        AI_TARGET_SPECIFIED_UNIT Altena
        AI_END

    .endsection ChapterFinalEventDataSection
