# Flixster_iOS_film_app

A film app for checking out recent films and descriptions

Flixter is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).


## Flixster Part 2 📝

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS (TODO)
- [ ] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough
<img src="http://g.recordit.co/aJ0NXwKWgu.gif" width=250><br>
<img src="http://g.recordit.co/Ug77AaerrU.gif" width=250><br>

### Notes
Describe any challenges encountered while building the app.

---

## Flixster Part 1 📝

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie. 

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthrough

<img src="http://g.recordit.co/BG2ILYWK9N.gif" width=250><br>

### Notes
Describe any challenges encountered while building the app.
>> The main challenge so far is to get cocoapods setup correctly on Mac Catalina 10.15.7. I had Loaderror issues when setting up the pod by `pod setup`. The final solution that helped after seeing "cannot locate gemfile" is to do `bundle init` and `bundle install`. Afterwards, `sudo gem install -n /usr/local/bin cocoapods` and `pod setup` do the job.
