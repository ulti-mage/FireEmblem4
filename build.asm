
.cpu "65816"

  crossbankRawMissing   := 0
  crossbankRawRemaining := b""

  crossbankRaw .segment Block
    crossbankRawMissing   := $10000 - (* & $FFFF)
    crossbankRawRemaining := \Block[crossbankRawMissing:]
    .text \Block[:crossbankRawMissing]
  .endsegment

  crossbankRawRemainder .segment
    .text crossbankRawRemaining
  .endsegment

  crossbank .namespace

    Remainder := b""

    start .function Filename: binary, Address=None

      .if ( Address == None )
        Address := *
      .endif

      Remainder ::= Filename[$8000 - (Address & $FFFF):]
      .text Filename[:$8000 - (Address & $FFFF)]

    .endfunction

    end .segment

      .text crossbank.Remainder

    .endsegment

  .endnamespace ; crossbank




  ; Bugfix idea:
  ; remove the first CMP in rsUnknown86B6BE, so AI units without
  ; the groupleader flag respect the ignored generation ID.
  ; Ayras AI is supposed to ignore Sigurd, but since she isnt a group
  ; leader she goes after him anyway.



  ; 7e2c42 quan current hp
  ; 7e2c66 midir current hp

  ; 29D4
  ; 7E2D40 sigurd stats

  ; 277C
  ; 7e2b46 deirdre hp


.include "SRC/BaseRom.asm"
.include "LIB/LibraryHelpers.h"
.include "LIB/IORegisters.h"
.include "LIB/WRAM.inc"
.include "LIB/Constants.inc"
.include "LIB/Macros.inc"
.include "LIB/MenuText.inc"
.include "LIB/Procs.h"
.include "LIB/Events.h"
.include "LIB/AI.h"
.include "LIB/Palettes.h"
.include "LIB/Dialogue.h"
.include "LIB/Sprites.h"
.include "LIB/Tiles.h"
.include "LIB/DMA.h"
.include "LIB/HDMA.h"
.include "LIB/PermanentFlags.h"


  ROM = binary("fe4.sfc")

.include "SRC/Debug.asm"
.include "SRC/Proc.asm"
.include "SRC/HDMA.asm"
.include "SRC/Decompressor.asm"
.include "SRC/Dialogue.asm"
.include "SRC/ActiveSpriteEngine.asm"

.include "SRC/Bank80.asm"
.include "SRC/Bank81.asm"
.include "SRC/Bank82.asm"
.include "SRC/Bank84.asm"
.include "SRC/Bank85.asm"
.include "SRC/Bank87.asm"
.include "SRC/Bank89.asm"
.include "SRC/Bank8A.asm"
.include "SRC/Bank8B.asm"
.include "SRC/Bank91.asm"


