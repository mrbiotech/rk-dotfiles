# dotfiles

**Objective:** Use GitHub (with dotbot) to store, version and install my dot files across systems.

This repo requires only dotbot to function and [instructions for its installation can be found here](https://github.com/anishathalye/dotbot).

## Installing my dotfiles from GitHub

```bash
git clone https://github.com/mrbiotech/dotfiles.git
cd dotfiles
./install
```

## dotbot `install.conf.yaml` configuration

### `link` command

```yaml
- link:
    ~/.config/terminator:
        create: true
        path: config/terminator
    ~/.vim: vim
    ~/.vimrc:
        relink: true
        path: .vimrc
    ~/.zshrc:
        force: true
        path: zshrc
    ~/.config/:
        glob: true
        path: config/*
        relink: true
```

| `link` option | Explanation                                                  |
| ------------- | ------------------------------------------------------------ |
| `path`        | The target for this symlink, same as in shortcut syntax (default: null, automatic) |
| `create`      | When true, create parent directories to the link as needed (default:false) |
| `relink`      | Removes the old target if it's a symlink (default:false)     |
| `force`       | Force removes the old target, file or folder and forces a new link (default:false) |
| `relative`    | Use a relative path when creating the symlink (default: false, absolute links) |
| `glob`        | Treat a `*` character as a wildcard and perform link operations on all of those matches (default:false) |

### `shell` command

Specify actual shell commands to run in base directory specified when running the installer. Default base directory is `~/.dotfiles`.

```yaml
- shell:
    - mkdir -p ~/src
    -
      command: read var && echo Your variable is $var
      stdin: true
      stdout: true
      description: Reading and printing variable
```

### `clean` command

Specifies directories to check for dead symbolic links. Removes them automagically. Only dead ones get removed automatically unless the `force` option is set to `true`.

```yaml
- clean: ['~']

- clean:
    ~/.config:
        force: true
```

### `defaults` command

Generally overrides settings for any commands/options that have defaults of their own.

```yaml
- defaults:
    link:
        create: true
        relink: true
```





## History

**[2018-10-05]** Initial set of GitHub repo, dotbot and bash, vim, tmux, zprezto, gcloud, ranger and slate dotfiles.

#### [`init_dotfiles.sh` initialization script to set up dotbot](https://github.com/Vaelatern/init-dotfiles)

`init_dotfiles.sh` options and (defaults):

- `test` (No) - Test mode: shows what work would be done but doesn't commit anything
- `verbose-config` (No) - Creates a dotbot config file with every option explicitly set
- `dump-config` (No) - Sends configuration to `stout` in case you wanna redirect it into a file
- `preview` (Yes) - All commands printed to console before execution
- `colors` (No) - Colorize output
