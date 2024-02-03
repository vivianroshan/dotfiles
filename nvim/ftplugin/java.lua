local jdtls = require('jdtls')
local root_markers = {'.git', 'mvnw', 'gradlew'}
local root_dir_folder = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir_folder, ":p:h:t")
local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', home..'/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar',
    '-configuration', home..'/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data', workspace_folder,
  },
  root_dir = root_dir_folder,
  settings = {
    java = {
      configuration={
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/Users/roshan/Developer/uni/dmsi/project/zulu8.76.0.17-ca-jdk8.0.402-macosx_x64/",
          },
        },
      }
    },
  },
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
