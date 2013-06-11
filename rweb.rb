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
        return JSON.parse(json.strip!)
    end
end

get '/' do
    erb :index
end

get '/index' do
    erb :index
end

get '/query' do
    erb :query, :locals => {:option  => params[nil]}
end

get '/query/:option' do
    out = ask (params[:option])
    "#{out}"
end

