LSTAGE_dir = "lstage/"

require ("class")

local stage = {}

stage.actor = require (LSTAGE_dir .. "objects/actor")

stage.actors = {}

function stage.addActor(actor)
	table.insert(stage.actors, actor)
end

function stage.act(dt)
	-- update all actors
	for _, v in ipairs(stage.actors) do
		v:act(dt)
	end

	-- dispose actors
	for i=#stage.actors, 1, -1 do
		if stage.actors[i]._disposed then
			table.remove(stage.actors, i)
		end
	end
end

function stage.draw()
	for _, v in ipairs(stage.actors) do
		v:draw()
	end
end

return stage