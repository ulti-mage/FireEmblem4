# Fire Emblem 4 Disassembly

To build a ROM with this folder you will need:

* Python installed and in your PATH variables.

* A headerless copy of FE4.sfc in this directory.

* The [**64tass**](https://sourceforge.net/projects/tass64/) executable inside the TOOLS folder.

* Zane Avernathy's [**c2a.py**](https://github.com/ZaneAvernathy/FE5Tools/blob/main/c2a.py) script and [**process_dialogue.py**](https://github.com/ZaneAvernathy/FireEmblem5/blob/master/TOOLS/process_dialogue.py) inside the TOOLS folder.

In oder to now build a ROM, you will need to:

* (Optionally run cleardialogueAll.bat to remove all .dialogue.txt files inside the TEXT folder, should some exit.)
* Run dialoguebuilderAll.bat to convert all .txt files inside the TEXT folder to .dialogue.txt files.
* Run tablebuilder.bat to convert all .csv files inside the TABLES folder to .csv.asm files.
* And finally run build.bat to generate a ROM called "FE4Disassembly.sfc". Should a ROM not be generated, consult the log.txt file.
