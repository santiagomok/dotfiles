-- Load core settings: globals, options, keymaps, ...
require("core.globals")
require("core.options")
require("core.keymaps")
require("core.tmux")
require("core.cursor")

-- Load Plugins
require('plugins.theme')
require('plugins.mini')
require('plugins.lspconfig')
require('plugins.fileconfig')
require('plugins.treesitter')
require('plugins.perforce')
require('plugins.terminal')
