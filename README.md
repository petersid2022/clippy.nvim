# clippy.nvim

*Project status: Work in progress*

Dead simple Neovim plugin that let's you manage your clipboard.
Written in Lua.

## Installation
Using [lazy](https://github.com/folke/lazy.nvim)
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
Currently, very few things are implemented, but I'm working on getting yank autocommands working. 
Such feature will automatically add whatever you yank to the ``Clippy``. Right now only manual addition is supported (yet the spirit is still there)

## License
This project is licensed under the MIT License. Please see the [LICENSE](./LICENSE) file for more details.
