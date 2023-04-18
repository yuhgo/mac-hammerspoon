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
remapKey({'right_ctrl'}, 'a', keyCode('left', {'cmd'}))
remapKey({'right_ctrl'}, 'f', keyCode('right', {'cmd'}))
remapKey({'right_ctrl', 'shift'}, 'a', keyCode('left', {'cmd', 'shift'}))
remapKey({'right_ctrl', 'shift'}, 'f', keyCode('right', {'cmd', 'shift'}))

-- Enter/Backspace/Delete
remapKey({'right_ctrl'}, 'n', keyCode('return'))
remapKey({'right_ctrl'}, 'b', keyCode('delete'))
remapKey({'right_ctrl'}, ';', keyCode('forwarddelete'))

-- Function
remapKey({'right_ctrl'}, '1', keyCode('f1'))
remapKey({'right_ctrl'}, '2', keyCode('f2'))
remapKey({'right_ctrl'}, '3', keyCode('f3'))
remapKey({'right_ctrl'}, '4', keyCode('f4'))
remapKey({'right_ctrl'}, '5', keyCode('f5'))
remapKey({'right_ctrl'}, '6', keyCode('f6'))
remapKey({'right_ctrl'}, '7', keyCode('f7'))
remapKey({'right_ctrl'}, '8', keyCode('f8'))
remapKey({'right_ctrl'}, '9', keyCode('f9'))
remapKey({'right_ctrl'}, '0', keyCode('f10'))
remapKey({'right_ctrl'}, '-', keyCode('f11'))
remapKey({'right_ctrl'}, '=', keyCode('f12'))
