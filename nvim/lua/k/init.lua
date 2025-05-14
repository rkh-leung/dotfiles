-- Load core settings first (important for things like leader key)
require("k.core.options")
require("k.core.keymaps")
require("k.core.autocmds")
-- Load plugin manager and plugin configurations
-- You could potentially load other things here if needed
require("k.utils") -- If you have utility functions defined

require("k.package_manager")
