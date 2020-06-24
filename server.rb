require 'sinatra'
require 'byebug' 
require_relative 'casting_director'
require './helpers/param_helper'

include ParamHelper

get '/' do
    validate_params(params)
    byebug
    erb :index
end

post '/' do 
    if params["actors"].length != 0 && params["characters"].length != 0
        @cast_list = CastingDirector.new(@actors, @characters).cast_parts
        puts @cast_list
        erb :index
    else
        @message = 'Please make sure you have at least 1 actor & character'
        erb :index
    end
end