# Example_config

This can be used as an example custom config for NvChad, this branch is a minimal one. Do check the feature_full branch if you need all the ease in your config.

## Project structure

```sh
$ tree NvChad

NvChad
├── LICENSE
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── bootstrap.lua
    │   ├── default_config.lua
    │   ├── init.lua
    │   ├── mappings.lua
    │   └── utils.lua
    ├── custom <- *LINK HERE*
    └── plugins
        ├── configs
        │   ├── cmp.lua
        │   ├── lazy_nvim.lua
        │   ├── lspconfig.lua
        │   ├── mason.lua
        │   ├── nvimtree.lua
        │   ├── others.lua
        │   ├── telescope.lua
        │   └── treesitter.lua
        └── init.lua
```
