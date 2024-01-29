-- Tank 1 PC

intIdMainComputer = 2 -- Die ID des Empfangenden Main Computers
intIdTablet = 4 -- Die ID des Empfangenden Tablets

p_left=peripheral.wrap("left") --Angeben an welcher Seite der Block angeschlossen ist
p_right=peripheral.wrap("right") --Angeben an welcher Seite der Block angeschlossen ist
rednet.open("back") --Aktieviert das Modem das hinten angeschlossen ist

while true do --Always loop
 
    leftTankCap = p_left.getTankCapacity()
    leftTankStored = p_left.getStored()
    leftTankFilledPercent = p_left.getFilledPercentage()
    
    print(leftTankCap , "Filled" , leftTankFilledPercent , "%")
 
    sendmessage = {KeyLeftTankCap = leftTankCap , KeyLeftTankStored = leftTankStored , KeyLeftTankFillPercent = leftTankFilledPercent }
    
    rednet.send(intIdMainComputer,sendmessage,"tank1")
    rednet.send(intIdTablet,sendmessage,"tank1")
 
    sleep(20)
 
end
