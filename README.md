# Dotfiles, vim and bash configs

These are my configs. They are personal, opinionated and not really optimized for reuse by other people.

On the other hand, they are easy-to-deploy and cross-platform, and maybe someone will benefit from reading or forking them.
Anyway, keeping them on github means that I can easily fetch them everywhere I want.

# How to install

Install on the localhost:

1. Fetch the repo: `cd ~ && git clone https://github.com/berekuk/etc.git`
2. Install dotfiles: `~/etc/script/install_dotfiles`

Distribute to the different host: `~/etc/script/distribute HOSTNAME`.

# How to configure or expand

You can add any localhost-specific configuration to the `bash/local` bash script. It's gitignored, btw.

OS-specific bash configuration should go into `bash/{linux,mac,freebsd,debian}` scripts.

If you need a new dotfile, add it to `dotfiles/` and re-run `script/install_dotfiles`. All dotfiles are symlinked.
