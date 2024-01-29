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

    rednet.lookup("mesystem","MeSystem")
    rednet.lookup("tank1","Tank1")

    MessageID,message_mesystem = rednet.receive("mesystem",20)
    MessageID,message_tank1 = rednet.receive("tank1",20)
 
-- print(MessageID)
    if MessageID == intIdApp2Computer then

        itemsUsed = message_mesystem["KeyItemsUsed"]
        itemsMax = message_mesystem["KeyItemsMax"]
        fluidsUsed = message_mesystem["KeyFluidUsed"]
        fluidsMax = message_mesystem["KeyFluidMax"]
    
    elseif MessageID == intIdTank1Computer then
        
        leftTankCap = message_tank1["KeyLeftTankCap"]
        leftTankStored = message_tank1["KeyLeftTankStored"]
        leftTankFilledPercent = message_tank1["KeyLeftTankFillPercent"]

    end
 
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
 
        print("Items:",  message_mesystem["KeyItemsUsed"], "/", message_mesystem["KeyItemsMax"])
        print("Fluids:",  message_mesystem["KeyFluidUsed"], "/", message_mesystem["KeyFluidMax"])
 
    end
--end
 

--sleep(30)
 
end
