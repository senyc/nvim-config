{pkgs, ...}: {
  # Allow lsp client to distinguish helm manifests
  plugins.helm.enable = true;
  plugins.lsp = {
    enable = true;

    keymaps = {
      diagnostic = {
        "]d" = "goto_next";
        "[d" = "goto_prev";
        "<leader>dq" = "setqflist";
        "<leader>do" = "open_float";
      };
      lspBuf = {
        "K" = "hover";
        "gd" = "definition";
        "gD" = "declaration";
        "<leader>fs" = "workspace_symbol";
        "<leader>fi" = "implementation";
        "<leader>fr" = "rename";
        "<leader>fa" = "code_action";
        "<leader>fc" = "incoming_calls";
        "<leader>fo" = "outgoing_calls";
        "<leader>ft" = "type_definition";
        "<leader>fT" = "typehierarchy";
        "gr" = "references";
        "<leader>=" = "format";
      };
    };

    servers = {
      terraformls.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      gopls.enable = true;
      solargraph.enable = true;
      lua-ls = {
        enable = true;
        extraOptions = {
          settings = {
            Lua = {
              format = {
                enable = true;
              };
              diagnostics = {
                globals = ["vim" "spec"];
              };
              runtime = {
                version = "LuaJIT";
                special = {
                  spec = "require";
                };
              };
              telemetry = {
                enable = false;
              };
            };
          };
        };
      };
      nil-ls = {
        enable = true;
        extraOptions = {
          settings = {
            nil = {
              formatting = {
                command = ["alejandra"];
              };
              nix = {
                flake = {
                  autoArchive = true;
                  autoEvalInputs = false;
                };
              };
            };
          };
        };
      };
      pyright.enable = true;
      tailwindcss.enable = true;
      tsserver.enable = true;
      helm-ls = {
        enable = true;
        settings = {
          yamlls = {
            enabled = false;
          };
        };
      };
      # Turns into a wall of red w/ helm charts
      yamlls.enable = true;
    };
  };

  extraPackages = with pkgs; [
    alejandra
    nodePackages.prettier
  ];

  extraConfigLua = ''
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
    require 'lspconfig.ui.windows'.default_options.border = 'rounded'

    for type, icon in pairs({
      Error = '>>',
      Warn = '->',
      Hint = '>-',
      Info = '--'
    }) do
      local name = 'DiagnosticSign' .. type
      local mapping = { text = icon, texthl = name, numhl = "" }
      vim.fn.sign_define(name, mapping)
    end
  '';
}
