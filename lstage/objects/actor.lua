local Actor = class:new()

function Actor:init()
	self:super()
end

function Actor:super()
	self._pos = {x=0, y=0}
	self._disposed = false
end

function Actor:act(dt)

end

function Actor:remove()
	self._disposed = true
end

function Actor:draw()

end

function Actor:setX(x)
	self._pos.x = x
end

function Actor:setY()
	self._pos.y = y
end

function Actor:getX()
	return self._pos.x
end

function Actor:getY()
	return self._pos.y
end

return Actor