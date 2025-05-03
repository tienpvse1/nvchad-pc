local M = {}

M.config = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "prettier",
    "tailwindcss-language-server",
    "svelte-language-server",
    "json-lsp",
    "js-debug-adapter",
    "graphql-language-service-cli",
    "emmet-language-server",

    -- golang
    -- "gopls",
    -- "gotests",
    -- "goimports",
    -- "gomodifytags",
  },
}

return M
