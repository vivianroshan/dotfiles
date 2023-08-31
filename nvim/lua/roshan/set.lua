vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;
vim.opt.smartindent = true;
vim.opt.swapfile = false;
vim.opt.backup = false;
vim.opt.incsearch = true;

--fold
vim.opt.foldmethod = "expr";
vim.opt.foldexpr = "nvim_treesitter#foldexpr()";
vim.opt.foldenable = false;

vim.opt.undofile = true;
if vim.loop.os_uname().sysname == "Linux" then
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
elseif vim.loop.os_uname().sysname == "Windows_NTX" then
    vim.opt.undodir      = os.getenv("HOMEPATH") .. "/.vim/undodir"
    vim.opt.shell        = "pwsh";
    vim.opt.shellcmdflag =
    "-NoLogo -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering=[System.Management.Automation.OutputRendering]::PlainText;";
    vim.opt.shellredir   = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
    vim.opt.shellpipe    = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
    vim.opt.shellquote   = "";
    vim.opt.shellxquote  = "";
end
