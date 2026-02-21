FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app (including pyproject.toml)
COPY . .

# Professional Touch: Run a lint check during build. 
# If there are syntax errors, the build will fail here.
RUN ruff check .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]