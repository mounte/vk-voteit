# Build stage
FROM python:2

WORKDIR /app

RUN pip install setuptools==44
RUN pip install zc.buildout
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY app ./
COPY var ./var
RUN buildout -c buildout.cfg

RUN apt-get update
RUN apt-get install -y nginx
COPY ./etc/nginx.conf /etc/nginx/sites-available/default

COPY etc ./etc
COPY prod.sh .

CMD ["./prod.sh"]
