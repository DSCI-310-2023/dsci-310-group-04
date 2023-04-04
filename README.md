###### Welcome to group-04's dsci-310 project!

# Classifying Music Genres Using Spotify Audio Features

**Contributors:** Annabelle Purnomo ([@annabelle-ep](https://github.com/annabelle-ep)), Ethan Pang ([@ethanielp](https://github.com/ethanielp)), Olivia Pang ([@oliviacyp](https://github.com/oliviacyp))

## About
This project attempts to build a k-nearest neighbour (KNN) classification model to predict song genres using various  Spotify's audio features as predictors:
`danceability`, `energy`, `key`, `loudness`, `mode`, `speechiness`, `acousticness`, `instrumentalness`, `liveness`, `valence`, `tempo`. 

Our KNN classification model is evaluated using ROC/AUC. We were able to create a model that produced an accuracy of 46.8% when predicting the genre of songs based on Spotify audio features in our testing data.

The data set used is from [rdatascience/tidytuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2020/2020-01-21) data. It uses [spotifyr](https://www.rcharlie.com/spotifyr/) to get audio track features from Spotify's Web API. It can be found specifically with this [URL](https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv), but also in our repository `data` folder.

## Getting started
To run the analyses you will need to clone this repository. 
1. Clone this repository. 
  - In your command line/terminal copy and paste
  ```
  git clone https://github.com/annabelle-ep/dsci-310-group-04.git
  ```
  - Press enter and after check it's there by typing `ls`. You should see a folder called `dsci-310-group-04`.
  - Move into this folder with ``cd dsci-310-group-04``. 

## Usage
1. Install Docker. Make sure to follow the [installation steps](https://docs.docker.com/engine/install/).
2. Again, remember to make sure you're in the root directory of this repository on your local computer. If you type `pwd` you should see that you're inside `dsci-310-group-04`. 
3. Run the following command from your computer's command line/terminal: 
```
docker run -p 8787:8787 --rm --platform linux/amd64 -e PASSWORD="apassword" -v /$(pwd):/home/rstudio/workspace ethanielp/dsci310-project:latest
```
  Alternatively you can also type 
```
make rstudio
```
  which will run the same command.

4. To work on files in this container, go to http://localhost:8787/ in your browser and type in the following
  - username: rstudio
  - password: apassword
  
5. Reproduce analysis with make. In the **Rstudio terminal**, type in the make command: 
  - `make all`

## Dependencies  
R version=4.2.2 and R packages: 
  - remotes
  - testthat=3.1.6
  - tidyverse=1.3*
  - tidymodels=1.0.0*
  - cowplot=1.1.1
  - kknn=1.3.1
  - RCurl=1.98
  - repr=1.1.6
  - here=1.0.1
  - bookdown=0.33
  - docopt=0.7.1

###### **License:** [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)
