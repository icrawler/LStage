local Actor = class("LStage.Actor")

function Actor:initialize()
	self._pos = {x=0, y=0}
	self._disposed = false
	self._actions = {}
	self._width = 10
	self._height = 10
	self._alpha = 255
end

function Actor:act(dt)
	-- update actor
	for _, v in ipairs(self._actions) do
		v:act(dt, self)
	end

	-- dispose actions
	for i=#self._actions, 1, -1 do
		if self._actions[i]._disposed then
			table.remove(self._actions, i)
		end
	end
end

function Actor:collides(x, y)

end

function Actor:addAction(action)
	table.insert(self._actions, action)
end

function Actor:remove()
	self._disposed = true
end

function Actor:draw()

end

function Actor:setAlpha(a)
	self._alpha = a
end

function Actor:getAlpha()
	return self._alpha
end

function Actor:setWidth(width)
	self._width = width
end

function Actor:setHeight(height)
	self._height = height
end

function Actor:getWidth()
	return self._width
end

function Actor:getHeight()
	return self._height
end

function Actor:setX(x)
	self._pos.x = x
end

function Actor:setY(y)
	self._pos.y = y
end

function Actor:getX()
	return self._pos.x
end

function Actor:getY()
	return self._pos.y
end

return Actor