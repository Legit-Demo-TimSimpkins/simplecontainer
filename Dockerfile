# Stage 1: Build
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Final Run
FROM python:3.12-slim-bookworm
WORKDIR /app

# --- TEST SECRET FOR LEGIT SECURITY ---
# Adding a fake AWS Access Key to trigger a "Secret in Code" finding
ENV AWS_ACCESS_KEY_ID="AKIAIMNO789ABCDEF012"
ENV DATABASE_PASSWORD="super-secret-password-123"
# ---------------------------------------

# 2. Set an environment variable with a fake secret to test Secret Scanning
ENV DB_PASSWORD="SuperSecretPassword123!"
ENV AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"

# Copy only the installed packages from the builder
COPY --from=builder /root/.local /root/.local
COPY . .

# Update PATH to find the installed packages
ENV PATH=/root/.local/bin:$PATH
USER 1001
CMD ["python", "app.py"]
