function love.load()
	stage = require("stage")

	testActor = stage.Actor:new()

	function testActor:draw()
		love.graphics.setColor(255, 255, 255, self:getAlpha())
		love.graphics.circle("fill", self:getX(), self:getY(), 20)
	end

	testActor:setY(100)

	stage.addActor(testActor)

	testAction = stage.Action:new()
	testAction.tween = stage.Tween:new(stage.Ease.inOutSine, 0, 255, 5)

	function testAction:act(dt, actor)
		actor:setX(actor:getX()+75*dt)
		actor:setAlpha(self.tween:update(dt))
	end

	testActor:addAction(testAction)

	testButton = stage.ui.SimpleButton:new()
	testButton:setX(100)
	testButton:setY(300)
	testButton:setSize(50, 20)

	stage.addActor(testButton)
end

function love.update(dt)
	stage.act(dt)
end

function love.draw()
	stage.draw()
	love.graphics.circle("fill", testActor:getX(), 500-testActor:getAlpha()/2, 2)
end

-- dont mind me...
function roundRect(x, y, w, h, r)
	if r == 0 then
		love.graphics.rectangle("fill", x, y, w, h)
	else
		love.graphics.polygon("line",
							      x, y+r,
							    r+x, y  ,
							  w+x-r, y  ,
							  w+x  , y+r,
							  w+x  , y+h-r,
							  w+x-r, y+h,
							    x+r, y+h,
							    x  , y+h-r)
		love.graphics.arc("line", x+r, y+r, r, -math.pi, -math.pi/2)
		love.graphics.arc("line", w+x-r, y+r, r, -math.pi/2, 0)
		love.graphics.arc("line", x+r, h+y-r, r, math.pi/2, math.pi)
		love.graphics.arc("line", w+x-r, h+y-r, r, math.pi/2, 0)
	end
end