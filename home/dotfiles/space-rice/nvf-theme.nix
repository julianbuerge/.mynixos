{pkgs, ...}: let
  coal = pkgs.vimUtils.buildVimPlugin {
    pname = "coal.nvim";
    version = "1"; # arbitrary tag
    src = pkgs.fetchFromGitHub {
      owner = "cranberry-clockworks";
      repo = "coal.nvim";
      rev = "2a1aaad"; #commit name
      sha256 = "sha256-Mcdf0sx0hBDdTimwWJiLU6lMcqPOmODuCCelhwwAgso=";
    };
  };
in {
  #import the base configuration that is shared between all rices
  imports = [
    ../shared/neovim-nvf/nvf-base.nix
  ];

  #here we configure only the looks
  programs.nvf = {
    enable = true;

    settings.vim = {
      extraPlugins = {
        coal = {
          package = coal;
          setup = ''
            vim.cmd.colorscheme("coal")
            ${builtins.readFile ./nvf-theme-adjustments.lua}
          '';
        };
      };

        statusline.lualine = {
  enable = true;

  setupOpts.sections = {
    lualine_a = [
      {
        __unkeyed-1 = "mode";
        icons_enabled = true;
        separator = {
          left = " ";
          right = "";
        };
      }
      {
        __unkeyed-1 = "";
        draw_empty = true;
        separator = {
          left = "";
          right = "";
        };
      }
    ];

    lualine_z = [
      {
        __unkeyed-1 = "";
        draw_empty = true;
        separator = {
          left = "";
          right = "";
        };
      }
      {
        __unkeyed-1 = "progress";
        separator.left = "";
      }
      "location"
      {
        __unkeyed-1 = "fileformat";
        color.fg = "black";
        symbols = {
          unix = ""; # e712
          dos = "";  # e70f
          mac = "";  # e711
        };
      }
    ];
  };
};


      visuals.nvim-web-devicons.enable = true;
    };
  };
}
