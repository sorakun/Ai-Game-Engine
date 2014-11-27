--[[------------------------------------------------
	-- Love Frames - A GUI library for LOVE --
	-- Copyright (c) 2013 Kenny Shields --
--]]------------------------------------------------

local dir = "libs/loveframes/skins/Dark"
local path = string.gsub(dir, "/", "%.")

-- color utility
require(path .. ".utils.color")

-- skin table
local skin = {}

-- skin info (you always need this in a skin)
skin.name = "Dark"
skin.author = "unekpl"
skin.version = "0.3"

-- fonts
local smallfont = love.graphics.newFont(dir .. "/assets/fonts/OpenSans-Regular.ttf", 11)
local normalfont = love.graphics.newFont(dir .. "/assets/fonts/OpenSans-Regular.ttf", 12)
local boldfont  = love.graphics.newFont(dir .. "/assets/fonts/OpenSans-Bold.ttf", 12)
local imagebuttonfont = love.graphics.newFont(dir .. "/assets/fonts/OpenSans-Regular.ttf", 14)

-- hakz!
loveframes.basicfontsmall = smallfont
loveframes.basicfont = normalfont

-- meh
Color.modup = Color.lighten
Color.moddown = Color.darken

-- colors
local basecolor   = hex("#2d2d2d")
local textcolor   = hex("#cccccc")
local basecolor2  = basecolor:modup(5)
local bordercolor = basecolor:modup(10)
local accentcolor = rgb(0, 175, 0)

-- directives
skin.directives = {}
skin.directives.text_default_color = textcolor

-- controls
skin.controls = {}

-- frame
skin.controls.frame_body_color                      = basecolor
skin.controls.frame_name_color                      = {255, 255, 255, 255}
skin.controls.frame_name_font                       = boldfont
skin.controls.frame_top_body_color					= bordercolor

-- button
skin.controls.button_text_down_color                = {255, 255, 255, 255}
skin.controls.button_text_nohover_color             = textcolor
skin.controls.button_text_hover_color               = textcolor:modup(10)
skin.controls.button_text_nonclickable_color        = {0, 0, 0, 100}
skin.controls.button_text_font                      = smallfont
skin.controls.button_body_down_color				= bordercolor:moddown(3)
skin.controls.button_body_nohover_color				= bordercolor:modup(3)
skin.controls.button_body_hover_color 				= bordercolor:modup(5)
skin.controls.button_body_nonclickable_color		= bordercolor:modup(10)
skin.controls.button_accent_down_color				= accentcolor
skin.controls.button_accent_color 					= basecolor:modup(35)

-- imagebutton
skin.controls.imagebutton_text_down_color           = {255, 255, 255, 255}
skin.controls.imagebutton_text_nohover_color        = {255, 255, 255, 255}
skin.controls.imagebutton_text_hover_color          = {255, 255, 255, 255}
skin.controls.imagebutton_text_font                 = imagebuttonfont

-- closebutton
skin.controls.closebutton_body_down_color           = accentcolor:darken(5)
skin.controls.closebutton_body_nohover_color        = basecolor:modup(35)
skin.controls.closebutton_body_hover_color          = accentcolor

-- progressbar
skin.controls.progressbar_body_color                = basecolor2
skin.controls.progressbar_text_color                = {255, 255, 255, 255}
skin.controls.progressbar_text_font                 = boldfont

-- list
skin.controls.list_body_color                       = basecolor

-- scrollbody
skin.controls.scrollbody_body_color                 = {0, 0, 0, 0}

-- panel
skin.controls.panel_body_color                      = basecolor2

-- tabpanel
skin.controls.tabpanel_body_color                   = basecolor

-- tabbutton
skin.controls.tab_text_nohover_color                = {0, 0, 0, 200}
skin.controls.tab_text_hover_color                  = {255, 255, 255, 255}
skin.controls.tab_text_font                         = smallfont
skin.controls.tab_accent_selected_color				= accentcolor
skin.controls.tab_accent_color 						= basecolor:modup(35)
skin.controls.tab_body_selected_color				= bordercolor:modup(10)
skin.controls.tab_body_color 						= bordercolor

-- multichoice
skin.controls.multichoice_body_color                = basecolor2
skin.controls.multichoice_text_color                = textcolor
skin.controls.multichoice_text_font                 = smallfont

-- multichoicelist
skin.controls.multichoicelist_body_color            = basecolor2

-- multichoicerow
skin.controls.multichoicerow_body_nohover_color     = basecolor2
skin.controls.multichoicerow_body_hover_color       = accentcolor
skin.controls.multichoicerow_text_nohover_color     = textcolor
skin.controls.multichoicerow_text_hover_color       = {255, 255, 255, 255}
skin.controls.multichoicerow_text_font              = smallfont

-- tooltip
skin.controls.tooltip_body_color                    = basecolor

-- textinput
skin.controls.textinput_body_color                  = basecolor2
skin.controls.textinput_body_multiline_color        = basecolor
skin.controls.textinput_indicator_color             = {255, 255, 255, 255}
skin.controls.textinput_text_normal_color           = textcolor
skin.controls.textinput_text_selected_color         = {255, 255, 255, 255}
skin.controls.textinput_highlight_bar_color         = accentcolor

-- slider
skin.controls.slider_value_color              		= accentcolor

-- checkbox
skin.controls.checkbox_body_color                   = basecolor2
skin.controls.checkbox_check_color                  = accentcolor
skin.controls.checkbox_text_font                    = smallfont

-- collapsiblecategory
skin.controls.collapsiblecategory_text_color        = textcolor

-- columnlist
skin.controls.columnlist_body_color                 = basecolor2

-- columlistarea
skin.controls.columnlistarea_body_color             = basecolor2

