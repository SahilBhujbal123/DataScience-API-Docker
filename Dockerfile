FROM rocker/r-plumber

# Copy your API file into the container
COPY . /app
WORKDIR /app

# Expose the port the API will run on
EXPOSE 8000

# Run the API file directly
CMD ["Rscript", "api_json.R"]
