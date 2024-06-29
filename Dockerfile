FROM alpine:latest
LABEL authors="LINLINLIN"

RUN apk update && apk add git bash wget \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
    && chmod +x miniconda.sh && \
    ./miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh \
    && git clone https://github.com/klmmlk/ChatTTS-Enhanced.git
ENV PATH="/opt/conda/bin:${PATH}"

WORKDIR /ChatTTS-Enhanced

RUN conda create -n Dlab python=3.10 -y \
    && conda activate Dlab \
    && conda install pytorch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 cpuonly -c pytorch \
    && pip install resemble-enhance \
    && pip install -r requirements.txt \
    && pip install WeTextProcessing


CMD ["python", "webui/webui.py"]
