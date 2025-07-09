
    .weak
      
      FlagChapter08_ConnachtSeizedCheck                 :=  0
      FlagChapter08_MeathSeizedCheck                    :=  1

      FlagChapter08_MuhammadCharge                      :=  3
      FlagChapter08_OvoCharge                           :=  4
      FlagChapter08_BanbaCharge                         :=  5
      FlagChapter08_FebailAsaello_Spawn                 :=  6
      FlagChapter08_IshtarSpawn                         :=  7
      FlagChapter08_IshtarLeave                         :=  8

      FlagChapter08_MeathSpawn                          := 11
      FlagChapter08_CoulterCharge                       := 12
      FlagChapter08_MunsterSavedMaykovReaction          := 13

      FlagChapter08_SeliphCedTalk                       := 16

      FlagChapter08_IshtarBattleQuote                   := 23
      FlagChapter08_FebailAsaello_BattleQuote           := 24
      FlagChapter08_PattyDaisy_FebailAsaelloBattleQuote := 25
      FlagChapter08_MuhammadBattleQuote                 := 26
      FlagChapter08_OvoBattleQuote                      := 27
      FlagChapter08_BanbaBattleQuote                    := 28
      FlagChapter08_BanbaTriangleAttackQuote            := 29
      FlagChapter08_FotlaBattleQuote                    := 30
      FlagChapter08_FotlaTriangleAttackQuote            := 31
      FlagChapter08_EriuBattleQuote                     := 32
      FlagChapter08_EriuTriangleAttackQuote             := 33
      FlagChapter08_BloomBattleQuote                    := 34
      FlagChapter08_CoulterBattleQuote                  := 35
      FlagChapter08_MaykovBattleQuote                   := 36

      FlagChapter08_AltenaOnMountainCheck               := 40
      FlagChapter08_Seliph_CedHawkTalkCheck             := 41
      FlagChapter08_PattyDaisy_FebailAsaelloTalkCheck   := 42
      FlagChapter08_AltenaDied                          := 43
      FlagChapter08_LeifAlive                           := 44
      FlagChapter08_FinnAlive                           := 45
      FlagChapter08_NannaAlive                          := 46
      FlagChapter08_JuliaCaptureReturn                  := 47
      FlagChapter08_IshtarDied                          := 48
      FlagChapter08_IshtarDiedCheck                     := 49
      FlagChapter08_ConnachtBridgeLowered               := 50
      FlagChapter08_LeifNearMountainCheck               := 51
      FlagChapter08_FeeOnMountainCheck                  := 52
      FlagChapter08_Unknown53                           := 53
      FlagChapter08_MuirneSeliphAdjacentCheck           := 54
      FlagChapter08_MuirneSeliphAdjacent                := 55
      FlagChapter08_LindaOnTree                         := 56
      FlagChapter08_AmidOnTree                          := 57
      FlagChapter08_AmidOnTreeCheck                     := 58
      FlagChapter08_LindaOnTreeCheck                    := 59
      FlagChapter08_FebailAsaello_BloomBattleQuote      := 60
      FlagChapter08_TineLinda_IshtarBattleQuote         := 61
      FlagChapter08_TineLinda_BloomBattleQuote          := 62
      FlagChapter08_SeliphBloomBattleQuote              := 63
      FlagChapter08_JeanneAlive                         := 64

      FS_Player                                         :=  0
      FS_Ch08Connacht                                   :=  1
      FS_Ch08Munster                                    :=  2
      FS_Ch08Meath                                      :=  3

      FS_Ch08Ced                                        :=  2

    .endweak

    .section Chapter08EventsSection

      aChapter08EventHeader ; 86/EE73

        .word Chapter08
        .long aChapter08OpeningEvent
        .long aChapter08MapEvents

      aChapter08OpeningEvent ; B2/EE7B

        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter08Start

        LOAD_FACTION_GROUP FS_Player,       FG_Ch08Seliph
        LOAD_FACTION_GROUP FS_Ch08Connacht, FG_Ch08Connacht
        LOAD_FACTION_GROUP FS_Ch08Munster,  FG_Ch08Munster1
        LOAD_FACTION_GROUP FS_Ch08Meath,    FG_Ch08Meath

        macroSetFactionsEnemies [FS_Player,       FS_Ch08Connacht]
        macroSetFactionsEnemies [FS_Player,       FS_Ch08Munster]
        macroSetFactionsEnemies [FS_Player,       FS_Ch08Meath]
        macroSetFactionsAllies  [FS_Ch08Connacht, FS_Ch08Munster]
        macroSetFactionsAllies  [FS_Ch08Connacht, FS_Ch08Meath]
        macroSetFactionsAllies  [FS_Ch08Munster,  FS_Ch08Meath]

        DEPLOY_UNIT_GROUP UNITGroupChapter08Start

        CHECK_UNIT_ALIVE Leif
          SET_FLAG FlagChapter08_LeifAlive
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE AdultFinn
          SET_FLAG FlagChapter08_FinnAlive
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE Nanna
          SET_FLAG FlagChapter08_NannaAlive
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE Jeanne
          SET_FLAG FlagChapter08_JeanneAlive
        BREAK_STATE_CHECKS

        EVENT FlagAlways, EventChapter08Opening

        END_CHAPTER_EVENTS

      aChapter08MapEvents ; 86/EEC9

        CHECK_SEIZING_CASTLE FlagChapter08_ConnachtSeizedCheck, FS_Player, Ch08_Connacht
          EVENT FlagAlways, EventChapter08ConnachtSeized

        CHECK_SEIZING_CASTLE FlagChapter08_MeathSeizedCheck, FS_Player, Ch08_Meath
          EVENT FlagAlways, EventChapter08Ending

        CHECK_UNIT_DIED FlagAlways, AnyCharacter, FS_Player
          SET_PERMANENT_FLAG PermanentFlagPlayerDeathInGen2

        CHECK_UNIT_IN_AREA FlagChapter08_AltenaOnMountainCheck, Altena, pack([46, 40]), pack([46, 40]) 
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter08_LeifNearMountainCheck, Leif, pack([49, 38]), pack([52, 42])
          EVENT FlagAlways, EventChapter08LeifNearMountain

        CHECK_UNIT_IN_AREA FlagChapter08_LeifNearMountainCheck, Leif, pack([41, 40]), pack([41, 40])
          EVENT FlagAlways, EventChapter08LeifNearMountain

        CHECK_UNIT_IN_AREA FlagChapter08_FeeOnMountainCheck, Fee, pack([17, 47]), pack([19, 52])
          EVENT FlagAlways, EventChapter08FeeOnMountain

        CHECK_UNITS_WITHIN_DISTANCE FlagChapter08_MuirneSeliphAdjacentCheck, Muirne, Seliph, 1
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter08_LindaOnTreeCheck, Linda, pack([20, 44]), pack([20, 44])
          EVENT FlagChapter08_LindaOnTree, EventChapter08LindaOnTree

        CHECK_UNIT_IN_AREA FlagChapter08_AmidOnTreeCheck, Amid, pack([25, 38]), pack([25, 38])
          EC_NOP_00

        CHECK_CHILD_TALK FlagChapter08_Seliph_CedHawkTalkCheck, Seliph, Ced
          EVENT FlagChapter08_SeliphCedTalk, EventChapter08Seliph_CedHawkTalk

        CHECK_CHILD_TALK FlagChapter08_PattyDaisy_FebailAsaelloTalkCheck, Patty, Febail
          EVENT FlagAlways, EventChapter08PattyDaisy_FebailAsaelloTalk

        CHECK_CHILD_TALK FlagChapter08_PattyDaisy_FebailAsaelloTalkCheck, Daisy, Asaello
          EVENT FlagAlways, EventChapter08PattyDaisy_FebailAsaelloTalk

        CHECK_UNIT_DIED FlagChapter08_AltenaDied, Altena
          SET_PERMANENT_FLAG PermanentFlagAltenaDied

        CHECK_UNIT_DIED_TO FlagAlways, IshtarCh08, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagChapter08_IshtarDiedCheck, IshtarCh08
          EVENT FlagChapter08_IshtarDied, EventChapter08IshtarDied

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING FlagChapter08_JuliaCaptureReturn, Julia
          EC_NOP_00

        CHECK_CHILD_TALK FlagAlways, Febail, Seliph
          EVENT FlagAlways, EventChapter08FebailAsaello_SeliphTalk

        CHECK_TALK FlagAlways, Hermina, Hawk
          EVENT FlagAlways, EventChapter08HerminaHawkTalk

        CHECK_TALK FlagAlways, Fee, Ced
          EVENT FlagAlways, EventChapter08FeeCedTalk

        CHECK_TALK FlagAlways, Nanna, Ares
          EVENT FlagAlways, EventChapter08NannaAresTalk

        CHECK_TALK FlagAlways, Ced, Seliph
          EVENT FlagAlways, EventChapter08CedSeliphTalk

        CHECK_CHILD_TALK FlagAlways, Seliph, Tine
          EVENT FlagAlways, EventChapter08Seliph_TineLindaTalk

        CHECK_TALK FlagAlways, Julia, Seliph
          EVENT FlagAlways, EventChapter08JuliaSeliphTalk

        CHECK_CHILD_TALK FlagAlways, Arthur, Fee
          EVENT FlagAlways, EventChapter08ArthurAmid_FeeHerminaTalk

        CHECK_TALK FlagAlways, AdultFinn, Leif
          EVENT FlagAlways, EventChapter08FinnLeifTalk

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 0
          EVENT FlagAlways, EventChapter08CivilianRescued1

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 1
          EVENT FlagAlways, EventChapter08CivilianRescued2

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 2
          EVENT FlagAlways, EventChapter08CivilianRescued3

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 3
          EVENT FlagAlways, EventChapter08CivilianRescued4

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 4
          EVENT FlagAlways, EventChapter08CivilianRescued5

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 5
          EVENT FlagAlways, EventChapter08CivilianRescued6

        VISIT_VILLAGE FlagAlways, Asaello, Ch08_Village3
          EVENT FlagAlways, EventChapter08Village3Asaello

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch08_Village1
          EVENT FlagAlways, EventChapter08Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch08_VillagePowerRing
          EVENT FlagAlways, EventChapter08VillagePowerRing

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch08_Village2
          EVENT FlagAlways, EventChapter08Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch08_Village3
          EVENT FlagAlways, EventChapter08Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch08_Village4
          EVENT FlagAlways, EventChapter08Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch08_VillageThiefBand
          EVENT FlagAlways, EventChapter08VillageThiefBand

        CHECK_SPECIAL_CRIT FlagAlways, 3, BanbaCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_BanbaTriangleAttackQuote, dialogueChapter08BanbaTriangleAttack, 0

        CHECK_SPECIAL_CRIT FlagAlways, 3, FotlaCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_FotlaTriangleAttackQuote, dialogueChapter08FotlaTriangleAttack, 0

        CHECK_SPECIAL_CRIT FlagAlways, 3, EriuCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_EriuTriangleAttackQuote, dialogueChapter08EriuTriangleAttack, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Patty, AnyFactionSlot, Febail
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_PattyDaisy_FebailAsaelloBattleQuote, dialogueChapter08PattyDaisy_FebailAsaelloBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Daisy, AnyFactionSlot, Asaello
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_PattyDaisy_FebailAsaelloBattleQuote, dialogueChapter08PattyDaisy_FebailAsaelloBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Febail, AnyFactionSlot, BloomCh08
          SET_PRECOMBAT_DIALOGUE FlagChapter08_FebailAsaello_BloomBattleQuote, dialogueChapter08FebailAsaello_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Asaello, AnyFactionSlot, BloomCh08
          SET_PRECOMBAT_DIALOGUE FlagChapter08_FebailAsaello_BloomBattleQuote, dialogueChapter08FebailAsaello_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Tine, AnyFactionSlot, IshtarCh08
          SET_PRECOMBAT_DIALOGUE FlagChapter08_TineLinda_IshtarBattleQuote, dialogueChapter08TineLinda_IshtarBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Linda, AnyFactionSlot, IshtarCh08
          SET_PRECOMBAT_DIALOGUE FlagChapter08_TineLinda_IshtarBattleQuote, dialogueChapter08TineLinda_IshtarBattleQuote, $46

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, Tine, AnyFactionSlot, BloomCh08
          SET_PRECOMBAT_DIALOGUE FlagChapter08_TineLinda_BloomBattleQuote, dialogueChapter08TineLinda_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, Linda, AnyFactionSlot, BloomCh08
          SET_PRECOMBAT_DIALOGUE FlagChapter08_TineLinda_BloomBattleQuote, dialogueChapter08TineLinda_BloomBattleQuote, $46

        CHECK_UNITS_FIGHTING_1TO2RANGE FlagAlways, FS_Player, Seliph, AnyFactionSlot, BloomCh08
          SET_PRECOMBAT_DIALOGUE FlagChapter08_SeliphBloomBattleQuote, dialogueChapter08SeliphBloomBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Febail
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_FebailAsaello_BattleQuote, dialogueChapter08FebailAsaello_BattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Asaello
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_FebailAsaello_BattleQuote, dialogueChapter08FebailAsaello_BattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, IshtarCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_IshtarBattleQuote, dialogueChapter08IshtarBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Muhammad
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_MuhammadBattleQuote, dialogueChapter08MuhammadBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Ovo
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_OvoBattleQuote, dialogueChapter08OvoBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, BanbaCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_BanbaBattleQuote, dialogueChapter08BanbaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, FotlaCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_FotlaBattleQuote, dialogueChapter08FotlaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, EriuCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_EriuBattleQuote, dialogueChapter08EriuBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, BloomCh08
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_BloomBattleQuote, dialogueChapter08BloomBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Coulter
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_CoulterBattleQuote, dialogueChapter08CoulterBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Maykov
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter08_MaykovBattleQuote, dialogueChapter08MaykovBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter08_BloomBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter08_FebailAsaello_BloomBattleQuote, FlagChapter08_TineLinda_BloomBattleQuote, FlagChapter08_SeliphBloomBattleQuote]
            SET_FLAG FlagChapter08_BloomBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter08_IshtarBattleQuote
          CHECK_FLAG_SET FlagChapter08_TineLinda_IshtarBattleQuote
            SET_FLAG FlagChapter08_IshtarBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter08_FebailAsaello_BattleQuote
          CHECK_FLAG_SET FlagChapter08_PattyDaisy_FebailAsaelloBattleQuote
            SET_FLAG FlagChapter08_FebailAsaello_BattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter08_BanbaBattleQuote
          CHECK_FLAG_SET FlagChapter08_BanbaTriangleAttackQuote
            SET_FLAG FlagChapter08_BanbaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter08_FotlaBattleQuote
          CHECK_FLAG_SET FlagChapter08_FotlaTriangleAttackQuote
            SET_FLAG FlagChapter08_FotlaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter08_EriuBattleQuote
          CHECK_FLAG_SET FlagChapter08_EriuTriangleAttackQuote
            SET_FLAG FlagChapter08_EriuBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch08Connacht, 1, AnyCharacter
          EVENT FlagChapter08_MuhammadCharge, EventChapter08MuhammadCharge
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch08Connacht, 2, AnyCharacter
          EVENT FlagChapter08_OvoCharge, EventChapter08OvoCharge
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 1, FS_Ch08Connacht, 7, AnyCharacter
          EVENT FlagChapter08_BanbaCharge, EventChapter08BanbaCharge
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 3, FS_Ch08Connacht
          EVENT FlagChapter08_FebailAsaello_Spawn, EventChapter08FebailAsaello_Spawn
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 5, FS_Ch08Connacht
          EVENT FlagChapter08_IshtarSpawn, EventChapter08IshtarSpawn
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR 12, FS_Ch08Connacht
          CHECK_UNIT_ALIVE IshtarCh08
            EVENT FlagChapter08_IshtarLeave, EventChapter08IshtarLeave
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch08Munster
          CHECK_FLAG_SET FlagChapter08_ConnachtSeizedCheck
            EVENT FlagChapter08_MeathSpawn, EventChapter08MeathSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch08Meath, 3, AnyCharacter
          CHECK_FLAG_SET FlagChapter08_AltenaOnMountainCheck
            EVENT FlagChapter08_CoulterCharge, EventChapter08CoulterCharge
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch08Meath
          CHECK_FLAG_SET FlagChapter08_SeliphCedTalk
            CHECK_UNIT_ALIVE Maykov
              EVENT FlagChapter08_MunsterSavedMaykovReaction, EventChapter08MunsterSavedMaykovReaction
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_UNITS_MARRIED Seliph, AnyCharacter
          SET_FLAG FlagChapter08_MuirneSeliphAdjacent
        BREAK_STATE_CHECKS

        CHECK_UNITS_MARRIED Muirne, AnyCharacter
          SET_FLAG FlagChapter08_MuirneSeliphAdjacent
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter08_MeathSpawn
          CHECK_FLAG_SET FlagChapter08_MuirneSeliphAdjacentCheck
            CHECK_PERMANENT_FLAG_UNSET PermanentFlagPlayerDeathInGen2
              EVENT FlagChapter08_MuirneSeliphAdjacent, EventChapter08MuirneSeliphAdjacent
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter08_MuirneSeliphAdjacentCheck
          CHECK_FLAG_UNSET FlagChapter08_MuirneSeliphAdjacent
            UNSET_FLAG FlagChapter08_MuirneSeliphAdjacentCheck
        BREAK_STATE_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter08_LindaOnTree, FlagChapter08_AmidOnTreeCheck]
          EVENT FlagChapter08_AmidOnTree, EventChapter08AmidOnTree
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter08_AmidOnTreeCheck
          CHECK_FLAG_UNSET FlagChapter08_AmidOnTree
            UNSET_FLAG FlagChapter08_AmidOnTreeCheck
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter08ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter08ClearTalksIfMarriedTable ; 86/F2D7

        .byte Fee, Arthur
        .byte Hermina, Arthur
        .byte Fee, Amid
        .byte Hermina, Amid
        .byte Tine, Seliph
        .byte Linda, Seliph
        .word $FFFF

    .endsection Chapter08EventsSection

    .section Chapter08EventDataSection

      aChapter08EventData ; 86/F2E5

        .structChapterEventData aChapter08LocationData, aChapter08MapChangeData, aUnknown86F370, aChapter08TalkEvents, None

      aChapter08LocationData ; 86/F2EF

        .byte size(aChapter08LocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/Chapter08LocationData.csv.asm"

      aChapter08UlsterCastle ; 86/F306

        .structChapterCastleLocationEntry Ch08_Ulster, UlsterName, [3, 35], $FC, aChapter08ShopData

      aChapter08LeonsterCastle ; 86/F30E

        .structChapterCastleLocationEntry Ch08_Leonster, LeonsterName, [8, 6], $FC, None

      aChapter08ConnachtCastle ; 86/F316

        .structChapterCastleLocationEntry Ch08_Connacht, ConnachtName, [49, 8], $FC, None

      aChapter08MunsterCastle ; 86/F31E

        .structChapterCastleLocationEntry Ch08_Munster, MunsterName, [44, 28], $FC, None

      aChapter08MeathCastle ; 86/F326

        .structChapterCastleLocationEntry Ch08_Meath, MeathName, [37, 57], $00, None

      aChapter08Village1 ; 86/F32E

        .structChapterVillageLocationEntry Ch08_Village1, [26, 22]

      aChapter08VillagePowerRing ; 86/F333

        .structChapterVillageLocationEntry Ch08_VillagePowerRing, [33, 2]

      aChapter08Village2 ; 86/F338

        .structChapterVillageLocationEntry Ch08_Village2, [39, 23]

      aChapter08Village3 ; 86/F33D

        .structChapterVillageLocationEntry Ch08_Village3, [46, 6]

      aChapter08Village4 ; 86/F342

        .structChapterVillageLocationEntry Ch08_Village4, [56, 28]

      aChapter08VillageThiefBand ; 86/F347

        .structChapterVillageLocationEntry Ch08_VillageThiefBand, [53, 44]

      aChapter08ShopData ; 86/F34C

        .byte PI_SteelSword2
        .byte PI_SlimSword1
        .byte PI_ThunderSword
        .byte PI_Armorslayer1
        .byte PI_SteelLance1
        .byte PI_SteelLance2
        .byte PI_SteelLance3
        .byte PI_SilverAxe
        .byte PI_IronBow1
        .byte PI_SteelBow2
        .byte PI_Fire1
        .byte PI_Thunder2
        .byte PI_Wind1
        .byte PI_MendStaff1
        .byte PI_SilenceStaff

        .byte PI_IronSword6
        .byte PI_IronLance4
        .byte PI_IronBow2
        .byte PI_Light1
        .byte PI_HealStaff3
        .byte PI_MendStaff3
        .word $FFFF

      aChapter08MapChangeData ; 86/F363

        .structChapterMapChangeEntry Chapter08, FlagChapter08_ConnachtBridgeLowered, [49, 16], aChapter08MapChangeConnachtBridge
        .word $FFFF

      aChapter08MapChangeConnachtBridge ; 86/F36C

        .byte 1
        .byte 1

        .word $00BE

      aUnknown86F370 ; 86/F370

        .word <>aUnknown86F374
        .word <>aUnknown86F384

      aUnknown86F374 ; 86/F374

        .word $0215
        .word $0216
        .word $0217
        .word $0218
        .word $021A
        .word $021B
        .word $021C
        .word $FFFF

      aUnknown86F384 ; 86/F384

        .word $0215
        .word $0216
        .word $0217
        .word $0219
        .word $021A
        .word $021B
        .word $021D
        .word $FFFF

      aChapter08TalkEvents ; 86/F394

        .structChapterTalkEventEntry Chapter08, FlagChapter08_Seliph_CedHawkTalkCheck, Seliph, Ced
        .structChapterTalkEventEntry Chapter08, FlagChapter08_Seliph_CedHawkTalkCheck, Seliph, Hawk
        .structChapterTalkEventEntry Chapter08, FlagChapter08_PattyDaisy_FebailAsaelloTalkCheck, Patty, Febail
        .structChapterTalkEventEntry Chapter08, FlagChapter08_PattyDaisy_FebailAsaelloTalkCheck, Daisy, Asaello
        .word $FFFF

      aFactionGroupData2D ; 86/F3B6

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData2D._Locations, None

        _Locations ; 86/F3BF
        .word Ch08_Ulster
        .word Ch08_Leonster
        .word $FFFF

      aFactionGroupData2E ; 86/F3C5

        .structFactionGroupData FactionConnacht, BattleHUDColorBrown, BattleBannerFreege, None, aFactionGroupData2E._Locations, aFactionGroupData2E._GroupAI

        _Locations ; 86/F3CE
        .word Ch08_Connacht
        .word $FFFF

        _GroupAI ; 86/F3D2
        .long aFactionGroup2EAI1
        .long aFactionGroup2EAI2
        .long aFactionGroup2EAI3
        .long aFactionGroup2EAI4
        .long aFactionGroup2EAI5
        .long aFactionGroup2EAI6
        .long aFactionGroup2EAI7
        .long aFactionGroup2EAI8
        .word $FFFF

      aFactionGroupData2F ; 86/F3EC

        .structFactionGroupData FactionMunster, BattleHUDColorBrown, BattleBannerFreege, None, aFactionGroupData2F._Locations, aFactionGroupData2F._GroupAI

        _Locations ; 86/F3F5
        .word Ch08_Munster
        .word $FFFF

        _GroupAI ; 86/F3F9
        .long aFactionGroup2FAI1
        .long aFactionGroup2FAI2
        .long aFactionGroup2FAI3
        .word $FFFF

      aFactionGroupData46 ; 86/F404

        .structFactionGroupData FactionMunster, BattleHUDColorBrown, BattleBannerSilesse, None, aFactionGroupData46._Locations, aFactionGroupData46._GroupAI

        _Locations ; 86/F40D
        .word Ch08_Munster
        .word $FFFF

        _GroupAI ; 86/F411
        .long aFactionGroup2FAI1
        .long aFactionGroup2FAI2
        .long aFactionGroup2FAI3
        .word $FFFF

      aFactionGroupData30 ; 86/F41C

        .structFactionGroupData FactionMeath, BattleHUDColorBrown, BattleBannerThracia, None, aFactionGroupData30._Locations, aFactionGroupData30._GroupAI

        _Locations ; 86/F425
        .word Ch08_Meath
        .word $FFFF

        _GroupAI ; 86/F429
        .long aFactionGroup30AI1
        .long aFactionGroup30AI2
        .long aFactionGroup30AI3
        .long aFactionGroup30AI4
        .long aFactionGroup30AI5
        .long aFactionGroup30AI6
        .long aFactionGroup30AI7
        .long aFactionGroup30AI8
        .word $FFFF

      aFactionGroup2EAI1 ; 86/F443

        AI_SET_FORMATION $0C, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch08_Ulster, $01
        AI_06 Ch08_Leonster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI2 ; 86/F454

        AI_SET_FORMATION $08, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch08_Leonster, $01
        AI_06 Ch08_Ulster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI3 ; 86/F465

        AI_SET_FORMATION $05, $03
        AI_0B
        AI_END

      aFactionGroup2EAI4 ; 86/F46A

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Daisy_Patty
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI5 ; 86/F46E

        AI_0B
        AI_END

      aFactionGroup2EAI6 ; 86/F470

        AI_07 Ch08_Connacht, $05
        AI_END

      aFactionGroup2EAI7 ; 86/F474

        AI_1D
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI8 ; 86/F477

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2FAI1 ; 86/F479

        AI_07 Ch08_Munster, $05
        AI_END

      aFactionGroup2FAI2 ; 86/F47D

        ; Wrong flag?
        AI_FLAG_IF_LEADER_ON_COORDS Chapter08, FlagChapter08_FotlaTriangleAttackQuote, [49, 10]
        AI_END

      aFactionGroup2FAI3 ; 86/F484

        AI_END

      aFactionGroup30AI1 ; 86/F485

        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_06 Ch08_Leonster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup30AI2 ; 86/F495

        AI_CHECK_GROUP_COMPLETE_BY_TURN_DIVISIBLE 1
        AI_SET_FORMATION $03, $00
        AI_0A
        AI_END

      aFactionGroup30AI3 ; 86/F49C

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter08, FlagChapter08_AltenaOnMountainCheck, +

          AI_02 $06
          AI_FLAG_IF_LEADER_ON_COORDS Chapter08, FlagChapter08_AltenaOnMountainCheck, [46, 40]
          AI_0B
          AI_END

        +
        AI_12
        AI_END

      aFactionGroup30AI4 ; 86/F4B3

        AI_0B
        AI_END

      aFactionGroup30AI5 ; 86/F4B5

        AI_07 Ch08_Meath, $04
        AI_END

      aFactionGroup30AI6 ; 86/F4B9

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup30AI7 ; 86/F4BC

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter08, FlagChapter08_ConnachtSeizedCheck, +

          AI_0B
          AI_END

        +
        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup30AI8 ; 86/F4C7

        AI_0A
        AI_END

    .endsection Chapter08EventDataSection
