local GridProperties = { }

function GridProperties:Create()
	if Editor.uiFlags.GridProperties then
		Editor.uii.GridProperties:Remove()
		return nil
	end
	Engine.debug("Creating Grid Window")
	Editor.uiFlags.GridProperties = true

	local self = { }

	self.frame = loveframes.Create("frame")
	local frame = self.frame

	frame:SetName("Grid Properties")
	frame:SetDockable(false)
	frame:Center()
	frame:SetSize(200, 200)

	frame.OnClose = function()
		self:Remove()
	end

	local grid = loveframes.Create("grid", frame)
	grid:SetPos(5, 30)
	grid:SetRows(5)
	grid:SetColumns(2)
	grid:SetCellWidth(85)
	grid:SetCellHeight(20)
	grid:SetCellPadding(5)
	grid:SetItemAutoSize(true)

	local lblEnable, lblXUnit, lblYUnit, lblColorPick
	lblEnable = loveframes.Create("text")
	lblEnable:SetText("Enabled")

	lblXUnit = loveframes.Create("text")
	lblXUnit:SetText("X Unit")

	lblYUnit = loveframes.Create("text")
	lblYUnit:SetText("Y Unit")

	lblColorPick = loveframes.Create("text")
	lblColorPick:SetText("Color")

	local checkEnable, inXUnit, inYUnit, btnColor
	checkEnable = loveframes.Create("checkbox")
	checkEnable:SetChecked(Editor.displayGrid)

	checkEnable.OnChanged = function (self, checked)
		Editor.displayGrid = checked
		--Engine.debug("Setting Grid to "..checked..".")
	end

	
	inXUnit = loveframes.Create("numberbox", frame)	
	inXUnit.OnValueChanged = function(object, value)
		Editor.SetXUnit(value)
		Engine.debug("Changing Grid XUNIT "..value..".")
	end
	inXUnit:SetValue(Editor.gridXUnit)
	inXUnit:SetMinMax(0, 1000)

	inYUnit = loveframes.Create("numberbox", frame)	
	inYUnit.OnValueChanged = function(object, value)
		Editor.SetYUnit(value)
		Engine.debug("Changing Grid YUNIT "..value..".")
	end
	inYUnit:SetValue(Editor.gridYUnit)
	inYUnit:SetMinMax(0, 1000)

	btnColor = loveframes.Create("button")
	btnColor:SetText("Select")
	btnColor.OnClick = function(self)
		require("interface.colorpicker"):Create(Editor.gridColor, "Select grid color")
	end

	grid:AddItem(lblEnable, 1, 1)
	grid:AddItem(checkEnable, 1, 2)
	grid:AddItem(lblXUnit, 2, 1)
	grid:AddItem(inXUnit, 2, 2)
	grid:AddItem(lblYUnit, 3, 1)
	grid:AddItem(inYUnit, 3, 2)

	grid:AddItem(lblColorPick, 4, 1)
	grid:AddItem(btnColor, 4, 2)

	setmetatable(self, {__index = GridProperties})
	return self
end

function GridProperties:Remove()
	self.frame:Remove()
	Editor.uiFlags.GridProperties = false
	Engine.debug("Removing GridProperties ui")
end

return GridProperties