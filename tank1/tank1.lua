--

p_left=peripheral.wrap("left") --Angeben an welcher Seite der Block angeschlossen ist
p_right=peripheral.wrap("right") --Angeben an welcher Seite der Block angeschlossen ist
rednet.open("back") --Aktieviert das Modem das hinten angeschlossen ist

leftTankCap = p_left.getTankCapacity()

print(leftTankCap)
