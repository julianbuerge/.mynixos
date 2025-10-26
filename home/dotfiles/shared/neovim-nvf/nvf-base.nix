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
  #fetch this plugin from github, will be installed in extraPlugins
  csscolors = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-highlight-colors";
    version = "1"; #arbitrary tag
    src = pkgs.fetchFromGitHub {
      owner = "brenoprata10";
      repo = "nvim-highlight-colors";
      rev = "e0c4a58"; 
      sha256 = "sha256-BIcOU2Gie90wujQFZ+aD3wYTRegSKw4CBxC95DRwo9I=";
    };
    doCheck = false;
  };
  #fetch this plugin from github, will be installed in extraPlugins
  symbols = pkgs.vimUtils.buildVimPlugin {
    pname = "telescope-symbols.nvim";
    version = "1"; #arbitrary tag
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-symbols.nvim";
      rev = "a6d0127"; 
      sha256 = "sha256-zYON9z3ELwjfqZ11LD6E7M+bymuBHxrSjYXhsCPEwR8=";
    };
  };


in
{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {

        #options and keybindings written in normal lua
        luaConfigRC = {
            options = (builtins.readFile ./options.lua);
            keybinds = (builtins.readFile ./keybinds.lua);
        };

        #Plugins

        #search menu, with find file and live grep
        telescope = {
          enable = true;
        };

        #language support: warnings, errors, autocompletion
        lsp = {
          enable = true;
          formatOnSave = true;
        };

        #autocompletion with lsp
        autocomplete.nvim-cmp = {
          enable = true;

          sources = {
            buffer = "[Buffer]";
            nvim-cmp = null;
            path = "[Path]";
          };

          sourcePlugins = [
            "cmp-buffer"
            "cmp-path"
            "cmp-nvim-lsp"
            "cmp-luasnip"
            "cmp-treesitter"
            "pathlib-nvim"
          ];
        };

        #Calling the enable language functions defined at the beginning
        #for the desired languages
        languages =
          (builtins.listToAttrs [
            (enalangform "nix")
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
        treesitter = {
            indent.enable = false;
            grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
                latex
            ];        
        };

        extraPlugins = {
            #colors colors in their color
            csscolors = {
                package = csscolors;
                setup = "require('nvim-highlight-colors').setup({})";
            };
            #allows for seeing all available symbols with :Telescope symbols
            symbols = {
                package = symbols;
            };
        };
      };
    };
  };
}
