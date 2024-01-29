intIDAusgabePC = 2

local monitor = peripheral.wrap( "top" )



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