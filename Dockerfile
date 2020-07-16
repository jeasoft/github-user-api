FROM python:3.8.4-alpine
RUN apk --update add bash vim
ENV PYTHONUNBUFFERED 1
WORKDIR /usr/local/app
COPY requirements.txt /usr/local/app/requirements.txt
RUN pip install -r requirements.txt
CMD ["hypercorn", "app:app", "--bind","0.0.0.0"]