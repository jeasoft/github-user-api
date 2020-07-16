FROM python:3.7.8-alpine
RUN apk --update add bash vim gcc 
ENV PYTHONUNBUFFERED 1
WORKDIR /usr/local/app
COPY requirements.txt /usr/local/app/requirements.txt
RUN pip install -r requirements.txt
CMD ["uvicorn", "app:app", "--host","0.0.0.0"]