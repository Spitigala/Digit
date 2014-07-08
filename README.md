dig-it
======

You are the tastemaker. Up-vote/down-vote music.

- Original Github Repo: https://github.com/girb0t/diggit
- Heroku: http://dbc-digit.herokuapp.com/

##About this app:


This is a simple music voting app that uses the soundcloud API. Users can add new tracks, and anyone can upvote/downvote any track.

Team Members:

-Connor Harwood
-Sahan Pitigala
-Tuan Duong
-Pei Xiong Liu


How to run it:

1. Clone down the repo.
2. In the config folder, there is a file named dbsetup.yml. Create a new file within the same directory called database.yml, and then copy and paste the DB configuration from dbsetup.yml in to the new database.yml file.
3. Go in to the Config > Initializers folder and create a new file called secret_token.rb. In this file, write the following:

```ruby

Diggit::Application.config.secret_key_base = 'your-key'

```

4. In your terminal, run 'rake secret', copy the produced key and paste it in place of 'your-key'. Make sure your key is in quotes as a string.

5. Run the following commands in this exact order:

rake db:create:all
rake db:migrate
rake db:seed


6. After seeding, start the rails server ('rails s'), and navigate to localhost:3000 to use the app.


##Git workflow:


git checkout development
git checkout -b "your branch name" development
make changes
git push origin "your branch"
create a pull request to the development branch

Changes will be merged to master branch after being tested in development.

