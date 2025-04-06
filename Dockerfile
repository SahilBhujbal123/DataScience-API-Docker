FROM rocker/r-plumber:4.2.2

COPY API_PART /app
WORKDIR /app

EXPOSE 8000

CMD ["Rscript", "api_json.R"]
