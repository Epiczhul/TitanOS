-- Bibliothek für die Grafikkarte laden
local gpu = peripheral.wrap("tm_gpu_0")

-- Monitor-Auflösung
local width, height = 64, 64
local gl = gpu.createWindow3D(1, 1, 768, 320)
gpu.refreshSize()
gpu.setSize(64)
-- Initialisierung der Grafikkarte
gpu.init(width, height)

-- Funktion zum Zeichnen einer Kugel
function drawSphere(x, y, radius)
  -- Pixel-Buffer der Grafikkarte
  local pixels = gpu.getPixels()

  -- Berechne die Kugelkoordinaten
  for i = 1, width do
    for j = 1, height do
      local u = (i - x) / radius
      local v = (j - y) / radius
      local r = math.sqrt(u^2 + v^2)

      -- Setze Pixel, wenn innerhalb der Kugel
      if r <= 1 then
        pixels[i][j] = 0xFFFFFF -- Farbe: Weiß
      end
    end
  end

  -- Aktualisierung des Monitors mit dem neuen Pixel-Buffer
  gpu.update()
end

-- Zeichne die Kugel in der Mitte des Monitors
drawSphere(width / 2, height / 2, 32)

-- Endlosschleife, um das Programm am Laufen zu halten
while true do
  -- Leere Taste drücken, um das Programm zu beenden
  if os.pullEvent("key_down") then
    break
  end
end

-- Aufräumen
gpu.deinit()

