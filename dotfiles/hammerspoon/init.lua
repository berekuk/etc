hs.grid.setMargins({0, 0})

-- via https://www.lua.org/pil/11.5.html
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

modes = {
  focused = {
    apps = Set({ 'Activity Monitor', 'Firefox Developer Edition', 'Visual Studio Code', 'iTerm' }),
  },
  art = {
    apps = Set({ 'Activity Monitor', 'Zoom', 'Obsidian', 'Visual Studio Code' }),
  },
  unfocused = {},
}
mode = 'unfocused'

apps = {
  {'1', '1Password'},
  -- {'2', 'Anki'},
  -- {'w', 'Chrome'},
  {'3', 'Transmission'},
  {'4', 'iBooks'},
  {'7', 'Spotify'},
  {'9', 'System preferences'},
  {'0', 'Activity Monitor'},
  {'q', 'Code'},
  {'w', 'Firefox Developer Edition'},
  {'e', 'iTerm'},
  {'t', 'Telegram'},
  {'r', 'Obsidian'},
  {'i', 'Figma'},
  {'o', 'Poe'},
  {'p', 'Preview'},
  {'a', 'Actual'},
  {'s', 'Slack'},
  {'d', 'Discord'},
  {'f', 'Finder'},
  {'g', 'Godot'},
  {'h', 'Hammerspoon'},
  {'x', 'Zotero'},
  {'c', 'Calendar'},
  {'v', 'IINA'},
  {'n', 'Notion'},
  {'m', 'Mail'},
  {',', 'Messages'},
  {'z', 'zoom.us'},
  {'b', 'BetterTouchTool'},
}

launch = function(appname)
  print(mode, appname)
  local app = hs.application.get(appname)
  if modes[mode] and modes[mode].apps and not modes[mode].apps[appname] then
    print('forbidden')
    return
  end
  if app then
    app:activate() -- necessary case for Emacs
  else
    hs.application.launchOrFocus(appname)
  end
end

hyperBind = function(key, action)
  hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, key, action)
end

for i, app in ipairs(apps) do
  hyperBind(app[1], function() launch(app[2]); end)
end


pickMode = function()
  cb = function(picked)
    if picked then
      mode = picked.text
      print(mode)
    end
  end

  chooserModes = {}
  i = 1
  for key, mode in pairs(modes) do
    chooserModes[i] = {
      text = key
    }
    i = i + 1
  end

  hs.chooser.new(cb):choices(chooserModes):show()
end

hyperBind('return', hs.grid.maximizeWindow)
hyperBind('space', hs.grid.show)
-- hyperBind('=', hs.reload)
hyperBind('=', pickMode)
