require 'sinatra'
require_relative 'casting_director'

get '/' do
    erb :index
end

post '/' do 
    if params["actors"].length != 0 && params["characters"].length != 0
        @actors = params["actors"].split(',').map {|name| name.strip}
        @characters = params["characters"].split(',').map {|name| name.strip}
        @cast_list = CastingDirector.new(@actors, @characters).cast_parts
        puts @cast_list
        erb :index
    else
        @message = 'Please make sure you have at least 1 actor & character'
        erb :index
    end
end