.include "EVENTS/ChapterPrologue.asm"
.include "EVENTS/Chapter01.asm"
.include "EVENTS/Chapter02.asm"
.include "EVENTS/Chapter03.asm"
.include "EVENTS/Chapter04.asm"
.include "EVENTS/Chapter05.asm"
.include "EVENTS/Chapter06.asm"
.include "EVENTS/Chapter07.asm"
.include "EVENTS/Chapter08.asm"
.include "EVENTS/Chapter09.asm"
.include "EVENTS/Chapter10.asm"
.include "EVENTS/ChapterFinal.asm"
.include "EVENTS/ChapterEpilogue.asm"











    * = $008223
    .logical $808223

      .dsection Code808223Section

      ; 80/823F

    .here

    * = $009D4F
    .logical $809D4F

      .dsection Code809D4FSection

      ; 80/9DD9

    .here

    * = $00A096
    .logical $80A096

      .dsection Code80A096Section

      ; 80/A1AB

    .here


    * = $00A5E9
    .logical $80A5E9

      .dsection Code80A5E9Section

      ; 80/A678

    .here





    * = $00A6C3
    .logical $80A6C3

      .dsection Code80A6C3Section

      ; 80/A773

    .here


    * = $00A899
    .logical $80A899

      .dsection Code80A899Section

      ; 80/A9F2

    .here

    * = $00AA02
    .logical $80AA02

      .dsection DecompressorSection

      ; 80/AD24

    .here

    * = $00C1CB
    .logical $80C1CB

      .dsection Code80C1CBSection

      ; 80/C212

    .here


    * = $00E42B
    .logical $80E42B

      .dsection Code80E42BSection

      ; 80/E586

    .here



    * = $018000
    .logical $818000

      .dsection ActiveSpriteEngineSection

      ; 8188b0

    .here



    * = $018ECB
    .logical $818ECB

      .dsection Code818ECBSection

      ; 81/8FA1

    .here



    * = $01B483
    .logical $81B483

      .dsection Code81B483Section

      ; 81/B4C5

    .here




    * = $01C000
    .logical $81C000

      aUNITGroupPointers                  .include "TABLES/UNITGroupPointers.csv.asm"
      aUNITGroupDataPrologueStart         .binclude "TABLES/EVENTUNIT/UNITGroupDataPrologueStart.csv.asm"
      aUNITGroupDataPrologueEvans         .binclude "TABLES/EVENTUNIT/UNITGroupDataPrologueEvans.csv.asm"
      aUNITGroupDataChapter01Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Start.csv.asm"
      aUNITGroupDataChapter01Marpha       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Marpha.csv.asm"
      aUNITGroupDataChapter01Heirhein     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Heirhein.csv.asm"
      aUNITGroupDataChapter01Nordion      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Nordion.csv.asm"
      aUNITGroupDataChapter01Verdane      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Verdane.csv.asm"
      aUNITGroupDataChapter01Brigands     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Brigands.csv.asm"
      aUNITGroupDataChapter02Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Start.csv.asm"
      aUNITGroupDataChapter02Yellows      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Yellows.csv.asm"
      aUNITGroupDataChapter02Infini       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Infini.csv.asm"
      aUNITGroupDataChapter02Mackily      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Mackily.csv.asm"
      aUNITGroupDataChapter02Agusti       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Agusti.csv.asm"
      aUNITGroupDataChapter03Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Start.csv.asm"
      aUNITGroupDataChapter03Sylvale      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Sylvale.csv.asm"
      aUNITGroupDataChapter03Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Thracia.csv.asm"
      aUNITGroupDataChapter03Orgahil      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Orgahil.csv.asm"
      aUNITGroupDataChapter03DozelFriege  .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03DozelFriege.csv.asm"
      aUNITGroupDataChapter04Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Start.csv.asm"
      aUNITGroupDataChapter04Donovan      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Donovan.csv.asm"
      aUNITGroupDataChapter04Pamela       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Pamela.csv.asm"
      aUNITGroupDataChapter04Annand       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Annand.csv.asm"
      aUNITGroupDataChapter04Andrey       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Andrey.csv.asm"
      aUNITGroupDataChapter04Zaxon        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Zaxon.csv.asm"
      aUNITGroupDataChapter05Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Start.csv.asm"
      aUNITGroupDataChapter05Leonster     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Leonster.csv.asm"
      aUNITGroupDataChapter05Phinora      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Phinora.csv.asm"
      aUNITGroupDataChapter05Velthomer    .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Velthomer.csv.asm"
      aUNITGroupDataChapter05Belhalla     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Belhalla.csv.asm"
      aUNITGroupDataChapter05Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Thracia.csv.asm"


    .here




    * = $028000
    .logical $828000

      .dsection ProcEngineSection
      .dsection ProcCodeSection
      .dsection Code828299Section

      ; 82/83B5

    .here


    * = $028A30
    .logical $828A30

      .dsection Code828A30Section

      ; 82/8B2B

    .here


    * = $028F3F
    .logical $828F3F

      .dsection Code828F3FSection

      ; 82/90B0

    .here


    * = $02921E
    .logical $82921E

      .dsection Code82921ESection

      ; 82/9245

    .here


    * = $02C000
    .logical $82C000

      .dsection HDMAEngineSection
      .dsection HDMACodeSection

      ; 82/C26D

    .here



    * = $02E41B
    .logical $82E41B

      .dsection Code82E41BSection

      ; 82/E5FF

    .here


    * = $02E747
    .logical $82E747

      .dsection Code82E747Section

      ; 82/EA43

    .here


    * = $02ECB9
    .logical $82ECB9

      .dsection Code82ECB9Section

      ; 82/ED1D

    .here


    * = $02EDE7
    .logical $82EDE7

      .dsection Code82EDE7Section

      ; 82/F207

    .here

    * = $02F4DE
    .logical $82F4DE

      .dsection Code82F4DEESection

      ; 82/F4F9

    .here

    * = $02F567
    .logical $82F567

      .dsection Code82F567Section

      ; 82/F7A2

    .here



    * = $038000
    .logical $838000

      aMainDataOffsets .block ; 83/8000

        CharacterNameOffsets    .word <>aCharacterNameOffsets     - aMainDataOffsets ; $00
        CharacterDataOffsets    .word <>aCharacterDataOffsets     - aMainDataOffsets ; $02
        ClassNameOffsets        .word <>aClassNameOffsets         - aMainDataOffsets ; $04
        ClassDataOffsets        .word <>aClassDataOffsets         - aMainDataOffsets ; $06
        MovementCostOffsets     .word <>aMovementCostOffsets      - aMainDataOffsets ; $08
        TerrainAvoidOffsets     .word <>aTerrainAvoidOffsets      - aMainDataOffsets ; $0A
        ItemNameOffsets         .word <>aItemNameOffsets          - aMainDataOffsets ; $0C
        ItemDescriptionOffsets  .word <>aItemDescriptionOffsets   - aMainDataOffsets ; $0E
        ItemDataOffsets         .word <>aItemDataOffsets          - aMainDataOffsets ; $10
                                .word <>aUnknown83D8E6            - aMainDataOffsets ; $12
        FactionNameOffsets      .word <>aFactionNameOffsets       - aMainDataOffsets ; $14
      .bend

      aClassWeaknessTable .binclude "TABLES/ClassWeakness.asm"                                     ; 83/8016
      aClassMapSpriteAssignmentOffsets .binclude "TABLES/ClassMapSpriteAssignmentOffsets.csv.asm"  ; 83/805E
      aClassMapSpriteAssignment .include "TABLES/ClassMapSpriteAssignment.asm"                     ; 83/80EE
      aPromotionTable .binclude "TABLES/PromotionTable.asm"                                        ; 83/833C
      aTerrainNameOffsets .include "TABLES/TerrainNameOffsets.csv.asm"                             ; 83/837B
      aTerrainNames .binclude "TEXT/MENUTEXT/TerrainNames.asm"                                     ; 83/83AF
      aMaleLoveDataIDs .include "TABLES/MaleLoveDataIDs.csv.asm"                                   ; 83/848D
        .sint -1
      aFemaleLoveDataIDs .include "TABLES/FemaleLoveDataIDs.csv.asm"                               ; 83/84DB
        .sint -1
      aLoveBaseOffsets .include "TABLES/LoveBaseOffsets.csv.asm"                                   ; 83/850F
      aGen1LoveBases .binclude "TABLES/Gen1LoveBases.csv.asm"                                      ; 83/8541
      aGen2LoveBases .binclude "TABLES/Gen2LoveBases.csv.asm"                                      ; 83/85C8
      aLoveGrowthOffsets  .include "TABLES/LoveGrowthOffsets.csv.asm"                              ; 83/8738
      aGen1LoveGrowths .binclude "TABLES/Gen1LoveGrowths.csv.asm"                                  ; 83/876A
      aGen2LoveGrowths .binclude "TABLES/Gen2LoveGrowths.csv.asm"                                  ; 83/87F1
      aUnknown838961 .binclude "TABLES/Unknown838961.asm"                                          ; 83/8961
      aChildrenDataOffsets .binclude "TABLES/ChildrenDataOffsets.csv.asm"                          ; 83/8993
      aChildrenData .binclude "TABLES/ChildrenData.csv.asm"                                        ; 83/89A5
      aHolyBloodGrowthBoostsOffsets .binclude "TABLES/HolyBloodDataOffsets.csv.asm"                ; 83/89C9
      aHolyBloodData .binclude "TABLES/HolyBloodData.csv.asm"                                      ; 83/89E3
      aClassNameOffsets .include "TABLES/ClassNameOffsets.csv.asm"                                 ; 83/8AB3
      aClassNames .binclude "TEXT/MENUTEXT/ClassNames.asm"                                         ; 83/8B43
      aClassDataOffsets .include "TABLES/ClassDataOffsets.csv.asm"                                 ; 83/8F35
      aClassData .binclude "TABLES/ClassData.csv.asm"                                              ; 83/8FC5
      aMovementCostOffsets .include "TABLES/MovementCostOffsets.csv.asm"                           ; 83/987D
      aMovementCost .binclude "TABLES/MovementCost.csv.asm"                                        ; 83/989B
      aTerrainAvoidOffsets .include "TABLES/TerrainAvoidOffsets.csv.asm"                           ; 83/9A21
      aTerrainAvoid .binclude "TABLES/TerrainAvoid.csv.asm"                                        ; 83/9A25
      aCharacterNameOffsets .include "TABLES/CharacterNameOffsets.csv.asm"                         ; 83/9A59
      aCharacterNames .binclude "TEXT/MENUTEXT/CharacterNames.asm"                                 ; 83/9ECD
      aCharacterDataOffsets .include "TABLES/CharacterDataOffsets.csv.asm"                         ; 83/ADF5
      aCharacterData .binclude "TABLES/CharacterData.csv.asm"                                      ; 83/B267
      aUnknown83D8E6 .word 0                                                                       ; 83/D8E6
      aFactionNameOffsets .include "TABLES/FactionNameOffsets.csv.asm"                             ; 83/D8E8
      aFactionNames .binclude "TEXT/MENUTEXT/FactionNames.asm"                                     ; 83/D956
      aItemNameOffsets .include "TABLES/ItemNameOffsets.csv.asm"                                   ; 83/DC12
      aItemNames .binclude "TEXT/MENUTEXT/ItemNames.asm"                                           ; 83/DD26
      aItemDescriptionOffsets .include "TABLES/ItemDescriptionOffsets.csv.asm"                     ; 83/E2E8
      aItemDescriptions .binclude "TEXT/MENUTEXT/ItemDescriptions.asm"                             ; 83/E3FC
      aItemDataOffsets .include "TABLES/ItemDataOffsets.csv.asm"                                   ; 83/E9D0
      aItemData .binclude "TABLES/ItemData.csv.asm"                                                ; 83/EAE4
      aPlayerItemTable .include "TABLES/PlayerItemTable.csv.asm"                                   ; 83/F489
      .sint -1
      aCastleNameOffsets .include "TABLES/CastleNameOffsets.csv.asm"                               ; 83/F517
      aCastleNames .binclude "TEXT/MENUTEXT/CastleNames.asm"                                       ; 83/F573

      rlSwapToMainDataBank ; 83/F7C1

        .al
        .autsiz
        .databank ?

        phk
        plb
        rtl

        .databank 0

        ; 83/F7C4

    .here


    * = $048000
    .logical $848000

      .dsection Code848000Section

      ; 84/80EC

    .here


    * = $048397
    .logical $848397

      .dsection Code848397Section

      ; 84/862C

    .here


    * = $048C31
    .logical $848C31

      .dsection Code848C31Section

      ; 84/8CFE

    .here


    * = $048F17
    .logical $848F17

      .dsection Code848F17Section

      ; 84/99B5

    .here

    * = $049AE5
    .logical $849AE5

      .dsection Code849AE5Section

      ; 84/9FB9

    .here


    * = $049FC4
    .logical $849FC4

      .dsection Code849FC4Section

      ; 84/A282

    .here


    * = $04A333
    .logical $84A333

      .dsection Code84A333Section

      ; 84/ABB0

    .here


    * = $04ACE7
    .logical $84ACE7

      .dsection Code84ACE7Section

      ; 84/AF17

    .here



    * = $04B1B8
    .logical $84B1B8

      .dsection Code84B1B8Section

      ; 84/B32B

    .here


    * = $04B3E4
    .logical $84B3E4

      .dsection Code84B3E4Section

      ; 84/B508

    .here


    * = $04B8C1
    .logical $84B8C1

      .dsection Code84B8C1Section

      ; 84/B9A3

    .here

    * = $04BAA1
    .logical $84BAA1

      .dsection Code84BAA1Section

      ; 84/BB1E

    .here

    * = $04BB9A
    .logical $84BB9A

      .dsection Code84BB9ASection

      ; 84/C0BD

    .here

    * = $04C15F
    .logical $84C15F

      .dsection Code84C15FSection

      ; 84/C398

    .here

    * = $04C461
    .logical $84C461

      .dsection Code84C461Section

      ; 84/C5D7

    .here


    * = $04C65E
    .logical $84C65E

      .dsection Code84C65ESection

      ; 84/CC5D

    .here


    * = $04CCB4
    .logical $84CCB4

      .dsection Code84CCB4Section

      ; 84/CD35

    .here

    * = $04CFBF
    .logical $84CFBF

      .dsection Code84CFBFSection

      ; 84/D03E

    .here


    * = $04D271
    .logical $84D271

      .dsection Code84D271Section

      ; 84/D2BA

    .here



    * = $04D4C7
    .logical $84D4C7

      .dsection Code84D4C7Section

      ; 84/EB24

    .here


    * = $04EC80
    .logical $84EC80

      .dsection Code84EC80Section

      ; 84/F75C

    .here



    * = $04F939
    .logical $84F939

      .dsection Code84F939Section

      ; 84/FE98

    .here


    * = $05A895
    .logical $85A895

      .dsection DialogueBoxHDMASection

      ; 85/AB19

    .here



    * = $068000
    .logical $868000

      .dsection Code868000Section

      ; 86/9A92

    .here



    * = $06C4C4
    .logical $86C4C4

      .dsection Code86C4C4Section

      ; 86/C575

    .here


    * = $06C739
    .logical $86C739

      aChapterEventPointers .include "TABLES/CHAPTER/ChapterEventPointers.csv.asm" ; 86/C739
      aChapterEventDataPointers .include "TABLES/CHAPTER/ChapterEventDataPointers.csv.asm" ; 86/C760
      aFactionGroupPointers .include "TABLES/CHAPTER/FactionGroupPointers.csv.asm" ; 86/C784

      .dsection Chapter01EventsSection
      .dsection Chapter01EventDataSection
      .dsection Chapter02EventsSection
      .dsection Chapter02EventDataSection
      .dsection Chapter03EventsSection
      .dsection Chapter03EventDataSection
      .dsection Chapter04EventsSection
      .dsection Chapter04EventDataSection
      .dsection Chapter05EventsSection
      .dsection Chapter05EventDataSection
      .dsection Chapter07EventsSection
      .dsection Chapter07EventDataSection
      .dsection Chapter08EventsSection
      .dsection Chapter08EventDataSection
      .dsection Chapter09EventsSection
      .dsection Chapter09EventDataSection
      .dsection ChapterEpilogueEventsSection

      .fill $868000 + $8000 - *, $00

    .here



    * = $07A19D
    .logical $87A19D

      .dsection Code87A19DSection

      ; 87/AE88

    .here

    * = $07BB50
    .logical $87BB50

      .dsection Code87BB50Section

      ; 87/BE98

    .here


    * = $07DF12
    .logical $87DF12

      .dsection Code87DF12Section

      ; 87/E6D3

    .here


    * = $07E98D
    .logical $87E98D

      .dsection Code87E98DSection

      ; 87/E9E0

    .here


    * = $07EA87
    .logical $87EA87

      .dsection Code87EA87Section

      ; 87/EBC8

    .here

    * = $07EC42
    .logical $87EC42

      .dsection Code87EC42Section

      ; 87/EF46

    .here



    * = $07EF61
    .logical $87EF61

      .dsection Code87EF61Section

      ; 87/F321

    .here





    * = $07F3A7
    .logical $87F3A7

      .dsection Code87F3A7Section

      ; 87/F4A7

    .here

    * = $07F515
    .logical $87F515

      .dsection Code87F515Section

      ; 87/F559

    .here


    * = $08D365
    .logical $88D365

      aMapMovementShortSpritePointers .binclude "TABLES/MapMovementShortSpritePointers.csv.asm" ; 88/D365
      aMapMovementTallSpritePointers  .binclude "TABLES/MapMovementTallSpritePointers.csv.asm"  ; 88/D428

      ; 88/D488

    .here








    * = $0990DA
    .logical $8990DA

      .dsection Code8990DASection

      ; 89/9140

    .here

    * = $099FDC
    .logical $899FDC

      .dsection Code899FDCSection

      ; 89/A085

    .here

    * = $09A150
    .logical $89A150

      .dsection Code89A150Section

      ; 89/A18C

    .here

    * = $0AB317
    .logical $8AB317

      .dsection Code8AB317Section

      ; 8A/B3FE

    .here

    * = $0AB4F9
    .logical $8AB4F9

      aPortraitGraphicPointers .include "TABLES/PortraitGraphicPointers.csv.asm" ; 8A/B4F9
      aPortraitPalettePointers .include "TABLES/PortraitPalettePointers.csv.asm" ; 8A/B7E1

      ; 8A/BAC9

    .here

    * = $0B9A88
    .logical $8B9A88

      aPortraitDataIDs .include "TABLES/PortraitDataIDs.csv.asm" ; 8B/9A88
      aClassPortraitDataIDs .include "TABLES/ClassPortraitDataIDs.csv.asm" ; 8B/9FF8

      ; 8B/A088
      ; 4 different HDMA structs

    .here


    * = $0BCDD8
    .logical $8BCDD8

      .dsection Code8BCDD8Section

      ; 8B/CE29

    .here


    * = $0D90B5
    .logical $8D90B5

      dialogueCastleNameMadino .include "TEXT/DIALOGUE/CastleNames/CastleNameMadino.dialogue.txt"
      dialogueCastleNameSylvale .include "TEXT/DIALOGUE/CastleNames/CastleNameSylvale.dialogue.txt"
      dialogueCastleNameInfini .include "TEXT/DIALOGUE/CastleNames/CastleNameInfini.dialogue.txt"
      dialogueCastleNameAgusti .include "TEXT/DIALOGUE/CastleNames/CastleNameAgusti.dialogue.txt"
      dialogueCastleNameHeirhein .include "TEXT/DIALOGUE/CastleNames/CastleNameHeirhein.dialogue.txt"
      dialogueCastleNameMackily .include "TEXT/DIALOGUE/CastleNames/CastleNameMackily.dialogue.txt"
      dialogueCastleNameNordion .include "TEXT/DIALOGUE/CastleNames/CastleNameNordion.dialogue.txt"
      dialogueCastleNameVelthomer .include "TEXT/DIALOGUE/CastleNames/CastleNameVelthomer.dialogue.txt"

      ; 8d90f6

    .here


    * = $0D90FD
    .logical $8D90FD

      dialogueCastleNameBelhalla .include "TEXT/DIALOGUE/CastleNames/CastleNameBelhalla.dialogue.txt"

      ; 8d9104

    .here




    * = $0D9110
    .logical $8D9110

      dialogueCastleNameChalphy .include "TEXT/DIALOGUE/CastleNames/CastleNameChalphy.dialogue.txt"
      dialogueCastleNameYngvi   .include "TEXT/DIALOGUE/CastleNames/CastleNameYngvi.dialogue.txt"

      ; 8d9120

    .here


    * = $0D9146
    .logical $8D9146

      dialogueCastleNameOrgahil .include "TEXT/DIALOGUE/CastleNames/CastleNameOrgahil.dialogue.txt"
      dialogueCastleNameTofa .include "TEXT/DIALOGUE/CastleNames/CastleNameTofa.dialogue.txt"
      dialogueCastleNameSailane .include "TEXT/DIALOGUE/CastleNames/CastleNameSailane.dialogue.txt"
      dialogueCastleNameZaxon .include "TEXT/DIALOGUE/CastleNames/CastleNameZaxon.dialogue.txt"
      dialogueCastleNameSilesse .include "TEXT/DIALOGUE/CastleNames/CastleNameSilesse.dialogue.txt"
      dialogueCastleNameLubeck .include "TEXT/DIALOGUE/CastleNames/CastleNameLubeck.dialogue.txt"

      ; 8d9174

    .here


    * = $0D9199
    .logical $8D9199

      dialogueCastleNamePhinora .include "TEXT/DIALOGUE/CastleNames/CastleNamePhinora.dialogue.txt"

      ; 8d91a1

    .here




    * = $0D91AD
    .logical $8D91AD

      dialogueCastleNameVerdane .include "TEXT/DIALOGUE/CastleNames/CastleNameVerdane.dialogue.txt"
      dialogueCastleNameEvans .include "TEXT/DIALOGUE/CastleNames/CastleNameEvans.dialogue.txt"
      dialogueCastleNameGenoa .include "TEXT/DIALOGUE/CastleNames/CastleNameGenoa.dialogue.txt"
      dialogueCastleNameMarpha .include "TEXT/DIALOGUE/CastleNames/CastleNameMarpha.dialogue.txt"
      
      ; 8d91ca

    .here





    * = $0DFC70
    .logical $8DFC70

      .include "EVENTS/ChapterPrologue/EventPrologueWorldMap.asm"
      .include "EVENTS/Chapter01/EventChapter01WorldMap.asm"
      .include "EVENTS/Chapter02/EventChapter02WorldMap.asm"
      .include "EVENTS/Chapter03/EventChapter03WorldMap.asm"
      .include "EVENTS/Chapter04/EventChapter04WorldMap.asm"
      
      ; 8dfe0e

    .here


    * = $0E8000
    .logical $8E8000

      .include "EVENTS/Chapter02/EventChapter02Opening.asm"
      .include "EVENTS/Chapter02/EventChapter02InfiniBrigandsSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02ElliotCharge.asm"
      .include "EVENTS/Chapter02/EventChapter02PhilipDefend.asm"
      .include "EVENTS/Chapter02/EventChapter02LewynSilviaSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02InfiniSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02WaltzCharge.asm"
      .include "EVENTS/Chapter02/EventChapter02SigurdLachesisTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02BeowulfTalkNoMoney.asm"
      .include "EVENTS/Chapter02/EventChapter02BeowulfTalkSuccess.asm"
      .include "EVENTS/Chapter02/EventChapter02MackilySpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentEvans.asm"
      .include "EVENTS/Chapter02/EventChapter02AgustiSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02LewynErinysTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02Ending.asm"
      .include "EVENTS/Chapter02/EventChapter02Village8.asm"
      .include "EVENTS/Chapter02/EventChapter02VillageBargainBand.asm"
      .include "EVENTS/Chapter02/EventChapter02VillageArmorslayer.asm"
      .include "EVENTS/Chapter02/EventChapter02Village5.asm"
      .include "EVENTS/Chapter02/EventChapter02Village2.asm"
      .include "EVENTS/Chapter02/EventChapter02Village4.asm"
      .include "EVENTS/Chapter02/EventChapter02Village6.asm"
      .include "EVENTS/Chapter02/EventChapter02Village7.asm"
      .include "EVENTS/Chapter02/EventChapter02_05B.asm"
      .include "EVENTS/Chapter02/EventChapter02_05C.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentHeirhein.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentInfini.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentMackily.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentNordion.asm"
      .include "EVENTS/Chapter02/EventChapter02HeirheinSeized.asm"
      .include "EVENTS/Chapter02/EventChapter02ErinysGroupArrive.asm"
      .include "EVENTS/Chapter02/EventChapter02InfiniSeized.asm"
      .include "EVENTS/Chapter02/EventChapter02_064.asm"
      .include "EVENTS/Chapter02/EventChapter02MackilyWorried.asm"
      .include "EVENTS/Chapter02/EventChapter02Village1.asm"
      .include "EVENTS/Chapter02/EventChapter02Village3.asm"
      .include "EVENTS/Chapter02/EventChapter02QuanDied.asm"
      .include "EVENTS/Chapter02/EventChapter02EthlynDied.asm"
      .include "EVENTS/Chapter02/EventChapter02FinnDied.asm"
      .include "EVENTS/Chapter02/EventChapter02MackilySeized.asm"
      .include "EVENTS/Chapter02/EventChapter02_06C.asm"
      .include "EVENTS/Chapter02/EventChapter02_06D.asm"
      .include "EVENTS/Chapter02/EventChapter02_06E.asm"
      .include "EVENTS/Chapter02/EventChapter02_06F.asm"
      .include "EVENTS/Chapter02/EventChapter02MountainArmorTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02ArdenPursuitRing.asm"

      dialogueChapter02WorldMap1 .include "TEXT/DIALOGUE/Chapter02/WorldMap1.dialogue.txt" ; 8E8AC1
      dialogueChapter02WorldMap2 .include "TEXT/DIALOGUE/Chapter02/WorldMap2.dialogue.txt" ; 8E8B27
      dialogueChapter02WorldMap3 .include "TEXT/DIALOGUE/Chapter02/WorldMap3.dialogue.txt" ; 8E8B84
      dialogueChapter02WorldMap4 .include "TEXT/DIALOGUE/Chapter02/WorldMap4.dialogue.txt" ; 8E8C1B

      dialogueChapter03WorldMap1 .include "TEXT/DIALOGUE/Chapter03/WorldMap1.dialogue.txt" ; 8E8CB7
      dialogueChapter03WorldMap2 .include "TEXT/DIALOGUE/Chapter03/WorldMap2.dialogue.txt" ; 8E8D17
      dialogueChapter03WorldMap3 .include "TEXT/DIALOGUE/Chapter03/WorldMap3.dialogue.txt" ; 8E8DAB
      dialogueChapter03WorldMap4 .include "TEXT/DIALOGUE/Chapter03/WorldMap4.dialogue.txt" ; 8E8E3F
      dialogueChapter03WorldMap5 .include "TEXT/DIALOGUE/Chapter03/WorldMap5.dialogue.txt" ; 8E8EA5

      .include "EVENTS/Chapter04/EventChapter04Opening.asm"
      .include "EVENTS/Chapter04/EventChapter04CuvuliCharge.asm"
      .include "EVENTS/Chapter04/EventChapter04DaccarAndreyPreparing.asm"
      .include "EVENTS/Chapter04/EventChapter04RaiseBridge.asm"
      .include "EVENTS/Chapter04/EventChapter04LowerBridge.asm"
      .include "EVENTS/Chapter04/EventChapter04PamelaSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandPamelaCloseByTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04_09E.asm"
      .include "EVENTS/Chapter04/EventChapter04AndreySpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandDeathAndreyResponse.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandDeathPlayerResponses.asm"
      .include "EVENTS/Chapter04/EventChapter04AndreyLeave.asm"
      .include "EVENTS/Chapter04/EventChapter04ZaxonSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04DonovanSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04SilesseSeized.asm"
      .include "EVENTS/Chapter04/EventChapter04SilesseSeizedDaccarResponse.asm"
      .include "EVENTS/Chapter04/EventChapter04LewynVisitsSilesse.asm"
      .include "EVENTS/Chapter04/EventChapter04Ending.asm"
      .include "EVENTS/Chapter04/EventChapter04CivilianRescuedA.asm"
      .include "EVENTS/Chapter04/EventChapter04CivilianRescuedB.asm"
      .include "EVENTS/Chapter04/EventChapter04Village7.asm"
      .include "EVENTS/Chapter04/EventChapter04Village4.asm"
      .include "EVENTS/Chapter04/EventChapter04Village5.asm"
      .include "EVENTS/Chapter04/EventChapter04Village3.asm"
      .include "EVENTS/Chapter04/EventChapter04Village2.asm"
      .include "EVENTS/Chapter04/EventChapter04VillageSafeguardAnyone.asm"
      .include "EVENTS/Chapter04/EventChapter04Village6.asm"
      .include "EVENTS/Chapter04/EventChapter04Village1.asm"
      .include "EVENTS/Chapter04/EventChapter04TofaSeized.asm"
      .include "EVENTS/Chapter04/EventChapter04_0B4.asm"
      .include "EVENTS/Chapter04/EventChapter04LamiaCharge.asm"
      .include "EVENTS/Chapter04/EventChapter04VillageSafeguardSilvia.asm"
      .include "EVENTS/Chapter04/EventChapter04ErinysSilviaAdjacent.asm"
      .include "EVENTS/Chapter04/EventChapter04_0B8.asm"
      .include "EVENTS/Chapter04/EventChapter04_0B9.asm"

      .sint -1

      dialogueChapter04OpeningLewynDead .include "TEXT/DIALOGUE/Chapter04/OpeningLewynDead.dialogue.txt" ; 8E9B61
      dialogueChapter04OpeningErinysDead .include "TEXT/DIALOGUE/Chapter04/OpeningErinysDead.dialogue.txt" ; 8EA228
      dialogueChapter04OpeningLewynErinysAlive .include "TEXT/DIALOGUE/Chapter04/OpeningLewynErinysAlive.dialogue.txt" ; 8EA432
      dialogueChapter04OpeningQuanEthlynFinnLeave .include "TEXT/DIALOGUE/Chapter04/OpeningQuanEthlynFinnLeave.dialogue.txt" ; 8EA626
      dialogueChapter04OpeningQuanEthlynLeave .include "TEXT/DIALOGUE/Chapter04/OpeningQuanEthlynLeave.dialogue.txt" ; 8EA793
      dialogueChapter04OpeningFinnLeave .include "TEXT/DIALOGUE/Chapter04/OpeningFinnLeave.dialogue.txt" ; 8EA88A
      dialogueChapter04Opening2 .include "TEXT/DIALOGUE/Chapter04/Opening2.dialogue.txt" ; 8EA962
      dialogueChapter04CuvuliCharge .include "TEXT/DIALOGUE/Chapter04/CuvuliCharge.dialogue.txt" ; 8EAA84
      dialogueChapter04CuvuliBattleQuote .include "TEXT/DIALOGUE/Chapter04/CuvuliBattleQuote.dialogue.txt" ; 8EAADC
      dialogueChapter04DithorbaBattleQuote .include "TEXT/DIALOGUE/Chapter04/DithorbaBattleQuote.dialogue.txt" ; 8EAAF7
      dialogueChapter04DaccarAndreyPreparing .include "TEXT/DIALOGUE/Chapter04/DaccarAndreyPreparing.dialogue.txt" ; 8EAB32
      dialogueChapter04RaiseBridge .include "TEXT/DIALOGUE/Chapter04/RaiseBridge.dialogue.txt" ; 8EAC65
      dialogueChapter04LowerBridge .include "TEXT/DIALOGUE/Chapter04/LowerBridge.dialogue.txt" ; 8EACDD
      dialogueChapter04MyosBattleQuote .include "TEXT/DIALOGUE/Chapter04/MyosBattleQuote.dialogue.txt" ; 8EAD16
      dialogueChapter04PamelaSpawn .include "TEXT/DIALOGUE/Chapter04/PamelaSpawn.dialogue.txt" ; 8EAD46
      dialogueChapter04AnnandSpawn .include "TEXT/DIALOGUE/Chapter04/AnnandSpawn.dialogue.txt" ; 8EADF1
      dialogueChapter04AnnandPamelaCloseByTalk .include "TEXT/DIALOGUE/Chapter04/AnnandPamelaCloseByTalk.dialogue.txt" ; 8EAF8D
      dialogueChapter04AndreySpawn .include "TEXT/DIALOGUE/Chapter04/AndreySpawn.dialogue.txt" ; 8EB0C6
      dialogueChapter04ZaxonAnnandBattleQuote .include "TEXT/DIALOGUE/Chapter04/ZaxonAnnandBattleQuote.dialogue.txt" ; 8EB1AE
      dialogueChapter04PamelaBattleQuote .include "TEXT/DIALOGUE/Chapter04/PamelaBattleQuote.dialogue.txt" ; 8EB1D3
      dialogueChapter04SilesseAndreyBattleQuote .include "TEXT/DIALOGUE/Chapter04/SilesseAndreyBattleQuote.dialogue.txt" ; 8EB1EB
      dialogueChapter04AnnandDeathAndreyResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathAndreyResponse.dialogue.txt" ; 8EB220
      dialogueChapter04AnnandDeathLahnaResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathLahnaResponse.dialogue.txt" ; 8EB2A2
      dialogueChapter04AnnandDeathLewynResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathLewynResponse.dialogue.txt" ; 8EB2DD
      dialogueChapter04AnnandDeathErinysResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathErinysResponse.dialogue.txt" ; 8EB305
      dialogueChapter04AndreyLeave .include "TEXT/DIALOGUE/Chapter04/AndreyLeave.dialogue.txt" ; 8EB352
      dialogueChapter04ZaxonSpawn1 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn1.dialogue.txt" ; 8EB38E
      dialogueChapter04ZaxonSpawn2 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn2.dialogue.txt" ; 8EB44F
      dialogueChapter04ZaxonSpawn3 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn3.dialogue.txt" ; 8EB4D2
      dialogueChapter04ZaxonSpawn4 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn4.dialogue.txt" ; 8EB5BD
      dialogueChapter04DonovanSpawn .include "TEXT/DIALOGUE/Chapter04/DonovanSpawn.dialogue.txt" ; 8EB714
      dialogueChapter04DonovanBattleQuote .include "TEXT/DIALOGUE/Chapter04/DonovanBattleQuote.dialogue.txt" ; 8EB77E
      dialogueChapter04SilesseSeizedDaccarAlive .include "TEXT/DIALOGUE/Chapter04/SilesseSeizedDaccarAlive.dialogue.txt" ; 8EB793
      dialogueChapter04SilesseSeizedDaccarDead .include "TEXT/DIALOGUE/Chapter04/SilesseSeizedDaccarDead.dialogue.txt" ; 8EB97A
      dialogueChapter04DaccarResponsePamelaDeadLamiaDead .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaDeadLamiaDead.dialogue.txt" ; 8EBAD4
      dialogueChapter04DaccarResponsePamelaDeadLamiaAlive .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaDeadLamiaAlive.dialogue.txt" ; 8EBB20
      dialogueChapter04DaccarResponsePamelaAliveLamiaDead .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaAliveLamiaDead.dialogue.txt" ; 8EBB2C
      dialogueChapter04DaccarResponsePamelaAliveLamiaAlive .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaAliveLamiaAlive.dialogue.txt" ; 8EBB38
      dialogueChapter04Piece_LamiaChargeOrder .include "TEXT/DIALOGUE/Chapter04/Piece_LamiaChargeOrder.dialogue.txt" ; 8EBB4A
      dialogueChapter04Piece_PamelaChargeOrder .include "TEXT/DIALOGUE/Chapter04/Piece_PamelaChargeOrder.dialogue.txt" ; 8EBB7D
      dialogueChapter04LamiaCharge .include "TEXT/DIALOGUE/Chapter04/LamiaCharge.dialogue.txt" ; 8EBBB1
      dialogueChapter04LewynVisitsSilesse .include "TEXT/DIALOGUE/Chapter04/LewynVisitsSilesse.dialogue.txt" ; 8EBBE2
      dialogueChapter04DaccarBattleQuote .include "TEXT/DIALOGUE/Chapter04/DaccarBattleQuote.dialogue.txt" ; 8EC033
      dialogueChapter04LamiaBattleQuote .include "TEXT/DIALOGUE/Chapter04/LamiaBattleQuote.dialogue.txt" ; 8EC06A
      dialogueChapter04Ending .include "TEXT/DIALOGUE/Chapter04/Ending.dialogue.txt" ; 8EC086
      dialogueChapter04CivilianRescuedA .include "TEXT/DIALOGUE/Chapter04/CivilianRescuedA.dialogue.txt" ; 8EC3B5
      dialogueChapter04CivilianRescuedB .include "TEXT/DIALOGUE/Chapter04/CivilianRescuedB.dialogue.txt" ; 8EC3D0
      dialogueChapter04Village7 .include "TEXT/DIALOGUE/Chapter04/Village7.dialogue.txt" ; 8EC3F8
      dialogueChapter04Village4 .include "TEXT/DIALOGUE/Chapter04/Village4.dialogue.txt" ; 8EC476
      dialogueChapter04Village5 .include "TEXT/DIALOGUE/Chapter04/Village5.dialogue.txt" ; 8EC537
      dialogueChapter04Village3 .include "TEXT/DIALOGUE/Chapter04/Village3.dialogue.txt" ; 8EC5B5
      dialogueChapter04Village2 .include "TEXT/DIALOGUE/Chapter04/Village2.dialogue.txt" ; 8EC643
      dialogueChapter04VillageSafeguardAnyone .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardAnyone.dialogue.txt" ; 8EC6B0
      dialogueChapter04Village6 .include "TEXT/DIALOGUE/Chapter04/Village6.dialogue.txt" ; 8EC731
      dialogueChapter04Village1Default .include "TEXT/DIALOGUE/Chapter04/Village1Default.dialogue.txt" ; 8EC798
      dialogueChapter04Village1BridgeLowered .include "TEXT/DIALOGUE/Chapter04/Village1BridgeLowered.dialogue.txt" ; 8EC81E
      dialogueChapter04TofaSeized .include "TEXT/DIALOGUE/Chapter04/TofaSeized.dialogue.txt" ; 8EC84D
      dialogueChapter04WorldMap1 .include "TEXT/DIALOGUE/Chapter04/WorldMap1.dialogue.txt" ; 8ECA72
      dialogueChapter04WorldMap2 .include "TEXT/DIALOGUE/Chapter04/WorldMap2.dialogue.txt" ; 8ECAE4

      ; 8ecd3d

    .here



    * = $0ED7DE
    .logical $8ED7DE

      dialogueDeathQuoteGen1PlayerSigurd .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Sigurd.dialogue.txt" ; 8ED7DE
      dialogueDeathQuoteGen1PlayerNaoise .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Naoise.dialogue.txt" ; 8ED7FF
      dialogueDeathQuoteGen1PlayerAlec .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Alec.dialogue.txt" ; 8ED835
      dialogueDeathQuoteGen1PlayerArden .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Arden.dialogue.txt" ; 8ED863
      dialogueDeathQuoteGen1PlayerFinn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Finn.dialogue.txt" ; 8ED897
      dialogueDeathQuoteGen1PlayerQuan .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Quan.dialogue.txt" ; 8ED8D4
      dialogueDeathQuoteGen1PlayerQuanLeave .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/QuanLeave.dialogue.txt" ; 8ED8F0
      dialogueDeathQuoteLoverMidirUnused .include "TEXT/DIALOGUE/DeathQuote/Lover/MidirUnused.dialogue.txt" ; 8ED946
      dialogueDeathQuoteGen1PlayerMidir .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Midir.dialogue.txt" ; 8ED977
      dialogueDeathQuoteGen1PlayerLewyn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Lewyn.dialogue.txt" ; 8ED99C
      dialogueDeathQuoteGen1PlayerChulainn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Chulainn.dialogue.txt" ; 8ED9D8
      dialogueDeathQuoteLoverAzelle .include "TEXT/DIALOGUE/DeathQuote/Lover/Azelle.dialogue.txt" ; 8ED9FB
      dialogueDeathQuoteGen1PlayerAzelle .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Azelle.dialogue.txt" ; 8EDA2C
      dialogueDeathQuoteLoverJamke .include "TEXT/DIALOGUE/DeathQuote/Lover/Jamke.dialogue.txt" ; 8EDA51
      dialogueDeathQuoteGen1PlayerJamke .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Jamke.dialogue.txt" ; 8EDA76
      dialogueDeathQuoteGen1PlayerClaud .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Claud.dialogue.txt" ; 8EDA8F
      dialogueDeathQuoteGen1PlayerBeowulf .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Beowulf.dialogue.txt" ; 8EDABE
      dialogueDeathQuoteGen1PlayerLex .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Lex.dialogue.txt" ; 8EDAE6
      dialogueDeathQuoteGen1PlayerDew .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Dew.dialogue.txt" ; 8EDB25
      dialogueDeathQuoteGen1PlayerDeirdre .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Deirdre.dialogue.txt" ; 8EDB48
      dialogueDeathQuoteGen1PlayerDeirdreReturn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/DeirdreReturn.dialogue.txt" ; 8EDB6D
      dialogueDeathQuoteGen1PlayerEthlyn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Ethlyn.dialogue.txt" ; 8EDBD1
      dialogueDeathQuoteGen1PlayerEthlynLeave .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/EthlynLeave.dialogue.txt" ; 8EDBF5
      dialogueDeathQuoteGen1PlayerLachesis .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Lachesis.dialogue.txt" ; 8EDC48
      dialogueDeathQuoteLoverAyra .include "TEXT/DIALOGUE/DeathQuote/Lover/Ayra.dialogue.txt" ; 8EDC63
      dialogueDeathQuoteGen1PlayerAyra .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Ayra.dialogue.txt" ; 8EDC92
      dialogueDeathQuoteGen1PlayerErinys .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Erinys.dialogue.txt" ; 8EDCAB
      dialogueDeathQuoteLoverTailtiu .include "TEXT/DIALOGUE/DeathQuote/Lover/Tailtiu.dialogue.txt" ; 8EDCCC
      dialogueDeathQuoteGen1PlayerTailtiu .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Tailtiu.dialogue.txt" ; 8EDCEC
      dialogueDeathQuoteLoverSilvia .include "TEXT/DIALOGUE/DeathQuote/Lover/Silvia.dialogue.txt" ; 8EDD02
      dialogueDeathQuoteGen1PlayerSilvia .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Silvia.dialogue.txt" ; 8EDD2D
      dialogueDeathQuoteLoverEdain .include "TEXT/DIALOGUE/DeathQuote/Lover/Edain.dialogue.txt" ; 8EDD46
      dialogueDeathQuoteGen1PlayerEdain .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Edain.dialogue.txt" ; 8EDD78
      dialogueDeathQuoteGen1PlayerBrigid .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Brigid.dialogue.txt" ; 8EDD9E

      dialogueDeathQuoteGen2PlayerSeliph .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Seliph.dialogue.txt" ; 8EDDB7

      ; 8eddce

    .here


    * = $0EDDDF
    .logical $8EDDDF

      dialogueDeathQuoteGen2PlayerShannan .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Shannan.dialogue.txt" ; 8EDDDF
      dialogueDeathQuoteGen2PlayerDalvin .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Dalvin.dialogue.txt" ; 8EDDF9
      dialogueDeathQuoteGen2PlayerAsaello .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Asaello.dialogue.txt" ; 8EDE0D
      dialogueDeathQuoteGen2PlayerLeif .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Leif.dialogue.txt" ; 8EDE21
      dialogueDeathQuoteGen2PlayerIuchar .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Iuchar.dialogue.txt" ; 8EDE37
      dialogueDeathQuoteGen2PlayerCharlot .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Charlot.dialogue.txt" ; 8EDE5C
      dialogueDeathQuoteGen2PlayerHawk .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Hawk.dialogue.txt" ; 8EDE6F
      dialogueDeathQuoteGen2PlayerTristan .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Tristan.dialogue.txt" ; 8EDE9B
      dialogueDeathQuoteGen2PlayerOldFinn .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/OldFinn.dialogue.txt" ; 8EDEB9
      dialogueDeathQuoteGen2PlayerDeimne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Deimne.dialogue.txt" ; 8EDEEB
      dialogueDeathQuoteGen2PlayerHannibal .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Hannibal.dialogue.txt" ; 8EDF0A
      dialogueDeathQuoteGen2PlayerAres .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Ares.dialogue.txt" ; 8EDF2C
      dialogueDeathQuoteGen2PlayerAmid .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Amid.dialogue.txt" ; 8EDF48
      dialogueDeathQuoteGen2PlayerOifey .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Oifey.dialogue.txt" ; 8EDF63
      dialogueDeathQuoteGen2PlayerDaisy .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Daisy.dialogue.txt" ; 8EDF94
      dialogueDeathQuoteGen2PlayerCreidne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Creidne.dialogue.txt" ; 8EDFAB
      dialogueDeathQuoteLoverMuirne .include "TEXT/DIALOGUE/DeathQuote/Lover/Muirne.dialogue.txt" ; 8EDFC3
      dialogueDeathQuoteGen2PlayerMuirne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Muirne.dialogue.txt" ; 8EDFD8
      dialogueDeathQuoteLoverJulia .include "TEXT/DIALOGUE/DeathQuote/Lover/Julia.dialogue.txt" ; 8EDFEE
      dialogueDeathQuoteGen2PlayerJulia .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Julia.dialogue.txt" ; 8EE004
      dialogueDeathQuoteGen1PlayerJuliaReturn .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/JuliaReturn.dialogue.txt" ; 8EE02E

      ; 8ee091

    .here

    * = $0EE0C8
    .logical $8EE0C8

      dialogueDeathQuoteGen2PlayerAltena .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Altena.dialogue.txt" ; 8EE0C8
      dialogueDeathQuoteLoverHermina .include "TEXT/DIALOGUE/DeathQuote/Lover/Hermina.dialogue.txt" ; 8EE0DA
      dialogueDeathQuoteGen2PlayerHermina .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Hermina.dialogue.txt" ; 8EE0ED
      dialogueDeathQuoteGen2PlayerLinda .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Linda.dialogue.txt" ; 8EE105
      dialogueDeathQuoteLoverLaylea .include "TEXT/DIALOGUE/DeathQuote/Lover/Laylea.dialogue.txt" ; 8EE118
      dialogueDeathQuoteGen2PlayerLaylea .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Laylea.dialogue.txt" ; 8EE12C
      dialogueDeathQuoteGen2PlayerJeanne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Jeanne.dialogue.txt" ; 8EE141
      dialogueDeathQuoteGen2PlayerIucharba .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Iucharba.dialogue.txt" ; 8EE161
      dialogueDeathQuoteGen2PlayerScathach .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Scathach.dialogue.txt" ; 8EE177
      dialogueDeathQuoteGen2PlayerFebail .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Febail.dialogue.txt" ; 8EE19C
      dialogueDeathQuoteGen2PlayerCoirpre .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Coirpre.dialogue.txt" ; 8EE1B4
      dialogueDeathQuoteGen2PlayerCed .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Ced.dialogue.txt" ; 8EE1E0
      dialogueDeathQuoteGen2PlayerDiarmuid .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Diarmuid.dialogue.txt" ; 8EE209
      dialogueDeathQuoteGen2PlayerLester .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Lester.dialogue.txt" ; 8EE227
      dialogueDeathQuoteGen2PlayerArthur .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Arthur.dialogue.txt" ; 8EE245
      dialogueDeathQuoteGen2PlayerPatty .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Patty.dialogue.txt" ; 8EE25F
      dialogueDeathQuoteLoverLarcei .include "TEXT/DIALOGUE/DeathQuote/Lover/Larcei.dialogue.txt" ; 8EE279
      dialogueDeathQuoteGen2PlayerLarcei .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Larcei.dialogue.txt" ; 8EE295
      dialogueDeathQuoteLoverLana .include "TEXT/DIALOGUE/DeathQuote/Lover/Lana.dialogue.txt" ; 8EE2AB
      dialogueDeathQuoteGen2PlayerLana .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Lana.dialogue.txt" ; 8EE2CE
      dialogueDeathQuoteLoverFee .include "TEXT/DIALOGUE/DeathQuote/Lover/Fee.dialogue.txt" ; 8EE2E8
      dialogueDeathQuoteGen2PlayerFee .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Fee.dialogue.txt" ; 8EE304
      dialogueDeathQuoteLoverTine .include "TEXT/DIALOGUE/DeathQuote/Lover/Tine.dialogue.txt" ; 8EE31A
      dialogueDeathQuoteGen2PlayerTine .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Tine.dialogue.txt" ; 8EE337
      dialogueDeathQuoteLoverLene .include "TEXT/DIALOGUE/DeathQuote/Lover/Lene.dialogue.txt" ; 8EE34E
      dialogueDeathQuoteGen2PlayerLene .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Lene.dialogue.txt" ; 8EE362
      dialogueDeathQuoteGen2PlayerNanna .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Nanna.dialogue.txt" ; 8EE377

      ; 8ee397

    .here


    * = $0EE8BE
    .logical $8EE8BE

      dialogueDeathQuoteReptorPreBetrayal .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/ReptorPreBetrayal.dialogue.txt" ; 8E/E8BE

      ; 8ee8db

    .here




    * = $0EF1DA
    .logical $8EF1DA

      aGen1PlayerDeathQuotes .binclude "TABLES/Gen1PlayerDeathQuoteTable.csv.asm" ; 8E/F1DA
      .word 0
      aGen2PlayerDeathQuotes .binclude "TABLES/Gen2PlayerDeathQuoteTable.csv.asm" ; 8E/F248
      .word 0
      aLoverDeathQuotes .binclude "TABLES/LoverDeathQuoteTable.csv.asm" ; 8E/F2E6
      .word 0

      aGen1EnemyNPCDeathQuotes ; 8E/F328

        .word DiMaggio,     <>$8EE397
        .word Gerrard,      <>$8EE3AF
        .word Cimbaeth,     <>$8EE3EA
        .word Munnir,       <>$8EE403
        .word Sandima,      <>$8EE426
        .word Ayra,         <>$8EE453
        .word ElliotCh01,   <>$8EE46B
        .word Jamke,        <>$8EDDCE
        .word ElliotCh02,   <>$8EE4A0
        .word Philip,       <>$8EE4CB
        .word Bordeaux,     <>$8EE4F2
        .word MacBeth,      <>$8EE50F
        .word Waltz,        <>$8EE52C
        .word Clement,      <>$8EE572
        .word Erinys,       <>$8EE58D
        .word Zane,         <>$8EE5B6
        .word Beowulf,      <>$8EE556
        .word ChagallCh02,  <>$8EE5DC
        .word Jacobi,       <>$8EE603
        .word EldiganCh03,  <>$8EE61A
        .word Papilio,      <>$8EE63D
        .word ChagallCh03,  <>$8EE664
        .word Pizare,       <>$8EE688
        .word Duvall,       <>$8EE6B1
        .word Cuvuli,       <>$8EE6C6
        .word Dithorba,     <>$8EE6E9
        .word Myos,         <>$8EE707
        .word Annand,       <>$8EE722
        .word Pamela,       <>$8EE748
        .word Donovan,      <>$8EE75D
        .word Daccar,       <>$8EE77F
        .word Lamia,        <>$8EE7A4
        .word Byron,        <>$8EE7B9
        .word Slayder,      <>$8EE7D3
        .word AndreyCh05,   <>$8EE7EC
        .word LombardCh05,  <>$8EE81B
        .word Vaja,         <>$8EE851
        .word Magorn,       <>$8EE877
        .word ReptorCh05,   <>$8EE895
        .word Ethlyn,       <>$8EE8DB
        .word Quan,         <>$8EE909

        .word 0

      aGen2EnemyNPCDeathQuotes ; 8E/F3CE

        .word Harold,   <>$8EE935
        .word Iucharba, <>$8EE96D
        .word Iuchar,   <>$8EE98E
        .word Schmidt,  <>$8EE9C8
        .word Danann,   <>$8EE9E5
        .word Kutuzov,  <>$8EEA05
        .word Kutuzov2, <>$8EEA05
        .word Liza,     <>$8EEA27
        .word Ishtore,  <>$8EEA40
        .word Javarro,  <>$8EEA7C
        .word Bramsel,  <>$8EEA96
        .word Banba1,   <>$8EEABF
        .word Fotla1,   <>$8EEADC
        .word Eriu1,    <>$8EEAF9
        .word Tine,     <>$8EEB16
        .word Bloom,    <>$8EEB28
        .word Ishtar,   <>$8EEB5E
        .word Febail,   <>$8EEB7A
        .word Muhammad, <>$8EEB9C
        .word Ovo,      <>$8EEBD2
        .word Banba2,   <>$8EEBE7
        .word Fotla2,   <>$8EEC0C
        .word Eriu2,    <>$8EEC28
        .word Bloom2,   <>$8EEC4B
        .word Coulter,  <>$8EEC67
        .word Maykov,   <>$8EEC87
        .word Altena,   <>$8EECA4
        .word Hannibal, <>$8EECC5
        .word Kanatz,   <>$8EECE6
        .word Distler,  <>$8EED08
        .word Musar,    <>$8EED2E
        .word Judah,    <>$8EED4C
        .word Arion1,   <>$8EED7E
        .word Travant2, <>$8EEDAF
        .word Riddell,  <>$8EEDD7
        .word Hilda1,   <>$8EEDF4
        .word Morrigan, <>$8EEE24
        .word Julius,   <>$8EEE4A
        .word Ishtar2,  <>$8EEE67
        .word Zagam,    <>$8EEE7C
        .word Arvis3,   <>$8EEEA1
        .word Roberto,  <>$8EEEE9
        .word Boyce,    <>$8EEF05
        .word Rodan,    <>$8EEF22
        .word Juphiel,  <>$8EEF3F
        .word Fisher,   <>$8EEF66
        .word Brian,    <>$8EEF7E
        .word Dagon,    <>$8EEFBA
        .word Hilda2,   <>$8EEFE1
        .word Scipio,   <>$8EF012
        .word Baran,    <>$8EF02D
        .word Meng,     <>$8EF054
        .word Mabel,    <>$8EF073
        .word Bleg,     <>$8EF096
        .word Arion2,   <>$8EF0B5
        .word Ishtar3,  <>$8EF0CD
        .word Manfroy,  <>$8EF0EB
        .word Julius2,  <>$8EF111
        .word Julius2,  <>$8EF134
        .word Julius2,  <>$8EF165
        .word Julia,    <>$8EE091

        .word 0

        ; 8E/F4C4

    .here





    * = $0F806B
    .logical $8F806B

      dialogueChapter02Opening1 .include "TEXT/DIALOGUE/Chapter02/Opening1.dialogue.txt" ; 8F806B
      dialogueChapter02Opening2 .include "TEXT/DIALOGUE/Chapter02/Opening2.dialogue.txt" ; 8F823F
      dialogueChapter02Opening3 .include "TEXT/DIALOGUE/Chapter02/Opening3.dialogue.txt" ; 8F8543
      dialogueChapter02Opening5 .include "TEXT/DIALOGUE/Chapter02/Opening5.dialogue.txt" ; 8F881B
      dialogueChapter02Opening4 .include "TEXT/DIALOGUE/Chapter02/Opening4.dialogue.txt" ; 8F8AC8
      dialogueChapter02InfiniBrigandsSpawn .include "TEXT/DIALOGUE/Chapter02/InfiniBrigandsSpawn.dialogue.txt" ; 8F8B5A
      dialogueChapter02MackilyWorried .include "TEXT/DIALOGUE/Chapter02/MackilyWorried.dialogue.txt" ; 8F8BFA
      dialogueChapter02ElliotCharge .include "TEXT/DIALOGUE/Chapter02/ElliotCharge.dialogue.txt" ; 8F8C6C
      dialogueChapter02PhilipDefend .include "TEXT/DIALOGUE/Chapter02/PhilipDefend.dialogue.txt" ; 8F8D0E
      dialogueChapter02ElliotBattleQuote .include "TEXT/DIALOGUE/Chapter02/ElliotBattleQuote.dialogue.txt" ; 8F8D5E
      dialogueChapter02PhilipBattleQuote .include "TEXT/DIALOGUE/Chapter02/PhilipBattleQuote.dialogue.txt" ; 8F8D95
      dialogueChapter02BordeauxBattleQuote .include "TEXT/DIALOGUE/Chapter02/BordeauxBattleQuote.dialogue.txt" ; 8F8DCA
      dialogueChapter02LewynSilviaSpawn .include "TEXT/DIALOGUE/Chapter02/LewynSilviaSpawn.dialogue.txt" ; 8F8E12
      dialogueChapter02InfiniSpawn1 .include "TEXT/DIALOGUE/Chapter02/InfiniSpawn1.dialogue.txt" ; 8F91EA
      dialogueChapter02AgustiSpawn2 .include "TEXT/DIALOGUE/Chapter02/AgustiSpawn2.dialogue.txt" ; 8F928A
      dialogueChapter02InfiniSpawn2 .include "TEXT/DIALOGUE/Chapter02/InfiniSpawn2.dialogue.txt" ; 8F92B6
      dialogueChapter02WaltzCharge .include "TEXT/DIALOGUE/Chapter02/WaltzCharge.dialogue.txt" ; 8F9439
      dialogueChapter02SigurdLachesisTalk .include "TEXT/DIALOGUE/Chapter02/SigurdLachesisTalk.dialogue.txt" ; 8F9478
      dialogueChapter02BeowulfTalkSuccess .include "TEXT/DIALOGUE/Chapter02/BeowulfTalkSuccess.dialogue.txt" ; 8F9678
      dialogueChapter02BeowulfTalkNoMoney .include "TEXT/DIALOGUE/Chapter02/BeowulfTalkNoMoney.dialogue.txt" ; 8F96D5
      dialogueChapter02WaltzBattleQuote .include "TEXT/DIALOGUE/Chapter02/WaltzBattleQuote.dialogue.txt" ; 8F9712
      dialogueChapter02BeowulfBattleQuote .include "TEXT/DIALOGUE/Chapter02/BeowulfBattleQuote.dialogue.txt" ; 8F9731
      dialogueChapter02InfiniSeized .include "TEXT/DIALOGUE/Chapter02/InfiniSeized.dialogue.txt" ; 8F975A
      dialogueChapter02MackilySpawn1 .include "TEXT/DIALOGUE/Chapter02/MackilySpawn1.dialogue.txt" ; 8F9DE1
      dialogueChapter02MacBethBattleQuote .include "TEXT/DIALOGUE/Chapter02/MacBethBattleQuote.dialogue.txt" ; 8F9E61
      dialogueChapter02MackilySpawn2 .include "TEXT/DIALOGUE/Chapter02/MackilySpawn2.dialogue.txt" ; 8F9EB2
      dialogueChapter02MackilySpawn3 .include "TEXT/DIALOGUE/Chapter02/MackilySpawn3.dialogue.txt" ; 8FA0BC
      dialogueChapter02HeirheinSeized .include "TEXT/DIALOGUE/Chapter02/HeirheinSeized.dialogue.txt" ; 8FA101
      dialogueChapter02ClementBattleQuote .include "TEXT/DIALOGUE/Chapter02/ClementBattleQuote.dialogue.txt" ; 8FA22A
      dialogueChapter02MackilySeized .include "TEXT/DIALOGUE/Chapter02/MackilySeized.dialogue.txt" ; 8FA261
      dialogueChapter02AgustiSpawn1 .include "TEXT/DIALOGUE/Chapter02/AgustiSpawn1.dialogue.txt" ; 8FA301
      dialogueChapter02ZaneBattleQuote .include "TEXT/DIALOGUE/Chapter02/ZaneBattleQuote.dialogue.txt" ; 8FA722
      dialogueChapter02ChulainnRecruitment .include "TEXT/DIALOGUE/Chapter02/ChulainnRecruitment.dialogue.txt" ; 8FA75D
      dialogueChapter02ChagallBattleQuote .include "TEXT/DIALOGUE/Chapter02/ChagallBattleQuote.dialogue.txt" ; 8FA851
      dialogueChapter02LewynErinysTalk .include "TEXT/DIALOGUE/Chapter02/LewynErinysTalk.dialogue.txt" ; 8FA878
      dialogueChapter02ErinysBattleQuote .include "TEXT/DIALOGUE/Chapter02/ErinysBattleQuote.dialogue.txt" ; 8FAE18
      dialogueChapter02LewynErinysBattleQuote .include "TEXT/DIALOGUE/Chapter02/LewynErinysBattleQuote.dialogue.txt" ; 8FAE41
      dialogueChapter02ErinysGroupArrive .include "TEXT/DIALOGUE/Chapter02/ErinysGroupArrive.dialogue.txt" ; 8FAE64
      dialogueChapter02Ending .include "TEXT/DIALOGUE/Chapter02/Ending.dialogue.txt" ; 8FAEB4
      dialogueChapter02Village8 .include "TEXT/DIALOGUE/Chapter02/Village8.dialogue.txt" ; 8FB2D7
      dialogueChapter02VillageBargainBand .include "TEXT/DIALOGUE/Chapter02/VillageBargainBand.dialogue.txt" ; 8FB31A
      dialogueChapter02VillageArmorslayer .include "TEXT/DIALOGUE/Chapter02/VillageArmorslayer.dialogue.txt" ; 8FB379
      dialogueChapter02Village5 .include "TEXT/DIALOGUE/Chapter02/Village5.dialogue.txt" ; 8FB40D
      dialogueChapter02Village2 .include "TEXT/DIALOGUE/Chapter02/Village2.dialogue.txt" ; 8FB461
      dialogueChapter02Village4 .include "TEXT/DIALOGUE/Chapter02/Village4.dialogue.txt" ; 8FB4FE
      dialogueChapter02Village6 .include "TEXT/DIALOGUE/Chapter02/Village6.dialogue.txt" ; 8FB59B
      dialogueChapter02Village7 .include "TEXT/DIALOGUE/Chapter02/Village7.dialogue.txt" ; 8FB623
      dialogueChapter02Village1 .include "TEXT/DIALOGUE/Chapter02/Village1.dialogue.txt" ; 8FB6AD
      dialogueChapter02Village3 .include "TEXT/DIALOGUE/Chapter02/Village3.dialogue.txt" ; 8FB728
      dialogueChapter02EndingKnightRing .include "TEXT/DIALOGUE/Chapter02/EndingKnightRing.dialogue.txt" ; 8FB77F

      ; 8fb81d

    .here






    * = $0FE8BF
    .logical $8FE8BF

      aEventPointers .include "TABLES/CHAPTER/EventPointers.csv.asm"

      ; 8F/EF55

    .here


    * = $108000
    .logical $908000

      .dsection ChapterPrologueEventsSection
      .dsection ChapterPrologueEventDataSection

      .include "EVENTS/Chapter01/EventChapter01Opening.asm"
      .include "EVENTS/Chapter01/EventChapter01_021.asm"
      .include "EVENTS/Chapter01/EventChapter01EdainGroupSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01GenoaSeized.asm"
      .include "EVENTS/Chapter01/EventChapter01SigurdAyraTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01EdainJamkeTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01HeirheinSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01NordionSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01MarphaSeized.asm"
      .include "EVENTS/Chapter01/EventChapter01VerdaneSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01DeirdreSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01Ending.asm"
      .include "EVENTS/Chapter01/EventChapter01_02C.asm"
      .include "EVENTS/Chapter01/EventChapter01_02D.asm"
      .include "EVENTS/Chapter01/EventChapter01_02E.asm"
      .include "EVENTS/Chapter01/EventChapter01_02F.asm"
      .include "EVENTS/Chapter01/EventChapter01_030.asm"
      .include "EVENTS/Chapter01/EventChapter01_031.asm"
      .include "EVENTS/Chapter01/EventChapter01_032.asm"
      .include "EVENTS/Chapter01/EventChapter01_033.asm"
      .include "EVENTS/Chapter01/EventChapter01Village1.asm"
      .include "EVENTS/Chapter01/EventChapter01Village2.asm"
      .include "EVENTS/Chapter01/EventChapter01Village3.asm"
      .include "EVENTS/Chapter01/EventChapter01EldiganRetreat.asm"
      .include "EVENTS/Chapter01/EventChapter01MunnirRallyVanguard.asm"
      .include "EVENTS/Chapter01/EventChapter01AyraDestroysGenoa.asm"
      .include "EVENTS/Chapter01/EventChapter01AyraStartsMoving.asm"
      .include "EVENTS/Chapter01/EventChapter01GenoaSeizedAyraResponse.asm"
      .include "EVENTS/Chapter01/EventChapter01_03C.asm"
      .include "EVENTS/Chapter01/EventChapter01QuanDied.asm"
      .include "EVENTS/Chapter01/EventChapter01EthlynDied.asm"
      .include "EVENTS/Chapter01/EventChapter01FinnDied.asm"
      .include "EVENTS/Chapter01/EventChapter01ElliotRetreats.asm"
      .include "EVENTS/Chapter01/EventChapter01LexBraveAxe.asm"
      .include "EVENTS/Chapter01/EventChapter01CrossknightTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01_043.asm"

      dialogueChapter01Opening2 .include "TEXT/DIALOGUE/Chapter01/Opening2.dialogue.txt" ; 908D0A
      dialogueChapter01Opening1 .include "TEXT/DIALOGUE/Chapter01/Opening1.dialogue.txt" ; 908E8D
      dialogueChapter01Opening3 .include "TEXT/DIALOGUE/Chapter01/Opening3.dialogue.txt" ; 908ECC
      dialogueChapter01Opening4 .include "TEXT/DIALOGUE/Chapter01/Opening4.dialogue.txt" ; 909106
      dialogueChapter01EdainGroupSpawn1 .include "TEXT/DIALOGUE/Chapter01/EdainGroupSpawn1.dialogue.txt" ; 909132
      dialogueChapter01EdainGroupSpawn2 .include "TEXT/DIALOGUE/Chapter01/EdainGroupSpawn2.dialogue.txt" ; 909361
      dialogueChapter01EdainGroupSpawn3 .include "TEXT/DIALOGUE/Chapter01/EdainGroupSpawn3.dialogue.txt" ; 90938A
      dialogueChapter01SigurdAyraTalk .include "TEXT/DIALOGUE/Chapter01/SigurdAyraTalk.dialogue.txt" ; 909403
      dialogueChapter01AyraBattleQuote .include "TEXT/DIALOGUE/Chapter01/AyraBattleQuote.dialogue.txt" ; 90967E
      dialogueChapter01CimbaethBattleQuote .include "TEXT/DIALOGUE/Chapter01/CimbaethBattleQuote.dialogue.txt" ; 9096AC
      dialogueChapter01GenoaSeizedAyraAlive .include "TEXT/DIALOGUE/Chapter01/GenoaSeizedAyraAlive.dialogue.txt" ; 9096e0
      dialogueChapter01GenoaSeizedAyraDead .include "TEXT/DIALOGUE/Chapter01/GenoaSeizedAyraDead.dialogue.txt" ; 9099E1
      dialogueChapter01HeirheinSpawn1 .include "TEXT/DIALOGUE/Chapter01/HeirheinSpawn1.dialogue.txt" ; 909CCC
      dialogueChapter01HeirheinSpawn2 .include "TEXT/DIALOGUE/Chapter01/HeirheinSpawn2.dialogue.txt" ; 909D2D
      dialogueChapter01NordionSpawn1 .include "TEXT/DIALOGUE/Chapter01/NordionSpawn1.dialogue.txt" ; 909D60
      dialogueChapter01NordionSpawn2 .include "TEXT/DIALOGUE/Chapter01/NordionSpawn2.dialogue.txt" ; 909E43
      dialogueChapter01ElliotBattleQuote .include "TEXT/DIALOGUE/Chapter01/ElliotBattleQuote.dialogue.txt" ; 90A07D
      dialogueChapter01MunnirRallyVanguard .include "TEXT/DIALOGUE/Chapter01/MunnirRallyVanguard.dialogue.txt" ; 90a0c1
      dialogueChapter01MunnirBattleQuote .include "TEXT/DIALOGUE/Chapter01/MunnirBattleQuote.dialogue.txt" ; 90A113
      dialogueChapter01MarphaSeized1 .include "TEXT/DIALOGUE/Chapter01/MarphaSeized1.dialogue.txt" ; 90a151
      dialogueChapter01MarphaSeized2 .include "TEXT/DIALOGUE/Chapter01/MarphaSeized2.dialogue.txt" ; 90A437
      dialogueChapter01VerdaneSpawn1 .include "TEXT/DIALOGUE/Chapter01/VerdaneSpawn1.dialogue.txt" ; 90A640
      dialogueChapter01VerdaneSpawn2 .include "TEXT/DIALOGUE/Chapter01/VerdaneSpawn2.dialogue.txt" ; 90A8A9
      dialogueChapter01DeirdreSpawnSandimaAlive .include "TEXT/DIALOGUE/Chapter01/DeirdreSpawnSandimaAlive.dialogue.txt" ; 90AD08
      dialogueChapter01DeirdreSpawnSandimaDead .include "TEXT/DIALOGUE/Chapter01/DeirdreSpawnSandimaDead.dialogue.txt" ; 90AFA6
      dialogueChapter01SandimaBattleQuote .include "TEXT/DIALOGUE/Chapter01/SandimaBattleQuote.dialogue.txt" ; 90B3CE
      dialogueChapter01Ending .include "TEXT/DIALOGUE/Chapter01/Ending.dialogue.txt" ; 90B3FA
      dialogueChapter01UnusedEnding .include "TEXT/DIALOGUE/Chapter01/UnusedEnding.dialogue.txt" ; 90B6A0
        ; This one is very slightly different. Just 'protect the people', leaving out 'of this country'.
      dialogueChapter01EdainJamkeTalk .include "TEXT/DIALOGUE/Chapter01/EdainJamkeTalk.dialogue.txt" ; 90B93D
      dialogueChapter01Village1 .include "TEXT/DIALOGUE/Chapter01/Village1.dialogue.txt" ; 90BB5A
      dialogueChapter01Village2 .include "TEXT/DIALOGUE/Chapter01/Village2.dialogue.txt" ; 90BBFA
      dialogueChapter01Village3 .include "TEXT/DIALOGUE/Chapter01/Village3.dialogue.txt" ; 90BCD6
      dialogueChapter01EldiganRetreat .include "TEXT/DIALOGUE/Chapter01/EldiganRetreat.dialogue.txt" ; 90BEC5
      dialogueChapter01JamkeBattleQuote .include "TEXT/DIALOGUE/Chapter01/JamkeBattleQuote.dialogue.txt" ; 90BEFF
      dialogueChapter01UnusedJamkeEdainBattleQuote .include "TEXT/DIALOGUE/Chapter01/UnusedJamkeEdainBattleQuote.dialogue.txt" ; 90BF2D
      dialogueChapter01AyraDestroysGenoa .include "TEXT/DIALOGUE/Chapter01/AyraDestroysGenoa.dialogue.txt" ; 90BF4E
      dialogueChapter01AyraStartsMoving .include "TEXT/DIALOGUE/Chapter01/AyraStartsMoving.dialogue.txt" ; 90BF91
      dialogueChapter01GenoaSeizedAyraResponse .include "TEXT/DIALOGUE/Chapter01/GenoaSeizedAyraResponse.dialogue.txt" ; 90BFB9
      dialogueChapter01LexBraveAxe .include "TEXT/DIALOGUE/Chapter01/LexBraveAxe.dialogue.txt" ; 90BFF2

      ; 90c0e8

    .here






    * = $118000
    .logical $918000

      .dsection Dialogue1Section

      ; 91/A3AB

    .here

    * = $11A863
    .logical $91A863

      .dsection Dialogue2Section

      ; 91/A8E4

    .here

    * = $11A984
    .logical $91A984

      .dsection Dialogue3Section

      ; 91/A9BB

    .here




    * = $11AD0B
    .logical $91AD0B

      .dsection Code91AD0BSection

      ; 91/AFA4

    .here


    * = $128000
    .logical $928000

      g2bppDialogueFont .text ROM[$128000:$130000] ; 92/8000

    .here






    * = $1D8000
    .logical $9D8000

      dialogueChapterPrologueWorldMap1 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap1.dialogue.txt" ; 9D8000
      dialogueChapterPrologueWorldMap2 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap2.dialogue.txt" ; 9D833B
      dialogueChapterPrologueWorldMap3 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap3.dialogue.txt" ; 9D839C
      dialogueChapterPrologueWorldMap4 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap4.dialogue.txt" ; 9D8490
      dialogueChapterPrologueWorldMap5 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap5.dialogue.txt" ; 9D84BA
      dialogueChapterPrologueWorldMap6 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap6.dialogue.txt" ; 9D8504
      dialogueChapterPrologueWorldMapUnknown .include "TEXT/DIALOGUE/ChapterPrologue/WorldMapUnknown.dialogue.txt" ; 9D8702

      .include "EVENTS/Chapter03/EventChapter03Opening.asm"
      .include "EVENTS/Chapter03/EventChapter03MadinoSeized.asm"
      .include "EVENTS/Chapter03/EventChapter03SylvaleSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03_075.asm"
      .include "EVENTS/Chapter03/EventChapter03EldiganApproachesSigurd.asm"
      .include "EVENTS/Chapter03/EventChapter03SigurdApproachesEldigan.asm"
      .include "EVENTS/Chapter03/EventChapter03LachesisEldiganTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03_079.asm"
      .include "EVENTS/Chapter03/EventChapter03EldiganDeathSigurdResponse.asm"
      .include "EVENTS/Chapter03/EventChapter03ThraciaSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03_07C.asm"
      .include "EVENTS/Chapter03/EventChapter03TravantLeave.asm"
      .include "EVENTS/Chapter03/EventChapter03SylvaleSeized.asm"
      .include "EVENTS/Chapter03/EventChapter03ClaudTailtiuSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03OrgahilSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03_081.asm"
      .include "EVENTS/Chapter03/EventChapter03Ending.asm"
      .include "EVENTS/Chapter03/EventChapter03_083.asm"
      .include "EVENTS/Chapter03/EventChapter03_084.asm"
      .include "EVENTS/Chapter03/EventChapter03Village2.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageWingclipper.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageRestore.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageDefense.asm"
      .include "EVENTS/Chapter03/EventChapter03Village4.asm"
      .include "EVENTS/Chapter03/EventChapter03Village3.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageStrength.asm"
      .include "EVENTS/Chapter03/EventChapter03Village1.asm"
      .include "EVENTS/Chapter03/EventChapter03QuanDied.asm"
      .include "EVENTS/Chapter03/EventChapter03EthlynDied.asm"
      .include "EVENTS/Chapter03/EventChapter03FinnDied.asm"
      .include "EVENTS/Chapter03/EventChapter03_090.asm"
      .include "EVENTS/Chapter03/EventChapter03_091.asm"
      .include "EVENTS/Chapter03/EventChapter03_092.asm"
      .include "EVENTS/Chapter03/EventChapter03SylvaleCommanderTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03DewBragiTower.asm"
      .include "EVENTS/Chapter03/EventChapter03_095.asm"

      dialogueChapter03Opening1 .include "TEXT/DIALOGUE/Chapter03/Opening1.dialogue.txt" ; 9D9381
      dialogueChapter03Opening2 .include "TEXT/DIALOGUE/Chapter03/Opening2.dialogue.txt" ; 9D9505
      dialogueChapter03Opening3 .include "TEXT/DIALOGUE/Chapter03/Opening3.dialogue.txt" ; 9D95AB
      dialogueChapter03Opening4 .include "TEXT/DIALOGUE/Chapter03/Opening4.dialogue.txt" ; 9D96B8
      dialogueChapter03MadinoSeized2 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized2.dialogue.txt" ; 9D97B1
      dialogueChapter03Opening5 .include "TEXT/DIALOGUE/Chapter03/Opening5.dialogue.txt" ; 9D9D8D
      dialogueChapter03JacobiBattleQuote .include "TEXT/DIALOGUE/Chapter03/JacobiBattleQuote.dialogue.txt" ; 9D9FE0
      dialogueChapter03MadinoSeized1 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized1.dialogue.txt" ; 9D9FFC
      dialogueChapter03SylvaleSpawn1 .include "TEXT/DIALOGUE/Chapter03/SylvaleSpawn1.dialogue.txt" ; 9DA0A2
      dialogueChapter03SylvaleSpawn2 .include "TEXT/DIALOGUE/Chapter03/SylvaleSpawn2.dialogue.txt" ; 9DA20F
      dialogueChapter03SylvaleSpawn3 .include "TEXT/DIALOGUE/Chapter03/SylvaleSpawn3.dialogue.txt" ; 9DA2B0
      dialogueChapter03SigurdEldiganCloseByTalk .include "TEXT/DIALOGUE/Chapter03/SigurdEldiganCloseByTalk.dialogue.txt" ; 9DA312
      dialogueChapter03LachesisEldiganTalk1 .include "TEXT/DIALOGUE/Chapter03/LachesisEldiganTalk1.dialogue.txt" ; 9DA412
      dialogueChapter03LachesisEldiganTalk2 .include "TEXT/DIALOGUE/Chapter03/LachesisEldiganTalk2.dialogue.txt" ; 9DA692
      dialogueChapter03EldiganDeathSigurdResponse .include "TEXT/DIALOGUE/Chapter03/EldiganDeathSigurdResponse.dialogue.txt" ; 9DA7D5
      dialogueChapter03ThraciaSpawn1 .include "TEXT/DIALOGUE/Chapter03/ThraciaSpawn1.dialogue.txt" ; 9DA894
      dialogueChapter03ThraciaSpawn2 .include "TEXT/DIALOGUE/Chapter03/ThraciaSpawn2.dialogue.txt" ; 9DA92D
      dialogueChapter03EldiganBattleQuote .include "TEXT/DIALOGUE/Chapter03/EldiganBattleQuote.dialogue.txt" ; 9DA98B
      dialogueChapter03LachesisEldiganBattleQuote .include "TEXT/DIALOGUE/Chapter03/LachesisEldiganBattleQuote.dialogue.txt" ; 9DA9CF
      dialogueChapter03PapilioBattleQuote .include "TEXT/DIALOGUE/Chapter03/PapilioBattleQuote.dialogue.txt" ; 9DA9F1
      dialogueChapter03ChagallBattleQuote .include "TEXT/DIALOGUE/Chapter03/ChagallBattleQuote.dialogue.txt" ; 9DAA21
      dialogueChapter03TravantLeave .include "TEXT/DIALOGUE/Chapter03/TravantLeave.dialogue.txt" ; 9DAA70
      dialogueChapter03SylvaleSeized .include "TEXT/DIALOGUE/Chapter03/SylvaleSeized.dialogue.txt" ; 9DAAC9
      dialogueChapter03ClaudTailtiuSpawn .include "TEXT/DIALOGUE/Chapter03/ClaudTailtiuSpawn.dialogue.txt" ; 9DACCF
      dialogueChapter03OrgahilSpawn1 .include "TEXT/DIALOGUE/Chapter03/OrgahilSpawn1.dialogue.txt" ; 9DAF38
      dialogueChapter03OrgahilSpawn2 .include "TEXT/DIALOGUE/Chapter03/OrgahilSpawn2.dialogue.txt" ; 9DB0CA
      dialogueChapter03OrgahilSpawn3 .include "TEXT/DIALOGUE/Chapter03/OrgahilSpawn3.dialogue.txt" ; 9DB142

      ; 9db16a

    .here


    * = $1DB454
    .logical $9DB454

      dialogueChapter03PizareBattleQuote .include "TEXT/DIALOGUE/Chapter03/PizareBattleQuote.dialogue.txt" ; 9DB454
      dialogueChapter03Ending1 .include "TEXT/DIALOGUE/Chapter03/Ending1.dialogue.txt" ; 9DB48D
      dialogueChapter03DuvallBattleQuote .include "TEXT/DIALOGUE/Chapter03/DuvallBattleQuote.dialogue.txt" ; 9DB4ED
      dialogueChapter03Ending2 .include "TEXT/DIALOGUE/Chapter03/Ending2.dialogue.txt" ; 9DB514
      dialogueChapter03Ending3 .include "TEXT/DIALOGUE/Chapter03/Ending3.dialogue.txt" ; 9DB5A3
      dialogueChapter03MadinoSeized3 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized3.dialogue.txt" ; 9DB6B8
      dialogueChapter03MadinoSeized4 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized4.dialogue.txt" ; 9DB7E0
      dialogueChapter03Ending4 .include "TEXT/DIALOGUE/Chapter03/Ending4.dialogue.txt" ; 9DB8CF
      dialogueChapter03Ending5 .include "TEXT/DIALOGUE/Chapter03/Ending5.dialogue.txt" ; 9DBA12
      dialogueChapter03VillageWingclipper .include "TEXT/DIALOGUE/Chapter03/VillageWingclipper.dialogue.txt" ; 9DBB4A
      dialogueChapter03VillageRestore .include "TEXT/DIALOGUE/Chapter03/VillageRestore.dialogue.txt" ; 9DBBB8
      dialogueChapter03Village2 .include "TEXT/DIALOGUE/Chapter03/Village2.dialogue.txt" ; 9DBC5C
      dialogueChapter03Village4SylvaleNotSeized .include "TEXT/DIALOGUE/Chapter03/Village4SylvaleNotSeized.dialogue.txt" ; 9DBCB2
      dialogueChapter03Village1 .include "TEXT/DIALOGUE/Chapter03/Village1.dialogue.txt" ; 9DBD1D
      dialogueChapter03Village3 .include "TEXT/DIALOGUE/Chapter03/Village3.dialogue.txt" ; 9DBD81
      dialogueChapter03VillageStrength .include "TEXT/DIALOGUE/Chapter03/VillageStrength.dialogue.txt" ; 9DBE06
      dialogueChapter03VillageDefense .include "TEXT/DIALOGUE/Chapter03/VillageDefense.dialogue.txt" ; 9DBE7E

      .include "EVENTS/Chapter05/EventChapter05Opening.asm"
      .include "EVENTS/Chapter05/EventChapter05SigurdByronTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AndreyCharge.asm"
      .include "EVENTS/Chapter05/EventChapter05BelhallaConversation.asm"
      .include "EVENTS/Chapter05/EventChapter05LubeckSeized.asm"
      .include "EVENTS/Chapter05/EventChapter05PhinoraSpawn.asm"
      .include "EVENTS/Chapter05/EventChapter05LeonsterSpawn.asm"
      .include "EVENTS/Chapter05/EventChapter05ThraciaSpawn.asm"
      .include "EVENTS/Chapter05/EventChapter05EthlynDied.asm"
      .include "EVENTS/Chapter05/EventChapter05QuanAndEthlynDead.asm"
      .include "EVENTS/Chapter05/EventChapter05PhinoraSeized.asm"
      .include "EVENTS/Chapter05/EventChapter05ReptorCharge.asm"
      .include "EVENTS/Chapter05/EventChapter05AidaBetrayal.asm"
      .include "EVENTS/Chapter05/EventChapter05ReptorBetrayalResponse.asm"
      .include "EVENTS/Chapter05/EventChapter05Ending.asm"
      .include "EVENTS/Chapter05/EventChapter05AnyoneAidaTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05Village1.asm"
      .include "EVENTS/Chapter05/EventChapter05Village2.asm"
      .include "EVENTS/Chapter05/EventChapter05Village3.asm"
      .include "EVENTS/Chapter05/EventChapter05Village4.asm"
      .include "EVENTS/Chapter05/EventChapter05Village5.asm"
      .include "EVENTS/Chapter05/EventChapter05Village6.asm"
      .include "EVENTS/Chapter05/EventChapter05VelthomerSeized.asm"
      .include "EVENTS/Chapter05/EventChapter05Village7.asm"
      .include "EVENTS/Chapter05/EventChapter05ReptorDied.asm"
      .include "EVENTS/Chapter05/EventChapter05ArdenOnCliff.asm"
      .include "EVENTS/Chapter05/EventChapter05_0D7.asm"
      .include "EVENTS/Chapter05/EventChapter05_0D8.asm"

    .here




    * = $2E8000
    .logical $AE8000

      dialogueChapterPrologueEthlynSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/EthlynSigurdTalk.dialogue.txt" ; AE8272
      dialogueChapterPrologueAzelleSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/AzelleSigurdTalk.dialogue.txt" ; AE8272
      dialogueChapterPrologueLexSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/LexSigurdTalk.dialogue.txt" ; AE/84B7
      dialogueChapterPrologueUnusedAlecEthlynTalk .include "TEXT/DIALOGUE/ChapterPrologue/UnusedAlecEthlynTalk.dialogue.txt" ; AE/865F
      dialogueChapterPrologueQuanSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/QuanSigurdTalk.dialogue.txt" ; AE/87E0
      dialogueChapterPrologueUnusedQuanSigurdTalkExpanded .include "TEXT/DIALOGUE/ChapterPrologue/UnusedQuanSigurdTalkExpanded.dialogue.txt" ; AE/8A14
      dialogueChapterPrologueUnusedMidirAzelleTalk .include "TEXT/DIALOGUE/ChapterPrologue/UnusedMidirAzelleTalk.dialogue.txt" ; AE/8AAB
      dialogueChapterPrologueUnusedNaoiseAlecTalk .include "TEXT/DIALOGUE/ChapterPrologue/UnusedNaoiseAlecTalk.dialogue.txt" ; AE/8BC8
      
      dialogueChapter01QuanFinnTalk .include "TEXT/DIALOGUE/Chapter01/QuanFinnTalk.dialogue.txt" ; AE8D28
      dialogueChapter01MidirEdainTalk .include "TEXT/DIALOGUE/Chapter01/MidirEdainTalk.dialogue.txt" ; AE8E25
      dialogueChapter01SigurdEdainTalk .include "TEXT/DIALOGUE/Chapter01/SigurdEdainTalk.dialogue.txt" ; AE8F3C
      dialogueChapter01AzelleEdainTalk .include "TEXT/DIALOGUE/Chapter01/AzelleEdainTalk.dialogue.txt" ; AE9169
      dialogueChapter01EdainEthlynTalk .include "TEXT/DIALOGUE/Chapter01/EdainEthlynTalk.dialogue.txt" ; AE92B8
      dialogueChapter01DewEdainTalk .include "TEXT/DIALOGUE/Chapter01/DewEdainTalk.dialogue.txt" ; AE938F
      dialogueChapter01AyraQuanTalk .include "TEXT/DIALOGUE/Chapter01/AyraQuanTalk.dialogue.txt" ; AE9488
      
      dialogueChapter02DewLachesisTalk .include "TEXT/DIALOGUE/Chapter02/DewLachesisTalk.dialogue.txt" ; AE98F4
      dialogueChapter02DeirdreEthlynTalk .include "TEXT/DIALOGUE/Chapter02/DeirdreEthlynTalk.dialogue.txt" ; AE9A14
      dialogueChapter02QuanFinnTalk .include "TEXT/DIALOGUE/Chapter02/QuanFinnTalk.dialogue.txt" ; AE9B71
      dialogueChapter02SigurdLewynTalk .include "TEXT/DIALOGUE/Chapter02/SigurdLewynTalk.dialogue.txt" ; AE9C8C
      dialogueChapter02BeowulfLachesisTalk .include "TEXT/DIALOGUE/Chapter02/BeowulfLachesisTalk.dialogue.txt" ; AE9F70
      dialogueChapter02AlecSilviaTalk .include "TEXT/DIALOGUE/Chapter02/AlecSilviaTalk.dialogue.txt" ; AEA173
      dialogueChapter02SilviaSigurdTalk .include "TEXT/DIALOGUE/Chapter02/SilviaSigurdTalk.dialogue.txt" ; AEA297
      dialogueChapter02ErinysSigurdTalk .include "TEXT/DIALOGUE/Chapter02/ErinysSigurdTalk.dialogue.txt" ; AEA3FA

      dialogueChapter03LexAyraTalk .include "TEXT/DIALOGUE/Chapter03/LexAyraTalk.dialogue.txt" ; AEA5C2
      dialogueChapter03ChulainnAyraTalk .include "TEXT/DIALOGUE/Chapter03/ChulainnAyraTalk.dialogue.txt" ; AEA74A
      dialogueChapter03SigurdBrigidTalk .include "TEXT/DIALOGUE/Chapter03/SigurdBrigidTalk.dialogue.txt" ; AEA838
      dialogueChapter03ClaudSigurdTalk .include "TEXT/DIALOGUE/Chapter03/ClaudSigurdTalk.dialogue.txt" ; AEA99E
      dialogueChapter03MidirBrigidTalk .include "TEXT/DIALOGUE/Chapter03/MidirBrigidTalk.dialogue.txt" ; AEACEC
      dialogueChapter03EthlynQuanTalk .include "TEXT/DIALOGUE/Chapter03/EthlynQuanTalk.dialogue.txt" ; AEAE09
      dialogueChapter03EdainBrigidTalk .include "TEXT/DIALOGUE/Chapter03/EdainBrigidTalk.dialogue.txt" ; AEB0D3

      dialogueChapter04SigurdClaudTalk .include "TEXT/DIALOGUE/Chapter04/SigurdClaudTalk.dialogue.txt" ; AEB3BD
      dialogueChapter04TailtiuAzelleTalk .include "TEXT/DIALOGUE/Chapter04/TailtiuAzelleTalk.dialogue.txt" ; AEB568
      dialogueChapter04EdainJamkeTalk .include "TEXT/DIALOGUE/Chapter04/EdainJamkeTalk.dialogue.txt" ; AEB7AD
      dialogueChapter04EdainMidirTalk .include "TEXT/DIALOGUE/Chapter04/EdainMidirTalk.dialogue.txt" ; AEB8A6
      dialogueChapter04EdainAzelleTalk .include "TEXT/DIALOGUE/Chapter04/EdainAzelleTalk.dialogue.txt" ; AEB9F0
      dialogueChapter04SilviaClaudTalk .include "TEXT/DIALOGUE/Chapter04/SilviaClaudTalk.dialogue.txt" ; AEBBFB
      dialogueChapter04LewynSigurdTalk .include "TEXT/DIALOGUE/Chapter04/LewynSigurdTalk.dialogue.txt" ; AEBF7F
      dialogueChapter04ErinysLewynTalk .include "TEXT/DIALOGUE/Chapter04/ErinysLewynTalk.dialogue.txt" ; AEC0F6
 
      dialogueChapter05EdainBrigidTalk .include "TEXT/DIALOGUE/Chapter05/EdainBrigidTalk.dialogue.txt" ; AEC1E7
      dialogueChapter05ClaudEdainTalk .include "TEXT/DIALOGUE/Chapter05/ClaudEdainTalk.dialogue.txt" ; AEC32E
      dialogueChapter05DewJamkeTalk .include "TEXT/DIALOGUE/Chapter05/DewJamkeTalk.dialogue.txt" ; AEC66C
      dialogueChapter05AlecNaoiseTalk .include "TEXT/DIALOGUE/Chapter05/AlecNaoiseTalk.dialogue.txt" ; AEC7D6
      dialogueChapter05LexAzelleTalk .include "TEXT/DIALOGUE/Chapter05/LexAzelleTalk.dialogue.txt" ; AEC858
      dialogueChapter05SigurdAyraTalk .include "TEXT/DIALOGUE/Chapter05/SigurdAyraTalk.dialogue.txt" ; AECA23
      dialogueChapter05TailtiuAzelleTalk .include "TEXT/DIALOGUE/Chapter05/TailtiuAzelleTalk.dialogue.txt" ; AECB70
      dialogueChapter05TailtiuClaudTalk .include "TEXT/DIALOGUE/Chapter05/TailtiuClaudTalk.dialogue.txt" ; AECC71
      dialogueChapter05TailtiuLexTalk .include "TEXT/DIALOGUE/Chapter05/TailtiuLexTalk.dialogue.txt" ; AECD78
      dialogueChapter05ErinysLewynTalk .include "TEXT/DIALOGUE/Chapter05/ErinysLewynTalk.dialogue.txt" ; AECEAD
      dialogueChapter05ErinysArdenTalk .include "TEXT/DIALOGUE/Chapter05/ErinysArdenTalk.dialogue.txt" ; AECFF4
      dialogueChapter05ErinysNaoiseTalk .include "TEXT/DIALOGUE/Chapter05/ErinysNaoiseTalk.dialogue.txt" ; AED100
      dialogueChapter05SilviaClaudTalk .include "TEXT/DIALOGUE/Chapter05/SilviaClaudTalk.dialogue.txt" ; AED1F8
      dialogueChapter05SilviaLewynTalk .include "TEXT/DIALOGUE/Chapter05/SilviaLewynTalk.dialogue.txt" ; AED2ED
      dialogueChapter05SilviaAlecTalk .include "TEXT/DIALOGUE/Chapter05/SilviaAlecTalk.dialogue.txt" ; AED3BA
      dialogueChapter05LachesisBeowulfTalk .include "TEXT/DIALOGUE/Chapter05/LachesisBeowulfTalk.dialogue.txt" ; AED4E4
      dialogueChapter05LachesisNaoiseTalk .include "TEXT/DIALOGUE/Chapter05/LachesisNaoiseTalk.dialogue.txt" ; AED611
      dialogueChapter05LachesisDewTalk .include "TEXT/DIALOGUE/Chapter05/LachesisDewTalk.dialogue.txt" ; AED799
      dialogueChapter05AyraLexTalk .include "TEXT/DIALOGUE/Chapter05/AyraLexTalk.dialogue.txt" ; AED8CA
      dialogueChapter05AyraChulainnTalk .include "TEXT/DIALOGUE/Chapter05/AyraChulainnTalk.dialogue.txt" ; AEDA62
      dialogueChapter05AyraArdenTalk .include "TEXT/DIALOGUE/Chapter05/AyraArdenTalk.dialogue.txt" ; AEDB64
      dialogueChapter05BrigidAlecTalk .include "TEXT/DIALOGUE/Chapter05/BrigidAlecTalk.dialogue.txt" ; AEDC86
      dialogueChapter05BrigidJamkeTalk .include "TEXT/DIALOGUE/Chapter05/BrigidJamkeTalk.dialogue.txt" ; AEDDC9
      dialogueChapter05BrigidMidirTalk .include "TEXT/DIALOGUE/Chapter05/BrigidMidirTalk.dialogue.txt" ; AEDF1E

      ; aee07d

    .here






    * = $308000
    .logical $B08000

      .dsection Chapter10EventsSection
      .dsection Chapter10EventDataSection

      ; B0/84C7

    .here




    * = $3084C7
    .logical $B084C7

      dialogueChapter05Opening1 .include "TEXT/DIALOGUE/Chapter05/Opening1.dialogue.txt" ; B084C7
      dialogueChapter05Opening2 .include "TEXT/DIALOGUE/Chapter05/Opening2.dialogue.txt" ; B0850C
      dialogueChapter05Opening3 .include "TEXT/DIALOGUE/Chapter05/Opening3.dialogue.txt" ; B086C4
      dialogueChapter05Opening4 .include "TEXT/DIALOGUE/Chapter05/Opening4.dialogue.txt" ; B087C1
      dialogueChapter05Opening5 .include "TEXT/DIALOGUE/Chapter05/Opening5.dialogue.txt" ; B0880F
      dialogueChapter05SigurdByronTalk .include "TEXT/DIALOGUE/Chapter05/SigurdByronTalk.dialogue.txt" ; B08903
      dialogueChapter05AndreyCharge .include "TEXT/DIALOGUE/Chapter05/AndreyCharge.dialogue.txt" ; B08B67
      dialogueChapter05BelhallaConversation .include "TEXT/DIALOGUE/Chapter05/BelhallaConversation.dialogue.txt" ; B08B98
      dialogueChapter05LubeckSeized1 .include "TEXT/DIALOGUE/Chapter05/LubeckSeized1.dialogue.txt" ; B09297
      dialogueChapter05LubeckSeized2 .include "TEXT/DIALOGUE/Chapter05/LubeckSeized2.dialogue.txt" ; B09817
      dialogueChapter05PhinoraSpawn1 .include "TEXT/DIALOGUE/Chapter05/PhinoraSpawn1.dialogue.txt" ; B09849
      dialogueChapter05PhinoraSpawn2 .include "TEXT/DIALOGUE/Chapter05/PhinoraSpawn2.dialogue.txt" ; B09DAE
      dialogueChapter05LeonsterSpawn .include "TEXT/DIALOGUE/Chapter05/LeonsterSpawn.dialogue.txt" ; B09E06
      dialogueChapter05ThraciaSpawn1 .include "TEXT/DIALOGUE/Chapter05/ThraciaSpawn1.dialogue.txt" ; B0A25F
      dialogueChapter05ThraciaSpawn2 .include "TEXT/DIALOGUE/Chapter05/ThraciaSpawn2.dialogue.txt" ; B0A2FF
      dialogueChapter05EthlynDiedQuanAlive1 .include "TEXT/DIALOGUE/Chapter05/EthlynDiedQuanAlive1.dialogue.txt" ; B0A487
      dialogueChapter05EthlynDiedQuanDead .include "TEXT/DIALOGUE/Chapter05/EthlynDiedQuanDead.dialogue.txt" ; B0A50E
      dialogueChapter05EthlynDiedQuanAlive2 .include "TEXT/DIALOGUE/Chapter05/EthlynDiedQuanAlive2.dialogue.txt" ; B0A624
      dialogueChapter05QuanAndEthlynDead .include "TEXT/DIALOGUE/Chapter05/QuanAndEthlynDead.dialogue.txt" ; B0A682
      dialogueChapter05PhinoraSeized1 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized1.dialogue.txt" ; B0A811
      dialogueChapter05PhinoraSeized2 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized2.dialogue.txt" ; B0A9E9
      dialogueChapter05PhinoraSeized3 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized3.dialogue.txt" ; B0AAD3
      dialogueChapter05PhinoraSeized4 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized4.dialogue.txt" ; B0AAFE
      dialogueChapter05ReptorCharge .include "TEXT/DIALOGUE/Chapter05/ReptorCharge.dialogue.txt" ; B0AB41
      dialogueChapter05AidaBetrayal .include "TEXT/DIALOGUE/Chapter05/AidaBetrayal.dialogue.txt" ; B0AB82
      dialogueChapter05ReptorBetrayalResponse .include "TEXT/DIALOGUE/Chapter05/ReptorBetrayalResponse.dialogue.txt" ; B0ABD0
      dialogueChapter05Ending1 .include "TEXT/DIALOGUE/Chapter05/Ending1.dialogue.txt" ; B0AC0B
      dialogueChapter05AnyoneAidaTalk .include "TEXT/DIALOGUE/Chapter05/AnyoneAidaTalk.dialogue.txt" ; B0AE59
      dialogueChapter05Ending2 .include "TEXT/DIALOGUE/Chapter05/Ending2.dialogue.txt" ; B0AE99
      dialogueChapter05Ending3 .include "TEXT/DIALOGUE/Chapter05/Ending3.dialogue.txt" ; B0B117
      dialogueChapter05Ending4SigurdAndParty .include "TEXT/DIALOGUE/Chapter05/Ending4SigurdAndParty.dialogue.txt" ; B0B2C7
      dialogueChapter05Ending4SigurdAlone .include "TEXT/DIALOGUE/Chapter05/Ending4SigurdAlone.dialogue.txt" ; B0B378
      dialogueChapter05Village1 .include "TEXT/DIALOGUE/Chapter05/Village1.dialogue.txt" ; B0B422
      dialogueChapter05Village2 .include "TEXT/DIALOGUE/Chapter05/Village2.dialogue.txt" ; B0B468
      dialogueChapter05Village3 .include "TEXT/DIALOGUE/Chapter05/Village3.dialogue.txt" ; B0B4B1
      dialogueChapter05Village4 .include "TEXT/DIALOGUE/Chapter05/Village4.dialogue.txt" ; B0B51F
      dialogueChapter05Village5 .include "TEXT/DIALOGUE/Chapter05/Village5.dialogue.txt" ; B0B588
      dialogueChapter05Village6 .include "TEXT/DIALOGUE/Chapter05/Village6.dialogue.txt" ; B0B5FC
      dialogueChapter05Village7 .include "TEXT/DIALOGUE/Chapter05/Village7.dialogue.txt" ; B0B66A
      dialogueChapter05LubeckSeizedByronDies .include "TEXT/DIALOGUE/Chapter05/LubeckSeizedByronDies.dialogue.txt" ; B0B726
      dialogueChapter05EdainAndreyBattleQuote .include "TEXT/DIALOGUE/Chapter05/EdainAndreyBattleQuote.dialogue.txt" ; B0B76E
      dialogueChapter05BrigidAndreyBattleQuote .include "TEXT/DIALOGUE/Chapter05/BrigidAndreyBattleQuote.dialogue.txt" ; B0B7E9
      dialogueChapter05SigurdLombardBattleQuote .include "TEXT/DIALOGUE/Chapter05/SigurdLombardBattleQuote.dialogue.txt" ; B0B8AE
      dialogueChapter05ByronSlayderBattleQuote .include "TEXT/DIALOGUE/Chapter05/ByronSlayderBattleQuote.dialogue.txt" ; B0B933
      dialogueChapter05ByronLubeckBattleQuote .include "TEXT/DIALOGUE/Chapter05/ByronLubeckBattleQuote.dialogue.txt" ; B0B968
      dialogueChapter05SlayderBattleQuote .include "TEXT/DIALOGUE/Chapter05/SlayderBattleQuote.dialogue.txt" ; B0B981
      dialogueChapter05AndreyBattleQuote .include "TEXT/DIALOGUE/Chapter05/AndreyBattleQuote.dialogue.txt" ; B0B9BA
      dialogueChapter05LombardBattleQuote .include "TEXT/DIALOGUE/Chapter05/LombardBattleQuote.dialogue.txt" ; B0B9DC
      dialogueChapter05VajaBattleQuote .include "TEXT/DIALOGUE/Chapter05/VajaBattleQuote.dialogue.txt" ; B0BA33
      dialogueChapter05EthlynThraciaBattleQuote .include "TEXT/DIALOGUE/Chapter05/EthlynThraciaBattleQuote.dialogue.txt" ; B0BA52
      dialogueChapter05QuanBattleQuoteEthlynAlive .include "TEXT/DIALOGUE/Chapter05/QuanBattleQuoteEthlynAlive.dialogue.txt" ; B0BA77
      dialogueChapter05QuanBattleQuoteEthlynDead .include "TEXT/DIALOGUE/Chapter05/QuanBattleQuoteEthlynDead.dialogue.txt" ; B0BAAC
      dialogueChapter05TravantBattleQuote .include "TEXT/DIALOGUE/Chapter05/TravantBattleQuote.dialogue.txt" ; B0BAC4
      dialogueChapter05MagornBattleQuote .include "TEXT/DIALOGUE/Chapter05/MagornBattleQuote.dialogue.txt" ; B0BB0C
      dialogueChapter05ReptorBattleQuotePostBetrayal .include "TEXT/DIALOGUE/Chapter05/ReptorBattleQuotePostBetrayal.dialogue.txt" ; B0BB36
      dialogueChapter05ReptorBattleQuotePreBetrayal .include "TEXT/DIALOGUE/Chapter05/ReptorBattleQuotePreBetrayal.dialogue.txt" ; B0BB5B

      ; b0bb8b

    .here







    * = $30CB5A
    .logical $B0CB5A

      .include "EVENTS/Chapter03/EventChapter03LexAyraTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03ChulainnAyraTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03SigurdBrigidTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03ClaudSigurdTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03MidirBrigidTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03EthlynQuanTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03EdainBrigidTalk.asm"

      .include "EVENTS/Chapter04/EventChapter04SigurdClaudTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04TailtiuAzelleTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04EdainJamkeTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04EdainMidirTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04EdainAzelleTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04SilviaClaudTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04LewynSigurdTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04ErinysLewynTalk.asm"

      .include "EVENTS/Chapter05/EventChapter05EdainBrigidTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ClaudEdainTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05DewJamkeTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AlecNaoiseTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LexAzelleTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SigurdAyraTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05_1CE.asm"
      .include "EVENTS/Chapter05/EventChapter05TailtiuAzelleTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05TailtiuClaudTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05TailtiuLexTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ErinysLewynTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ErinysArdenTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ErinysNaoiseTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SilviaClaudTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SilviaLewynTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SilviaAlecTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LachesisBeowulfTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LachesisNaoiseTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LachesisDewTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AyraLexTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AyraChulainnTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AyraArdenTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05BrigidAlecTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05BrigidJamkeTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05BrigidMidirTalk.asm"

      ; b0cfde

    .here





    * = $30CFE7
    .logical $B0CFE7

      dialogueChapterPrologueMidirGerrardBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/MidirGerrardBattleQuote.dialogue.txt" ; B0CFE7
      dialogueChapter01MidirMunnirBattleQuote .include "TEXT/DIALOGUE/Chapter01/MidirMunnirBattleQuote.dialogue.txt" ; B0D03A
      dialogueChapter01AzelleMunnirBattleQuote .include "TEXT/DIALOGUE/Chapter01/AzelleMunnirBattleQuote.dialogue.txt" ; B0D09B
      dialogueChapter01DeirdreSandimaBattleQuote .include "TEXT/DIALOGUE/Chapter01/DeirdreSandimaBattleQuote.dialogue.txt" ; B0D0EB
      dialogueChapter01JamkeSandimaBattleQuote .include "TEXT/DIALOGUE/Chapter01/JamkeSandimaBattleQuote.dialogue.txt" ; B0D128
      dialogueChapter01UnusedEdainJamkeBattleQuote .include "TEXT/DIALOGUE/Chapter01/UnusedEdainJamkeBattleQuote.dialogue.txt" ; B0D17A

      dialogueChapter02ErinysChagallBattleQuote .include "TEXT/DIALOGUE/Chapter02/ErinysChagallBattleQuote.dialogue.txt" ; B0D1B5
      dialogueChapter02LachesisChagallBattleQuote .include "TEXT/DIALOGUE/Chapter02/LachesisChagallBattleQuote.dialogue.txt" ; B0D218
      dialogueChapter02LachesisElliotBattleQuote .include "TEXT/DIALOGUE/Chapter02/LachesisElliotBattleQuote.dialogue.txt" ; B0D280
      dialogueChapter02BeowulfWaltzBattleQuote .include "TEXT/DIALOGUE/Chapter02/BeowulfWaltzBattleQuote.dialogue.txt" ; B0D2F9
      dialogueChapter02LewynMacBethBattleQuote .include "TEXT/DIALOGUE/Chapter02/LewynMacBethBattleQuote.dialogue.txt" ; B0D362
      dialogueChapter02UnusedLewynErinysBattleQuote .include "TEXT/DIALOGUE/Chapter02/UnusedLewynErinysBattleQuote.dialogue.txt" ; B0D3B0

      dialogueChapter03SigurdEldiganBattleQuote .include "TEXT/DIALOGUE/Chapter03/SigurdEldiganBattleQuote.dialogue.txt" ; B0D3D2
      dialogueChapter03BrigidDuvallBattleQuote .include "TEXT/DIALOGUE/Chapter03/BrigidDuvallBattleQuote.dialogue.txt" ; B0D440
      dialogueChapter03LachesisChagallBattleQuote .include "TEXT/DIALOGUE/Chapter03/LachesisChagallBattleQuote.dialogue.txt" ; B0D48A
      dialogueChapter03SigurdChagallBattleQuote .include "TEXT/DIALOGUE/Chapter03/SigurdChagallBattleQuote.dialogue.txt" ; B0D4DB
 
      ; b0d572

    .here






    * = $30D59A
    .logical $B0D59A

      dialogueChapter04LewynMyosBattleQuote .include "TEXT/DIALOGUE/Chapter04/LewynMyosBattleQuote.dialogue.txt" ; B0D59A
      dialogueChapter04LewynDaccarBattleQuote .include "TEXT/DIALOGUE/Chapter04/LewynDaccarBattleQuote.dialogue.txt" ; B0D602
      dialogueChapter04ErinysDithorbaBattleQuote .include "TEXT/DIALOGUE/Chapter04/ErinysDithorbaBattleQuote.dialogue.txt" ; B0D66D
      dialogueChapter04ErinysPamelaBattleQuote .include "TEXT/DIALOGUE/Chapter04/ErinysPamelaBattleQuote.dialogue.txt" ; B0D722
      dialogueChapter04LewynPamelaBattleQuote .include "TEXT/DIALOGUE/Chapter04/LewynPamelaBattleQuote.dialogue.txt" ; B0D7B0

      dialogueChapter05LexLombardBattleQuote .include "TEXT/DIALOGUE/Chapter05/LexLombardBattleQuote.dialogue.txt" ; B0D83C
      dialogueChapter05TailtiuReptorBattleQuote .include "TEXT/DIALOGUE/Chapter05/TailtiuReptorBattleQuote.dialogue.txt" ; B0D8B6
      dialogueChapter05SigurdMagornBattleQuote .include "TEXT/DIALOGUE/Chapter05/SigurdMagornBattleQuote.dialogue.txt" ; B0D990
      dialogueChapter05SigurdReptorBattleQuote .include "TEXT/DIALOGUE/Chapter05/SigurdReptorBattleQuote.dialogue.txt" ; B0D9B9
      dialogueChapter05AidaReptorBattleQuote .include "TEXT/DIALOGUE/Chapter05/AidaReptorBattleQuote.dialogue.txt" ; B0DB71

      ; b0dbd0

    .here








    * = $318000
    .logical $B18000

      .include "EVENTS/ChapterPrologue/EventPrologueOpening.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEdainAbduction.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueQuanGroupSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueLexAzelleSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueYngviSeized.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEvansSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueArvisSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEnding.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueSigurdHomeCastle.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00A.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00B.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00C.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00D.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00E.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00F.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue010.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue011.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue012.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueSigurdArvisTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage1.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage2.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage4.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage3.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillageSpeedRing.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueQuanDied.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEthlynDied.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueFinnDied.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01C.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01D.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01E.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01F.asm"

      dialogueChapterPrologueOpening1 .include "TEXT/DIALOGUE/ChapterPrologue/Opening1.dialogue.txt" ; B18771
      dialogueChapterPrologueOpening2 .include "TEXT/DIALOGUE/ChapterPrologue/Opening2.dialogue.txt" ; B18874
      dialogueChapterPrologueMunnirMidirBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/MunnirMidirBattleQuote.dialogue.txt" ; B18E93
      dialogueChapterPrologueMidirCutsceneDeath .include "TEXT/DIALOGUE/ChapterPrologue/MidirCutsceneDeath.dialogue.txt" ; B18ECD
      dialogueChapterPrologueMunnirEdainCaptured .include "TEXT/DIALOGUE/ChapterPrologue/MunnirEdainCaptured.dialogue.txt" ; B18EF7
      dialogueChapterPrologueMunnirLowerBridge .include "TEXT/DIALOGUE/ChapterPrologue/MunnirLowerBridge.dialogue.txt" ; B1901C
      dialogueChapterPrologueMunnirHurryUp .include "TEXT/DIALOGUE/ChapterPrologue/MunnirHurryUp.dialogue.txt" ; B19067
      dialogueChapterPrologueDiMaggioYngviTakeover .include "TEXT/DIALOGUE/ChapterPrologue/DiMaggioYngviTakeover.dialogue.txt" ; B190A5
      dialogueChapterPrologueQuanGroupSpawn .include "TEXT/DIALOGUE/ChapterPrologue/QuanGroupSpawn.dialogue.txt" ; B190DC
      dialogueChapterPrologueDiMaggioBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/DiMaggioBattleQuote.dialogue.txt" ; B19291
      dialogueChapterPrologueYngviSeized .include "TEXT/DIALOGUE/ChapterPrologue/YngviSeized.dialogue.txt" ; B192C5
      dialogueChapterPrologueEvansSpawn .include "TEXT/DIALOGUE/ChapterPrologue/EvansSpawn.dialogue.txt" ; B19403
      dialogueChapterPrologueEnding2 .include "TEXT/DIALOGUE/ChapterPrologue/Ending2.dialogue.txt" ; B1946F
      dialogueChapterPrologueMunnirAttackCastle .include "TEXT/DIALOGUE/ChapterPrologue/MunnirAttackCastle.dialogue.txt" ; B195BC
      dialogueChapterPrologueGerrardBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/GerrardBattleQuote.dialogue.txt" ; B195FA
      dialogueChapterPrologueMunnirGerrardConversation .include "TEXT/DIALOGUE/ChapterPrologue/MunnirGerrardConversation.dialogue.txt" ; B19616
      dialogueChapterPrologueLexAzelleSpawn .include "TEXT/DIALOGUE/ChapterPrologue/LexAzelleSpawn.dialogue.txt" ; B1978A
      dialogueChapterPrologueEnding1 .include "TEXT/DIALOGUE/ChapterPrologue/Ending1.dialogue.txt" ; B1998E
      dialogueChapterPrologueUnusedEnding1Copy .include "TEXT/DIALOGUE/ChapterPrologue/UnusedEnding1Copy.dialogue.txt" ; B19A5C

      dialogueChapterPrologueSigurdHomeCastle .include "TEXT/DIALOGUE/ChapterPrologue/SigurdHomeCastle.dialogue.txt" ; B19B2A
      dialogueChapterPrologueVillage1 .include "TEXT/DIALOGUE/ChapterPrologue/Village1.dialogue.txt" ; B19B9B
      dialogueChapterPrologueVillage2 .include "TEXT/DIALOGUE/ChapterPrologue/Village2.dialogue.txt" ; B19C32
      dialogueChapterPrologueVillage4 .include "TEXT/DIALOGUE/ChapterPrologue/Village4.dialogue.txt" ; B19CED
      dialogueChapterPrologueVillage3 .include "TEXT/DIALOGUE/ChapterPrologue/Village3.dialogue.txt" ; B19D8D
      dialogueChapterPrologueVillageSpeedRing .include "TEXT/DIALOGUE/ChapterPrologue/VillageSpeedRing.dialogue.txt" ; B19E87
      dialogueChapterPrologueArvisSpawn .include "TEXT/DIALOGUE/ChapterPrologue/ArvisSpawn.dialogue.txt" ; B19F26
      dialogueChapterPrologueArvisSigurdTalkAzelleAlive .include "TEXT/DIALOGUE/ChapterPrologue/ArvisSigurdTalkAzelleAlive.dialogue.txt" ; B19F88
      dialogueChapterPrologueArvisSigurdTalkAzelleDead .include "TEXT/DIALOGUE/ChapterPrologue/ArvisSigurdTalkAzelleDead.dialogue.txt" ; B1A1F1

      .dsection ChapterFinalEventsSection
      .dsection ChapterFinalEventDataSection

      ; B1/AC01

    .here


    * = $328000
    .logical $B28000

      .dsection Chapter06EventsSection
      .dsection Chapter06EventDataSection

      dialogueChapter01WorldMap1 .include "TEXT/DIALOGUE/Chapter01/WorldMap1.dialogue.txt" ; B284FB
      dialogueChapter01WorldMap2 .include "TEXT/DIALOGUE/Chapter01/WorldMap2.dialogue.txt" ; B28517
      dialogueChapter01WorldMap3 .include "TEXT/DIALOGUE/Chapter01/WorldMap3.dialogue.txt" ; B28543
      dialogueChapter01WorldMap4 .include "TEXT/DIALOGUE/Chapter01/WorldMap4.dialogue.txt" ; B28592
      dialogueChapter01WorldMap5 .include "TEXT/DIALOGUE/Chapter01/WorldMap5.dialogue.txt" ; B28639
      dialogueChapter01WorldMap6 .include "TEXT/DIALOGUE/Chapter01/WorldMap6.dialogue.txt" ; B286E8

      ; B2876C

    .here



    * = $32D2AA
    .logical $B2D2AA

      dialogueChapter03Village4SylvaleSeized .include "TEXT/DIALOGUE/Chapter03/Village4SylvaleSeized.dialogue.txt" ; B2D2AA
      dialogueChapter04VillageSafeguardSilvia1 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia1.dialogue.txt" ; B2D2FB
      dialogueChapter04VillageSafeguardSilvia2 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia2.dialogue.txt" ; B2D3C4
      dialogueChapter04VillageSafeguardSilvia3 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia3.dialogue.txt" ; B2D3D6
      dialogueChapter04VillageSafeguardSilvia4 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia4.dialogue.txt" ; B2D3E8
      dialogueChapter04VillageSafeguardSilvia5 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia5.dialogue.txt" ; B2D3F9

      ; b2d497

    .here



    * = $32D726
    .logical $B2D726

      dialogueChapter03DewBragiTower1 .include "TEXT/DIALOGUE/Chapter03/DewBragiTower1.dialogue.txt" ; B2D726
      dialogueChapter03DewBragiTower2 .include "TEXT/DIALOGUE/Chapter03/DewBragiTower2.dialogue.txt" ; B2D766
      dialogueChapter03DewBragiTower3 .include "TEXT/DIALOGUE/Chapter03/DewBragiTower3.dialogue.txt" ; B2D81C
      dialogueChapter02MountainArmorTalk .include "TEXT/DIALOGUE/Chapter02/MountainArmorTalk.dialogue.txt" ; B2D862
      dialogueChapter01CrossknightTalk .include "TEXT/DIALOGUE/Chapter01/CrossknightTalk.dialogue.txt" ; B2D8D3
      dialogueChapter03SylvaleCommanderTalk .include "TEXT/DIALOGUE/Chapter03/SylvaleCommanderTalk.dialogue.txt" ; B2D8D3

      ; b2d92f

    .here



    * = $32DBC9
    .logical $B2DBC9

      dialogueChapter05ArdenOnCliff .include "TEXT/DIALOGUE/Chapter05/ArdenOnCliff.dialogue.txt" ; B2DBC9

      ; b2dc78

    .here




    * = $32E187
    .logical $B2E187

      dialogueChapter04ErinysSilviaAdjacent .include "TEXT/DIALOGUE/Chapter04/ErinysSilviaAdjacent.dialogue.txt" ; B2E187

      ; b2e359

    .here



    * = $32F6C3
    .logical $B2F6C3

      dialogueChapter02ArdenPursuitRing .include "TEXT/DIALOGUE/Chapter02/ArdenPursuitRing.dialogue.txt" ; B2F6C3

      ; b2f7be

    .here



    * = $32F7CE
    .logical $B2F7CE

      .include "EVENTS/ChapterPrologue/EventPrologueEthlynSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueAzelleSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueLexSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueUnusedAlecEthlynTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueQuanSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueUnusedMidirAzelleTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueUnusedNaoiseAlecTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01QuanFinnTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01MidirEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01SigurdEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01AzelleEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01EdainEthlynTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01DewEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01AyraQuanTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02DewLachesisTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02DeirdreEthlynTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02QuanFinnTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02SigurdLewynTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02BeowulfLachesisTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02AlecSilviaTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02SilviaSigurdTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02ErinysSigurdTalk.asm"

      ; B2/FA8D
      
    .here








    * = $010000
    .logical $C10000

      g4bppcMageFemaleMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/MageFemale.4bpp.comp"
      g4bppcMageMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Mage.4bpp.comp"
      g4bppcPriestFemaleMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/PriestFemale.4bpp.comp"
      g4bppcJuniorLordMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/JuniorLord.4bpp.comp"
      g4bppcMyrmidonMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Myrmidon.4bpp.comp"
      g4bppcLanceArmorMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/LanceArmor.4bpp.comp"
      g4bppcBarbarianMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/Barbarian.4bpp.comp"
      g4bppcArcherMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Archer.4bpp.comp"
      g4bppcSoldierMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Soldier.4bpp.comp"
      g4bppcArcherFemaleMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/ArcherFemale.4bpp.comp"
      g4bppcAxeArmorMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/AxeArmor.4bpp.comp"
      g4bppcBowSoldierMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/BowSoldier.4bpp.comp"
      g4bppcDancerMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Dancer.4bpp.comp"
      g4bppcMyrmidonFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/MyrmidonFemale.4bpp.comp"
      g4bppcPrincessMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Princess.4bpp.comp"
      g4bppcThiefMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Thief.4bpp.comp"
      g4bppcGeneralMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/General.4bpp.comp"
      g4bppcPriestessMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/Priestess.4bpp.comp"
      g4bppcFighterMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Fighter.4bpp.comp"
      g4bppcWindMageMapMovementSprite           .crossbank.start "GRAPHICS/MapMovementSprites/WindMage.4bpp.comp"

    .here

    * = $020000
    .logical $C20000

      .crossbank.end
      g4bppcWindMageFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/WindMageFemale.4bpp.comp"
      g4bppcPriestMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Priest.4bpp.comp"
      g4bppcHunterMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Hunter.4bpp.comp"
      g4bppcSwordmasterMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/Swordmaster.4bpp.comp"
      g4bppcHeroMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Hero.4bpp.comp"
      g4bppcWarriorMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Warrior.4bpp.comp"
      g4bppcBrigandMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Brigand.4bpp.comp"
      g4bppcPirateMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Pirate.4bpp.comp"
      g4bppcHeroFemaleMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/HeroFemale.4bpp.comp"
      g4bppcBaronMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Baron.4bpp.comp"
      g4bppcHighPriestFemaleMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/HighPriestFemale.4bpp.comp"
      g4bppcSwordmasterFemaleMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/SwordmasterFemale.4bpp.comp"
      g4bppcSniperFemaleMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/SniperFemale.4bpp.comp"
      g4bppcSniperMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Sniper.4bpp.comp"
      g4bppcEmperorMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Emperor.4bpp.comp"
      g4bppcSwordSoldierMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/SwordSoldier.4bpp.comp"
      g4bppcAxeSoldierMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/AxeSoldier.4bpp.comp"
      g4bppcSpearSoldierMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/SpearSoldier.4bpp.comp"
      g4bppcSwordArmorMapMovementSprite         .crossbank.start "GRAPHICS/MapMovementSprites/SwordArmor.4bpp.comp"

    .here

    * = $030000
    .logical $C30000

      .crossbank.end
      g4bppcBowArmorMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/BowArmor.4bpp.comp"
      g4bppcFireMageFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/FireMageFemale.4bpp.comp"
      g4bppcFireMageMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/FireMage.4bpp.comp"
      g4bppcThunderMageFemaleMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/ThunderMageFemale.4bpp.comp"
      g4bppcThunderMageMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/ThunderMage.4bpp.comp"
      g4bppcHighPriestMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/HighPriest.4bpp.comp"
      g4bppcWarMageFemaleMapMovementSprite      .binary "GRAPHICS/MapMovementSprites/WarMageFemale.4bpp.comp"
      g4bppcDarkBishopMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/DarkBishop.4bpp.comp"
      g4bppcDarkMageMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/DarkMage.4bpp.comp"
      g4bppcPrinceMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Prince.4bpp.comp"
      g4bppcWarMageMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/WarMage.4bpp.comp"
      g4bppcChildFemaleMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/ChildFemale.4bpp.comp"
      g4bppcChildMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Child.4bpp.comp"
      g4bppcQueenMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Queen.4bpp.comp"
      g4bppcBishopMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Bishop.4bpp.comp"
      g4bppcCivilianMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Civilian.4bpp.comp"
      g4bppcCivilianFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/CivilianFemale.4bpp.comp"
      g4bppcRogueFemaleMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/RogueFemale.4bpp.comp"
      g4bppcBardMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Bard.4bpp.comp"
      g4bppcThiefFemaleMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/ThiefFemale.4bpp.comp"
      g4bppcRogueMapMovementSprite              .crossbank.start "GRAPHICS/MapMovementSprites/Rogue.4bpp.comp"

    .here

    * = $040000
    .logical $C40000

      .crossbank.end
      g4bppcSageMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Sage.4bpp.comp"
      g4bppcSageFemaleMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/SageFemale.4bpp.comp"
      g4bppcDarkPrinceMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/DarkPrince.4bpp.comp"
      g4bppcSmallOifeyMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/SmallOifey.4bpp.comp"
      g4bppcShortEmptyMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/ShortEmpty.4bpp.comp"

      g4bppcDragonRiderMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/DragonRider.4bpp.comp"
      g4bppcCavalierMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Cavalier.4bpp.comp"
      g4bppcDukeKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/DukeKnight.4bpp.comp"
      g4bppcPegasusRiderMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/PegasusRider.4bpp.comp"
      g4bppcAxeKnightMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/AxeKnight.4bpp.comp"
      g4bppcFreeKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/FreeKnight.4bpp.comp"
      g4bppcLanceKnightMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/LanceKnight.4bpp.comp"
      g4bppcBowKnightMapMovementSprite          .crossbank.start "GRAPHICS/MapMovementSprites/BowKnight.4bpp.comp"

    .here

    * = $050000
    .logical $C50000

      .crossbank.end
      g4bppcKnightLordSeliphMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/KnightLordSeliph.4bpp.comp"
      g4bppcTroubadourMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/Troubadour.4bpp.comp"
      g4bppcKnightLordSigurdMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/KnightLordSigurd.4bpp.comp"
      g4bppcPaladinMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Paladin.4bpp.comp"
      g4bppcDragonMasterMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/DragonMaster.4bpp.comp"
      g4bppcArchKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/ArchKnight.4bpp.comp"
      g4bppcGreatKnightMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/GreatKnight.4bpp.comp"
      g4bppcMageKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/MageKnight.4bpp.comp"
      g4bppcDragonKnightMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/DragonKnight.4bpp.comp"
      g4bppcPegasusKnightMapMovementSprite      .crossbank.start "GRAPHICS/MapMovementSprites/PegasusKnight.4bpp.comp"

    .here

    * = $060000
    .logical $C60000

      .crossbank.end
      g4bppcFalconKnightMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/FalconKnight.4bpp.comp"
      g4bppcMasterKnightMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/MasterKnight.4bpp.comp"
      g4bppcRangerMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Ranger.4bpp.comp"
      g4bppcBallisticianMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/Ballistician.4bpp.comp"
      g4bppcIronBallisticianMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/IronBallistician.4bpp.comp"
      g4bppcKillerBallisticianMapMovementSprite .binary "GRAPHICS/MapMovementSprites/KillerBallistician.4bpp.comp"
      g4bppcGreatBallisticianMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/GreatBallistician.4bpp.comp"
      g4bppcDragonRiderFemaleMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/DragonRiderFemale.4bpp.comp"
      g4bppcDragonKnightFemaleMapMovementSprite .binary "GRAPHICS/MapMovementSprites/DragonKnightFemale.4bpp.comp"
      g4bppcDragonMasterFemaleMapMovementSprite .binary "GRAPHICS/MapMovementSprites/DragonMasterFemale.4bpp.comp"
      g4bppcPaladinFemaleMapMovementSprite      .binary "GRAPHICS/MapMovementSprites/PaladinFemale.4bpp.comp"
      g4bppcMageKnightFemaleMapMovementSprite   .crossbank.start "GRAPHICS/MapMovementSprites/MageKnightFemale.4bpp.comp"

    .here

    * = $070000
    .logical $C70000

      .crossbank.end
      g4bppcMasterKnightFemaleMapMovementSprite .binary "GRAPHICS/MapMovementSprites/MasterKnightFemale.4bpp.comp"
      g4bppcTallEmptyMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/TallEmpty.4bpp.comp"

      ; C7/0C6C

    .here









    * = $112E50
    .logical $D12E50

      aVerdaneMapHighlightTilemap          .text ROM[$112E50:$113019] ; D12E50
      aAgustriaMapHighlightTilemap         .text ROM[$113019:$113193] ; D13019
      aSilesseMapHighlightTilemap          .text ROM[$113193:$113300] ; D13193
      aAedMapHighlightTilemap              .text ROM[$113300:$11345D] ; D13300
      aIsaachMapHighlightTilemap           .text ROM[$11345D:$11360F] ; D1345D
      aMunsterMapHighlightTilemap          .text ROM[$11360F:$1137AC] ; D1360F
      aThraciaMapHighlightTilemap          .text ROM[$1137AC:$113977] ; D137AC
      aMiletosMapHighlightTilemap          .text ROM[$113977:$113AAC] ; D13977
      aGrannvaleMapHighlightTilemap        .text ROM[$113AAC:$113C01] ; D13AAC

      ; D1/3C01

    .here






    ; aUnknownD13C85 .text ROM[$113C85:$113D09]




    * = $1468A3
    .logical $D468A3

      aUnitedGrannvaleMapHighlightTilemap  .text ROM[$1468A3:$14699E] ; D468A3
      aUnifiedThraciaMapHighlightTilemap   .text ROM[$14699E:$146B27] ; D4699E

      ; D4/6B27

    .here






