--[[------------------------------------------------
    -- Love Frames - A GUI library for LOVE --
    -- Copyright (c) 2013 Kenny Shields --
--]]------------------------------------------------

-- skin path
local dir = "/libs/loveframes/skins/Snap"
local path = string.gsub(dir, "/", "%.")

-- skin table
local skin = {}

-- skin info (you always need this in a skin)
skin.name = "Snap"
skin.author = "unek.czarnawol.ga"
skin.version = "1.1"
skin.base = "Blue"

-- color definitions
local rgb = require(path .. ".color").rgb

local darkcolor = rgb(68, 68, 68)
local bodycolor = rgb(236, 232, 232)
local textcolor = rgb(32, 32, 32)

local redcolor   = rgb(232, 67, 57)
local whitecolor = rgb(255, 255, 255)

-- fonts
local smallfont     = love.graphics.newFont(dir .. "/font/Roboto-Light.ttf", 12)
local boldfont      = love.graphics.newFont(dir .. "/font/RobotoCondensed-Bold.ttf", 12)

loveframes.basicfontsmall = smallfont
loveframes.basicfont = smallfont

-- controls 
skin.controls = {}

-- frame
skin.controls.frame_body_color                      = bodycolor
skin.controls.frame_top_color                       = darkcolor
skin.controls.frame_name_color                      = whitecolor
skin.controls.frame_name_font                       = boldfont
skin.controls.frame_shadow_right_color              = bodycolor:darken(5)
skin.controls.frame_shadow_bottom_color             = bodycolor:darken(15)
skin.controls.frame_shadow_size                     = 0 -- increase to 3-5 for a cool 3d effect

-- button
skin.controls.button_text_nohover_color             = textcolor
skin.controls.button_text_down_color                = textcolor
skin.controls.button_text_hover_color               = textcolor
skin.controls.button_text_nonclickable_color        = textcolor:lighten(15)
skin.controls.button_body_nohover_color             = bodycolor:darken(5)
skin.controls.button_body_down_color                = bodycolor:darken(10)
skin.controls.button_body_hover_color               = bodycolor:darken(3)
skin.controls.button_body_nonclickable_color        = bodycolor:lighten(10)
skin.controls.button_body_shadow_color              = bodycolor:darken(10)
skin.controls.button_text_font                      = smallfont

-- checkbox
skin.controls.checkbox_body_nohover_color           = bodycolor:darken(5)
skin.controls.checkbox_body_hover_color             = bodycolor:darken(3)
skin.controls.checkbox_body_shadow_color            = bodycolor:darken(10)
skin.controls.checkbox_check_color                  = darkcolor
skin.controls.checkbox_text_font                    = smallfont

-- closebutton
skin.controls.closebutton_body_nohover_color        = redcolor
skin.controls.closebutton_body_down_color           = redcolor:darken(5)
skin.controls.closebutton_body_hover_color          = redcolor:lighten(5)

-- columnlist
skin.controls.columnlist_body_color                 = bodycolor:darken(5)

-- columlistarea
skin.controls.columnlistarea_body_color             = bodycolor

-- columnlistheader
skin.controls.columnlistheader_body_color           = darkcolor:lighten(15)
skin.controls.columnlistheader_text_color           = whitecolor
skin.controls.columnlistheader_text_font            = boldfont

-- columnlistrow
skin.controls.columnlistrow_body1_color             = whitecolor
skin.controls.columnlistrow_body2_color             = whitecolor:darken(5)
skin.controls.columnlistrow_body_selected_color     = darkcolor
skin.controls.columnlistrow_text_color              = darkcolor
skin.controls.columnlistrow_text_selected_color     = bodycolor

-- scrollbar
skin.controls.scrollbar_body_nohover_color          = darkcolor:lighten(15)
skin.controls.scrollbar_body_hover_color            = darkcolor:lighten(20)
skin.controls.scrollbar_body_down_color             = darkcolor:lighten(10)