-- columnlistheader
skin.controls.columnlistheader_text_down_color      = {255, 255, 255, 255}
skin.controls.columnlistheader_text_nohover_color   = textcolor
skin.controls.columnlistheader_text_hover_color     = textcolor:modup(10)
skin.controls.columnlistheader_text_font            = smallfont

-- columnlistrow
skin.controls.columnlistrow_body1_color             = basecolor2
skin.controls.columnlistrow_body2_color             = basecolor2
skin.controls.columnlistrow_body_selected_color     = accentcolor
skin.controls.columnlistrow_body_hover_color        = basecolor2
skin.controls.columnlistrow_text_color              = textcolor
skin.controls.columnlistrow_text_hover_color        = textcolor
skin.controls.columnlistrow_text_selected_color     = {255, 255, 255, 255}

-- modalbackground
skin.controls.modalbackground_body_color            = {0, 0, 0, 180}

-- linenumberspanel
skin.controls.linenumberspanel_text_color           = textcolor
skin.controls.linenumberspanel_body_color			= basecolor2

--[[---------------------------------------------------------
	- func: OutlinedRectangle(x, y, width, height, ovt, ovb, ovl, ovr)
	- desc: creates and outlined rectangle
--]]---------------------------------------------------------
function skin.OutlinedRectangle(x, y, width, height, ovt, ovb, ovl, ovr)
	local ovt = ovt or false
	local ovb = ovb or false
	local ovl = ovl or false
	local ovr = ovr or false

	-- top
	if not ovt then
		love.graphics.rectangle("fill", x, y, width, 1)
	end

	-- bottom
	if not ovb then
		love.graphics.rectangle("fill", x, y + height - 1, width, 1)
	end

	-- left
	if not ovl then
		love.graphics.rectangle("fill", x, y, 1, height)
	end

	-- right
	if not ovr then
		love.graphics.rectangle("fill", x + width - 1, y, 1, height)
	end

end

--[[---------------------------------------------------------
	- func: Arrow(direction, size)
	- desc: draws an arrow
--]]---------------------------------------------------------
function skin.Arrow(direction, size)
end

--[[---------------------------------------------------------
	- func: DrawFrame(object)
	- desc: draws the frame object
--]]---------------------------------------------------------
function skin.DrawFrame(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local hover = object:GetHover()
	local name = object:GetName()
	local icon = object:GetIcon()
	local bodycolor = skin.controls.frame_body_color
	local topcolor = skin.controls.frame_top_color
	local namecolor = skin.controls.frame_name_color
	local topbarcolor = skin.controls.frame_top_body_color
	local font = skin.controls.frame_name_font
	local image = skin.images["frame-topbar.png"]

	-- frame body
	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

	-- frame top bar
	love.graphics.setColor(topbarcolor)
	love.graphics.draw(image, x, y, 0, width, 1)

	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y + 25, width, 1, true, true)

	-- frame name section
	love.graphics.setFont(font)

	if icon then
		local iconwidth = icon:getWidth()
		local iconheight = icon:getHeight()
		icon:setFilter("nearest", "nearest")
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.draw(icon, x + 5, y + 5)
		love.graphics.setColor(0, 0, 0)
		love.graphics.print(name, x + iconwidth + 11, y + 6)
		love.graphics.setColor(namecolor)
		love.graphics.print(name, x + iconwidth + 10, y + 5)
	else
		love.graphics.setColor(0, 0, 0)
		love.graphics.print(name, x + 6, y + 6)
		love.graphics.setColor(namecolor)
		love.graphics.print(name, x + 5, y + 5)
	end

	-- frame border
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawButton(object)
	- desc: draws the button object
