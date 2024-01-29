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

rednet.lookup("mesystem","MeSystem")

if fs.exists("mesystem.txt") == false then
    fs.makeDir("mesystem.txt")
end

    while true do

      MessageID,message_mesystem = rednet.receive("mesystem",30)

      itemsUsed = message_mesystem["KeyItemsUsed"]
      itemsMax = message_mesystem["KeyItemsMax"]
      fluidsUsed = message_mesystem["KeyFluidUsed"]
      fluidsMax = message_mesystem["KeyFluidMax"]

      print(itemsUsed)
  
      print("Tick")
      file = fs.open("mesystem.txt", "w")
      file.write(itemsUsed)
      file.close()

      sleep(20)
    end
