# Bossman

## About

Bossman is a very simple menubar utility for sending things to the command line. It stays out of your way by sending everything to a specific tmux session which you can use however you see fit.

## Installation

If you have tmux installed at `/usr/local/bin/tmux` then just build Bossman and run. Tmux is required, but the path can be changed in preferences.

## Usage

Click the menubar item and enter a command. Commands are sent via `tmux send-keys` so commands will be queued and sent as they are finished. You are expected to nohup responsibly.

Included in the application bundle are two applescripts for attaching to the tmux session in either iTerm or Terminal. You can set the <kbd>Command</kbd> + <kbd>Enter</kbd> field to `osascript /path/to/Bossman.app/Contents/Resources/Attach in (Terminal | iTerm).scpt` so that command returning automatically launches you into the shell.

Fun use: run a curses program and then submit keys directly to it. It's not the expected use case so Enter will be sent each time you do it, but that could be changed.

<kbd>Alt</kbd> + Click the menubar item opens the **Preferences** window.

## Todo

- Autosize the command bar
- Show current process and/or progress spinner
- Add a button (?) to background the current process
- Add script or method to send notification on task complete
- Do a path check for tmux on launch
- Include standalone tmux?
- Better architecture, etc.

## License

Copyright © 2015, Ian Clark Smith ian@sumisu.jp

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
