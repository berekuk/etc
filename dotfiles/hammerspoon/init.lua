-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

singleapps = {
  {'1', '1Password 6'},
  {'2', 'Anki'},
  {'3', 'Transmission'},
  {'4', 'iBooks'},
  {'7', 'Music'},
  {'0', 'Activity Monitor'},
  {'9', 'System preferences'},
  {'w', 'Firefox Developer Edition'},
  {'q', 'Visual Studio Code'},
  {'e', 'iTerm'},
  {'r', 'Emacs'},
  {'t', 'Telegram'},
  {'p', 'Preview'},
  {'s', 'Slack'},
  {'f', 'Finder'},
  {'x', 'Zotero'},
  {'c', 'Calendar'},
  {'v', 'VLC'},
  {'n', 'Notion'},
  {'m', 'Mail'},
  {',', 'Messages'},
  {'z', 'zoom.us'},
-- Older and disabled:
  -- {'5', 'Kindle'},
  -- {'a', 'Adium'},
  -- {'a', 'RStudio'},
  -- {'b', 'brainworkshop'},
  -- {'d', 'Dash'},
  -- {'y', 'VK Messenger'},
  -- {'q', 'OmniFocus'},
}

launch = function(appname)
  -- delay = 3
  -- hs.alert.show("wait 3s")
  delay = 0
  hs.timer.doAfter(
    delay,
    function()
      local app = hs.application.get(appname)
      if app then
        app:activate() -- necessary case for Emacs
      else
        hs.application.launchOrFocus(appname)
      end
    end
  )
  k.triggered = true
end

hyperBind = function(key, action)
  k:bind({}, key, action)
end

for i, app in ipairs(singleapps) do
  hyperBind(app[1], function() launch(app[2]); end)
end

hyperBind('return', hs.grid.maximizeWindow)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
