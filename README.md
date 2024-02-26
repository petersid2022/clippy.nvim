# clippy.nvim

Clippy.nvim is a Neovim plugin that let's you manage your clipboard.
Written in Lua.

## Installation
Using [lazy](https://github.com/folke/lazy.nvim):
```
{
    "petersid2022/clippy.nvim/",
    config = function ()
        require('clippy').setup({})
    end
}
```

> **Note:** 
> 
> This plugin is still early in development, so you **have to** call ``setup()`` to use it.

## Features
* By default, pressing ``<C-e>`` will toggle Clippy's floating window (which is mapped to ``require('clippy.ui'):toggle_menu()``)
 
* In there you can add (or yank) whatever text you'd like to keep (or don't want to lose by overwriting [Neovim's selection registers](https://neovim.io/doc/user/change.html#registers) for example), as Clippy saves all of it's contents (automatically, upon closing) to ``~/.cache/nvim/clippy.log``.
 
* Come to think of it, ``Clippy`` also doubles as a very basic note-taking plugin.

## License
This project is licensed under the MIT License. Refer to the [LICENSE](./LICENSE) file for more details.
