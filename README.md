# Standalone Whisper Service

A minimal local Whisper API service using FastAPI + faster-whisper.

## 1) Setup

```bash
python -m venv .venv
. .venv/Scripts/activate  # Windows PowerShell: .\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
copy .env.example .env
```

## 2) Run

```bash
uvicorn app.main:app --host 0.0.0.0 --port 3221
```

The first startup downloads the model (`WHISPER_MODEL_SIZE`, default `small`).

## 3) Use

Health check:

```bash
curl http://localhost:3221/health
```

Transcribe:

```bash
curl -X POST "http://localhost:3221/transcribe" \
  -F "file=@sample.wav"
```

Translate to English:

```bash
curl -X POST "http://localhost:3221/transcribe?task=translate" \
  -F "file=@sample.mp3"
```

## 4) Docker

```bash
docker build -t whisper-service .
docker run --rm -p 3221:3221 whisper-service
```

## 5) Run with batch file

```bash
.\run_whisper_service.bat
```

## 6) Tray controller

```bash
.\run_whisper_tray.bat
```

The tray app monitors API health and can open health/logs.
