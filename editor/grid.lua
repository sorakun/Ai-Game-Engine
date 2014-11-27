
function Editor.EnableGrid()
	Editor.displayGrid = true
end

function Editor.DisableGrid()
	Editor.displayGrid = true
end

function Editor.SetXUnit(value)
	Editor.gridXUnit = value
end

function Editor.SetYUnit(value)
	Editor.gridYUnit = value
end

function Editor.SetGridColor(c)
	Editor.gridColor.r = c.r
	Editor.gridColor.g = c.g
	Editor.gridColor.b = c.b
	Editor.gridColor.a = c.a
end
-- Draw Grid
function Editor.DisplayGrid()
	if Editor.displayGrid and Editor.cam.scene ~= nil then
		local maxW = Editor.cam.scene.w
		local maxH = Editor.cam.scene.h	
		local gx, gy = 0, 0
		love.graphics.push()
		love.graphics.translate(-Editor.cam.x, - Editor.cam.y)
		love.graphics.setColor(Editor.gridColor.r, Editor.gridColor.g, Editor.gridColor.b, Editor.gridColor.a)
		for gx = 0, maxW, Editor.gridXUnit do
			love.graphics.line(gx, 0, gx, maxH)
		end	
		for gy = 0, maxH, Editor.gridYUnit do
			love.graphics.line(0, gy, maxW, gy)
		end
		love.graphics.pop()
	end
end