-- slider
skin.controls.slider_body_color                     = bodycolor:darken(10)
skin.controls.slider_value_color                    = redcolor
skin.controls.slider_button_body_nohover_color      = whitecolor
skin.controls.slider_button_body_hover_color        = whitecolor
skin.controls.slider_button_body_down_color         = whitecolor:darken(3)
skin.controls.slider_button_body_nonclickable_color = bodycolor:lighten(5)

-- multichoice
skin.controls.multichoice_body_nohover_color        = bodycolor:darken(5)
skin.controls.multichoice_body_hover_color          = bodycolor:darken(3)
skin.controls.multichoice_body_shadow_color         = bodycolor:darken(10)
skin.controls.multichoice_text_color                = textcolor
skin.controls.multichoice_text_font                 = smallfont

-- multichoicelist
skin.controls.multichoicelist_body_color            = bodycolor:darken(5)

-- multichoicerow
skin.controls.multichoicerow_body_nohover_color     = bodycolor:darken(5)
skin.controls.multichoicerow_body_hover_color       = darkcolor
skin.controls.multichoicerow_text_nohover_color     = textcolor
skin.controls.multichoicerow_text_hover_color       = bodycolor
skin.controls.multichoicerow_text_font              = smallfont

-- textinput
skin.controls.textinput_body_color                  = whitecolor:darken(3)
skin.controls.textinput_indicator_color             = textcolor
skin.controls.textinput_text_normal_color           = textcolor
skin.controls.textinput_text_placeholder_color      = bodycolor:darken(20)
skin.controls.textinput_text_selected_color         = whitecolor
skin.controls.textinput_highlight_bar_color         = darkcolor

-- tabpanel
skin.controls.tabpanel_body_color                   = bodycolor

-- tabbutton
skin.controls.tab_text_color                        = textcolor
skin.controls.tab_body_color                        = bodycolor:darken(10)
skin.controls.tab_body_active_color                 = bodycolor
skin.controls.tab_text_font                         = smallfont

-- tooltip
skin.controls.tooltip_body_color                    = bodycolor:darken(10)

-- collapsiblecategory
skin.controls.collapsiblecategory_text_color        = textcolor

-- panel
skin.controls.panel_body_color                      = bodycolor

-- progressbar
skin.controls.progressbar_body_color                = bodycolor:darken(10)
skin.controls.progressbar_bar_color                 = redcolor
skin.controls.progressbar_text_color                = textcolor
skin.controls.progressbar_text_font                 = smallfont

-- linenumberspanel
skin.controls.linenumberspanel_text_color           = textcolor
skin.controls.linenumberspanel_body_color           = bodycolor

-- form
skin.controls.form_text_color                       = textcolor:lighten(10)
skin.controls.form_text_font                        = smallfont

-- menu
skin.controls.menu_body_color                       = bodycolor:darken(3)

-- menuoption
skin.controls.menuoption_body_hover_color           = bodycolor:darken(15)
skin.controls.menuoption_text_hover_color           = textcolor
skin.controls.menuoption_text_color                 = textcolor

function skin.OutlinedRectangle(x, y, width, height, ovt, ovb, ovl, ovr)
    -- borders are so 2012
end

function skin.RoundedRectangle(x, y, w, h, r)
   r = r or 15
   love.graphics.rectangle("fill", x, y+r, w, h-r*2)
   love.graphics.rectangle("fill", x+r, y, w-r*2, r)
   love.graphics.rectangle("fill", x+r, y+h-r, w-r*2, r)
   love.graphics.arc("fill", x+r, y+r, r, math.pi, math.pi * 1.5)
   love.graphics.arc("fill", x + w-r, y+r, r, -math.pi * 0.5, 0)
   love.graphics.arc("fill", x + w-r, y + h-r, r, 0, math.pi * 0.5)
   love.graphics.arc("fill", x+r, y + h-r, r, math.pi * 0.5, math.pi)
end
-- very shitty
function skin.Triangle(x, y, side, rot)
    if rot then
        love.graphics.polygon("fill", x, y, x - side, y + side, x + side, y + side)
    else
        love.graphics.polygon("fill", x - side, y, x + side, y, x, y + side)
    end
