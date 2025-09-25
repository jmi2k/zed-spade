use zed_extension_api::{self as zed, Command, LanguageServerId};

struct Spade;

impl Spade {
    #[allow(clippy::unused_self)]
    fn language_server_binary_path(
        &mut self,
        _: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<String> {
        worktree
            .which("spade-language-server")
            .ok_or_else(|| "spade-language-server is not installed. Install Rust toolchain and install lsp:\n\
                            cargo install --git https://gitlab.com/spade-lang/spade spade-language-server --tag v<spade-version>".into())
    }
}

impl zed::Extension for Spade {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<Command> {
        Ok(zed::Command {
            command: self.language_server_binary_path(language_server_id, worktree)?,
            args: vec![],
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(Spade);
