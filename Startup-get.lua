-- Bibliothek für den Wireless-Modem
local rednet = require("rednet")

-- Bibliothek für das Dateisystem
local fs = require("fs")

-- Öffne den Wireless-Modem an der Oberseite
local modem = peripheral.wrap("top")

-- Endlosschleife zum Empfangen der Datei
while true do
  -- Empfange eine Nachricht vom Wireless-Modem
  local message, sender, channel = modem.receive()

  -- Wenn die Nachricht die Datei "startup" enthält
  if message == "startup" then
    -- Lösche die vorhandene Datei "startup" (falls vorhanden)
    fs.delete("startup")

    -- Schreibe die empfangene Datei in die Datei "startup"
    fs.write("startup", modem.read())

    -- Führe die Datei "startup" aus
    os.execute("startup")
  end
end
