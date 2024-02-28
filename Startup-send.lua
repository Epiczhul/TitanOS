-- Bibliothek für den Wireless-Modem
local rednet = require("rednet")

-- Öffne den Wireless-Modem an der Oberseite
local modem = peripheral.wrap("top")

-- Endlosschleife zum Senden der Datei
while true do
  -- Sende die Datei "startup" an alle Computer im Netzwerk
  modem.transmit(0, "startup")

  -- Warte 1 Sekunde
  sleep(1)
end
