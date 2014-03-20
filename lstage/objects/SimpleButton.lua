local Button = require(LSTAGE_dir .. "objects/button")
local Skin = require(LSTAGE_dir .. "objects/skin")

local SimpleButton = class("LStage.SimpleButton", Button)

function SimpleButton:initialize(skin)
	Button.initialize(self)

	skin = skin or Skin
	self.skin = skin
	self.curColor = self.skin.btn_color
end

function SimpleButton:act(dt)
	Button.act(self, dt)
end

function SimpleButton:_none()
	self.curColor = self.skin.btn_color
end

function SimpleButton:_hover()
	self.curColor = self.skin.btn_highlight
end

function SimpleButton:_down()
	self.curColor = self.skin.btn_down
end

function SimpleButton:pressed()

end

function SimpleButton:draw(drawFunction)
	if drawFunction ~= nil then
		drawFunction(self.curColor, self._pos.x, self._pos.y, self._width, self._height)
	else
		love.graphics.setColor(self.curColor)
		love.graphics.rectangle("fill", self._pos.x, self._pos.y, self._width, self._height)
	end
end

return SimpleButton