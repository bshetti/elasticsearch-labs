# app/Dockerfile for langtrace build with chatbot rag app

FROM node:18-alpine AS build-step
WORKDIR /app
ENV PATH=/node_modules/.bin:$PATH
COPY frontend ./frontend
RUN rm -rf /app/frontend/node_modules
RUN cd frontend && yarn install
RUN cd frontend && REACT_APP_API_HOST=/api yarn build

FROM python:3.11-slim

WORKDIR /app
RUN mkdir -p ./frontend/build
COPY --from=build-step ./app/frontend/build ./frontend/build 
RUN mkdir ./api
RUN mkdir ./data

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*


COPY api ./api
COPY data ./data
COPY requirements.txt ./requirements.txt
RUN pip3 install --upgrade pip

RUN pip3 install --no-cache-dir -r ./requirements.txt
RUN pip3 install --no-cache-dir langtrace-python-sdk
RUN pip3 install --no-cache-dir opentelemetry-instrumentation-flask

ENV FLASK_ENV=production

EXPOSE 4000
WORKDIR /app/api
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4000" ]