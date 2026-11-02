# Serve Qwen3.8-27B NVFP4 with ninfer-serve (nightly).
#
#   ninfer [ctx_size] [--dflash2]
#
#   ctx_size   --max-context per request (default 200000; native ceiling 262144)
#   --dflash2  speculative backend DFlash2 (draft tokens 7) instead of MTP (draft tokens 3)
function ninfer-nightly --description 'serve Qwen3.8-27B NVFP4; MTP by default, --dflash2 selects DFlash2'
    argparse -X 1 dflash2 -- $argv
    or return 1

    set -l ctx_size 200000
    set -q argv[1]
    and set ctx_size $argv[1]

    set -l spec mtp
    set -l draft_tokens 3
    if set -ql _flag_dflash2
        set spec dflash2
        set draft_tokens 7
    end

    # Product build from the rtx5090-release preset.
    ~/projects/ninfer/build/rtx5090-release/apps/ninfer-serve ~/projects/ninfer/models/qwen3_8_27b_nvfp4_v3.ninfer \
        --max-context $ctx_size \
        --context-capacity auto \
        --max-concurrency 1 \
        --kv-dtype fp8 \
        --spec $spec --draft-tokens $draft_tokens \
        --proposal-head optimized \
        --preserve-thinking \
        --port 9931 \
        --max-tokens 32768
end
