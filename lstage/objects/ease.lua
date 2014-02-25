local ease = {}

local PI2 = math.pi/2

--[[
	t - current time
	a - start value
	b - end value
	d - duration
]]

function ease.linear(a, b, t, d)
	return (b-a)*(t/d) + b
end

function ease.inSine(a, b, t, d)
	return (b-a)*-math.cos(t/d*PI2) + b
end

function ease.outSine(a, b, t, d)
	return (b-a)*math.sin(t/d*PI2) + b
end

function ease.inOutSine(a, b, t, d)
	return (b-a)*(-(math.cos(t/d*math.pi)+1)/2) + b
end

local Tween = class("LStage.Tween")

function Tween:initialize(easeFunc, a, b, duration)
	self._easeFunc = easeFunc
	self._curTime = 0
	self._duration = duration
	self._done = false
	self._a = a
	self._b = b
end

function Tween:update(dt)
	if not self._done then
		if self._curTime < self._duration then
			self._curTime = self._curTime + dt
		else
			self._curTime = self._duration
			self._done = true
		end
	end
	return self._easeFunc(self._a, self._b, self._curTime, self._duration)
end

function Tween:getTime()
	return self._curTime
end

function Tween:setTime(t)
	self._curTime = t
end

ease.Tween = Tween

return ease