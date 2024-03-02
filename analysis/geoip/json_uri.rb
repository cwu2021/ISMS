# https://stackoverflow.com/questions/22132623/ruby-iterate-over-parsed-json
require "net/http"
require "uri"
require "json"

#uri = URI.parse("http://www.reddit.com/user/brain_poop/comments/.json")
#uri = URI.parse("https://d7uri8nf7uskq.cloudfront.net/tools/list-cloudfront-ips")
uri = URI.parse("https://ip-ranges.amazonaws.com/ip-ranges.json")

response = Net::HTTP.get_response(uri)

data = JSON.parse(response.body)
# https://repost.aws/knowledge-center/cloudfront-502-errors
# Origin Certificate is expired, not trusted, or self-signed
#data['CLOUDFRONT_GLOBAL_IP_LIST'].each do |child|
#data['CLOUDFRONT_REGIONAL_EDGE_IP_LIST'].each do |child|
data['prefixes'].each do |child|
    #puts child
 if child['service']=="CLOUDFRONT_ORIGIN_FACING"
    puts child['ip_prefix']
 end
end
