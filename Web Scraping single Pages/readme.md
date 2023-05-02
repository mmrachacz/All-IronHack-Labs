![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Web Scraping Single Page (GNOD part 1)

#### Business goal:

- Check the `case_study_gnod.md` file.
- Make sure you've understood the big picture of your project:

  - the goal of the company (`Gnod`),
  - their current product (`Gnoosic`),
  - their strategy, and
  - how your project fits into this context.

  Re-read the business case and the e-mail from the CTO, take a look at the flowchart.

#### Instructions - Scraping popular songs

Your product will take a song as an input from the user and will output another song (the recommendation). In most cases, the recommended song will have to be similar to the inputted song, but the CTO thinks that if the song is on the top charts at the moment, the user will also enjoy a recommendation of another song that is popular at the moment.

You have to find data on the internet about currently popular songs. Popvortex maintains a weekly Top 100 of "hot" songs here: [http://www.popvortex.com/music/charts/top-100-songs.php](http://www.popvortex.com/music/charts/top-100-songs.php).

It's a good place to start! Scrape the current top 100 songs and their respective artists, and put the information into a pandas dataframe.

