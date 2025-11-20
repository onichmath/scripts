#!/bin/bash
set -e
pip install --upgrade pip

pip uninstall -y vllm || true
pip uninstall -y vllm-nightly || true

pip install --no-cache-dir --force-reinstall \
    "vllm-nightly[all]" \
    --extra-index-url https://wheels.vllm.ai/nightly

echo "[INFO] Installed vLLM version:"
python - <<EOF
import vllm
print(">>> vLLM version:", vllm.__version__)
EOF
