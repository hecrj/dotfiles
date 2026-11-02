# Toggle the ninfer-nightly server (Qwen3.8-27B NVFP4, DFlash2, ctx 200000).
#
#   first press  -> start: ninfer-nightly --dflash2 200000, detached (setsid),
#                   log appended to ~/.cache/ninfer-nightly.log
#   second press -> stop:  kill the server (and its fish wrapper) if alive
#
# Bound to SUPER + N in hyprland (hyprland.conf / hyprland.lua).
# A mako toast is shown on both start and stop.
function ninfer-nightly-toggle --description 'toggle ninfer-nightly --dflash2 200000; toast via mako'
    # Matched against the full command line (pgrep -f):
    #   server  -> ~/projects/ninfer/build/rtx5090-release/apps/ninfer-serve ...
    #   wrapper -> fish -c ninfer-nightly --dflash2 200000
    # (the stable `ninfer` build lives elsewhere, so it is left untouched)
    set -l server_re  'rtx5090-release/apps/ninfer-serve'
    set -l wrapper_re 'fish -c ninfer-nightly --dflash2 200000'

    set -l running (pgrep -f $server_re; pgrep -f $wrapper_re)

    if test (count $running) -gt 0
        pkill -f $server_re  # the actual server
        pkill -f $wrapper_re # its fish wrapper (exits on its own once the server dies)
        notify-send -t 3000 'ninfer-nightly' 'stopped'
        return 0
    end

    # Start detached: own session, no terminal, logs appended
    mkdir -p ~/.cache
    setsid fish -c 'ninfer-nightly --dflash2 200000' >>~/.cache/ninfer-nightly.log 2>&1 &
    notify-send -t 3000 'ninfer-nightly' 'starting (dflash2, ctx 200000)'
end
