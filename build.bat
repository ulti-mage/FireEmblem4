SET startDir=%~dp0

SET as="%startDir%/TOOLS/64tass"

%as% -x -f -C -a -Wall -o "FE4Disassembly.sfc" --vice-labels -l "labels.txt" "Build.asm" 1>"log.txt" 2>&1 -Wno-portable -Wno-shadow -Wno-deprecated

pause