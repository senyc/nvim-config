{
  imports = [
    ./set.nix
    ./keymaps.nix

    ./highlight.nix
    ./diagnostic.nix

    ./autocommand.nix
    ./functions.nix
    ./filetype.nix

    ../plugins/catppuccin.nix
    ../plugins/lsp.nix
    ../plugins/undotree.nix
    ../plugins/toggleterm.nix
    ../plugins/grapple.nix
    ../plugins/illuminate.nix
    ../plugins/lualine.nix
    ../plugins/cmp.nix
    ../plugins/treesitter.nix
    ../plugins/telescope.nix
    ../plugins/gitsigns.nix
    ../plugins/comment.nix
    ../plugins/nvim-surround.nix
    ../plugins/devicons.nix
    ../plugins/gh-nvim.nix
  ];
}
