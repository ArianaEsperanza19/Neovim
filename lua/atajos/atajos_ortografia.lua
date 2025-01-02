local M = {}

M.show_spell_keymaps = function()
  local spell_keymaps = [[
    Shortcuts and Commands for Spell Check:

      Spell Check:
       - `z=`: See suggestions for misspelled words
       - `zg`: Add word to the dictionary
       - `zug`: Undo add word to the dictionary
       - `zw`: Mark word as misspelled
       - `zuw`: Undo mark word as misspelled

      Next or Previous misspelled word:
       - `]s`: Jump to the next misspelled word
       - `[s`: Jump to the previous misspelled word

       Search and Replace by Telescope & Abolish:
       Search and Replace in a selected file
       <leader>rr + <C-r>:
       Search and Remplace globally
       <leader>r + <C-r>:

       Search and Remplace in vanilla
       Replace all occurrences of 'old_word' with 'new_word'
       :%s/old_word/new_word/g
       Replace all occurrences (ignore case)
       :%s/old_word/new_word/gi
       Replace 'old_word' as a whole word
       :%s/\<old_word\>/new_word/g
       Replace 'old_word' as a whole word (ignore case)
       :%s/\<old_word\>/new_word/gi

      Commands to Change Spell Check Language:
       - `:SpellLangEn`: Change spell check language to English
       - `:SpellLangEs`: Change spell check language to Spanish
       - `:DisableSpell`: Disable spell check

      Useful Commands:
       - `:set spell`: Enable spell check
       - `:set nospell`: Disable spell check
  ]]

  vim.api.nvim_echo({{spell_keymaps, "Normal"}}, true, {})
end

return M