end

--[[---------------------------------------------------------
    - func: DrawFrame(object)
    - desc: draws the frame object
--]]---------------------------------------------------------
function skin.DrawFrame(object)

    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local name = object:GetName()
    local icon = object:GetIcon()
    local bodycolor = skin.controls.frame_body_color
    local topcolor = skin.controls.frame_top_color
    local namecolor = skin.controls.frame_name_color
    local font = skin.controls.frame_name_font
    local shadowrightcolor = skin.controls.frame_shadow_right_color
    local shadowbottomcolor = skin.controls.frame_shadow_bottom_color
    local shadowsize = skin.controls.frame_shadow_size
        
    -- frame body
    if shadowsize > 0 then
        love.graphics.setColor(topcolor)
        love.graphics.polygon("fill"
            , x + width, y
            , x + width + shadowsize, y + shadowsize
            , x + width + shadowsize, y + shadowsize + 25
            , x + width, y + shadowsize + 25)
        love.graphics.setColor(shadowrightcolor)
        love.graphics.polygon("fill"
            , x + width, y + 25
            , x + width + shadowsize, y + shadowsize + 25
            , x + width + shadowsize, y + height + shadowsize
            , x + width, y + height)

        love.graphics.setColor(shadowbottomcolor)
        love.graphics.polygon("fill"
            , x, y + height
            , x + shadowsize, y + height + shadowsize
            , x + width + shadowsize, y + height + shadowsize
            , x + width, y + height)
    end

    love.graphics.setColor(bodycolor)
    love.graphics.rectangle("fill", x, y, width, height)
    
    -- frame top bar
    love.graphics.setColor(topcolor)
    love.graphics.rectangle("fill", x, y, width, 25)
    
    -- frame name section
    love.graphics.setFont(font)
    
    if icon then
        local iconwidth = icon:getWidth()
        local iconheight = icon:getHeight()
        icon:setFilter("nearest", "nearest")
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(icon, x + 5, y + 5)
        love.graphics.setColor(namecolor)
        love.graphics.print(name, x + iconwidth + 10, y + 4)
    else
        love.graphics.setColor(namecolor)
        love.graphics.print(name, x + 5, y + 4)
    end
    
end

function skin.DrawNumberBoxButton(object)
    
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local hover = object:GetHover()
    local text = object:GetText()
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
    local bodynonclickablecolor = skin.controls.button_body_nonclickable_color
    local bodyshadowcolor = skin.controls.button_body_shadow_color

    if not enabled or not clickable then
        love.graphics.setColor(bodynonclickablecolor)
    end

    if down then
        love.graphics.setColor(bodydowncolor)
    elseif hover then
        love.graphics.setColor(bodyhovercolor)
    else
        love.graphics.setColor(bodynohovercolor)
    end

    love.graphics.rectangle("fill", x, y, width, height)

    local arrowx = math.floor(x + width/2) + 1
    local arrowy = math.floor(y) + 4
    if text == "+" then
        love.graphics.setColor(bodyshadowcolor)
        skin.Triangle(arrowx + 1, arrowy + 1, 4, true)
        love.graphics.setColor(255, 255, 255, 255)
        skin.Triangle(arrowx, arrowy, 4, true)
    elseif text == "-" then
        love.graphics.setColor(bodyshadowcolor)
        skin.Triangle(arrowx + 1, arrowy + 1, 4)
        love.graphics.setColor(255, 255, 255, 255)
        skin.Triangle(arrowx, arrowy, 4)
    end
end

