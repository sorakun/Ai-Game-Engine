local frame 
local textline 

function DisplayFE(name)
	-- Frame setup
	frame = loveframes.Create("frame")
	frame:SetName("Function Editor")
	frame:SetSize(500, 500)
	frame:Center()

	-- Text Input setup
	local textinput = loveframes.Create("textinput", frame)
	textinput:SetPos(5, 30)
	textinput:SetWidth(490)
	textinput:SetHeight(490)
	textinput:SetMultiline(true)
	a, b = 1, 2
	local f = loadstring("function ")
	local i = f()
	print(i)

end	

