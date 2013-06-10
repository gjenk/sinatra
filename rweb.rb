require 'sinatra'
require 'socket'
get '/' do
    erb :index
end

get '/query' do
    erb :query
end
