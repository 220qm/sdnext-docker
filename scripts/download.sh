#!/usr/bin/env bash
echo "Downloading SD 1.5 model"
cd /workspace/automatic/models/Stable-diffusion
wget https://huggingface.co/runwayml/Stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors

echo "Downloading SD 1.5 VAE"
cd /workspace/automatic/models/VAE
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors
