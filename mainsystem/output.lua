intIDAusgabePC = 2
IntID = os.getComputerID()

local monitor = peripheral.wrap( "top" )

while true do

    file = fs.open("mesystem.txt","r")
    itemsUsed = file.readLine()

    local file = fs.open('your/file/path')
    local data = fs.readAll()
    file.close()
    
    local t = {}
    for v in data:gmatch('(.-)n') do
      table.insert(t,v)
    end
    return t

    print(t)
  

    file.close()

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