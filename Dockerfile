FROM python:3.10.4-slim
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 PYTHONUNBUFFERED=1

RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends \
        g++ \
        default-libmysqlclient-dev \
        wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /code/
