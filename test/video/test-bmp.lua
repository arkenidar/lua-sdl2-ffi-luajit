local sdl = require 'sdl2'
local ffi = require 'ffi'
local C = ffi.C

sdl.init(sdl.INIT_VIDEO)

local window = sdl.createWindow("Hello Lena",
                                sdl.WINDOWPOS_CENTERED,
                                sdl.WINDOWPOS_CENTERED,
                                512,
                                512,
                                sdl.WINDOW_SHOWN)

local windowsurface = sdl.getWindowSurface(window)

local image = sdl.loadBMP("lena.bmp")

-- moved inside the loop
--- sdl.upperBlit(image, nil, windowsurface, nil)
--- sdl.updateWindowSurface(window)

-- moved at the end
--- sdl.freeSurface(image)

local running = true
local event = ffi.new('SDL_Event')
while running do
   while sdl.pollEvent(event) ~= 0 do
      if event.type == sdl.QUIT then
         running = false
      end
   end

   -- added
   sdl.upperBlit(image, nil, windowsurface, nil)
   sdl.updateWindowSurface(window)

end

-- added
sdl.freeSurface(image)

sdl.destroyWindow(window)
sdl.quit()
