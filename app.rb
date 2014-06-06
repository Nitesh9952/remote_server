require 'sinatra'
require 'sinatra/json'
require "sinatra/reloader" if development?

get '/processes' do
  cmd = if params[:p_id]
          "ps -eu -p #{params[:p_id]}"
        elsif params[:sort_by] == "cpu"
          "ps -eu --sort=-%cpu"
        elsif params[:sort_by] == "ram"
          "ps -eu --sort=-%mem"
        else
          "ps -eu"
        end

  system("#{cmd} > result.out")
  header, processes = read_file "result.out"
  json :header => header, :body => processes
end

def read_file file_name
  lines = File.readlines(file_name)
  body = []
  header = lines.shift.split(' ')
  lines.each do |line|
    body << line.strip.split(' ')
  end
  [header, body]
end
