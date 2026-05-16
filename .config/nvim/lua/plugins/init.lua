return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

   {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig")
      vim.lsp.enable({"pyright"})
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local config = {
        cmd = { "jdtls" },
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.completion = {completeopt = "menu,menuone,noselect"}
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          select = false,
          behavior = cmp.ConfirmBehavior.Replace,
        }),
         ["<C-Space>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end),
      })
      opts.experimental = {
        ghost_text = true,
      }
      return opts
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true, -- This hides all files starting with a dot
      },
    },
  },

  {
    "CRAG666/code_runner.nvim",
    event = "VeryLazy",  -- optional: lazy load
    config = function()
      require("code_runner").setup {
        before_run_filetype = function()
                vim.cmd("silent! w") -- Saves the file without showing the "written" message
        end,
        filetype = {
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          python = "python3 -u",
          c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
          cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
          sh = "bash",
          lua = "lua",
        },
        mode = "term",        -- use terminal mode (needed for interactive input)
        focus = true,         -- focus the terminal when running
        startinsert = true,   -- ✅ automatically enter insert mode
      }
    end,
  },
  {
    "lambdalisue/vim-suda",
    lazy = false,
    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "xml", "html", "javascriptreact", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,          -- Auto close tags
          enable_rename = true,         -- Auto rename pair of tags
          enable_close_on_slash = true, -- Auto close when writing </
        },
      })
    end,
  },
  
}
