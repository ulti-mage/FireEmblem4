
    .weak

      Flag_Unknown0                     :=  0
      Flag_Unknown1                     :=  1
      Flag_Unknown2                     :=  2
      Flag_Unknown3                     :=  3
      Flag_Unknown4                     :=  4

      Flag_Unknown6                     :=  6
      Flag_Unknown7                     :=  7

      Flag_Unknown10                    := 10
      Flag_Unknown11                    := 11
      Flag_Unknown12                    := 12
      Flag_Unknown13                    := 13

      Flag_Unknown20                    := 20

      Flag_KutuzovBattleQuote           := 24
      Flag_LizaBattleQuote              := 25
      Flag_IshtoreBattleQuoteCheck      := 26
      Flag_JavarroBattleQuote           := 27
      Flag_BramselBattleQuote           := 28
      Flag_BanbaBattleQuote             := 29
      Flag_Unknown30                    := 30
      Flag_FotlaBattleQuote             := 31
      Flag_Unknown32                    := 32
      Flag_EriuBattleQuote              := 33
      Flag_Unknown34                    := 34
      Flag_TineBattleQuote              := 35
      Flag_BloomBattleQuote             := 36

      Flag_Unknown38                    := 38

      Flag_Unknown40                    := 40

      Flag_Unknown42                    := 42
      Flag_Unknown43                    := 43
      Flag_Unknown44                    := 44
      Flag_Unknown45                    := 45

      Flag_Unknown47                    := 47
      Flag_Unknown48                    := 48
      Flag_IshtoreBattleQuote           := 49
      Flag_LizaDied                     := 50
      Flag_IshtoreDiedInCombat          := 51
      Flag_IshtoreAlternateDeathQuote   := 52
      Flag_Unknown53                    := 53
      Flag_Unknown54                    := 54

      Flag_Unknown56                    := 56
      Flag_Unknown57                    := 57
      Flag_ArthurTineBattleQuote        := 58
      Flag_AresBramselBattleQuote       := 59
      Flag_AresJavarroBattleQuote       := 60
      Flag_TineBloomBattleQuote         := 61
      Flag_ArthurBloomBattleQuote       := 62
      Flag_LeifBloomBattleQuote         := 63

    .endweak

    .section Chapter07EventsSection

      aChapter07EventHeader ; 86/E6FF

        .word Chapter07
        .long aChapter07OpeningEvent
        .long aChapter07MapEvents

      aChapter07OpeningEvent ; 86/E707

        REGISTER_UNITGROUP_MAP_SPRITES $21

        LOAD_FACTION_GROUP 0, FG_Ch07Seliph
        LOAD_FACTION_GROUP 1, FG_Ch07Aed
        LOAD_FACTION_GROUP 2, FG_Ch07Dahna
        LOAD_FACTION_GROUP 3, FG_Ch07Melgen
        LOAD_FACTION_GROUP 4, FG_Ch07Ulster
        LOAD_FACTION_GROUP 5, FG_Ch07Leif

        macroSetFactionsEnemies [0, 1]
        macroSetFactionsNeutral [0, 2]
        macroSetFactionsEnemies [0, 3]
        macroSetFactionsEnemies [0, 4]
        macroSetFactionsAllies  [0, 5]
        macroSetFactionsAllies  [1, 2]
        macroSetFactionsAllies  [1, 3]
        macroSetFactionsAllies  [1, 4]
        macroSetFactionsEnemies [1, 5]
        macroSetFactionsNeutral [2, 3]
        macroSetFactionsAllies  [2, 4]
        macroSetFactionsEnemies [2, 5]
        macroSetFactionsAllies  [3, 4]
        macroSetFactionsEnemies [3, 5]
        macroSetFactionsEnemies [4, 5]

        DEPLOY_UNIT_GROUP $21

        SET_FLAG Flag_Unknown54
        SET_FLAG Flag_Unknown44

        UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

        EVENT $FF, $00F6

        END_CHAPTER_EVENTS

      aChapter07MapEvents ; 86/E764

        CHECK_SEIZING_CASTLE Flag_Unknown0, $0000, $0001
          EVENT $FF, $00F8

        CHECK_SEIZING_CASTLE Flag_Unknown1, $0000, $0003
          EVENT $FF, $00FC

        CHECK_SEIZING_CASTLE Flag_Unknown2, $0000, $0002
          EVENT $FF, $0101

        CHECK_SEIZING_CASTLE Flag_Unknown47, $0000, $0004
          EVENT $FF, $0116

        CHECK_SEIZING_CASTLE Flag_Unknown3, $0000, $0005
          EVENT $FF, $0103

        CHECK_UNIT_DIED $FF, $FFFF, $0000
          SET_PERMANENT_FLAG 89
        
        EC_16 Flag_Unknown40, Arthur, Tine
          EVENT $FF, $0105

        EC_16 $FF, Shannan, Patty
          EVENT $FF, $01EB

        CHECK_TALK $FF, Seliph, Shannan
          EVENT $FF, $01EC

        EC_16 $FF, Oifey, Diarmuid
          EVENT $FF, $01ED

        EC_16 $FF, Larcei, Shannan
          EVENT $FF, $01EE

        EC_16 $FF, Patty, Seliph
          EVENT $FF, $01EF

        CHECK_TALK $FF, Ares, Seliph
          EVENT $FF, $01F0

        CHECK_TALK $FF, Leif, Seliph
          EVENT $FF, $01F1

        CHECK_TALK $FF, Diarmuid, Nanna
          EVENT $FF, $01F2

        CHECK_TALK $FF, Tristan, Jeanne
          EVENT $FF, $01F3

        EC_16 $FF, Tine, Seliph
          EVENT $FF, $01F4

        EC_16 $FF, Lene, Seliph
          EVENT $FF, $01F5

        CHECK_TALK $FF, OldFinn, Nanna
          EVENT $FF, $01F6

        CHECK_TALK $FF, OldFinn, Lana
          EVENT $FF, $01F7

        CHECK_TALK $FF, OldFinn, Larcei
          EVENT $FF, $01F8

        CHECK_ENTERING_CASTLE_MENU Flag_Unknown38, Ares, $0002
          EVENT $FF, $0106

        CHECK_UNIT_DIED Flag_LizaDied, Liza, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_Unknown43, Ares, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_Unknown45, Javarro, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED_TO $FF, Banba1, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED $FF, Banba1, $FFFF
          EVENT $FF, $0111

        CHECK_UNIT_DIED_TO $FF, Fotla1, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED $FF, Fotla1, $FFFF
          EVENT $FF, $0112

        CHECK_UNIT_DIED_TO $FF, Eriu1, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED $FF, Eriu1, $FFFF
          EVENT $FF, $0113

        CHECK_UNIT_DIED_TO $FF, Bloom, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED $FF, Bloom, $FFFF
          EVENT $FF, $0114

        CHECK_UNITS_WITHIN_DISTANCE Flag_Unknown54, Daisy, Shannan, $01, $FF
          EVENT $FF, $0122

        CHECK_UNITS_WITHIN_DISTANCE Flag_Unknown56, Dalvin, Tristan, $01, $FF
          EC_NOP_00

        CHECK_UNITS_WITHIN_DISTANCE Flag_Unknown56, Tristan, Dalvin, $01, $FF
          EC_NOP_00

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING Flag_Unknown42, $002B
          EC_NOP_00

        CHECK_TALK Flag_Unknown53, AnyCharacter, DahnaArmy1
          EVENT $FF, $0120


        VISIT_VILLAGE $FF, Laylea, $0007
          EVENT $FF, $0121

        VISIT_VILLAGE $FF, AnyCharacter, $0006
          EVENT $FF, $0108

        VISIT_VILLAGE $FF, AnyCharacter, $0007
          EVENT $FF, $0109

        VISIT_VILLAGE $FF, AnyCharacter, $0008
          EVENT $FF, $010A

        VISIT_VILLAGE $FF, AnyCharacter, $0009
          EVENT $FF, $010B

        VISIT_VILLAGE $FF, AnyCharacter, $000A
          EVENT $FF, $010C

        VISIT_VILLAGE $FF, AnyCharacter, $000B
          EVENT $FF, $010D

        CHECK_SPECIAL_CRIT $FF, $0003, Banba1
          SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown30, $B1CD7C, $00

        CHECK_SPECIAL_CRIT $FF, $0003, Fotla1
          SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown32, $B1CDA8, $00

        CHECK_SPECIAL_CRIT $FF, $0003, Eriu1
          SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown34, $B1CDD0, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Arthur, $FFFF, Tine
          SET_PRECOMBAT_DIALOGUE Flag_ArthurTineBattleQuote, $B0DE30, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, Amid, $FFFF, Linda
          SET_PRECOMBAT_DIALOGUE Flag_ArthurTineBattleQuote, $B0DE30, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, Ares, $FFFF, Bramsel
          SET_PRECOMBAT_DIALOGUE Flag_AresBramselBattleQuote, $B0DE78, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, Ares, $FFFF, Javarro
          SET_PRECOMBAT_DIALOGUE Flag_AresJavarroBattleQuote, $B0DEFA, $0043

        CHECK_UNITS_FIGHTING $FF, $0000, Tine, $FFFF, Bloom
          SET_PRECOMBAT_DIALOGUE Flag_TineBloomBattleQuote, $B0DF4C, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Linda, $FFFF, Bloom
          SET_PRECOMBAT_DIALOGUE Flag_TineBloomBattleQuote, $B0DF4C, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Arthur, $FFFF, Bloom
          SET_PRECOMBAT_DIALOGUE Flag_ArthurBloomBattleQuote, $B0DF90, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Amid, $FFFF, Bloom
          SET_PRECOMBAT_DIALOGUE Flag_ArthurBloomBattleQuote, $B0DF90, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Leif, $FFFF, Bloom
          SET_PRECOMBAT_DIALOGUE Flag_LeifBloomBattleQuote, $B0E01A, $0046

        CHECK_UNITS_FIGHTING Flag_IshtoreBattleQuoteCheck, $0000, $FFFF, $FFFF, Ishtore
          EC_NOP_00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Kutuzov
          SET_BATTLE_OR_DEATH_QUOTE Flag_KutuzovBattleQuote, $B1D216, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Kutuzov2
          SET_BATTLE_OR_DEATH_QUOTE Flag_KutuzovBattleQuote, $B1D216, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Liza
          SET_BATTLE_OR_DEATH_QUOTE Flag_LizaBattleQuote, $B1D25B, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Javarro
          SET_BATTLE_OR_DEATH_QUOTE Flag_JavarroBattleQuote, $B1D2EB, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Bramsel
          SET_BATTLE_OR_DEATH_QUOTE Flag_BramselBattleQuote, $B1D307, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Banba1
          SET_BATTLE_OR_DEATH_QUOTE Flag_BanbaBattleQuote, $B1D342, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Fotla1
          SET_BATTLE_OR_DEATH_QUOTE Flag_FotlaBattleQuote, $B1D35B, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Eriu1
          SET_BATTLE_OR_DEATH_QUOTE Flag_EriuBattleQuote, $B1D372, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Tine
          SET_BATTLE_OR_DEATH_QUOTE Flag_TineBattleQuote, $B1D38C, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Linda
          SET_BATTLE_OR_DEATH_QUOTE Flag_TineBattleQuote, $B1D38C, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Bloom
          SET_BATTLE_OR_DEATH_QUOTE Flag_BloomBattleQuote, $B1D3A0, $00

        CHECK_UNIT_DIED_TO Flag_IshtoreDiedInCombat, Ishtore, $FFFF
          EC_NOP_00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET Flag_IshtoreBattleQuote
          CHECK_FLAG_SET Flag_IshtoreBattleQuoteCheck
            CHECK_FLAG_UNSET Flag_LizaDied
              SET_BATTLE_OR_DEATH_QUOTE Flag_IshtoreBattleQuote, $B1D2CC, $00
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_IshtoreBattleQuote
          CHECK_FLAG_SET Flag_IshtoreBattleQuoteCheck
            CHECK_FLAG_SET Flag_LizaDied
              SET_BATTLE_OR_DEATH_QUOTE Flag_IshtoreBattleQuote, $B1D2AA, $00
        BREAK_STATE_CHECKS

        UNSET_FLAG Flag_IshtoreBattleQuoteCheck

        CHECK_FLAG_SET Flag_IshtoreDiedInCombat
          CHECK_FLAG_UNSET Flag_IshtoreAlternateDeathQuote
            CHECK_FLAG_UNSET Flag_LizaDied
              SET_BATTLE_OR_DEATH_QUOTE Flag_IshtoreAlternateDeathQuote, $8EEA5A, $01
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_TineBattleQuote
          CHECK_FLAG_SET Flag_ArthurTineBattleQuote
            SET_FLAG Flag_TineBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_BramselBattleQuote
          CHECK_FLAG_SET Flag_AresBramselBattleQuote
            SET_FLAG Flag_BramselBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_JavarroBattleQuote
          CHECK_FLAG_SET Flag_AresJavarroBattleQuote
            SET_FLAG Flag_JavarroBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_BloomBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_TineBloomBattleQuote, Flag_ArthurBloomBattleQuote, Flag_LeifBloomBattleQuote]
            SET_FLAG Flag_BloomBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_BanbaBattleQuote
          CHECK_FLAG_SET Flag_Unknown30
            SET_FLAG Flag_BanbaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_FotlaBattleQuote
          CHECK_FLAG_SET Flag_Unknown32
            SET_FLAG Flag_FotlaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_EriuBattleQuote
          CHECK_FLAG_SET Flag_Unknown34
            SET_FLAG Flag_EriuBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $02, $02, $00, $0000
          EVENT Flag_Unknown4, $00F7
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $0C, $01, $FF, $FFFF
          CHECK_UNIT_ALIVE Kutuzov
            EVENT Flag_Unknown48, $0115
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $02, $00, $0000
          CHECK_FLAG_SET Flag_Unknown6
            EVENT Flag_Unknown7, $00FA
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $02, $00, $0000
          CHECK_FLAG_SET Flag_Unknown0
            EVENT Flag_Unknown6, $00F9
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $01, $FFFF
          CHECK_FLAG_SET Flag_Unknown10
            EVENT Flag_Unknown11, $00FE
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $02, $00, $0000
          CHECK_FLAG_SET Flag_Unknown1
            EVENT Flag_Unknown10, $00FD
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CHECK_FLAG_SET Flag_Unknown10
            EVENT Flag_Unknown12, $00FF
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $03, $FFFF
          EVENT Flag_Unknown13, $0100
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $04, $FFFF
          EVENT Flag_Unknown20, $0107
        BREAK_TURN_EVENT_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown56, Flag_Unknown1]
          EVENT Flag_Unknown57, $0123
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown56
          CHECK_FLAG_UNSET Flag_Unknown57
            UNSET_FLAG Flag_Unknown56
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CLEAR_TALK_IF_ONE_MARRIED aUnknown86EBC6
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aUnknown86EBC6 ; 86/EBC6

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

        .structChapterMapChangeEntry Chapter07,  0, [18, 6],  aChapter07MapChangeAedPassage
        .structChapterMapChangeEntry Chapter07, 44, [44, 55], aChapter07MapChangeUlsterLeftRampart
        .structChapterMapChangeEntry Chapter07, 44, [51, 52], aChapter07MapChangeUlsterTopRampart
        .structChapterMapChangeEntry Chapter07, 44, [56, 55], aChapter07MapChangeUlsterRightRampart
        .structChapterMapChangeEntry Chapter07, 55, [44, 55], aChapter07MapChangeUlsterRemoveLeftRampart
        .structChapterMapChangeEntry Chapter07, 55, [51, 52], aChapter07MapChangeUlsterRemoveTopRampart
        .structChapterMapChangeEntry Chapter07, 55, [56, 55], aChapter07MapChangeUlsterRemoveRightRampart
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

        .structChapterTalkEventEntry Chapter07, 40, Arthur, Tine
        .structChapterTalkEventEntry Chapter07, 40, Amid, Linda
        .structChapterTalkEventEntry Chapter07, 53, $FFFF, DahnaArmy1
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
