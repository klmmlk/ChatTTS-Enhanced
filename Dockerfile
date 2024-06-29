FROM python:3.10-alpine
LABEL authors="LINLINLIN"

RUN apk update && apk add git \
    && git clone https://github.com/klmmlk/ChatTTS-Enhanced.git

WORKDIR /ChatTTS-Enhanced

RUN pip install pytorch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 cpuonly -c pytorch \
    && pip install resemble-enhance \
    && pip install -r requirements.txt \
    && pip install WeTextProcessing


CMD ["python", "webui/webui.py"]
