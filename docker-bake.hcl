variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "ashleykza"
}

variable "APP" {
    default = "a1111"
}

variable "RELEASE" {
    default = "1.9.2"
}

variable "CU_VERSION" {
    default = "118"
}

variable "BASE_IMAGE_REPOSITORY" {
    default = "ashleykza/runpod-base"
}

variable "BASE_IMAGE_VERSION" {
    default = "1.0.2"
}

variable "CUDA_VERSION" {
    default = "11.8.0"
}

variable "TORCH_VERSION" {
    default = "2.1.2"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${REGISTRY}/${REGISTRY_USER}/${APP}:${RELEASE}"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_VERSION}-cuda${CUDA_VERSION}-torch${TORCH_VERSION}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "${TORCH_VERSION}+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.23.post1+cu${CU_VERSION}"
        WEBUI_VERSION = "v${RELEASE}"
        CONTROLNET_COMMIT = "59d5998823daabd73d6339b3d21c9cdda27b0286"
        CIVITAI_BROWSER_PLUS_VERSION = "v3.5.4"
        APP_MANAGER_VERSION = "1.0.2"
        CIVITAI_DOWNLOADER_VERSION = "2.1.0"
        VENV_PATH = "/workspace/venvs/stable-diffusion-webui"
    }
}
