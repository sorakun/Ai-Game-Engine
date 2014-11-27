
--[[ Camera Module ]]

local class = require 'oop.middleclass'

local Camera = class("Camera")

function Camera:initialize(x, y)
  self.sx = 1
  self.sy = 1
  self.w = 0
  self.h = 0
  self.rot = 0
  self.x = x
  self.y = y
  self.scene = nil
end

function Camera:Attach(s)
  Engine.debug("Attaching scene \""..s.name.."\" to camera.")
  self.scene = s
  self.w = s.w
  self.h = s.h
end

function Camera:SetScale(sx, sy)
  self.sx = sx
  self.sy = sy
  love.graphics.scale(sx, sy)
end

-- Can be undo by calling Camera:Unset().
function Camera:Translate(x, y)
  love.graphics.push()
  love.graphics.rotate(-self.rot)
  love.graphics.scale(1 / self.sx, 1 / self.sy)
  love.graphics.translate(-self.x, -self.y)
end

function Camera:Set()
  love.graphics.push()
  love.graphics.rotate(-self.rot)
  love.graphics.scale(1/self.sx, 1/self.sy)
  love.graphics.translate(-self.x, -self.y)
end

function Camera:Unset()
  love.graphics.pop()
end

function Camera:Update(dt)
  if self.scene ~= nil then 
    self.scene:Update(dt)
  end
end

function Camera:SetPos(x, y)
  self.x = x
  self.y = y
end

-- INFO: Scaling not supported yet.
function Camera:Render()
  self:Set()
  if self.scene ~= nil then 
    self.scene:Render()
  end
  self:Unset()
end

-- Makes sure than x, y coordinates are visible to the camera, if not, wrap there.
function Camera:Focus(x, y)
  local wx, wy = love.window.getWidth(), love.window.getHeight()
  if self.x > x and self.x < self.x + wx and self.y > y and self.y < self.y + wy then
    return
  end

  self:SetPos(x - wx/2, y - wy/2)
  print("focus")
end

return Camera