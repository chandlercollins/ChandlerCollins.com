HEROKU_USERNAME = "chanman379@gmail.com"
HEROKU_API_KEY  = "510ef02747b2b869fa6510396b999ca940f6bfcd"
HEROKU_APP      = "blooming-galaxy-1960"

task :cron do

  require "heroku"
  require "heroku/command"
  require "heroku/command/pgbackups"

  Heroku::Auth.credentials = [HEROKU_USERNAME, HEROKU_API_KEY]
  Heroku::Command.load
  Heroku::Command::Pgbackups.new([], 
    {:app => HEROKU_APP, :expire => true}).capture

end