--[[---------------------------------------------------------
    - func: DrawButton(object)
    - desc: draws the button object
--]]---------------------------------------------------------
function skin.DrawButton(object)

    local skin = object:GetSkin()
    local parent = object:GetParent()
    if parent.type == "numberbox" then
        skin.DrawNumberBoxButton(object)
        return
    end

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
    local bodynonclickablecolor = skin.controls.button_body_nonclickable_color
    local bodyshadowcolor = skin.controls.button_body_shadow_color
    local radius = 3
    
    if not enabled or not clickable then
        -- button body
        love.graphics.setColor(bodynonclickablecolor)
        love.graphics.rectangle("fill", x, y, width, height)
        -- button text
        love.graphics.setFont(font)
        love.graphics.setColor(textnonclickablecolor)
        love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
        return
    end
    
    if down then
        -- button body
        love.graphics.setColor(bodyshadowcolor)
        skin.RoundedRectangle(x, y + radius, width, height, radius)
        love.graphics.setColor(bodydowncolor)
        skin.RoundedRectangle(x, y + radius, width, height - radius, radius)
        -- button text
        love.graphics.setFont(font)
        love.graphics.setColor(textdowncolor)
        love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2 + radius)
    elseif hover then
        -- button body
        love.graphics.setColor(bodyshadowcolor)
        skin.RoundedRectangle(x, y + radius, width, height, radius)
        love.graphics.setColor(bodyhovercolor)
        skin.RoundedRectangle(x, y, width, height, radius)
        -- button text
        love.graphics.setFont(font)
        love.graphics.setColor(texthovercolor)
        love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
    else
        -- button body
        love.graphics.setColor(bodyshadowcolor)
        skin.RoundedRectangle(x, y + radius, width, height, radius)
        love.graphics.setColor(bodynohovercolor)
        skin.RoundedRectangle(x, y, width, height, radius)
        -- button text
        love.graphics.setFont(font)
        love.graphics.setColor(textnohovercolor)
        love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
    end

end

--[[---------------------------------------------------------
    - func: DrawCloseButton(object)
    - desc: draws the close button object
--]]---------------------------------------------------------
function skin.DrawCloseButton(object)

    local skin = object:GetSkin()
    local parent = object.parent
    local parentwidth = parent:GetWidth()
    object.y = parent.y
    local x = object:GetX()
    local y = object:GetY()
    local hover = object:GetHover()
    local down = object.down
    local bodydowncolor = skin.controls.closebutton_body_down_color
    local bodyhovercolor = skin.controls.closebutton_body_hover_color
    local bodynohovercolor = skin.controls.closebutton_body_nohover_color

    if down then
        -- button body
        love.graphics.setColor(bodydowncolor)
        love.graphics.rectangle("fill", x, y, 15, 5)
    elseif hover then
        -- button body
        love.graphics.setColor(bodyhovercolor)
        love.graphics.rectangle("fill", x, y, 15, 5)
    else
        -- button body
        love.graphics.setColor(bodynohovercolor)
        love.graphics.rectangle("fill", x, y, 15, 5)
    end
    
    object:SetPos(parentwidth - 20, 4)
    object:SetSize(16, 16)
    
end

--[[---------------------------------------------------------
    - func: skin.DrawCheckBox(object)
    - desc: draws the check box object
--]]---------------------------------------------------------
function skin.DrawCheckBox(object)
    
    local skin = object:GetSkin()
    local x = object:GetX() + 2
    local y = object:GetY() + 1
    local width = object:GetBoxWidth() - 2
    local height = object:GetBoxHeight() - 3
    local checked = object:GetChecked()
    local bodynohovercolor = skin.controls.checkbox_body_nohover_color
    local bodyhovercolor = skin.controls.checkbox_body_hover_color
    local checkcolor = skin.controls.checkbox_check_color
    local shadowcolor = skin.controls.checkbox_body_shadow_color
    local radius = 2
    
    love.graphics.setColor(shadowcolor)
    skin.RoundedRectangle(x, y, width, height + radius, radius)
    if hover then
        love.graphics.setColor(bodyhovercolor)
    else
        love.graphics.setColor(bodynohovercolor)
    end
    skin.RoundedRectangle(x, y, width, height, 3)
    
    if checked then
        local image = skin.images["check.png"]
        local scalex = width / image:getWidth()
        local scaley = height / image:getHeight()
        love.graphics.setColor(checkcolor)
        love.graphics.draw(image, x, y, 0, scalex, scaley)
    end
    
