This is a small JSON API build in Sinatra.
This API can be used to get details running on the server.

Set Up:-

  #To install sintra
  gem install sinatra

  #To install 'Common Extensions'
  gem install sinatra-contrib


Start server on 3000 port:-

  ruby app.rb -p 3000

Command to check the processes:-

  #To see all the processes
  curl 127.0.0.1:3000/processes

  #To see a specific process
  curl 127.0.0.1:3000/processes?p_id=xxxx

  #To sort processes by ram
  curl 127.0.0.1:3000/processes?sort_by=ram

  #To sort processes by cpu
  curl 127.0.0.1:3000/processes?sort_by=cpu
