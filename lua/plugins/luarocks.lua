return {
  "camspiers/luarocks",
  dependencies = {
    "rcarriga/nvim-notify", -- Optional dependency
  },
  opts = {
    rocks = {
        hererocks = true
    } -- Specify LuaRocks packages to install
  }
}
