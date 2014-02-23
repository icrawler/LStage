function love.load()
	stage = require("stage")

	testActor = stage.actor:new()
	
	function testActor:draw()
		love.graphics.setColor(255, 255, 255)
		love.graphics.circle("fill", 20, 20, 20)
	end

	stage.addActor(testActor)
end

function love.update(dt)
	stage.act(dt)
end

function love.draw()
	stage.draw()
end