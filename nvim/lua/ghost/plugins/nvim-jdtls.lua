local nvim_jdtls = {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local function attach_jdtls()
      local jdtls = require("jdtls")
      local root_markers = { ".git", "mvnw", "gradlew" }
      local root_dir_folder = require("jdtls.setup").find_root(root_markers)
      local home = os.getenv("HOME")
      local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir_folder, ":p:h")
      local opts = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          home ..
          "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar",
          "-configuration",
          home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
          "-data",
          workspace_folder,
        },
        root_dir = root_dir_folder,
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-1.8",
                  path = home .. "/Developer/tools/zulu8.76.0.17-ca-jdk8.0.402-macosx_x64/zulu-8.jdk/Contents/Home",
                },
              },
              format = {
                settings = {
                  url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
                  profile = "GoogleStyle",
                },
              },
            },
          },
        },
        init_options = {
          bundles = {
            vim.fn.glob(
              home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/*.jar"
            ),
          },
        },
      }
      -- This starts a new client & server,
      -- or attaches to an existing client & server depending on the `root_dir`.
      --opts["on_attach"] = function()
      --require("jdtls").setup_dap()
      --require("jdtls.dap").setup_dap_main_class_configs()
      --end
      --jdtls.setup_dap({ hotcodereplace = "auto" })
      jdtls.start_or_attach(opts)
      --vim.lsp.codelens.refresh()
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost" }, {
      --filetypes = { "java" },
      pattern = { "*.java" },
      callback = function()
        attach_jdtls()
        --require("dap.ext.vscode").load_launchjs()
        --require("jdtls.dap").setup_dap_main_class_configs()
        --jdtls.dap.setup_dap_main_class_configs()
      end,
    })
    attach_jdtls()
  end,
}

--return nvim_jdtls
return { }
