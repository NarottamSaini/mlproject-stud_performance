From python:3.9-slim
#FROM python:3.7.13-slim-buster
#From python:3.7-alphine
COPY . /usr/app/
EXPOSE 5000
WORKDIR /usr/app/
#RUN apt-get update -y && apt-get upgrade -y && apt-get install --no-install-recommends
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc && \
    python setup.py install && \
    apt-get remove -y gcc && apt-get -y autoremove && pip install -r requirements.txt
#RUN pip install -r requirements.txt
CMD python app.py