end

--[[---------------------------------------------------------
    - func: skin.DrawColumnList(object)
    - desc: draws the column list object
--]]---------------------------------------------------------
function skin.DrawColumnList(object)
    
    local skin = object:GetSkin()
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
    
    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local name = object:GetName()
    local down = object.down
    local font = skin.controls.columnlistheader_text_font
    local twidth = font:getWidth(object.name)
    local theight = font:getHeight(object.name) + 2
    local bodycolor = skin.controls.columnlistheader_body_color
    local textcolor = skin.controls.columnlistheader_text_color

    -- header body
    love.graphics.setColor(bodycolor)
    love.graphics.rectangle("fill", x, y, width, height)
    -- header name
    love.graphics.setFont(font)
    love.graphics.setColor(textcolor)
    love.graphics.print(name, x + width/2 - twidth/2, y + height/2 - theight/2)
    
end

--[[---------------------------------------------------------
    - func: skin.DrawColumnListArea(object)
    - desc: draws the column list area object
--]]---------------------------------------------------------
function skin.DrawColumnListArea(object)
        
end

--[[---------------------------------------------------------
    - func: skin.DrawOverColumnListArea(object)
    - desc: draws over the column list area object
--]]---------------------------------------------------------
function skin.DrawOverColumnListArea(object)
    
end

--[[---------------------------------------------------------
    - func: skin.DrawColumnListRow(object)
    - desc: draws the column list row object
--]]---------------------------------------------------------
function skin.DrawColumnListRow(object)
    
    local skin = object:GetSkin()
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
    local theight = font:getHeight()
    local hover = object:GetHover()
    local selected = object:GetSelected()
    local body1color = skin.controls.columnlistrow_body1_color
    local body2color = skin.controls.columnlistrow_body2_color
    local bodyselectedcolor = skin.controls.columnlistrow_body_selected_color
    local textcolor = skin.controls.columnlistrow_text_color
    local textselectedcolor = skin.controls.columnlistrow_text_selected_color
    
    object:SetTextPos(5, height/2 - theight/2)
    
    if selected then
        love.graphics.setColor(bodyselectedcolor)
    elseif colorindex == 1 then
        love.graphics.setColor(body1color)
    else
        love.graphics.setColor(body2color)
    end
    
    love.graphics.rectangle("fill", x, y, width, height)
    
    for k, v in ipairs(columndata) do
        love.graphics.setFont(font)
        if selected then
            love.graphics.setColor(textselectedcolor)
        else
            love.graphics.setColor(textcolor)
        end
        local text = v
        love.graphics.print(text, x + textx, y + texty)
        x = x + cwidth
    end
    
end

--[[---------------------------------------------------------
    - func: DrawScrollArea(object)
    - desc: draws the scroll area object
--]]---------------------------------------------------------
function skin.DrawScrollArea(object)
    
end

--[[---------------------------------------------------------
    - func: DrawScrollBar(object)
    - desc: draws the scroll bar object
--]]---------------------------------------------------------
function skin.DrawScrollBar(object)

    local skin = object:GetSkin()
    local x = object:GetX() + 4
    local y = object:GetY() + 4
    local width = object:GetWidth() - 8
    local height = object:GetHeight() - 8
    local dragging = object:IsDragging()
    local hover = object:GetHover()
    local bodydowncolor = skin.controls.scrollbar_body_down_color
    local bodyhovercolor = skin.controls.scrollbar_body_hover_color
    local bodynohovercolor = skin.controls.scrollbar_body_nohover_color

    if dragging then
        love.graphics.setColor(bodydowncolor)
    elseif hover then
        love.graphics.setColor(bodyhovercolor)
    else
        love.graphics.setColor(bodynohovercolor)
    end
    
    love.graphics.rectangle("fill", x, y, width, height)

end

