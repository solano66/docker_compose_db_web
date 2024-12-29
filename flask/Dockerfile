FROM python:3.12.8
WORKDIR /app

# 將 flask 所需檔案複製，並安裝相關套件
COPY . /app/
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python3", "/app/app.py"]