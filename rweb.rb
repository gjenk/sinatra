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
        return json.strip!
    end

    def push(host, data)
        
        path = "/users/1/workers/1"
        host = "https://miningmonitor.herokuapp.com"

        puts "sending data to #{host}#{path}"

        return RestClient.put "#{host}#{path}", data, {:content_type => :json} 
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

