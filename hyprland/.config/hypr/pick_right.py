#!/usr/bin/env python3
"""pick-right: move newly opened "pick" windows to the right-side split.

Watches Hyprland's socket2 event stream and dispatches `movewindow r`
when a window titled "pick" opens. For a tiled window this moves it to
its right-side layout neighbor (no-op if there is none); for a floating
window it snaps it to the right screen edge.

Started via `exec-once` in hyprland.conf. Retries until the session's
socket2 accepts connections (exec-once can fire before the socket is
ready), and exits on socket EOF (compositor shutdown).
"""

import os
import socket
import subprocess
import time
from glob import glob


def connect() -> socket.socket:
    d = os.environ.get("XDG_RUNTIME_DIR", f"/run/user/{os.getuid()}")
    while True:
        for path in glob(os.path.join(d, "hypr", "*", ".socket2.sock")):
            try:
                s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                s.connect(path)
                return s
            except OSError:
                continue
        time.sleep(1)


def main() -> None:
    with connect().makefile() as f:
        for line in f:
            # Events are `name>>param,param,...`; openwindow ends in the title.
            name, _, params = line.rstrip("\n").partition(">>")
            if name == "openwindow" and params.split(",")[-1] == "pick":
                subprocess.run(["hyprctl", "dispatch", "movewindow", "r"])


if __name__ == "__main__":
    main()
