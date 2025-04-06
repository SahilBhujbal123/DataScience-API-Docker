# Base image
FROM rstudio/plumber

# Install required R packages
RUN R -e "install.packages(c('plumber', 'stringr', 'tm', 'stringdist', 'jsonlite'))"

# Copy API files to the container
COPY api_json.R /app/api_json.R
COPY run_api.R /app/run_api.R
COPY APImodel_1.rds /app/APImodel_1.rds

# Set working directory
WORKDIR /app

# Expose the Plumber API port
EXPOSE 8000

# Run the API
CMD ["Rscript", "run_api.R"]
