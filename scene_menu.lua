---------------------------------------------------------------------------------
-- Menu Scene
-- This scene is the main menu
---------------------------------------------------------------------------------
local globals = require( "globals" )
local sfx = require( "sfx" )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Clear previous scene
storyboard.removeAll()

-- local forward references should go here --
backgroundMusic = nil
backgroundMusicChannel = nil

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  -- local clickSound = audio.loadSound( "audio/click.mp3");
  
  local sceneTitle = display.newText( "Magic Chicken", 0, 0, globals.font.bold, 36 )
  sceneTitle.x = display.contentCenterX
  sceneTitle.y = display.contentCenterY - 20
  
  group:insert( sceneTitle )
  
  local visitChickenButton = display.newText( "Visit the Magic Chicken", 0, 0, globals.font.regular, 18 )
  visitChickenButton.x = display.contentCenterX
  visitChickenButton.y = display.contentCenterY + 80
  
  local function onTap( event )
    storyboard.gotoScene( "scene_chicken" )
    audio.play(sfx.clickSound)
    audio.stop( backgroundMusicChannel )
    backgroundMusicChannel = nil
  end
  visitChickenButton:addEventListener( "tap", onTap )
  
  group:insert( visitChickenButton )

end


-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  backgroundMusic = audio.loadStream("audio/menu_music.mp3") 
  backgroundMusicChannel = audio.play( backgroundMusic )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  audio.dispose(backgroundMusic)
  backgroundMusic = nil

end


-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view

end


-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view

end


-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
  
end


-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene

end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )

-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )

---------------------------------------------------------------------------------

return scene
