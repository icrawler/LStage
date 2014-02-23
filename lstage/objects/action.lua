local Action = class("LStage.Action")

function Action:init()
	self._disposed = false
end

function Action:act(dt, actor)

end

function Action:dispose()
	self._disposed = true
end

return Action