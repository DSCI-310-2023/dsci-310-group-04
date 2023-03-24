# spotify songs data pipe

# builds the last of any dependencies
all:

04_EDA.R : tidy_data.csv
	Rscript Scripts/04_EDA.R

.Phony : rstudio
rstudio:
	docker run -p 8787:8787 --rm --platform linux/amd64 -v /$(pwd):/home/rstudio/workspace ethanielp/dsci310-project:test

.Phony : clean
clean:
	rm -rf Outputs
	mkdir Outputs
