# Serve Qwen3.8-27B NVFP4 with ninfer-serve
#
#   ninfer [ctx_size] [--dflash2]
#
#   ctx_size   --max-context per request (default 200000)
#   --dflash2  speculative backend DFlash2 (draft tokens 7) instead of MTP (draft tokens 3)
function ninfer --description 'serve Qwen3.8-27B NVFP4; MTP by default, --dflash2 selects DFlash2'
    argparse -X 1 dflash2 -- $argv
    or return 1

    set -l ctx_size auto
    set -q argv[1]
    and set ctx_size $argv[1]

    set -l spec mtp
    set -l draft_tokens 3
    if set -ql _flag_dflash2
        set spec dflash2
        set draft_tokens 7
    end

    ~/.local/bin/ninfer-serve ~/.local/bin/qwen3_8_27b_nvfp4_v3.ninfer \
        --max-context $ctx_size \
        --kv-capacity auto \
        --kv-headroom-mib 512 \
        --max-concurrency 1 \
        --kv-dtype fp8 \
        --device-state-slots 2 \
        --spec $spec --draft-tokens $draft_tokens \
        --lm-head-draft \
        --preserve-thinking \
        --port 9931 \
        --default-max-tokens 32768
end
