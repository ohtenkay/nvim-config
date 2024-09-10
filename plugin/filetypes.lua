-- Hyprlang
vim.filetype.add {
  pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
}

vim.filetype.add {
  extension = {
    puml = 'plantuml',
    pu = 'plantuml',
    uml = 'plantuml',
    iuml = 'plantuml',
    plantuml = 'plantuml',
  },
}
