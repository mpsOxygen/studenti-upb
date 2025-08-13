FROM python:3-alpine

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

# RUN useradd -m -u 1000 app
RUN adduser -u 1000 -D app
RUN chown -R app:app /app
RUN chmod 1777 /tmp
COPY . .

USER 1000
EXPOSE 8443

CMD [ "gunicorn", "-b", "0.0.0.0:8443", "app:application" ]

# "--certfile", "/app/certs/server.crt", "--keyfile", "/app/certs/server.key", 
