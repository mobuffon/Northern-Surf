require 'uri'
require 'net/http'
require 'json'

class GeoLocationJob < ApplicationJob
  queue_as :default
  def perform(location)

    uri = URI.parse("https://api.radar.io/v1/search/autocomplete?query=#{location}")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "prj_live_pk_8806bae1f6131e694500fddba8065b65e3ae59cf"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    obj = JSON.parse(response.body.force_encoding(Encoding::UTF_8))
    lat = obj["addresses"][0]["latitude"]
    long = obj["addresses"][0]["longitude"]
    return lat, long
  end
end
