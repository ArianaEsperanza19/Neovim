-- Comment es un plugin que permite convertir en comentario mediante un atajo todo el texto.
local comment = require('Comment')

-- comment remap
comment.setup({
  toggler = {
    line = 'gc'
  }
})
