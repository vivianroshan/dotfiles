vim.cmd("source ~/.vimrc")

function ColorScheme(clr)
  local color = clr or "github_dark_default"
  vim.cmd.colorscheme(color)
end

function ToggleBackground()
  vim.cmd.colorscheme(vim.g.colors_name)
  if Background == 0 then
    Background = 1
  else
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    Background = 0
  end
  print(Background)
end

function PythonTraceback()
  vim.opt.errorformat = [[\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m]]
end

vim.keymap.set("n", "<leader>b", function() ToggleBackground() end)
vim.keymap.set("n", "<leader>pt", function() PythonTraceback() end)

require("ghost.core.icons")