--]]---------------------------------------------------------
function skin.DrawButton(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local hover = object:GetHover()
	local text = object:GetText()
	local font = skin.controls.button_text_font
	local twidth = font:getWidth(object.text)
	local theight = font:getHeight(object.text)
	local down = object.down
	local enabled = object:GetEnabled()
	local clickable = object:GetClickable()
	local textdowncolor = skin.controls.button_text_down_color
	local texthovercolor = skin.controls.button_text_hover_color
	local textnohovercolor = skin.controls.button_text_nohover_color
	local textnonclickablecolor = skin.controls.button_text_nonclickable_color
	local bodydowncolor = skin.controls.button_body_down_color
	local bodyhovercolor = skin.controls.button_body_hover_color
	local bodynohovercolor = skin.controls.button_body_nohover_color
	local bodynonclickablecolor = skin.controls.button_body_nonclickable
	local accentcolor = skin.controls.button_accent_color
	local accenthovercolor = skin.controls.button_accent_down_color
	local image = skin.images["button-nohover.png"]
	local imageheight = image:getHeight()
	local scaley = height/imageheight

	if not enabled or not clickable then
		love.graphics.setColor(bodynonclickablecolor)
	elseif down then
		love.graphics.setColor(bodydowncolor)
	elseif hover then
		love.graphics.setColor(bodyhovercolor)
	else
		love.graphics.setColor(bodynohovercolor)
	end
	love.graphics.draw(image, x, y, 0, width, scaley)
	if not enabled or not clickable then
		love.graphics.setColor(textnonclickablecolor)
	elseif down then
		love.graphics.setColor(textdowncolor)
	elseif hover then
		love.graphics.setColor(texthovercolor)
	else
		love.graphics.setColor(textnohovercolor)
	end
	love.graphics.setFont(font)
	love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
	if hover then
		love.graphics.setColor(accenthovercolor)
	else
		love.graphics.setColor(accentcolor)
	end
	love.graphics.rectangle("fill", x, y + height - 2, width, 2)
	-- button border
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawCloseButton(object)
	- desc: draws the close button object
--]]---------------------------------------------------------
function skin.DrawCloseButton(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local parent = object.parent
	local parentwidth = parent:GetWidth()
	local hover = object:GetHover()
	local down = object.down
	local bodydowncolor = skin.controls.closebutton_body_down_color
	local bodyhovercolor = skin.controls.closebutton_body_hover_color
	local bodynohovercolor = skin.controls.closebutton_body_nohover_color
	local radius = 5

	--image:setFilter("nearest", "nearest")

	if down then
		-- button body
		love.graphics.setColor(bodydowncolor)
		love.graphics.circle("fill", x+width/2, y+height/2, radius)
	elseif hover then
		-- button body
		love.graphics.setColor(bodyhovercolor)
		love.graphics.circle("fill", x+width/2, y+height/2, radius)
	else
		-- button body
		love.graphics.setColor(bodynohovercolor)
		love.graphics.circle("fill", x+width/2, y+height/2, radius)
	end

	object:SetPos(parentwidth - 20, 4)
	object:SetSize(16, 16)

end

--[[---------------------------------------------------------
	- func: DrawImage(object)
	- desc: draws the image object
--]]---------------------------------------------------------
function skin.DrawImage(object)

	local x = object:GetX()
	local y = object:GetY()
	local orientation = object:GetOrientation()
	local scalex = object:GetScaleX()
	local scaley = object:GetScaleY()
	local offsetx = object:GetOffsetX()
	local offsety = object:GetOffsetY()
	local shearx = object:GetShearX()
	local sheary = object:GetShearY()
	local image = object.image
	local color = object.imagecolor or {255, 255, 255}

	love.graphics.setColor(color)
	love.graphics.draw(image, x, y, orientation, scalex, scaley, offsetx, offsety, shearx, sheary)

end

--[[---------------------------------------------------------
	- func: DrawImageButton(object)
	- desc: draws the image button object
--]]---------------------------------------------------------
function skin.DrawImageButton(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local text = object:GetText()
	local hover = object:GetHover()
	local image = object:GetImage()
	local imagewidth = image:getWidth()
	local imageheight = image:getHeight()
	local scalex = imagewidth / width
	local scaley = imageheight / height
	local down = object.down
	local font = skin.controls.imagebutton_text_font
	local twidth = font:getWidth(object.text)
	local theight = font:getHeight(object.text)
	local color = object.imagecolor or {255, 255, 255}
	local textdowncolor = skin.controls.imagebutton_text_down_color
	local texthovercolor = skin.controls.imagebutton_text_hover_color
	local textnohovercolor = skin.controls.imagebutton_text_nohover_color

	if down then
		if image then
			love.graphics.setColor(color)
			love.graphics.draw(image, x + 1, y + 1, 0, scalex, scaley)
		end
		if text ~= "Image Button" then
			love.graphics.setColor(0, 0, 0, 120)
			love.graphics.rectangle("fill", x + width/2 - twidth/2 - 1
				, y + height - theight - 5, twidth + 4, theight)
			love.graphics.setFont(font)
			love.graphics.setColor(textdowncolor)
			love.graphics.print(text, x + width/2 - twidth/2 + 1, y + height - theight - 6 + 1)
		end
	elseif hover then
		if image then
			love.graphics.setColor(color)
			love.graphics.draw(image, x, y, 0, scalex, scaley)
		end
		if text ~= "Image Button" then
		love.graphics.setColor(0, 0, 0, 120)
			love.graphics.rectangle("fill", x + width/2 - twidth/2 - 2
				, y + height - theight - 6, twidth + 4, theight)
			love.graphics.setFont(font)
			love.graphics.setColor(texthovercolor)
			love.graphics.print(text, x + width/2 - twidth/2, y + height - theight - 6)
		end
	else
		if image then
			love.graphics.setColor(color)
			love.graphics.draw(image, x, y, 0, scalex, scaley)
		end
		if text ~= "Image Button" then
			love.graphics.setColor(0, 0, 0, 120)
			love.graphics.rectangle("fill", x + width/2 - twidth/2 - 2
				, y + height - theight - 6, twidth + 4, theight)
			love.graphics.setFont(font)
			love.graphics.setColor(textnohovercolor)
			love.graphics.print(text, x + width/2 - twidth/2, y + height - theight - 6)
		end
	end

end

--[[---------------------------------------------------------
	- func: DrawProgressBar(object)
	- desc: draws the progress bar object
--]]---------------------------------------------------------
function skin.DrawProgressBar(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local value = object:GetValue()
	local max = object:GetMax()
	local barwidth = object:GetBarWidth()
	local font = skin.controls.progressbar_text_font
	local text = value .. " / " ..max
	local twidth = font:getWidth(text)
	local theight = font:getHeight("a")
	local bodycolor = skin.controls.progressbar_body_color
	local barcolor = skin.controls.progressbar_bar_color
	local textcolor = skin.controls.progressbar_text_color

	-- progress bar body
	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)
	love.graphics.setColor(accentcolor)
	--love.graphics.draw(image, x + 4, y + 4, 0, barwidth - 8, scaley)
	love.graphics.rectangle("fill", x+4, y+4, math.max(0, barwidth-8), height-8)
	love.graphics.setFont(font)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(text, x + width/2 - twidth/2 + 1, y + height/2 - theight/2 + 1)
	love.graphics.setColor(textcolor)
	love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)

	-- progress bar border
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawScrollArea(object)
	- desc: draws the scroll area object
--]]---------------------------------------------------------
function skin.DrawScrollArea(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bartype = object:GetBarType()
	local gradient = skin.images["scrollbody.png"]
	local gradientheight = gradient:getHeight()
	local gradientwidth = gradient:getWidth()
	local scalex = width/gradientwidth
	local scaley = height/gradientheight

	if bartype == "vertical" then
		love.graphics.setColor(255, 255, 255, 255)
		--love.graphics.draw(gradient, x, y, 0, scalex, scaley)
	elseif bartype == "horizontal" then
		love.graphics.setColor(255, 255, 255, 255)
		--[[love.graphics.draw(gradient
			, x + width
			, y
			, 0.5 * math.pi
			, height/gradientwidth
			, width/gradientheight)]]
	end

end

--[[---------------------------------------------------------
	- func: DrawScrollBar(object)
	- desc: draws the scroll bar object
--]]---------------------------------------------------------
function skin.DrawScrollBar(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local dragging = object:IsDragging()
	local hover = object:GetHover()
	local bartype = object:GetBarType()
	local bodydowncolor = skin.controls.scrollbar_body_down_color
	local bodyhovercolor = skin.controls.scrollbar_body_hover_color
	local bodynohovercolor = skin.controls.scrollbar_body_nohover_color

	local off = 4
	local x, y = math.floor(x), math.floor(y)
	local width, height = math.floor(width), math.floor(height)

	if hover or dragging then
		love.graphics.setColor(127, 127, 127, 255)
	else
		love.graphics.setColor(127, 127, 127, 150)
	end
	if bartype == "vertical" then
		local radius = math.floor((width / 2) - 4)
		love.graphics.rectangle("fill"
			, x + off
			, y + off + radius
			, width - off * 2
			, height - off * 2 - radius * 2)

		love.graphics.arc("fill"
			, x + off + radius
			, y + off + radius
			, radius
			, math.pi
			, 2*math.pi)

		love.graphics.arc("fill"
			, x + off + radius
			, y + height - off * 2
			, radius
			, 0
			, math.pi)
	else
		local radius = math.floor((height / 2) - 4)
		love.graphics.rectangle("fill"
			, x + off + radius
			, y + off
			, width - off * 2 - radius * 2
			, height - off * 2)

		love.graphics.arc("fill"
			, x + off + radius
			, y + off + radius
			, radius
			, 0.5 * math.pi
			, 1.5 * math.pi)

		love.graphics.arc("fill"
			, x + width - off * 2
			, y + off + radius
			, radius
			, 1.5 * math.pi
			, 2.5 * math.pi)
	end

end

--[[---------------------------------------------------------
	- func: DrawScrollBody(object)
	- desc: draws the scroll body object
--]]---------------------------------------------------------
function skin.DrawScrollBody(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.scrollbody_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawPanel(object)
	- desc: draws the panel object
--]]---------------------------------------------------------
function skin.DrawPanel(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.panel_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawList(object)
	- desc: draws the list object
--]]---------------------------------------------------------
function skin.DrawList(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.list_body_color

	love.graphics.setColor(bodycolor)
	--love.graphics.rectangle("fill", x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawList(object)
	- desc: used to draw over the object and its children
--]]---------------------------------------------------------
function skin.DrawOverList(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()

	love.graphics.setColor(bordercolor)
	--skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawTabPanel(object)
	- desc: draws the tab panel object
--]]---------------------------------------------------------
function skin.DrawTabPanel(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local buttonheight = object:GetHeightOfButtons()
	local bodycolor = skin.controls.tabpanel_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y + buttonheight, width, height - buttonheight)
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y + buttonheight - 1, width, height - buttonheight + 2)

	object:SetScrollButtonSize(15, buttonheight)

