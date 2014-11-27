
function Editor.RenderTitle()
	-- Custom Drawing
	local tx, ty = 	Editor.window.w/2 - (Editor.fontTitle:getWidth(Engine.name) / 2) ,
					Editor.window.h/2 - (Editor.fontTitle:getHeight(Engine.name) / 2)
	love.graphics.setBackgroundColor(255, 255, 255)
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.setFont(Editor.fontTitle)
	love.graphics.print(Engine.namejp, tx, ty - Editor.fontDesc:getHeight("Game Engine"))

	local tx2, ty2 = 	Editor.window.w/2 - (Editor.fontDesc:getWidth("Game Engine") / 2) ,
						Editor.window.h/2 - (Editor.fontDesc:getHeight("Game Engine") / 2)
	--love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setFont(Editor.fontDesc)
	love.graphics.print("Game Engine", tx2, ty2 + Editor.fontTitle:getHeight(Engine.name)/2 - Editor.fontDesc:getHeight("Game Engine"))
end

function Editor.UpdateTitle(dt)

end