FROM jupyter/r-notebook

RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "remotes::install_version('cowplot', version = '1.1.1', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('kknn', version = '1.3.1', repos= 'https://cloud.r-project.org')"