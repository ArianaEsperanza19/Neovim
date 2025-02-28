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
       - `<F6>`: Change to next language

      Next or Previous misspelled word:
       - `]z`: Jump to the next misspelled word
       - `[z`: Jump to the previous misspelled word

      Commands to Change Spell Check Language:
       - `:DisableSpell`: Disable spell check
       - `:SpellLangEn`: Change spell check language to English
       - `:SpellLangEs`: Change spell check language to Spanish
       - `:SpellLangEo`: Change spell check language to Esperanto

      Useful Commands:
       - `:set spell`: Enable spell check
       - `:set nospell`: Disable spell check

       Search and Remplace in vanilla
       Replace all occurrences of 'old_word' with 'new_word'
       :%s/old_word/new_word/g
       Replace all occurrences (ignore case)
       :%s/old_word/new_word/gi
       Replace 'old_word' as a whole word
       :%s/\<old_word\>/new_word/g
       Replace 'old_word' as a whole word (ignore case)
       :%s/\<old_word\>/new_word/gi
  ]]

	local Terminal = require("toggleterm.terminal").Terminal
	local keymap_term = Terminal:new({
		cmd = 'echo "' .. spell_keymaps .. '" | less',
		direction = "float",
		hidden = true,
	})
	keymap_term:toggle()
	-- vim.api.nvim_echo({{spell_keymaps, "Normal"}}, true, {})
end

return M
