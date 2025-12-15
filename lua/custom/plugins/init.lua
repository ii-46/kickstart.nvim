-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
      vim.lsp.enable 'jdtls'
    end,
  },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      auto_delete_empty_sessions = true,
      auto_restore_last_session = true,
      -- log_level = 'debug',
    },
  },
}
