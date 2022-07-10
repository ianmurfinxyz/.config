--------------------------------------------------------------------------------
-- NEOVIM LUA CONFIGURATION ROOT
-- author: Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

-- set paths which controls where lua searches for packages in 'require'
-- calls. Allows us to use paths relative to the config root rather than
-- relative paths.
local cfg = '/home/merlin/.config/nvim/'
package.path = string.format(
	"?;?.lua;%s/?.lua;%s/lua/?.lua;%s/lua/merlin/?.lua;%s/lua/util/?.lua;",
	cfg, cfg, cfg, cfg
)

require("merlin.options")
require("merlin.mappings")
require("merlin.plugins")
require("merlin.theme")
require("merlin.completion")
require("merlin.lsp")
