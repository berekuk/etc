-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

singleapps = {
  {'q', 'OmniFocus'},
  {'w', 'Google Chrome'},
  {'e', 'iTerm'},
  {'r', 'Emacs'},
  {'t', 'Telegram'},
  {'y', 'YNAB 4'},
  {'i', 'iTunes'},
  {'p', 'Preview'},
  {'a', 'Adium'},
  {'s', 'Slack'},
  {'d', 'Dash'},
  {'f', 'Finder'},
  {'z', 'Adobe InDesign CC 2017'},
  {'x', 'Pixelmator'},
  {'c', 'Calendar'},
  {'m', 'Mail'},
  {'n', 'Notes'},
  {'v', 'VLC'},
  {'b', 'brainworkshop'},
  {'1', '1Password 6'},
  {'2', 'Anki'},
  {'5', 'Kindle'},
  {'0', 'Activity Monitor'},
  {'space', 'Safari'}
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
