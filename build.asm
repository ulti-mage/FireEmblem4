
.cpu "65816"

.include "asm/BaseRom.asm"
.include "lib/FE4Macros.inc"
.include "lib/FE4Constants.inc"
.include "lib/MenuText.inc"
.include "lib/LibraryHelpers.h"
.include "lib/IORegisters.h"
.include "lib/WRAM.inc"

.include "asm/Debug.asm"
.include "asm/Stuff.asm"









; 01AD1D > 2BE4

; mainloop $809B00 > 89E7EA, 89E7BD, 89E7CC
