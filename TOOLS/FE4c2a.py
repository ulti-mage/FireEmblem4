#!/usr/bin/python3
import sys
from os.path import basename, splitext
import csv


def add_def(definition, value):
    definitions.append(f'{definition.ljust(reserved, " ")} = {value}\n')

if __name__ == "__main__":

    (inname, helper, outname), indent = sys.argv[1:4], 2

    if len(sys.argv) == 5:
        try:
            indent = int(sys.argv[4])
        except:
            print(f'Invalid spacing "{sys.argv[4]}", ignoring')

    tablename = splitext(basename(inname))[0].strip()

    with open(inname, "r", encoding="UTF-8") as c:
        sheet = csv.reader(c)
        row1 = next(sheet)
        rows = [row for row in sheet]

    structHelper = []
    with open(helper, "r", encoding="UTF-8") as h:
        lines = h.readlines()

    for line in lines:
        structHelper.append(line.split(','))

    # grab first non-command ID

    fieldIndex = 0
    for index, name in enumerate(row1):
        if name.startswith('.'):
            fieldIndex = index + 1

    # grab the start and step values

    parts = row1[0].split()

    if (len(parts) == 3):
        start = parts[1]
        step = parts[2]
    elif (len(parts) == 2):
        start = parts[1]
        step = 1
    elif (len(parts) == 1):
        start, step = 0, 1
    else:
        raise ValueError(f"Unable to parse first cell: {row1[0]}.")

    fields = row1[fieldIndex:]
    start = int(start)
    step = int(step)

    fieldwidth = max(len(f) for f in fields)
    namewidth = 0

    for row in rows:
        namewidth = max(namewidth, max(len(n) for n in row[:fieldIndex]))

    reserved = indent + namewidth + fieldwidth

    definitions, table, usedFields = [], [], []

    for index, items in enumerate(rows):
        # run through all characters

        command = ""
        counter = 0
        for i, c in enumerate(items[:fieldIndex]):
            if c != "":
                counter += 1
                name = c
                command = row1[i]
        if counter == 0 or counter > 1:
            raise ValueError(f"Multiple structs defined for: {name}")

        add_def(name, start + (index * step))

        args = ""

        structID = 0
        for i, field in enumerate(structHelper):
            if field[0] == command:
                structID = i

        # get the data of the csv struct in order of the helper file
        for structField in iter(structHelper[structID][1:]):

            # run through data of a character
            for i, item in enumerate(items[fieldIndex:]):
                if structField == fields[i]:
                    field = (" " * indent) + name + fields[i]
                    add_def(field, item)
                    usedFields.append(fields[i])

        definitions.append("\n")

        args = ", ".join([name + field for field in usedFields])
        table.append(f"{name}{tablename}Entry {command} {args}\n")
        usedFields.clear()

    with open(outname, "w", encoding="UTF-8") as o:
        o.writelines(definitions)
        o.writelines(table)
