local Actor = require(LSTAGE_dir .. "objects/actor")

local Button = class("LStage.Button", Actor)

function Button:initialize(skin)
	Actor.initialize(self)
	--[[
		0 - none
		1 - hover
		2 - press
		3 - down
	]]
	self._btnState = 0
end

function Button:act(dt)
	Actor.act(self, dt)

	local mouseX, mouseY = love.mouse.getPosition()
	local collides = self:collides(mouseX, mouseY)

	if collides then
		if love.mouse.isDown("l") then
			self:_down()
		else
			self:_hover()
		end
	else
		self:_none()
	end
end

function Button:getState()
	return self._btnState
end

function Button:_none()

end

function Button:_hover()

end

function Button:pressed()

end

function Button:_down()

end

function Button:isDown()
	return self._btnState == 3
end

return Button