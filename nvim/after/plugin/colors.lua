--require('catppuccin').setup({
--    disable_background = true
--})
function ColorScheme(color)
    color = color or 'catppuccin'
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    Background = 0
end

function ToggleBackground(color)
    color = color or 'catppuccin'
    vim.cmd.colorscheme(color)
    if Background == 0 then
        Background = 1
    else
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        Background = 0
    end
    print(Background)
end

ColorScheme()

vim.keymap.set("n", "<leader>c", function()
    ToggleBackground();
end)


require('lualine').setup()
