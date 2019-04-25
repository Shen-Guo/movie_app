     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'uri'

get '/' do

  erb :index
  
end

get '/movies' do
  search_result = HTTParty.get('http://www.omdbapi.com/?apikey=2f6435d9&s='+params['title'])
  @lists = search_result["Search"] #array contain hashes
  @title = params['title'] # movie keywod
  @file = File.new('search_history.txt','a+')
  @file.puts @title
  @file.close
  
  if @lists.length > 1
    erb :lists 
  else
    # binding.pry 
   redirect URI::encode("/movies/#{@lists[0]["imdbID"]}")
  end
  
end

get '/movies/:id' do 
  @id=params[:id]
  result = HTTParty.get("http://www.omdbapi.com/?apikey=2f6435d9&i=#{@id}")
  @year = result["Year"]
  @poster = result["Poster"]
  @title = result["Title"]

  erb :about
end
#Everytime a user does a search save the movie searched into a file called search_history.txt
#add an extra path '/history' that list out all search history
get '/history' do
  @file = File.new('search_history.txt','r')
  erb :history
  # binding.pry
end
