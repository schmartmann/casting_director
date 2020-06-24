require 'sinatra'
require_relative 'casting_director'
require './helpers/param_helper'

if ENV['RACK-ENV'] == 'production'
    require 'byebug'
end

include ParamHelper

get '/' do
    if validate_params(params)
        @cast_list = CastingDirector.new(@actors, @characters).cast_parts
    end

    erb :index
end

post '/' do 
    if validate_params(params)
        @cast_list = CastingDirector.new(@actors, @characters).cast_parts
    else
        @message = 'Please make sure you have at least 1 actor & character'
    end

    redirect to("/?actors=#{params['actors']}&characters=#{params['characters']}")
end