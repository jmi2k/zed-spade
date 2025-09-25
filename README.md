# `zed-spade`

An extension for the [Spade](https://spade-lang.org) hardware description language: syntax highlighting, and LSP support.

## LSP Setup

The extension requires the Spade language server to be installed manually:

```bash
cargo install --git https://gitlab.com/spade-lang/spade spade-language-server --tag v<spade-version>
```

The language server binary (`spade-language-server`) must be available in `$PATH`.
