# commit.sh

Conventional Commits from the terminal.

![demo][demo]

## Motivation

- I've been using [VS Code Conventional Commits][vscode_conventional_commits] for sometime and I wanted to have that experience on my terminal as well.
- I wanted to get comfortable with shell scripting :smile:.

  **Note**:
  - This is not a 1:1 port of and this **does not** have all the functionalities found in [VS Code Conventional Commits][vscode_conventional_commits]. I've added the functionalities which I use in my workflow.

## Dependencies

|      |                           |
| ---- | ------------------------- |
| git  | for working with git 😄   |
| fzf  | for fuzzy-finding options |

## Install instructions

- Copy `commit.sh` file somewhere in your `$PATH`, and make it executable. (I keep the script in `~/.local/bin`)

    for example:

    ```sh
    wget https://raw.githubusercontent.com/krish-r/commit.sh/main/commit.sh -O ~/.local/bin/commit.sh

    # adds executable permission to user
    chmod u+x ~/.local/bin/commit.sh
    ```

## Uninstall instructions

- Simply remove the script from your path.

    for example:

    ```sh
    rm -i $(which commit.sh)
    ```

## Usage

```sh
commit.sh
```

## Credits

- [VS Code Conventional Commits][vscode_conventional_commits] - for the inspiration & description
- [gitmoji][gitmoji] - for the emoji guides & description

[demo]: https://user-images.githubusercontent.com/54745129/204369635-3f4fdf2e-3ff7-43ee-b074-e59babcefff3.gif
[vscode_conventional_commits]: https://github.com/vivaxy/vscode-conventional-commits
[gitmoji]: https://github.com/carloscuesta/gitmoji