end

--[[---------------------------------------------------------
	- func: DrawTabButton(object)
	- desc: draws the tab button object
--]]---------------------------------------------------------
function skin.DrawTabButton(object)

	local x = object:GetX()
	local y = object:GetY()
	local hover = object:GetHover()
	local text = object:GetText()
	local image = object:GetImage()
	local tabnumber = object:GetTabNumber()
	local parent = object:GetParent()
	local ptabnumber = parent:GetTabNumber()
	local font = skin.controls.tab_text_font
	local twidth = font:getWidth(object.text)
	local theight = font:getHeight(object.text)
	local imagewidth = 0
	local imageheight = 0
	local texthovercolor = skin.controls.button_text_hover_color
	local textnohovercolor = skin.controls.button_text_nohover_color
	local selectedtabaccentcolor = skin.controls.tab_accent_selected_color
	local tabaccentcolor = skin.controls.tab_accent_color
	local bodycolor = skin.controls.tab_body_color
	local bodyselectedcolor = skin.controls.tab_body_selected_color

	if image then
		image:setFilter("nearest", "nearest")
		imagewidth = image:getWidth()
		imageheight = image:getHeight()
		object.width = imagewidth + 15 + twidth
		if imageheight > theight then
			parent:SetTabHeight(imageheight + 5)
			object.height = imageheight + 5
		else
			object.height = parent.tabheight
		end
	else
		object.width = 10 + twidth
		object.height = parent.tabheight
	end

	local width  = object:GetWidth()
	local height = object:GetHeight()

	local gradient = skin.images["frame-topbar.png"]
	local gradientheight = gradient:getHeight()
	local scaley = height/gradientheight

	if tabnumber == ptabnumber then
		-- button body
		love.graphics.setColor(bodyselectedcolor)
		love.graphics.draw(gradient, x, y, 0, width, scaley)
		love.graphics.setColor(selectedtabaccentcolor)
		love.graphics.rectangle("fill", x, y, width, 3)
		-- button border
		love.graphics.setColor(bordercolor)
		skin.OutlinedRectangle(x, y, width, height, false, true)
		if image then
			-- button image
			love.graphics.setColor(255, 255, 255, 255)
			love.graphics.draw(image, x + 5, y + height/2 - imageheight/2)
			-- button text
			love.graphics.setFont(font)
			love.graphics.setColor(texthovercolor)
			love.graphics.print(text, x + imagewidth + 10, y + height/2 - theight/2)
		else
			-- button text
			love.graphics.setFont(font)
			love.graphics.setColor(texthovercolor)
			love.graphics.print(text, x + 5, y + height/2 - theight/2)
		end
	else
		-- button body
		love.graphics.setColor(bodycolor)
		love.graphics.draw(gradient, x, y, 0, width, scaley)
		love.graphics.setColor(tabaccentcolor)
		love.graphics.rectangle("fill", x, y, width, 3)
		-- button border
		love.graphics.setColor(bordercolor)
		skin.OutlinedRectangle(x, y, width, height, false, true)
		if image then
			-- button image
			love.graphics.setColor(255, 255, 255, 150)
			love.graphics.draw(image, x + 5, y + height/2 - imageheight/2)
			-- button text
			love.graphics.setFont(font)
			love.graphics.setColor(textnohovercolor)
			love.graphics.print(text, x + imagewidth + 10, y + height/2 - theight/2)
		else
			-- button text
			love.graphics.setFont(font)
			love.graphics.setColor(textnohovercolor)
			love.graphics.print(text, x + 5, y + height/2 - theight/2)
		end
	end

