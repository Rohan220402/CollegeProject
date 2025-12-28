# 1. Use a lightweight Python image
FROM python:3.10-slim

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy requirement file first (better caching)
COPY requirements.txt .

# 4. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy rest of the project
COPY . .

# 6. Expose Streamlit default port
EXPOSE 8501

# 7. Run Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
