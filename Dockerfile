FROM python:3.11-slim

RUN pip install --no-cache-dir "mlflow-skinny[auth]" psycopg2-binary sqlalchemy alembic Flask Flask-CORS gunicorn

EXPOSE 5000

CMD mlflow server \
    --backend-store-uri $DATABASE_URL \
    --default-artifact-root $ARTIFACT_ROOT \
    --host 0.0.0.0 \
    --port 5000 \
    --serve-artifacts \
    --app-name basic-auth
