--------------------------------------------------------------------------------
-- NEOVIM LUA CONFIGURATION ROOT
-- author: Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local cfg = '/home/merlin/.config/nvim/'
package.path = string.format(
	"?;?.lua;%s/?.lua;%s/lua/?.lua;%s/lua/merlin/?.lua;%s/lua/util/?.lua;",
	cfg, cfg, cfg, cfg
)

require("merlin.options")
require("merlin.mappings")
