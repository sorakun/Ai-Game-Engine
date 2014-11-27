-- // Additional math functions // --
local function clamp(low, n, high) return math.min(math.max(low, n), high) end

-- // Color converting // --
local function hex2rgb(hex) -- by thebra
	local hex = hex:gsub("#", "")
	return tonumber("0x"..hex:sub(1,2))
	, tonumber("0x"..hex:sub(3,4))
	, tonumber("0x"..hex:sub(5,6))
	, (string.len(hex) > 7 and tonumber("0x"..hex:sub(7,8)) or 255)
end

local function hue2rgb(p, q, t)
	if t < 0   then t = t + 1 end
	if t > 1   then t = t - 1 end
	if t < 1/6 then return p + (q - p) * 6 * t end
	if t < 1/2 then return q end
	if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
	return p
end

-- Both rgb2hsl and hsl2rgb were adapted from:
-- http://pastebin.com/NrcJgL1d by mjijackson.com
local function rgb2hsl(r, g, b, a)
	local r, g, b, a = r/255, g/255, b/255, a and a/255 or 1
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h = (max + min) / 2
	local s, l = h, h

	if max == min then
		h, s = 0, 0
	else
		local d = max - min
		s = (l > 0.5) and d / (2 - max - min) or d / (max + min)

		if max == r then
			h = (g - b) / d + (g < b and 6 or 0)
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end

		h = h / 6
	end

	return h * 360, s, l, a
end

local function hsl2rgb(h, s, l, a)
	local r, g, b
	local a = a or 1

	local h = h / 360

	if s == 0 then
		r, g, b = l, l, l
	else
		local q = (l < 0.5) and l * (1 + s) or l + s - l * s
		local p = l * 2 - q

		r = hue2rgb(p, q, h + 1/3)
		g = hue2rgb(p, q, h)
		b = hue2rgb(p, q, h - 1/3)
	end

	return r * 255, g * 255, b * 255, a * 255
end

Color = {}
Color.__index = Color

function Color:lighten(amount)
	local h, s, l, a = unpack(self.hsl)

	l = clamp(0, l + amount / 100, 1)

	--self[1], self[2], self[3], self[4] = hsl2rgb(h, s, l, a)
	--self.hsl = {h, s, l, a}

	--return self
	return rgb({hsl2rgb(h, s, l, a)}, {h, s, l, a})
end
function Color:darken(amount)
	local h, s, l, a = unpack(self.hsl)

	l = clamp(0, l - amount / 100, 1)

	--self[1], self[2], self[3], self[4] = hsl2rgb(h, s, l, a)
	--self.hsl = {h, s, l, a}

	--return self
	return rgb({hsl2rgb(h, s, l, a)}, {h, s, l, a})
end

function Color:saturate(amount)
	local h, s, l, a = unpack(self.hsl)

	s = clamp(0, s + amount / 100, 1)

	--self[1], self[2], self[3], self[4] = hsl2rgb(h, s, l, a)
	--self.hsl = {h, s, l, a}

	--return self
	return rgb({hsl2rgb(h, s, l, a)}, {h, s, l, a})
end
function Color:desaturate(amount)
	local h, s, l, a = unpack(self.hsl)

	s = clamp(0, s - amount / 100, 1)

	--self[1], self[2], self[3], self[4] = hsl2rgb(h, s, l, a)
	--self.hsl = {h, s, l, a}

	--return self
	return rgb({hsl2rgb(h, s, l, a)}, {h, s, l, a})
end

function Color:spin(amount)
	local h, s, l, a = unpack(self.hsl)

	h = (h + amount) % 360

	--self[1], self[2], self[3], self[4] = hsl2rgb(h, s, l, a)
	--self.hsl = {h, s, l, a}

	--return self
	return rgb({hsl2rgb(h, s, l, a)}, {h, s, l, a})
end
function rgb(rgb, g, b, a, hsl)
	local rgb = assert(rgb, "assertion failed: #1 not specified")

	if type(rgb) == "table" then
		r, g, b, a = unpack(rgb)
	else
		r = rgb
		g = g or r
		b = b or g
		a = a or 255
	end

	local self = {r, g, b, a}
	self.hsl = hsl or {rgb2hsl(r, g, b, a)}

    return setmetatable(self, Color)
end

function hsl(h, s, l, a)
	local h = assert(h, "assertion failed: hue not specified")
	local s = assert(s, "assertion failed: saturation not specified")
	local l = assert(l, "assertion failed: lightness not specified")
	local a = a or 1

	local self = {hsl2rgb(h, s, l, a)}
	self.hsl = {h, s, l, a}

	return setmetatable(self, Color)
end

function hex(hex)
	local hex = assert(hex)

	local self = {hex2rgb(hex)}
	self.hsl = {rgb2hsl(unpack(self))}

	return setmetatable(self, Color)
end
