FROM python:3.11-slim

# OSパッケージのインストール（libpqとビルド用）
RUN apt-get update && apt-get install -y \
    libpq-dev gcc build-essential

# 作業ディレクトリ
WORKDIR /app

# Pythonパッケージのインストール
RUN pip install --upgrade pip

# awslabs.postgres-mcp-server と psycopg 関連をインストール
RUN pip install \
    psycopg \
    psycopg_pool \
    awslabs.postgres-mcp-server

# メイン実行コマンド（明示的にserverモジュールを起動）
ENTRYPOINT ["python", "-u", "-m", "awslabs.postgres_mcp_server.server"]