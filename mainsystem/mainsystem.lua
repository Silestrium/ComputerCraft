--Hauptcomputer
 
intIDAusgabePC = 2
intIDAusgabeTablet = 4
varModemPC = "Bottom"
local monitor = peripheral.wrap( "top" )
 
IntID = os.getComputerID()
 
intIdApp2Computer = 3 -- Die ID des Sendenden APP2 Computer
 
if IntID == intIDAusgabePC then
rednet.open(varModemPC) --Aktieviert das Modem das hinten angeschlossen ist
 
elseif intID == intIDAusgabeTablet then
rednet.open("Top") --Aktieviert das Modem das hinten angeschlossen ist
end
 
while true do --Always loop
 
    MessageID,message = rednet.receive()
 
-- print(MessageID)
        itemsUsed = message["KeyItemsUsed"]
        itemsMax = message["KeyItemsMax"]
        fluidsUsed = message["KeyFluidUsed"]
        fluidsMax = message["KeyFluidMax"]
 
if MessageID == intIdApp2Computer then -- APP2 Receive
    if IntID == intIDAusgabePC then -- Ausgabe auf PC
        
        
        term.redirect(monitor)
        print("Items", itemsUsed , " / " , itemsMax)
        print("Fluids:",  fluidsUsed , "/" , fluidsMax)
        -- All the prints you want here
        -- term.restore()
 
    end
 
 
    if IntID == intIDAusgabeTablet then -- Ausgabe auf Tablet
 
        print("Items:",  message["KeyItemsUsed"], "/", message["KeyItemsMax"])
        print("Fluids:",  message["KeyFluidUsed"], "/", message["KeyFluidMax"])
 
    end
end
 
 
 
end