--[[---------------------------------------------------------
    - func: DrawScrollBody(object)
    - desc: draws the scroll body object
--]]---------------------------------------------------------
function skin.DrawScrollBody(object)

end

--[[---------------------------------------------------------
    - func: DrawScrollButton(object)
    - desc: draws the scroll button object
--]]---------------------------------------------------------
function skin.DrawScrollButton(object)

    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local hover = object:GetHover()
    local down = object.down
    local bodycolor = skin.controls.scrollbody_body_color
    local bodydowncolor = skin.controls.scrollbar_body_down_color
    local bodyhovercolor = skin.controls.scrollbar_body_hover_color
    local bodynohovercolor = skin.controls.scrollbar_body_nohover_color

    love.graphics.setColor(bodycolor)
    love.graphics.rectangle("fill", x, y, width, height)
    
    if dragging then
        love.graphics.setColor(bodydowncolor)
    elseif hover then
        love.graphics.setColor(bodyhovercolor)
    else
        love.graphics.setColor(bodynohovercolor)
    end

    love.graphics.rectangle("fill", x+4, y+4, width-8, height-8)
    
end

--[[---------------------------------------------------------
    - func: skin.DrawSlider(object)
    - desc: draws the slider object
--]]---------------------------------------------------------
function skin.DrawSlider(object)
    
    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local slidtype = object:GetSlideType()
    local bodycolor = skin.controls.slider_body_color
    local valuecolor = skin.controls.slider_value_color
    local value = object:GetValue()
    local button = object.internals[1]
    local buttonx = button:GetX()
    local buttony = button:GetY()
    local buttonradius = math.min(button:GetWidth(), button:GetHeight()) / 2
    
    if slidtype == "horizontal" then
        love.graphics.setColor(bodycolor)
        skin.RoundedRectangle(x, y + height/2 - 2, width, 4, 2)
        love.graphics.setColor(valuecolor)
        skin.RoundedRectangle(x, y + height/2 - 2, buttonx - x + buttonradius, 4, 2)
    elseif slidtype == "vertical" then
        love.graphics.setColor(bodycolor)
        skin.RoundedRectangle(x + width/2 - 2, y, 4, height, 2)
        love.graphics.setColor(valuecolor)
        skin.RoundedRectangle(x + width/2 - 2, buttony, 4, height - buttony + y, 2)
    end
    
end

--[[---------------------------------------------------------
    - func: skin.DrawSliderButton(object)
    - desc: draws the slider button object
--]]---------------------------------------------------------
function skin.DrawSliderButton(object)

    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local hover = object:GetHover()
    local down = object.down
    local parent = object:GetParent()
    local enabled = parent:GetEnabled()
    local bodydowncolor = skin.controls.slider_button_body_down_color
    local bodyhovercolor = skin.controls.slider_button_body_hover_color
    local bodynohovercolor = skin.controls.slider_button_body_nohover_color
    local bodynonclickablecolor = skin.controls.slider_button_body_nonclickable_color
    local radius = math.min(width, height) / 2
    
    if not enabled then
        -- button body
        love.graphics.setColor(bodynonclickablecolor)
        love.graphics.circle("fill", x + width / 2, y + height / 2, radius)
        return
    end
    
    if down then
        -- button body
        love.graphics.setColor(bodydowncolor)
        love.graphics.circle("fill", x + width / 2, y + height / 2, radius)
    elseif hover then
        -- button body
        love.graphics.setColor(bodyhovercolor)
        love.graphics.circle("fill", x + width / 2, y + height / 2, radius)
    else
        -- button body
        love.graphics.setColor(bodynohovercolor)
        love.graphics.circle("fill", x + width / 2, y + height / 2, radius)
    end
    
end

