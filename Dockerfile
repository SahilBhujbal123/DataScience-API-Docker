# Base image with R + plumber
FROM rstudio/plumber

# Install any required R packages
RUN R -e "install.packages(c('plumber', 'stringr', 'tm', 'stringdist', 'jsonlite'), repos='https://cloud.r-project.org/')"

# Copy the API and model file into the container
COPY api_json.R /api/api_json.R
COPY APImodel_1.rds /api/APImodel_1.rds

# Set working directory
WORKDIR /api

# Expose port
EXPOSE 8000

# Run the API
CMD ["R", "-e", "pr <- plumber::plumb('api_json.R'); pr$run(host='0.0.0.0', port=8000)"]
