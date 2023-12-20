vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.tabstop = 4;
vim.opt.softtabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.expandtab = true;
vim.opt.autoindent = true;
vim.opt.smartindent = true;
vim.opt.swapfile = false;
vim.opt.backup = false;
vim.opt.incsearch = true;
vim.opt.signcolumn = "yes";

--fold
vim.opt.foldmethod = "expr";
vim.opt.foldexpr = "nvim_treesitter#foldexpr()";
vim.opt.foldenable = false;
vim.cmd.colorscheme("slate");

--vim.g.netrw_browse_split = 0
--vim.g.netrw_banner = 0

local target_path = vim.fn.expand('~/.vim/undodir')
if vim.fn.isdirectory(target_path) == 0 then
    vim.fn.mkdir(target_path, "p", 0700)
end
vim.opt.undodir = target_path
vim.opt.undofile = true

function PythonTraceback()
    vim.opt.errorformat = [[\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m]]
end

ColorColumn = ''
function ToggleColorColumn(col)
    col = col or ColorColumn
    if ColorColumn > '-1' then
        ColorColumn = '-1';
    else
        ColorColumn = '80';
    end
    vim.opt.colorcolumn = col;
    print(col);
end

ToggleColorColumn(ColorColumn);

--pwsh
if vim.loop.os_uname().sysname == "Windows_NTX" then
	vim.opt.undodir      = os.getenv("HOMEPATH") .. "/.vim/undodir"
	vim.opt.shell        = "pwsh";
	vim.opt.shellcmdflag =
	"-NoLogo -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering=[System.Management.Automation.OutputRendering]::PlainText;";
	vim.opt.shellredir   = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	vim.opt.shellpipe    = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
	vim.opt.shellquote   = "";
	vim.opt.shellxquote  = "";
end
