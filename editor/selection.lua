

--[[ Clear all selected elements]]

function Editor.ClearSelection()
	Editor.selected = nil
	Editor.selectedPos.x = 0
	Editor.selectedPos.y = 0
	Editor.UpdateSelectedList()
end

function Editor.AddToSelection(o)
	table.insert(Editor.selected, o)
	Editor.UpdateSelectedList()
end

function Editor.Select(o)
	Editor.selected = { o }
	Editor.UpdateSelectedList()
end

function Editor.Deselect(o)
	for i, v in ipairs(Editor.selected) do
		if o == v then
			table.remove(Editor.selected, i)
			Editor.UpdateSelectedList()
			return
		end
	end
end

function Editor.IsSelected(o)
	if Editor.selected == nil then
		return false
	end	

	for _, v in ipairs(Editor.selected) do
		if v == o then
			return true
		end
	end
	return false
end

--[[ Used the calculate the difference between mouse position
and object position in case of moving multiple objects ]]

function Editor.updateSelectionPosition(x, y)
	for _, v in ipairs(Editor.selected) do
		v.__selectionX = v.x - x
		v.__selectionY = v.y - y
	end
end

--[[ Used when right mouse is clicked ]]
function Editor.CheckSelection(x, y)
	Engine.debug("Editor.CheckSelection("..x..", "..y..")")
	if Editor.cam.scene == nil then
		return
	end
	local somethingSelected = false
	for i = #Editor.cam.scene.objects, 1, -1 do
		local v = Editor.cam.scene.objects[i]
		local objX, objY = v:GetRealPos()
		local objW, objH = v:GetSize()

		if Editor.Math.objectClicked(v, x, y) then
			print("something clicked")
			somethingSelected = true
			if love.keyboard.isDown("lshift") and Editor.selected ~= nil then
				-- Shall we select or deselect the object
				if Editor.IsSelected(v) then
					Editor.moveSO = true
					-- Change moving origin object.
					Editor.updateSelectionPosition(x, y)
				else
					Editor.AddToSelection(v)
					Editor.updateSelectionPosition(x, y)
				end
			elseif love.keyboard.isDown("lalt") and Editor.selected ~= nil then
				if Editor.IsSelected(v) then
					Editor.Deselect(v)
				end
			else
				Editor.Select(v)
				Editor.UpdateObjectProperties(Editor.selected)
				Editor.moveSO = true
				Editor.updateSelectionPosition(x, y)
				break
			end
		end
	end
	if not somethingSelected then
		Editor.ClearSelection()
	end
end

function Editor.RenderSelection()
	for _, o in ipairs(Editor.selected) do
		local px, py = o:GetPos()
		local str = "  x: "..px..", y: "..py
		local f = love.graphics.getFont()
		local sizeX, sizeY = f:getWidth(str), f:getHeight(str)

		-- Draw borders 
		local w, h = o:GetWidth(), o:GetHeight()
		-- If nothing to draw than just leave.
		if w == 0 and h == 0 then
			return
		end

		love.graphics.setColor(Editor.selectionColor.r, Editor.selectionColor.g, Editor.selectionColor.b, Editor.selectionColor.a)
		love.graphics.push()
		love.graphics.translate(-Editor.cam.x, - Editor.cam.y)
		-- real object positions
		
		-- Calculating new point coordinations
		--[[ http://math.stackexchange.com/questions/384186/calculate-new-positon-of-rectangle-corners-based-on-angle ]]
		
		-- Original point 1 coordinates
		
		local p1, p2, p3, p4 = Editor.Math.rotateObject(o)

		love.graphics.line(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y, p1.x, p1.y)
		--print(p1.x.." ".. p1.y .." ".. p2.x.." ".. p2.y.." ".. p3.x.." ".. p3.y.." ".. p4.x.." ".. p4.y.." ".. p1.x.." ".. p1.y)

		-- Any other lines to draw?
		
		if love.keyboard.isDown("x") then
			love.graphics.line(0, py, Editor.cam.scene.w + Editor.window.w, py)
		elseif love.keyboard.isDown("y") then
			love.graphics.line(px, 0, px, Editor.cam.scene.h + Editor.window.h)
		else
			love.graphics.line(px, 0, px, Editor.cam.scene.h + Editor.window.h)
			love.graphics.line(0, py, Editor.cam.scene.w + Editor.window.w, py)
		end
		
		love.graphics.pop()
		love.graphics.setColor(255, 255, 255)
		love.graphics.push()
		love.graphics.translate(-Editor.cam.x, - Editor.cam.y)
		love.graphics.setColor(0, 0, 0, 127)
		love.graphics.rectangle("fill", px, py, sizeX, sizeY)
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(Editor.fontStd)
		love.graphics.print( str, px, py)
		love.graphics.pop()
	end
end

-- Remove selected objects from the scene.

function Editor.RemoveSelectedObjects()
	if Editor.cam.scene == nil then
		return
	end
	local i = 1
	while i <= #Editor.cam.scene.objects  do
		local v = Editor.cam.scene.objects[i]
		if Editor.IsSelected(v) then
			Editor.Deselect(v)
			Editor.cam.scene:RemoveObject(v)
		else
			i = i + 1
		end
	end
end

-- Align Selected Objects
function Editor.AlignSelection(align)
	if align == "vertical" then

	else

	end
end

-- Fork all selected objects
function Editor.ForkSelectedObjects()

end