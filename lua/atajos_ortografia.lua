local M = {}

M.show_spell_keymaps = function()
  local spell_keymaps = [[
    Shortcuts and Commands for Spell Check:

    1. Spell Check:
       - `z=`: See suggestions for misspelled words
       - `zg`: Add word to the dictionary
       - `zug`: Undo add word to the dictionary
       - `zw`: Mark word as misspelled
       - `zuw`: Undo mark word as misspelled
    
    2. Commands to Change Spell Check Language:
       - `:SpellLangEn`: Change spell check language to English
       - `:SpellLangEs`: Change spell check language to Spanish
       - `:DisableSpell`: Disable spell check
    
    3. Useful Commands:
       - `:set spell`: Enable spell check
       - `:set nospell`: Disable spell check
       - `]s`: Jump to the next misspelled word
       - `[s`: Jump to the previous misspelled word
  ]]

  vim.api.nvim_echo({{spell_keymaps, "Normal"}}, true, {})
end

return M

