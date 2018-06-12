-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

singleapps = {
  {'1', '1Password 6'},
  {'2', 'Anki'},
  {'3', 'Transmission'},
  {'4', 'iBooks'},
  {'5', 'Kindle'},
  {'7', 'iTunes'},
  {'0', 'Activity Monitor'},
  {'9', 'System preferences'},
  {'q', 'FirefoxNightly'},
  {'w', 'Google Chrome'},
  {'e', 'iTerm'},
  {'r', 'Emacs'},
  {'t', 'Telegram'},
  {'y', 'YNAB 4'},
  {'p', 'Preview'},
  {'d', 'Dash'},
  {'s', 'Slack'},
  {'f', 'Finder'},
  {'x', 'Pixelmator'},
  {'c', 'Calendar'},
  {'v', 'VLC'},
  {'n', 'Notes'},
  {'m', 'Mail'},
  {',', 'Messages'},
-- Older and disabled:
  -- {'a', 'Adium'},
  -- {'b', 'brainworkshop'},
  -- {'z', 'Adobe InDesign CC 2017'},
  -- {'q', 'OmniFocus'},
}

launch = function(appname)
  hs.application.launchOrFocus(appname)
--  hs.alert.show("triggered")
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
--  hs.alert.show("hyper pressed")
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
--  hs.alert.show("hyper released")
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
