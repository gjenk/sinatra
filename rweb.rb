require 'sinatra'
require 'socket'
require 'json'
require 'pp'

helpers do 
    def ask(option)    
        
        s = TCPSocket.new '192.168.1.100', 4028
        str = '{"command" : "'
        unless option.nil?
            str += "#{option}" + '"}'
        else
            str += 'summary"}'
        end
        s.puts str
        json = s.gets
        s.close
        json = JSON.parse(json.strip!)
        return JSON.pretty_generate(json)
    end
end

get '/' do
    erb :index
end

get '/index' do
    erb :index
end

get '/query' do
    erb :query
end