end

--[[---------------------------------------------------------
	- func: DrawMultiChoice(object)
	- desc: draws the multi choice object
--]]---------------------------------------------------------
function skin.DrawMultiChoice(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local text = object:GetText()
	local choice = object:GetChoice()
	local image = skin.images["multichoice-arrow.png"]
	local font = skin.controls.multichoice_text_font
	local theight = font:getHeight("a")
	local bodycolor = skin.controls.multichoice_body_color
	local textcolor = skin.controls.multichoice_text_color

	image:setFilter("nearest", "nearest")

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x + 1, y + 1, width - 2, height - 2)

	love.graphics.setColor(textcolor)
	love.graphics.setFont(font)

	if choice == "" then
		love.graphics.print(text, x + 5, y + height/2 - theight/2)
	else
		love.graphics.print(choice, x + 5, y + height/2 - theight/2)
	end

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(image, x + width - 20, y + 5)

	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawMultiChoiceList(object)
	- desc: draws the multi choice list object
--]]---------------------------------------------------------
function skin.DrawMultiChoiceList(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.multichoicelist_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawOverMultiChoiceList(object)
	- desc: draws over the multi choice list object
--]]---------------------------------------------------------
function skin.DrawOverMultiChoiceList(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()

	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y - 1, width, height + 1)

end

--[[---------------------------------------------------------
	- func: DrawMultiChoiceRow(object)
	- desc: draws the multi choice row object
--]]---------------------------------------------------------
function skin.DrawMultiChoiceRow(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local text = object:GetText()
	local font = skin.controls.multichoicerow_text_font
	local bodyhovecolor = skin.controls.multichoicerow_body_hover_color
	local texthovercolor = skin.controls.multichoicerow_text_hover_color
	local bodynohovercolor = skin.controls.multichoicerow_body_nohover_color
	local textnohovercolor = skin.controls.multichoicerow_text_nohover_color

	love.graphics.setFont(font)

	if object.hover then
		love.graphics.setColor(bodyhovecolor)
		love.graphics.rectangle("fill", x, y, width, height)
		love.graphics.setColor(0, 0, 0, 255)
		love.graphics.print(text, x + 6, y + 6)
		love.graphics.setColor(texthovercolor)
		love.graphics.print(text, x + 5, y + 5)
	else
		love.graphics.setColor(bodynohovercolor)
		love.graphics.rectangle("fill", x, y, width, height)
		love.graphics.setColor(textnohovercolor)
		love.graphics.print(text, x + 5, y + 5)
	end

end

--[[---------------------------------------------------------
	- func: DrawToolTip(object)
	- desc: draws the tool tip object
--]]---------------------------------------------------------
function skin.DrawToolTip(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.tooltip_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawText(object)
	- desc: draws the text object
--]]---------------------------------------------------------
function skin.DrawText(object)
	--love.graphics.setColor {255, 255, 255, 255}
end

