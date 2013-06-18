require 'socket'
require 'rest_client'
require 'json'

command = ARGV[0]

s = TCPSocket.new '192.168.1.100', 4028

json = '{"command":"'
if command.nil?
    json += 'summary"}'
else
    json += "#{command}" + '"}'
end

s.puts "#{json}"
output = s.gets
s.close

puts output.strip!

path = "/users/1/workers/1"
host = "https://miningmonitor.herokuapp.com"

puts "sending data to #{host}#{path}"

puts RestClient.put "#{host}#{path}", output, {:content_type => :json} 
