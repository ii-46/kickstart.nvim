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
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    opts = {
      enabled = true,
      log_level = vim.log.levels.OFF,
      editor = {
        client = 'neovim',
        tooltip = 'The Superior Text Editor',
        icon = nil,
      },
      display = {
        theme = 'default',
        flavor = 'dark',
        view = 'full',
        swap_fields = false,
        swap_icons = false,
      },
      timestamp = {
        enabled = false,
        reset_on_idle = false,
        reset_on_change = false,
        shared = false,
      },
      idle = {
        enabled = true,
        timeout = 300000,
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = true,
        smart_idle = true,
        details = 'Idling',
        state = nil,
        tooltip = '💤',
        icon = nil,
      },
      text = {
        default = nil,
        workspace = function(opts)
          return 'In ' .. opts.workspace
        end,
        viewing = function(opts)
          return 'Viewing some file' -- .. opts.filename
        end,
        editing = function(opts)
          return 'Editing some file' -- .. opts.filename
        end,
        file_browser = function(opts)
          return 'Browsing files in ' .. opts.name
        end,
        plugin_manager = function(opts)
          return 'Managing plugins in ' .. opts.name
        end,
        lsp = function(opts)
          return 'Configuring LSP in ' .. opts.name
        end,
        docs = function(opts)
          return 'Reading ' .. opts.name
        end,
        vcs = function(opts)
          return 'Committing changes in ' .. opts.name
        end,
        notes = function(opts)
          return 'Taking notes in ' .. opts.name
        end,
        debug = function(opts)
          return 'Debugging in ' .. opts.name
        end,
        test = function(opts)
          return 'Testing in ' .. opts.name
        end,
        diagnostics = function(opts)
          return 'Fixing problems in ' .. opts.name
        end,
        games = function(opts)
          return 'Playing ' .. opts.name
        end,
        terminal = function(opts)
          return 'Running commands in ' .. opts.name
        end,
        dashboard = 'Home',
      },
      buttons = nil,
      -- buttons = {
      --   {
      --     label = 'View Repository',
      --     url = function(opts) return opts.repo_url end,
      --   },
      -- },
      assets = nil,
      variables = nil,
      hooks = {
        ready = nil,
        shutdown = nil,
        pre_activity = nil,
        post_activity = nil,
        idle_enter = nil,
        idle_leave = nil,
        workspace_change = nil,
        buf_enter = nil,
      },
      plugins = nil,
      advanced = {
        plugin = {
          autocmds = true,
          cursor_update = 'on_hold',
          match_in_mappings = true,
        },
        server = {
          update = 'fetch',
          pipe_path = nil,
          executable_path = nil,
          timeout = 300000,
        },
        discord = {
          pipe_paths = nil,
          reconnect = {
            enabled = false,
            interval = 5000,
            initial = true,
          },
        },
        workspace = {
          root_markers = {
            '.git',
            '.hg',
            '.svn',
          },
          limit_to_cwd = false,
        },
      },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      CustomOilBar = function()
        local path = vim.fn.expand '%'
        path = path:gsub('oil://', '')

        return '  ' .. vim.fn.fnamemodify(path, ':.')
      end

      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        win_options = {
          winbar = '%{v:lua.CustomOilBar()}',
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            local folder_skip = { 'dev-tools.locks', 'dune.lock', '_build' }
            return vim.tbl_contains(folder_skip, name)
          end,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open parent directory in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
}
