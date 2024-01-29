--APP2 Auslesen und an den Hauptcomputer senden
 
intIdMainComputer = 2 -- Die ID des Empfangenden Main Computers
intIdTablet = 4 -- Die ID des Empfangenden Tablets
 
p=peripheral.wrap("left") --Angeben an welcher Seite der Block angeschlossen ist
rednet.open("back") --Aktieviert das Modem das hinten angeschlossen ist
 
while true do --Always loop
 
    intMaxFluidStorage = p.getAvailableFluidStorage() -- Gibt aus wie viel Fluid Storage im ME System ist
    intUsedFluidStorage = p.getUsedFluidStorage() --Gibt aus wie viel Platz des Fluid Storage verbraucht ist
 
    intMaxItemStorage = p.getAvailableItemStorage() -- Gibt aus wie viel Item Storage im ME System ist
    intUsedItemStorage = p.getUsedItemStorage() --Gibt aus wie viel Platz des Item Storage verbraucht ist
 
    print(intMaxFluidStorage, intUsedFluidStorage, intMaxItemStorage, intUsedItemStorage)

    sendmessage = {KeyItemsMax = intMaxItemStorage , KeyItemsUsed = intUsedItemStorage , KeyFluidMax = intMaxFluidStorage , KeyFluidUsed = intUsedFluidStorage }
    
    rednet.send(intIdMainComputer,sendmessage,"mesystem")
    rednet.send(intIdTablet,sendmessage,"mesystem")
 
    sleep(20)
 
end
