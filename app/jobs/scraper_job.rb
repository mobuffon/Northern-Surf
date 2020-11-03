require 'http'
require 'json'
require 'open-uri'
require 'nokogiri'

class ScraperJob < ApplicationJob
  queue_as :default

  def perform(spot)
    @spot = spot
    @windhash = []
    @big_windhash = (0..9).to_a

    days = wind_info(@spot.url)

    build_days(days)

    all_data = Hash[@big_windhash.zip(@windhash)]
    all_data.transform_values do |data|
      data.map(&:flatten!)
    end

    all_data = all_data.transform_keys do |k|
      (Date.today + k).strftime("%A %d %b")
    end


    all_data = windy_days(all_data)

    @spot.update(windy_days: all_data.to_json)
  end

  def wind_info(spot_url)
    html_content = open(spot_url).read
    doc = Nokogiri::HTML(html_content)
    windspeed = doc.search('.speed').text.gsub(/\s+/, "")
    max_windspeed = doc.search('.data-gusts').text.gsub(/\s+/, "")
    wind_direction = doc.search('.units-wd-dir').text.gsub(/\s+/, ",").split(',').delete_if { |string| string == '' } # .split(/(\d{2}h(.){5,15}s)/) # .delete_if { |string| string == "" || string == "t" }

    windspeed = windspeed.to_s.split('k').map { |s| s.gsub(/[k,t,s,]/, '') }.delete_if { |s| s == '' }
    max_windspeed = max_windspeed.to_s.split('k').map { |s| s.gsub(/[k,t,s,m,a,x]/, '') }.delete_if { |s| s == '' }

    days = windspeed.zip(max_windspeed, wind_direction)
    return days
  end

  def build_days(days)
    build_day(days[0, 8], 1)
    build_day(days[7, 8], 2)
    build_day(days[15, 8], 3)
    build_day(days[23, 8], 4)
    build_day(days[31, 8], 5)
    build_day(days[39, 8], 6)
    build_day(days[47, 8], 7)
    build_day(days[55, 8], 8)
    build_day(days[63, 8], 9)
    build_day(days[71, 8], 10)
    build_day(days[79, 8], 11)
  end

  def build_day(dayspan, _)
    keys = ['h02', 'h05', 'h08', 'h11', 'h14', 'h17', 'h20', 'h23']

    day = keys.zip(dayspan)
    @windhash << day
  end

  def windy_days(all_data)
    all_data.select do |_, v|
      if v.find { |hour| hour[1].to_i > 15 }
        true
      else
        false
      end
    end
  end
end
