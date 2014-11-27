require("engine.engine")	
require("utilities.utils")

function love.load()
	Engine.Start()
end

function love.update(dt)
	Engine.Update(dt)
end

function love.draw()
	Engine.Render()
	loveframes.draw()
end

function love.mousepressed(x, y, button)
	--print("mouse key "..button.." pressed")
	Engine.MousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
	Engine.MouseReleased(x, y, button)
end

-- Events
function love.keypressed(key, unicode)
	Engine.KeyPressed(key, unicode)
	--print("key "..key.." pressed")
end

function love.keyreleased(key)
	Engine.KeyReleased(key)
	--print("key "..key.." released")
end

function love.textinput(text)
    Engine.TextInput(text)
end

function love.resize(w, h)
	Engine.Resize(w, h)
end

function love.quit()
	Engine.Quit()
end