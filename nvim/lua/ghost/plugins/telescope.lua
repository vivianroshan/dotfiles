local telescope = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  cmd = "Telescope",
  keys = {
    {
      "<leader>pf",
      function() require("telescope.builtin").find_files() end,
      mode = "n",
      desc = "find_files",
    },
    {
      "<leader>ph",
      function() require("telescope.builtin").find_files({ hidden = true, prompt_prefix = "🔎" }) end,
      mode = "n",
      desc = "find_files_hidden",
    },
    {
      "<C-p>",
      function() require("telescope.builtin").git_files() end,
      mode = "n",
      desc = "git_files",
    },
    {
      "<leader>pt",
      function() require("telescope.builtin").help_tags() end,
      mode = "n",
      desc = "help_tags",
    },
    {
      "<leader>ps",
      function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
      mode = "n",
      desc = "grep_string",
    },
    {
      "<leader>psW",
      function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") }) end,
      mode = "n",
      desc = "grep_string",
    },
    {
      "<leader>psw",
      function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end,
      mode = "n",
      desc = "grep_string",
    },
    {
      "<leader>pb",
      function() require("telescope.builtin").buffers() end,
      mode = "n",
      desc = "buffers",
    },
    {
      "<leader>pl",
      function() require("telescope.builtin").live_grep() end,
      mode = "n",
      desc = "live_grep",
    },
    {
      "<leader>pgc",
      function() require("telescope.builtin").git_commits() end,
      mode = "n",
      desc = "git_commits",
    },
    {
      "<leader>pgb",
      function() require("telescope.builtin").git_branches() end,
      mode = "n",
      desc = "git_branches",
    },
    {
      "<leader>pgs",
      function() require("telescope.builtin").git_status() end,
      mode = "n",
      desc = "git_status",
    },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
      },
    },
  },
}

return telescope
