###### dsci-310-group-04

# TITLE --to be added

**Contributors:** Annabelle Purnomo ([@annabelle-ep](https://github.com/annabelle-ep)), Ethan Pang ([@ethanielp](https://github.com/ethanielp))), Olivia Pang ([oliviacyp](https://github.com/oliviacyp))

## About
This project attempts to build a k-nearest neighbour classification model to predict music genres using various predictors:
`danceability`, `energy`, `key`, `loudness`, `mode`, `speechiness`, `acousticness`, `instrumentalness`, `liveness`, `valence`, `tempo`.

The data set used is from [rdatascience/tidytuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2020/2020-01-21) data. It uses [spotifyr](https://www.rcharlie.com/spotifyr/) to get audio track features from Spotify's Web API. It can be found specifically with this [URL](https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv), but also in our repository `data` folder.

## Getting started
To run the analyses you will need to clone this repository. 
1. Open the command line/terminal. Go to your computer searchbar and type in `Terminal`. Check out [GitLab's explanation](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html#choose-a-terminal) on choosing a command line/terminal based on your computer.
2. Make sure you have `Git` installed. Check out [GitLab's instructions](https://docs.gitlab.com/ee/topics/git/how_to_install_git/index.html).
3. On your computer, move to a folder where you will want the repository folder to appear. 
- To check what's in the folder you're in, type in `ls` in your command line/terminal.
- You can move directories by typing `cd <folder name>`. 
4. Clone this repository. 
- You can do this by going to this repository (dsci-310-group-04) section called "Code". 
- Look for the green button called "Code". Click it and it should give you a small pop-up. Copy the [HTTPS URL](https://github.com/annabelle-ep/dsci-310-group-04.git) for this repository. 
- In your command line/terminal type ``git clone <HTTPS URL>`` and replace <HTTPS URL> with the HTTPS URL you copied. 
- Press enter and after check it's there by typing `ls`. You should see a folder called `dsci-310-group-04`.
- Move into this folder with ``cd dsci-310-group-04``. 

## Usage
1. Install Docker. Make sure to follow the [installation steps](https://docs.docker.com/engine/install/).
2. Again, remember to make sure you're in the root directory of this repository on your local computer. If you type `pwd` you should see that you're inside `dsci-310-group-04`. 
3. Run the following command from the command line/terminal: 

  `docker run -p 8888:8888 --rm -v /$(pwd):/home/jovyan/work/project ethanielp/dsci310-project`
  
- To work on files in this container, copy the bottom of the output after running the line above and paste it into a browser (e.g., Chrome, Safari). <img width="573" alt="image" src="https://user-images.githubusercontent.com/87722418/219476602-b568e21d-9dcf-4377-a1c5-0146c8fe2451.png">

## Dependencies
- irkernel=1.1*
  
  R version=4.2.2 and R packages: 
- tidyverse=1.3*
- tidymodels=0.1*
- cowplot=1.1.1
- kknn=1.3.1
- RCurl=1.98
- repr

###### **License:** [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)
