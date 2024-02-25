# clippy.nvim

*Project status: Work in progress*

Dead simple Neovim plugin that let's you manage your clipboard.
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

> However, note that this plugin is still in an experimental phase, so you **must** call ``setup()`` to utilize its features.

## Features
By default, pressing ``<C-e>`` will toggle Clippy's floating window, utilizing the command ``require('clippy.ui'):toggle_menu()``. 

In there you can add whatever text you'd like to keep handy, as Clippy saves all of it's contents (automatically, upon closing) to ``~/.cache/nvim/clippy.log``.

Currently, very few things are implemented, but I am actively working on implementing yank autocommands.

Once enabled, this feature will automatically populate the ``Clippy`` with whatever you yank. As of right now, only manual additions are supported.

Come to think of it, ``Clippy`` also doubles as a basic note-taking plugin.

## License
This project is licensed under the MIT License. Refer to the [LICENSE](./LICENSE) file for more details.