--[[---------------------------------------------------------
    - func: DrawMultiChoice(object)
    - desc: draws the multi choice object
--]]---------------------------------------------------------
function skin.DrawMultiChoice(object)
    
    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local text = object:GetText()
    local choice = object:GetChoice()
    local hover = object:GetHover()
    local font = skin.controls.multichoice_text_font
    local theight = font:getHeight()
    local bodynohovercolor = skin.controls.multichoice_body_nohover_color
    local bodyhovercolor = skin.controls.multichoice_body_hover_color
    local textcolor = skin.controls.multichoice_text_color
    local shadowcolor = skin.controls.multichoice_body_shadow_color
    local radius = 3
    
    love.graphics.setColor(shadowcolor)
    skin.RoundedRectangle(x, y, width, height + radius, radius)
    if hover then
        love.graphics.setColor(bodyhovercolor)
    else
        love.graphics.setColor(bodynohovercolor)
    end
    skin.RoundedRectangle(x, y, width, height, radius)
    
    love.graphics.setColor(textcolor)
    love.graphics.setFont(font)
    
    love.graphics.print(choice == "" and text or choice, x + 5, y + height/2 - theight/2)
    
    love.graphics.setColor(shadowcolor)
    skin.Triangle(x + width - 14, y + 11, 5)
    love.graphics.setColor(255, 255, 255)
    skin.Triangle(x + width - 15, y + 10, 5)
    
end

--[[---------------------------------------------------------
    - func: DrawMultiChoiceList(object)
    - desc: draws the multi choice list object
--]]---------------------------------------------------------
function skin.DrawMultiChoiceList(object)
    
    local skin = object:GetSkin()
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

    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    
end

--[[---------------------------------------------------------
    - func: DrawMultiChoiceRow(object)
    - desc: draws the multi choice row object
--]]---------------------------------------------------------
function skin.DrawMultiChoiceRow(object)
    
    local skin = object:GetSkin()
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
    - func: DrawTabButton(object)
    - desc: draws the tab button object
--]]---------------------------------------------------------
function skin.DrawTabButton(object)

    local skin = object:GetSkin()
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
    local bodycolor = skin.controls.tab_body_color
    local bodyactivecolor = skin.controls.tab_body_active_color
    local textcolor = skin.controls.tab_text_color
    local width  = object:GetWidth()
    local height = object:GetHeight()
    
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
    
    if tabnumber == ptabnumber then
        -- button body
        love.graphics.setColor(bodyactivecolor)
        love.graphics.rectangle("fill", x, y, width, height + 3)
        if image then
            -- button image
            love.graphics.setColor(255, 255, 255, 255)
            love.graphics.draw(image, x + 5, y + height/2 - imageheight/2)
            -- button text
            love.graphics.setFont(font)
            love.graphics.setColor(textcolor)
            love.graphics.print(text, x + imagewidth + 10, y + height/2 - theight/2)
        else
            -- button text
            love.graphics.setFont(font)
            love.graphics.setColor(textcolor)
            love.graphics.print(text, x + 5, y + height/2 - theight/2)
        end 
    else
        -- button body
        love.graphics.setColor(bodycolor)
        love.graphics.rectangle("fill", x, y, width, height)
        if image then
            -- button image
            love.graphics.setColor(255, 255, 255, 150)
            love.graphics.draw(image, x + 5, y + height/2 - imageheight/2)
            -- button text
            love.graphics.setFont(font)
            love.graphics.setColor(textcolor)
            love.graphics.print(text, x + imagewidth + 10, y + height/2 - theight/2)
        else
            -- button text
            love.graphics.setFont(font)
            love.graphics.setColor(textcolor)
            love.graphics.print(text, x + 5, y + height/2 - theight/2)
        end
    end

end

--[[---------------------------------------------------------
    - func: DrawProgressBar(object)
    - desc: draws the progress bar object
--]]---------------------------------------------------------
function skin.DrawProgressBar(object)

    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local value = object:GetValue()
    local max = object:GetMax()
    local barwidth = object:GetBarWidth()
    local font = skin.controls.progressbar_text_font
    local text = value .. "/" ..max
    local twidth = font:getWidth(text)
    local theight = font:getHeight()
    local bodycolor = skin.controls.progressbar_body_color
    local barcolor = skin.controls.progressbar_bar_color
    local textcolor = skin.controls.progressbar_text_color
        
    -- progress bar body
    love.graphics.setColor(bodycolor)
    love.graphics.rectangle("fill", x, y, width, height)
    love.graphics.setColor(barcolor)
    love.graphics.rectangle("fill", x + 2, y + 2, math.max(0, barwidth - 4), height - 4)
    love.graphics.setFont(font)
    love.graphics.setColor(textcolor)
    love.graphics.print(text, x + width/2 - twidth/2, y + height/2 - theight/2)
        
