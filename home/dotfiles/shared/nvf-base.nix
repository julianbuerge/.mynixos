{ config, pkgs, ... }:

let

  #enable the language lang (string) with lsp support (nothing about formatting because some languages do not even have that option)
  enalang = lang: {
    name = lang;
    value = {
      enable = true;
      lsp.enable = true;
    };
  };
  #enable the language lang (string) with lsp and formatting support
  enalangform = lang: {
    name = lang;
    value = {
      enable = true;
      lsp.enable = true;
      format.enable = true;
    };
  };
  #enable the language lang (string) with lsp and explicitly no formatting support
  enalangnoform = lang: {
    name = lang;
    value = {
      enable = true;
      lsp.enable = true;
      format.enable = false;
    };
  };

in
{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        #Formatting Options
        lineNumberMode = "relative";

        options = {
          shiftwidth = 4;
          wrap = true;
          breakindent = true;
        };

        #Spell checking options
        spellcheck = {
          enable = true;
          languages = [
            "en_us"
            "de_ch"
            "es"
          ];
        };

        #Keybindings
        keymaps = [
          {
            key = "<leader>cd";
            mode = "n";
            silent = true;
            action = ":Ex<CR>";
          }
          {
            key = "<leader>q";
            mode = "n";
            silent = true;
            action = ":q<CR>";
          }
          {
            key = "<leader>w";
            mode = "n";
            silent = true;
            action = ":w<CR>";
          }
        ];

        #Plugins

        #search menu, with find file and live grep
        telescope = {
          enable = true;
        };

        #language support: warnings, errors, autocompletion
        lsp = {
          enable = true;
        };

        #autocompletion with lsp
        autocomplete.nvim-cmp = {
          enable = true;
        };

        #Calling the enable language functions defined at the beginning
        #for the desired languages
        languages =
          (builtins.listToAttrs [
            (enalangnoform "nix")
            (enalangnoform "bash")
            (enalang "clang")
            (enalang "julia")
            (enalangnoform "markdown")
            (enalangform "lua")
            (enalangform "python")
            (enalangform "rust")
          ])
          // {
            enableTreesitter = true;
          };

        #turn of treesitter indentation (we have autoindentation, combined they are messy)
        treesitter.indent.enable = false;
      };
    };
  };
}
