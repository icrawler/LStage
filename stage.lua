LSTAGE_dir = "lstage/"

class = require "middleclass"

local stage = {}

stage.Ease = require (LSTAGE_dir .. "objects/ease")
stage.Tween = stage.Ease.Tween
stage.Actor = require (LSTAGE_dir .. "objects/actor")
stage.Action = require (LSTAGE_dir .. "objects/action")
stage.Group = require (LSTAGE_dir .. "objects/group")
stage.ui = {}
stage.ui.Button = require (LSTAGE_dir .. "objects/button")
stage.ui.SimpleButton = require (LSTAGE_dir .. "objects/SimpleButton")
stage.ui.skin = require (LSTAGE_dir .. "objects/skin")

stage.actors = {}

stage.pos = {x=0, y=0}
stage.scal = {x=1, y=1}
stage.rotation = 0

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

function stage.translate(dx, dy)
	stage.pos.x = stage.pos.x + (dx or -stage.pos.x)
	stage.pos.y = stage.pos.y + (dy or -stage.pos.y)
end

function stage.scale(sx, sy)
	stage.scal.x = sx or 1
	stage.scal.y = sy or 1
end

function stage.rotate(rad)
	stage.rotation = stage.rotation + rad
end

function stage.draw()
	love.graphics.push()
	love.graphics.scale(stage.scal.x, stage.scal.y)
	love.graphics.rotate(stage.rotation)
	love.graphics.translate(stage.pos.x, stage.pos.y)
	for _, v in ipairs(stage.actors) do
		love.graphics.setColor(255, 255, 255)
		v:draw()
	end
	love.graphics.pop()
	love.graphics.setColor(255, 255, 255)
end

return stage