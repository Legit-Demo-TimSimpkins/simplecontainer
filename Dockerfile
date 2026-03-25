# Stage 1: Build
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Final Run (The scanner only sees this part)
FROM python:3.12-slim-bookworm
WORKDIR /app
# Copy only the installed packages from the builder
COPY --from=builder /root/.local /root/.local
COPY . .

# Update PATH to find the installed packages
ENV PATH=/root/.local/bin:$PATH
USER 1001
CMD ["python", "app.py"]
