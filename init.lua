local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function()
     hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
     hs.timer.usleep(1000)
     hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

local function remapKey(modifiers, key, keyCode)
  hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function handleGlobalAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    -- hs.alert.show(name)
    if name ~= "iTerm" then
      enableAllHotkeys()
    else
      disableAllHotkeys()
    end
  end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

-- カーソル移動
remapKey({'right_ctrl'}, 'h', keyCode('left'))
remapKey({'right_ctrl'}, 'j', keyCode('down'))
remapKey({'right_ctrl'}, 'k', keyCode('up'))
remapKey({'right_ctrl'}, 'l', keyCode('right'))
remapKey({'right_ctrl', 'shift'}, 'h', keyCode('left', {'shift'}))
remapKey({'right_ctrl', 'shift'}, 'j', keyCode('down', {'shift'}))
remapKey({'right_ctrl', 'shift'}, 'k', keyCode('up', {'shift'}))
remapKey({'right_ctrl', 'shift'}, 'l', keyCode('right', {'shift'}))
remapKey({'right_ctrl', 'cmd'}, 'h', keyCode('left', {'cmd'}))
remapKey({'right_ctrl', 'cmd'}, 'j', keyCode('down', {'cmd'}))
remapKey({'right_ctrl', 'cmd'}, 'k', keyCode('up', {'cmd'}))
remapKey({'right_ctrl', 'cmd'}, 'l', keyCode('right', {'cmd'}))
remapKey({'right_ctrl', 'shift', 'cmd'}, 'h', keyCode('left', {'shift', 'cmd'}))
remapKey({'right_ctrl', 'shift', 'cmd'}, 'j', keyCode('down', {'shift', 'cmd'}))
remapKey({'right_ctrl', 'shift', 'cmd'}, 'k', keyCode('up', {'shift', 'cmd'}))
remapKey({'right_ctrl', 'shift', 'cmd'}, 'l', keyCode('right', {'shift', 'cmd'}))

-- Home/End
remapKey({'right_ctrl'}, 'a', keyCode('home'))
remapKey({'right_ctrl'}, 'f', keyCode('end'))
remapKey({'right_ctrl', 'shift'}, 'a', keyCode('home', {'shift'}))
remapKey({'right_ctrl', 'shift'}, 'f', keyCode('end', {'shift'}))

-- Enter/Backspace/Delete
remapKey({'right_ctrl'}, 'n', keyCode('return'))
remapKey({'right_ctrl'}, 'b', keyCode('delete'))
remapKey({'right_ctrl'}, ';', keyCode('forwarddelete'))

-- 記号など
-- remapKey({'right_ctrl'}, 'o', keyCode('-'))
-- remapKey({'right_ctrl', 'shift'}, 'o', keyCode('-', {'shift'}))

-- remapKey({'right_ctrl'}, 'p', keyCode('plus'))
-- remapKey({'right_ctrl', 'shift'}, 'p', keyCode('plus', {'shift'}))
