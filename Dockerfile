FROM rocker/tidyverse:4.1.3

RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "remotes::install_version('cowplot', version = '1.1.1', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('kknn', version = '1.3.1', repos= 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('testthat', version = '3.1.6', repos= 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('RCurl', version = '1.98-1.10', repos= 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels', version = '1.0.0', repos= 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('repr', version = '1.1.6', repos= 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('here', version = '1.0.1', repos= 'https://cloud.r-project.org')"