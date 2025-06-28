
  .include "../TEXT/DIALOGUE/Dialogue.h"

  DialogueStatusEnabled           = bits($0001)
  DialogueStatusActive            = bits($0002)
  DialogueStatusWaitForInput      = bits($0004)
  DialogueStatusAssetLoading      = bits($0008)
  DialogueStatusUpdateMouth       = bits($0010)
  DialogueStatusToggleMouthMove   = bits($0020) ; set if displaying anything but character $BF?
  DialogueStatusPreventInput      = bits($0040) ; if set: ignore the display height for the BG area?
  DialogueStatusPreventBSkipping  = bits($0080)
  DialogueStatusPreventASpeedUp   = bits($0100)
  DialogueStatusInstantSpeedUp    = bits($0200)
  DialogueStatusAutoscroll        = bits($0400)
  DialogueStatusTopOpened         = bits($0800)
  DialogueStatusBottomOpened      = bits($1000)
  DialogueStatus2000              = bits($2000)
  DialogueStatusCaretLight        = bits($4000) ; the little "press A" indicator
  DialogueStatusCaretDark         = bits($8000) ; the little "press A" indicator

  DIALOGUE_EOF .segment
    .byte $01
  .endsegment

  DIALOGUE_NL .segment
    .byte $02
  .endsegment

  DIALOGUE_CLEAR .segment
    .byte $03
  .endsegment

  DIALOGUE_SCROLL .segment
    .byte $04
  .endsegment

  DIALOGUE_SIDE .segment Side
    ; 0 is left, 1 is right
    .byte $05
    .byte \Side
  .endsegment

  DIALOGUE_LEFT .segment
    .byte $06
  .endsegment

  DIALOGUE_RIGHT .segment
    .byte $07
  .endsegment

  DIALOGUE_WAIT_PRESS .segment
    .byte $08
  .endsegment

  DIALOGUE_FONT_0 .segment
    .byte $09
    .enc "DialoguePage0"
  .endsegment

  DIALOGUE_FONT_1 .segment
    .byte $0A
    .enc "DialoguePage1"
  .endsegment

  DIALOGUE_FONT_2 .segment
    .byte $0B
    .enc "DialoguePage2"
  .endsegment

  DIALOGUE_FONT_3 .segment
    .byte $0C
    .enc "DialoguePage3"
  .endsegment

  DIALOGUE_FONT_4 .segment
    .byte $0D
    .enc "DialoguePage4"
  .endsegment

  DIALOGUE_FONT_5 .segment
    .byte $0E
    .enc "DialoguePage5"
  .endsegment

  ; $0F is a copy of DIALOGUE_FONT_5

  DIALOGUE_STACK_EOF .segment
    ; This is no different than a regular EOF, but the ending uses this
    ; to remember when pushed dialogue pointers are supposed to be pulled.
    .byte $00, $01
  .endsegment

  DIALOGUE_STACK_NL .segment
    .byte $00, $02
  .endsegment


  DIALOGUE_SET_TEXT_POSITION .segment Coordinates
    ; Unused.
    .byte $00, $10
    .byte \Coordinates[0]
    .byte \Coordinates[1]
  .endsegment

  DIALOGUE_SET_DISPLAY_AREA .segment Height, Width
    ; Unused.
    .byte $00, $11
    .byte \Height
    .byte \Width
  .endsegment

  DIALOGUE_SET_SPEED .segment Speed
    ; Input if -3 sets the text speed to the value set in the options menu.
    .byte $00, $12
    .char \Speed
  .endsegment

  DIALOGUE_PLAY_SONG .segment Song
    .byte $00, $13
    .byte \Song
  .endsegment

  DIALOGUE_SET_TEXT_SOUND .segment Sound
    ; Sets the text bloops.
    .byte $00, $14
    .byte \Sound
  .endsegment

  DIALOGUE_SET_BASE_TILE .segment BaseTileIndex
    ; Unused.
    .byte $00, $15
    .word \BaseTileIndex
  .endsegment

  DIALOGUE_SET_CLEAR_TILE .segment ClearTileIndex
    ; Unused.
    .byte $00, $16
    .word \ClearTileIndex
  .endsegment

  DIALOGUE_CLEAR_HALT .segment
    ; Unused.
    ; Clear dialogue but waits for input.
    .byte $00, $17
  .endsegment

  DIALOGUE_18 .segment
    ; Unused.
    ; Identical code to DIALOGUE_WAIT_PRESS.
    .byte $00, $18
  .endsegment

  DIALOGUE_SET_BUFFER_OFFSET .segment BufferOffset
    ; Unused.
    .byte $00, $19
    .word \BufferOffset
  .endsegment

  DIALOGUE_SET_VRAM_ADDRESS .segment Address
    ; Unused.
    .byte $00, $1A
    .word \Address
  .endsegment

  DIALOGUE_SET_BUFFER_POSITION .segment BufferPosition
    ; Unused.
    .byte $00, $1B
    .long \BufferPosition
  .endsegment

  DIALOGUE_ADD_TILE_OFFSET .segment TileCount
    ; Unused.
    .byte $00, $1C
    .byte \TileCount
  .endsegment

  DIALOGUE_PAUSE .segment Timer
    .byte $00, $1D
    .byte \Timer
  .endsegment

  DIALOGUE_SET_STATUS .segment Status
    ; Unused.
    .byte $00, $1E
    .word \Status
  .endsegment

  DIALOGUE_ADD_STATUS .segment Status
    ; Unused.
    ; ORA's input with current status.
    .byte $00, $1F
    .word \Status
  .endsegment

  DIALOGUE_MASK_STATUS .segment Status
    ; Unused.
    ; AND's input with current status.
    .byte $00, $20
    .word \Status
  .endsegment

  ; $21 calls DIALOGUE_WAIT_PRESS

  DIALOGUE_UNIT1_NAME .segment
    ; This displays the player characters name in the Unit1 slot.
    .byte $00, $22
  .endsegment

  DIALOGUE_UNIT2_NAME .segment
    ; This displays the player characters name in the Unit2 slot.
    .byte $00, $23
  .endsegment

  DIALOGUE_LOAD_SLOT_PORTRAIT .segment
    ; If the current side is right, load Unit1.
    ; If the current side is left, load Unit2.
    .byte $00, $24
  .endsegment

  DIALOGUE_NUMBER1 .segment
    ; This displays the number in aDialogue.wNumber1.
    .byte $00, $25
  .endsegment

  DIALOGUE_NUMBER2 .segment
    ; This displays the number in aDialogue.wNumber2.
    .byte $00, $26
  .endsegment

  DIALOGUE_ITEM_NAME .segment
    ; This displays the item name of the value in aDialogue.wItemID.
    .byte $00, $27
  .endsegment

  DIALOGUE_CLASS_NAME .segment
    ; This displays the class name of the value in aDialogue.wClassID.
    .byte $00, $28
  .endsegment

  DIALOGUE_SCROLL_ALL .segment
    .byte $00, $29
  .endsegment

  DIALOGUE_SET_TEXT .segment DialoguePointer
    ; Similar to $27 and $28, this takes a long pointer as an argument and inserts
    ; its dialogue at the point where it was called.
    .byte $00, $2A
    .long \DialoguePointer
  .endsegment

  DIALOGUE_PLAY_SFX2B .segment SFX
    .byte $00, $2B
    .byte \SFX
  .endsegment

  DIALOGUE_CHILD_NAME .segment CharacterID
    ; Displays a childs name or the substitutes name, whoever exists.
    .byte $00, $2C
    .word \CharacterID
  .endsegment

  DIALOGUE_ASMC .segment RoutinePointer
    ; Executes the routine at given addres with a jsl.
    .byte $00, $2D
    .long \RoutinePointer
  .endsegment

  DIALOGUE_LOAD_UNIT1_PORTRAIT .segment
    .byte $00, $2E
  .endsegment

  DIALOGUE_LOAD_UNIT2_PORTRAIT .segment
    .byte $00, $2F
  .endsegment

  DIALOGUE_CHILD_SIBLING_NAME .segment CharacterID
    ; Displays the siblings name of a child or substitute, whoever exists.
    ; Based on CharacterID in wUnit2.
    .byte $00, $30
  .endsegment

  ; 31 and 32 do the exact same thing

  DIALOGUE_PLAY_SFX31 .segment SFX
    .byte $00, $31
    .byte \SFX
  .endsegment

  DIALOGUE_PLAY_SFX32 .segment SFX
    .byte $00, $32
    .byte \SFX
  .endsegment

  DIALOGUE_PLAY_SFX33 .segment SFX
    .byte $00, $33
    .byte \SFX
  .endsegment

  DIALOGUE_LOAD_CHILD_SIBLING_PORTRAIT .segment
    ; Loads the siblings portrait of a child or substitute, whoever exists.
    ; Based on CharacterID in wUnit2.
    .byte $00, $34
  .endsegment

  ; $35 - $39 are all escape commands
  ; $3A calls $03
  ; $3B calls $04
  ; $3C calls $05

  DIALOGUE_OPEN_BOX .segment
    .byte $00, $3D
  .endsegment

  DIALOGUE_CLOSE_BOX .segment
    .byte $00, $3E
  .endsegment

  DIALOGUE_LOAD_PORTRAIT .segment Portrait
    .byte $00, $3F
    .word \Portrait
  .endsegment

  DIALOGUE_UNLOAD_PORTRAIT .segment
    .byte $00, $40
  .endsegment


  DIALOGUE_WMM .segment Coordinates, Slot, Type
    .byte $00, $00 + $80
    .byte \Coordinates[0]
    .byte \Coordinates[1]
    .byte \Slot
    .byte \Type
  .endsegment

  DIALOGUE_CLEAR_WMM .segment Slot
    .byte $00, $01 + $80
    .byte \Slot
  .endsegment

  DIALOGUE_WM_LOAD_PORTRAIT .segment Slot, Portrait
    .byte $00, $02 + $80
    .byte \Slot
    .word \Portrait
  .endsegment

  DIALOGUE_WM_FADE_IN_PORTRAIT .segment Slot, Coordinates
    .byte $00, $03 + $80
    .byte \Slot
    .byte \Coordinates[0]
    .byte \Coordinates[1]
  .endsegment

  DIALOGUE_WM_FADE_OUT_PORTRAIT .segment Slot
    .byte $00, $04 + $80
    .byte \Slot
  .endsegment

  DIALOGUE_WM_MOVE_PORTRAIT .segment Slot, Coordinates
    .byte $00, $05 + $80
    .byte \Slot
    .byte \Coordinates[0]
    .byte \Coordinates[1]
  .endsegment

  DIALOGUE_WM_HIGHLIGHT .segment CountryID
    .byte $00, $06 + $80
    .byte \CountryID
  .endsegment

  DIALOGUE_WM_CLEAR_HIGHLIGHT .segment
    .byte $00, $07 + $80
  .endsegment
