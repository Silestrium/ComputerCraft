intIDAusgabePC = 2
IntID = os.getComputerID()

local monitor = peripheral.wrap( "top" )

file = fs.open("mesystem.txt","r")
itemsUsed = file.readLine()
file.close()

while true do

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

    sleep(5)

end