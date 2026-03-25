# Use a specific, slim version of Python to keep the image small
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy your requirements file first (for better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Create a non-privileged user for better security posture
RUN useradd -m myuser
USER myuser

# The command to run your app
CMD ["python", "app.py"]
