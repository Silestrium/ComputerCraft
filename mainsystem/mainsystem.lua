--Hauptcomputer
 
intIDAusgabePC = 2
intIDAusgabeTablet = 4
varModemPC = "Bottom"
local monitor = peripheral.wrap( "top" )
 
IntID = os.getComputerID()
 
intIdApp2Computer = 3 -- Die ID des Sendenden APP2 Computer
intIdTank1Computer = 5  -- Die ID des Sendenden Tank1 Computer
 
if IntID == intIDAusgabePC then
rednet.open(varModemPC) --Aktieviert das Modem das hinten angeschlossen ist
 
elseif intID == intIDAusgabeTablet then
rednet.open("Top") --Aktieviert das Modem das hinten angeschlossen ist
end
 
while true do --Always loop
 
    MessageID,message_app2 = rednet.receive()
    MessageID,message_tank1 = rednet.receive()
 
-- print(MessageID)
    --if MessageID == intIdApp2Computer then

        itemsUsed = message_app2["KeyItemsUsed"]
        itemsMax = message_app2["KeyItemsMax"]
        fluidsUsed = message_app2["KeyFluidUsed"]
        fluidsMax = message_app2["KeyFluidMax"]
    
    --elseif MessageID == intIdTank1Computer then
        
        leftTankCap = message_tank1["KeyLeftTankCap"]
        leftTankStored = message_tank1["KeyLeftTankStored"]
        leftTankFilledPercent = message_tank1["KeyLeftTankFillPercent"]

    --end
 
--if MessageID == intIdApp2Computer then -- APP2 Receive
    if IntID == intIDAusgabePC then -- Ausgabe auf PC
        
        
        term.redirect(monitor)
        print("Me System Status:")
        print("Items", itemsUsed , " / " , itemsMax)
        print("Fluids:",  fluidsUsed , "/" , fluidsMax)
        print("Mekanism Tanks:")
        print("Left Tank Stored:", leftTankStored, leftTankFilledPercent, "%")
        -- All the prints you want here
        -- term.restore()
 
    end
 
 
    if IntID == intIDAusgabeTablet then -- Ausgabe auf Tablet
 
        print("Items:",  message_app2["KeyItemsUsed"], "/", message_app2["KeyItemsMax"])
        print("Fluids:",  message_app2["KeyFluidUsed"], "/", message_app2["KeyFluidMax"])
 
    end
--end
 

sleep(30)
 
end