--[[---------------------------------------------------------
	- func: DrawTextInput(object)
	- desc: draws the text input object
--]]---------------------------------------------------------
function skin.DrawTextInput(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local font = object:GetFont()
	local focus = object:GetFocus()
	local showindicator = object:GetIndicatorVisibility()
	local alltextselected = object:IsAllTextSelected()
	local textx = object:GetTextX()
	local texty = object:GetTextY()
	local text = object:GetText()
	local multiline = object:GetMultiLine()
	local lines = object:GetLines()
	local offsetx = object:GetOffsetX()
	local offsety = object:GetOffsetY()
	local indicatorx = object:GetIndicatorX()
	local indicatory = object:GetIndicatorY()
	local vbar = object:HasVerticalScrollBar()
	local hbar = object:HasHorizontalScrollBar()
	local linenumbers = object:GetLineNumbersEnabled()
	local itemwidth = object:GetItemWidth()
	local theight = font:getHeight("a")
	local bodycolor = skin.controls.textinput_body_color
	local multilinebodycolor = skin.controls.textinput_body_multiline_color
	local textnormalcolor = skin.controls.textinput_text_normal_color
	local textselectedcolor = skin.controls.textinput_text_selected_color
	local highlightbarcolor = skin.controls.textinput_highlight_bar_color
	local indicatorcolor = skin.controls.textinput_indicator_color

	if multiline then
		love.graphics.setColor(multilinebodycolor)
	else
		love.graphics.setColor(bodycolor)
	end
	love.graphics.rectangle("fill", x, y, width, height)

	if alltextselected then
		local bary = 0
		if multiline then
			for i=1, #lines do
				local twidth = font:getWidth(lines[i])
				if twidth == 0 then
					twidth = 5
				end
				love.graphics.setColor(highlightbarcolor)
				love.graphics.rectangle("fill", textx, texty + bary, twidth, theight)
				bary = bary + theight
			end
		else
			local twidth = font:getWidth(text)
			love.graphics.setColor(highlightbarcolor)
			love.graphics.rectangle("fill", textx, texty, twidth, theight)
		end
	end

	if showindicator and focus then
		love.graphics.setColor(indicatorcolor)
		love.graphics.rectangle("fill", indicatorx, indicatory, 1, theight)
	end

	if not multiline then
		object:SetTextOffsetY(height/2 - theight/2)
		if offsetx ~= 0 then
			object:SetTextOffsetX(0)
		else
			object:SetTextOffsetX(5)
		end
	else
		if vbar then
			if offsety ~= 0 then
				if hbar then
					object:SetTextOffsetY(5)
				else
					object:SetTextOffsetY(-5)
				end
			else
				object:SetTextOffsetY(5)
			end
		else
			object:SetTextOffsetY(5)
		end

		if hbar then
			if offsety ~= 0 then
				if linenumbers then
					local panel = object:GetLineNumbersPanel()
					if vbar then
						object:SetTextOffsetX(5)
					else
						object:SetTextOffsetX(-5)
					end
				else
					if vbar then
						object:SetTextOffsetX(5)
					else
						object:SetTextOffsetX(-5)
					end
				end
			else
				object:SetTextOffsetX(5)
			end
		else
			object:SetTextOffsetX(5)
		end

	end

	textx = object:GetTextX()
	texty = object:GetTextY()

	love.graphics.setFont(font)

	if alltextselected then
		love.graphics.setColor(textselectedcolor)
	else
		love.graphics.setColor(textnormalcolor)
	end

	if multiline then
		for i=1, #lines do
			if alltextselected then
				love.graphics.setColor(0, 0, 0)
				love.graphics.print(lines[i], textx+1, texty + theight * i - theight+1)
				love.graphics.setColor(textselectedcolor)
			else
				love.graphics.setColor(textnormalcolor)
			end
			love.graphics.print(lines[i], textx, texty + theight * i - theight)
		end
	else
		if alltextselected then
			love.graphics.setColor(0, 0, 0)
			love.graphics.print(lines[1], textx+1, texty+1)
			love.graphics.setColor(textselectedcolor)
		else
			love.graphics.setColor(textnormalcolor)
		end
		love.graphics.print(lines[1], textx, texty)
	end

end

--[[---------------------------------------------------------
	- func: DrawOverTextInput(object)
	- desc: draws over the text input object
--]]---------------------------------------------------------
function skin.DrawOverTextInput(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local focus = object:GetFocus()
	local multiline = object:GetMultiLine()

	if focus and not multiline then
		love.graphics.setColor(accentcolor)
	else
		love.graphics.setColor(bordercolor)
	end
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: DrawScrollButton(object)
	- desc: draws the scroll button object
--]]---------------------------------------------------------
function skin.DrawScrollButton(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local hover = object:GetHover()
	local scrolltype = object:GetScrollType()
	local down = object.down
	local bodydowncolor = skin.controls.button_body_down_color
	local bodyhovercolor = skin.controls.button_body_hover_color
	local bodynohovercolor = skin.controls.button_body_nohover_color

	-- button body
	local image = skin.images["scrollbody.png"]
	local imageheight = image:getHeight()
	local imagewidth = image:getWidth()
	local scaley = height/imageheight
	local scalex = imageheight
	love.graphics.setColor(255, 255, 255, 255)
	if scrolltype == "up" or scrolltype == "down" then
		--love.graphics.draw(image, x, y, 0, scalex, scaley)
	else
		--love.graphics.draw(image, x + width, y, math.pi / 2, scalex, scaley)
	end

	if down then
		x = x + 1
		y = y + 1
	end

	if scrolltype == "up" then
		local image = skin.images["arrow-up.png"]
		local imagewidth = image:getWidth()
		local imageheight = image:getHeight()
		image:setFilter("nearest", "nearest")
		if hover then
			love.graphics.setColor(255, 255, 255, 255)
		else
			love.graphics.setColor(255, 255, 255, 150)
		end
		love.graphics.draw(image, x + width/2 - imagewidth/2, y + height/2 - imageheight/2)
		-- button border
		love.graphics.setColor(bordercolor)
		--skin.OutlinedRectangle(x, y, width, height, false, true)
	elseif scrolltype == "down" then
		local image = skin.images["arrow-down.png"]
		local imagewidth = image:getWidth()
		local imageheight = image:getHeight()
		image:setFilter("nearest", "nearest")
		if hover then
			love.graphics.setColor(255, 255, 255, 255)
		else
			love.graphics.setColor(255, 255, 255, 150)
		end
		love.graphics.draw(image, x + width/2 - imagewidth/2, y + height/2 - imageheight/2)
		-- button border
		love.graphics.setColor(bordercolor)
		--skin.OutlinedRectangle(x, y, width, height, true)
	elseif scrolltype == "left" then
		local image = skin.images["arrow-left.png"]
		local imagewidth = image:getWidth()
		local imageheight = image:getHeight()
		image:setFilter("nearest", "nearest")
		if hover then
			love.graphics.setColor(255, 255, 255, 255)
		else
			love.graphics.setColor(255, 255, 255, 150)
		end
		love.graphics.draw(image, x + width/2 - imagewidth/2, y + height/2 - imageheight/2)
		-- button border
		love.graphics.setColor(bordercolor)
		--skin.OutlinedRectangle(x, y, width, height, false, false, false, true)
	elseif scrolltype == "right" then
		local image = skin.images["arrow-right.png"]
		local imagewidth = image:getWidth()
		local imageheight = image:getHeight()
		image:setFilter("nearest", "nearest")
		if hover then
			love.graphics.setColor(255, 255, 255, 255)
		else
			love.graphics.setColor(255, 255, 255, 150)
		end
		love.graphics.draw(image, x + width/2 - imagewidth/2, y + height/2 - imageheight/2)
		-- button border
		love.graphics.setColor(bordercolor)
		--skin.OutlinedRectangle(x, y, width, height, false, false, true)
	end

end

--[[---------------------------------------------------------
	- func: skin.DrawSlider(object)
	- desc: draws the slider object
--]]---------------------------------------------------------
function skin.DrawSlider(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local slidtype = object:GetSlideType()
	local button = object.internals[1]
	local buttonx = button:GetX()
	local buttony = button:GetY()
	local increase = object:GetScrollIncrease() == object:GetScrollDecrease() and object:GetScrollIncrease() or 0
	local color = skin.controls.slider_value_color

	if slidtype == "horizontal" then
		love.graphics.setColor(bordercolor)
		love.graphics.rectangle("fill", buttonx, y + height/2, width - buttonx + x, 1)

		if increase >= 8 then
			for i = 0, math.floor(width / increase) do
				local stepx = x + 5 + i * increase

				if buttonx <= stepx then
					love.graphics.setColor(bordercolor)
				else
					love.graphics.setColor(color)
				end

				love.graphics.rectangle("fill", stepx, y + height / 2 - 2, 1, 5)
			end
		end
		love.graphics.setColor(color)
		love.graphics.rectangle("fill", x + 5, y + height/2, buttonx - x, 1)
	elseif slidtype == "vertical" then
		love.graphics.setColor(color)
		love.graphics.rectangle("fill", x + width/2, buttony, 1, height - buttony + y)
		love.graphics.setColor(bordercolor)
		love.graphics.rectangle("fill", x + width/2, y + 5, 1, buttony - y)
	end

end

--[[---------------------------------------------------------
	- func: skin.DrawSliderButton(object)
	- desc: draws the slider button object
--]]---------------------------------------------------------
function skin.DrawSliderButton(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local hover = object:GetHover()
	local down = object.down
	local parent = object:GetParent()
	local enabled = parent:GetEnabled()
	local bodydowncolor = skin.controls.button_body_down_color
	local bodyhovercolor = skin.controls.button_body_hover_color
	local bodynohovercolor = skin.controls.button_body_nohover_color
	local image = skin.images["button-nohover.png"]
	local imageheight = image:getHeight()
	local scaley = height/imageheight

	if down then
		love.graphics.setColor(bodydowncolor)
	elseif hover then
		love.graphics.setColor(bodyhovercolor)
	else
		love.graphics.setColor(bodynohovercolor)
	end

	love.graphics.draw(image, x, y, 0, width, scaley)
	-- button border
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: skin.DrawCheckBox(object)
	- desc: draws the check box object
--]]---------------------------------------------------------
function skin.DrawCheckBox(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetBoxWidth()
	local height = object:GetBoxHeight()
	local checked = object:GetChecked()
	local hover = object:GetHover()
	local bodycolor = skin.controls.checkbox_body_color
	local checkcolor = skin.controls.checkbox_check_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

	if checked then
		love.graphics.setColor(checkcolor)
		love.graphics.rectangle("fill", x + 4, y + 4, width - 8, height - 8)
	end

	if hover then
		love.graphics.setColor(bordercolor)
		skin.OutlinedRectangle(x + 4, y + 4, width - 8, height - 8)
	end

end

--[[---------------------------------------------------------
	- func: skin.DrawCollapsibleCategory(object)
	- desc: draws the collapsible category object
--]]---------------------------------------------------------
function skin.DrawCollapsibleCategory(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local text = object:GetText()
	local textcolor = skin.controls.collapsiblecategory_text_color
	local font = smallfont
	local imagedown = skin.images["arrow-down.png"]
	local imageright = skin.images["arrow-right.png"]
	local open = object.open

	love.graphics.setColor(255, 255, 255, 255)
	if open then
		love.graphics.draw(imagedown, x + 5, y + 6 + 1)
	else
		love.graphics.draw(imageright, x + 5, y + 6 - 1)
	end

	love.graphics.setFont(font)
	love.graphics.setColor(textcolor)
	love.graphics.print(text, x + 22, y + 5)

	love.graphics.setColor(bordercolor)
	--skin.OutlinedRectangle(x+5, y+ 16, width-10, 10, true, false, true, true)

end

--[[---------------------------------------------------------
	- func: skin.DrawColumnList(object)
	- desc: draws the column list object
--]]---------------------------------------------------------
function skin.DrawColumnList(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.columnlist_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

end

--[[---------------------------------------------------------
	- func: skin.DrawColumnListHeader(object)
	- desc: draws the column list header object
--]]---------------------------------------------------------
function skin.DrawColumnListHeader(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local hover = object:GetHover()
	local name = object:GetName()
	local down = object.down
	local font = skin.controls.columnlistheader_text_font
	local twidth = font:getWidth(object.name)
	local theight = font:getHeight(object.name)
	local bodydowncolor = skin.controls.columnlistheader_body_down_color
	local textdowncolor = skin.controls.columnlistheader_text_down_color
	local bodyhovercolor = skin.controls.columnlistheader_body_hover_color
	local textdowncolor = skin.controls.columnlistheader_text_hover_color
	local nohovercolor = skin.controls.columnlistheader_body_nohover_color
	local textnohovercolor = skin.controls.columnlistheader_text_nohover_color

	local buttonbodydowncolor = skin.controls.button_body_down_color
	local buttonbodyhovercolor = skin.controls.button_body_hover_color
	local buttonbodynohovercolor = skin.controls.button_body_nohover_color
	local image = skin.images["button-nohover.png"]
	local imageheight = image:getHeight()
	local scaley = height/imageheight

	if down then
		love.graphics.setColor(buttonbodydowncolor)
	elseif hover then
		love.graphics.setColor(buttonbodyhovercolor)
	else
		love.graphics.setColor(buttonbodynohovercolor)
	end

	love.graphics.draw(image, x, y, 0, width, scaley)
	-- button border
	love.graphics.setFont(font)
	if down or hover then
		love.graphics.setColor(textdowncolor)
	else
		love.graphics.setColor(textnohovercolor)
	end
	love.graphics.print(name, x + width/2 - twidth/2, y + height/2 - theight/2)
	-- header border
	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height, false, false, false, true)


end

--[[---------------------------------------------------------
	- func: skin.DrawColumnListArea(object)
	- desc: draws the column list area object
--]]---------------------------------------------------------
function skin.DrawColumnListArea(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.columnlistarea_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

end

--[[---------------------------------------------------------
	- func: skin.DrawOverColumnListArea(object)
	- desc: draws over the column list area object
--]]---------------------------------------------------------
function skin.DrawOverColumnListArea(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()

	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height)

end

--[[---------------------------------------------------------
	- func: skin.DrawColumnListRow(object)
	- desc: draws the column list row object
--]]---------------------------------------------------------
function skin.DrawColumnListRow(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local colorindex = object:GetColorIndex()
	local font = object:GetFont()
	local columndata = object:GetColumnData()
	local textx = object:GetTextX()
	local texty = object:GetTextY()
	local parent = object:GetParent()
	local cwidth, cheight = parent:GetParent():GetColumnSize()
	local theight = font:getHeight("a")
	local hover = object:GetHover()
	local selected = object:GetSelected()
	local body1color = skin.controls.columnlistrow_body1_color
	local body2color = skin.controls.columnlistrow_body2_color
	local bodyhovercolor = skin.controls.columnlistrow_body_hover_color
	local bodyselectedcolor = skin.controls.columnlistrow_body_selected_color
	local textcolor = skin.controls.columnlistrow_text_color
	local texthovercolor = skin.controls.columnlistrow_text_hover_color
	local textselectedcolor = skin.controls.columnlistrow_text_selected_color

	object:SetTextPos(5, height/2 - theight/2)

	if selected then
		love.graphics.setColor(bodyselectedcolor)
		love.graphics.rectangle("fill", x, y, width, height)
	elseif hover then
		love.graphics.setColor(bodyhovercolor)
		love.graphics.rectangle("fill", x, y, width, height)
	elseif colorindex == 1 then
		love.graphics.setColor(body1color)
		love.graphics.rectangle("fill", x + 1, y + 1, width - 2, height - 2)
	else
		love.graphics.setColor(body2color)
		love.graphics.rectangle("fill", x, y, width, height)
	end

	for k, v in ipairs(columndata) do
		love.graphics.setFont(font)
		if selected then
			love.graphics.setColor(0, 0, 0, 255)
			love.graphics.print(v, x + textx + 1, y + texty + 1)
			love.graphics.setColor(textselectedcolor)
		elseif hover then
			love.graphics.setColor(texthovercolor)
		else
			love.graphics.setColor(textcolor)
		end
		love.graphics.print(v, x + textx, y + texty)
		x = x + cwidth
	end

end

--[[---------------------------------------------------------
	- func: skin.DrawModalBackground(object)
	- desc: draws the modal background object
--]]---------------------------------------------------------
function skin.DrawModalBackground(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local bodycolor = skin.controls.modalbackground_body_color

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

end

--[[---------------------------------------------------------
	- func: skin.DrawLineNumbersPanel(object)
	- desc: draws the line numbers panel object
--]]---------------------------------------------------------
function skin.DrawLineNumbersPanel(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()
	local offsety = object:GetOffsetY()
	local parent = object:GetParent()
	local lines = parent:GetLines()
	local font = parent:GetFont()
	local theight = font:getHeight("a")
	local textcolor = skin.controls.linenumberspanel_text_color
	local bodycolor = skin.controls.linenumberspanel_body_color
	local mody = y

	object:SetWidth(10 + font:getWidth(#lines))
	love.graphics.setFont(font)

	love.graphics.setColor(bodycolor)
	love.graphics.rectangle("fill", x, y, width, height)

	love.graphics.setColor(bordercolor)
	skin.OutlinedRectangle(x, y, width, height, true, true, true, false)

	for i=1, #lines do
		love.graphics.setColor(textcolor)
		love.graphics.print(i, x + 5, mody - offsety)
		mody = mody + theight
	end

end

--[[---------------------------------------------------------
	- func: skin.DrawNumberBox(object)
	- desc: draws the numberbox object
--]]---------------------------------------------------------
function skin.DrawNumberBox(object)

end

--[[---------------------------------------------------------
	- func: skin.DrawGrid(object)
	- desc: draws the grid object
--]]---------------------------------------------------------
function skin.DrawGrid(object)

	local x = object:GetX()
	local y = object:GetY()
	local width = object:GetWidth()
	local height = object:GetHeight()

	love.graphics.setColor(bordercolor)
	--skin.OutlinedRectangle(x, y, width, height)

	local cx = x
	local cy = y
	local cw = object.cellwidth + (object.cellpadding * 2)
	local ch = object.cellheight + (object.cellpadding * 2)

	for i=1, object.rows do
		for n=1, object.columns do
			local ovt = false
			local ovl = false
			if i > 1 then
				ovt = true
			end
			if n > 1 then
				ovl = true
			end
			--skin.OutlinedRectangle(cx, cy, cw, ch, ovt, false, ovl, false)
			cx = cx + cw
		end
		cx = x
		cy = cy + ch
	end

end

-- register the skin
loveframes.skins.Register(skin)
