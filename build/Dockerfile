# Dockerfile apogee untuk demo postgres dan r-shiny
# Use an R base image
FROM rocker/r-ver:4

# Install system dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl3 \
    libpq-dev

# Install R packages yang diperlukan 
RUN R -e "install.packages(c('shiny', 'RPostgres', 'dotenv'), repos='https://cran.rstudio.com/')"

# Set working directory dalam container
WORKDIR /usr/src/app

# Expose port yang kita nak Shiny run
EXPOSE 8038

# Run shiny app kita
CMD ["R", "-e", "shiny::runApp('/usr/src/app')"]