end

--[[---------------------------------------------------------
    - func: skin.DrawCollapsibleCategory(object)
    - desc: draws the collapsible category object
--]]---------------------------------------------------------
function skin.DrawCollapsibleCategory(object)
    
    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local text = object:GetText()
    local open = object:GetOpen()
    local textcolor = skin.controls.collapsiblecategory_text_color
    local font = smallfont
    
    if open then
        love.graphics.setColor(0, 0, 0, 30)
        skin.Triangle(x + 10 + 1, y + 10 + 1, 5)
        love.graphics.setColor(255, 255, 255, 255)
        skin.Triangle(x + 10, y + 10, 5)
    else
        love.graphics.setColor(0, 0, 0, 30)
        skin.Triangle(x + 10 + 1, y + 10 + 1, 5, true)
        love.graphics.setColor(255, 255, 255, 255)
        skin.Triangle(x + 10, y + 10, 5, true)
    end
    
    love.graphics.setFont(font)
    love.graphics.setColor(textcolor)
    love.graphics.print(text, x + 23, y + 3)
    
end

--[[---------------------------------------------------------
    - func: skin.DrawForm(object)
    - desc: draws the form object
--]]---------------------------------------------------------
function skin.DrawForm(object)

    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local topmargin = object.topmargin
    local name = object.name
    local font = skin.controls.form_text_font
    local textcolor = skin.controls.form_text_color
    
    love.graphics.setFont(font)
    love.graphics.setColor(textcolor)
    love.graphics.print(name, x + 7, y)

end

--[[---------------------------------------------------------
    - func: skin.DrawMenu(object)
    - desc: draws the menu object
--]]---------------------------------------------------------
function skin.DrawMenu(object)
    
    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local bodycolor = skin.controls.menu_body_color
    
    love.graphics.setColor(bodycolor)
    love.graphics.rectangle("fill", x, y, width, height)
    
end

--[[---------------------------------------------------------
    - func: skin.DrawMenuOption(object)
    - desc: draws the menuoption object
--]]---------------------------------------------------------
function skin.DrawMenuOption(object)

    local skin = object:GetSkin()
    local x = object:GetX()
    local y = object:GetY()
    local width = object:GetWidth()
    local height = object:GetHeight()
    local hover = object:GetHover()
    local text = object:GetText()
    local icon = object:GetIcon()
    local option_type = object.option_type
    local body_hover_color = skin.controls.menuoption_body_hover_color
    local text_hover_color = skin.controls.menuoption_text_hover_color
    local text_color = skin.controls.menuoption_text_color
    local twidth = smallfont:getWidth(text)
    
    
    if option_type == "divider" then
        love.graphics.setColor(body_hover_color)
        love.graphics.rectangle("fill", x + 4, y + 2, width - 8, 1)
        object.contentheight = 10
    else
        love.graphics.setFont(smallfont)
        if hover then
            love.graphics.setColor(body_hover_color)
            love.graphics.rectangle("fill", x, y, width, height)
            love.graphics.setColor(text_hover_color)
            love.graphics.print(text, x + 26, y + 5)
        else
            love.graphics.setColor(text_color)
            love.graphics.print(text, x + 26, y + 5)
        end
        if icon then
            love.graphics.setColor(255, 255, 255, 255)
            love.graphics.draw(icon, x + 5, y + 5)
        end
        object.contentwidth = twidth + 31
        object.contentheight = 25
    end
    
end

-- register the skin
loveframes.skins.Register(skin)