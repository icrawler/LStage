local Action = require("action")

local MoveAction = Action:new()

function MoveAction:act(dt, actor)
	actor:setX(actor:getX()+50*dt)
end