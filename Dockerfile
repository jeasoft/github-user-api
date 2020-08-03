FROM python:3.8.4-alpine
RUN apk --update add bash vim
ENV PYTHONUNBUFFERED 1
COPY . /usr/local/app/
WORKDIR /usr/local/app
RUN pip install -r requirements.txt
CMD ["hypercorn", "/usr/local/app/app:app", "--bind","0.0.0.0"]