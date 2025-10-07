return {
  "mrcjkb/rustaceanvim", -- Especifica el repositorio del plugin
  config = function()
    vim.g.rustaceanvim = function()
      -- Actualiza esta ruta según tu sistema
      local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb'
      local this_os = vim.uv.os_uname().sysname;

      -- La ruta es diferente en Windows
      if this_os:find "Windows" then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
      else
        -- La extensión de liblldb es .so para Linux y .dylib para MacOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      local cfg = require('rustaceanvim.config')
      return {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end
  end,
  lazy = false, -- O puedes configurarlo como true si deseas cargarlo bajo demanda
}
-- return {
--   {
--     'mrcjkb/rustaceanvim',
--     version = '^5', -- Recommended
--     lazy = false, -- This plugin is already lazy
--     ft = "rust",
--     config = function ()
--       local mason_registry = require('mason-registry')
--       local codelldb = mason_registry.get_package("codelldb")
--       local extension_path = codelldb:get_install_path() .. "/extension/"
--       local codelldb_path = extension_path .. "adapter/codelldb"
--       local liblldb_path = extension_path .. "lldb/lib/liblldb.so" -- For Linux
--       local cfg = require('rustaceanvim.config')
-- 
--       vim.g.rustaceanvim = {
--         dap = {
--           adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--         },
--       }
--     end
--   },
-- }

--  ["rust-analyzer"] = {
--    cargo = {
--      allFeatures = true,
--    },
--  },
