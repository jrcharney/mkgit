# mkgit

`mkgit` is a collection of Bash scripts designed to simplify GitHub repository creation, branch management, `.gitignore` and license setup, and visualizing repository history in the terminal.

The goal of this project is to make using Git more plain-English and less Nerd jargon.
Pushing, pulling, and commits are easy, but branching and moving back and forth in the commit can be clumsy for a lot of users. And then there are those time were you really screw up and you panic thinking you deleted everything.

With these scripts I hope to address some of those problems, especially if you take a break and forget how to use stuff later.

## Requirements

Before installing `mkgit`, ensure your system meets the following requirements:

- `git` for repository management
- `gh` GitHub CLI (recommended) for GitHub integration
- A terminal that supports UTF-8 characters, emojis, and 256+ colors (e.g., `kitty`, Windows Terminal for WSL2)
- NerdFont or other font that supports required glyphs
- Bash or Zsh as your shell.
- `tmux` terminal multiplexer (recommended) because you should be using it anyway.

---

## Installation

1. Clone the repository:

```bash
git clone https://www.github.com/jrcharney/mkgit.git ~/.mkgit
```

2. Add the scripts to your PATH:

```bash
export PATH="$PATH:$HOME/.mkgit/bin"
```

You can add this line to your `~/.bashrc` or `~/.zshrc` to make it permanent.

Better yet, add this to your `~/.bashrc` or `~/.zshrc` file so it doesn't add a duplicate.

```bash 
# Add ~/.mkgit/bin to PATH only if not already in PATH
[[ ":$PATH:" != *":$HOME/.mkgit/bin:"* ]] && export PATH="$PATH:$HOME/.mkgit/bin"
```

And then source your `~/.bashrc` or `~/.zshrc` file.

```bash
source ~/.bashrc    # for Bash

source ~/.zshrc     # for Zsh
```

---

## Setup

Before using `mkgit`, configure your Git workflow with:

```bash
~/.mkgit/gitconf
```

Features:

- Detects if `~/.gitconfig` exists, creates it if it doesn't exist, and updates it safely if it does, including making a back up.
- Offers optional GitHub CLI (`gh`) integration
- Saves Personal Access Token (PAT) securely in `~/.config/mkgit.conf`

---

## Main Scripts

| Script      | Description |
|------------|-------------|
| `mkgit`      | Create a new Git repository interactively. Options to initialize `README.md`, `LICENSE.txt`, and `.gitignore`. |
| `lsgit`      | List repositories and project info. Supports sorting, reverse order, last update, and file extensions. |
| `mklicense`  | Create a `LICENSE.txt` from GitHub templates. Optionally lists all available licenses. |
| `mkignore`   | Create a `.gitignore` from GitHub templates. Optionally lists editors, languages, and environment preferences. |
| `gitrail`    | Display Git commit history as a "subway map". Supports filtering by branch, author, file, or message. Detects terminal width. Options for detailed or compact view. |

### gitrail Options

```text
-b branch       Show only a specific branch
-a author       Filter commits by author
-f filename     Filter commits touching a file
-m message      Filter commits containing a string
-d              Detailed view (author, date, full commit message)
-c              Compact view (graph only, short commit)
-h, --help      Display help
```

---

## Branching Scripts

| Script | Description |
|--------|-------------|
| `pwb`                  | Print current branch, like how `pwd` works |
| `lsb [branch-name]`    | List branches or files in a branch, like how `ls` works |
| `cdb branch-name`      | Change branch, like how `cd` works |
| `mkb [new-branch] [based-on-branch]` | Create new branch either based on the current one or based on another branch |
| `rmb branch-name`      | Remove branch (cannot remove current branch) |
| `mvb [old-branch] [new-branch]` | Rename branch (cannot rename current branch) |
| `cpb [old-branch] [new-branch]` | Copy branch (does not switch) |
| `diffb [options] branch-a branch-b` | Compare branches (`-t`, `-d`, `-s`) with auto width detection and optional color |
| `mergeb branch-a branch-b` | Merge `branch-a` into `branch-b` |

---

## Help System

Use `githelp` for overview and section-specific help:

```bash
githelp             # Show all scripts and descriptions
githelp branching   # Show branching commands
githelp mkgit       # Show mkgit options
githelp lsgit       # Show lsgit options
githelp mklicense   # Show mklicense options
githelp mkignore    # Show mkignore options
githelp gitrail     # Show gitrail options
```

---

## Future features

- [ ] Moving forward and backwards in git commits.
- [ ] Fast Forward. (No more accidently running over previous commits)
- [ ] Rewind. Move backward.

---

## Notes

- **Emoji support:** Optional; scripts will detect if terminal supports Unicode emojis
- **Configuration files:**
  - `~/.gitconfig` – standard Git config, optionally updated by `gitconf`
  - `~/.config/mkgit.conf` – stores PAT and other mkgit-specific settings
- **Integration:** Complements `git` and `gh` workflows without overwriting existing commands

---

## License

This project itself is MIT licensed. You can include a license in your projects using `mklicense`.

Created by Jason Charney with help from ChatGPT.

