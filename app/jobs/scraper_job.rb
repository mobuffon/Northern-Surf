# require "byebug"
# class ScraperJob < ApplicationJob
#   queue_as :default

#   def perform
    require 'http'
    require 'json'
    require "open-uri"
    require "nokogiri"


    html_content = open('https://www.windfinder.com/forecast/dahme').read
    doc = Nokogiri::HTML(html_content)
    windspeed = doc.search('.speed').text.gsub(/\s+/, "")
    max_windspeed = doc.search('.data-gusts').text.gsub(/\s+/, "")
    wind_direction = doc.search('.units-wd-dir').text.gsub(/\s+/, ",").split(',').delete_if { |string| string == ""} # .split(/(\d{2}h(.){5,15}s)/) # .delete_if { |string| string == "" || string == "t" }

    windspeed = windspeed.to_s.split('k').map { |s| s.gsub(/[k,t,s,]/, '') }.delete_if { |s| s == ""}
    max_windspeed = max_windspeed.to_s.split('k').map { |s| s.gsub(/[k,t,s,m,a,x]/, '') }.delete_if { |s| s == ""}
    wind_direction
    days = windspeed.zip(max_windspeed, wind_direction)
    # days = [["10 ", " 17 ", "SW"], ["12 ", " 19 ", "WSW"], ["12 ", " 20 ", "SW"], ["12 ", " 20 ", "SW"], ["13 ", " 19 ", "SW"], ["12 ", " 21 ", "SW"], ["14 ", " 24 ", "SW"], ["14 ", " 27 ", "SW"], ["16 ", " 30 ", "SW"], ["19 ", " 32 ", "SW"], ["19 ", " 32 ", "SSW"], ["18 ", " 32 ", "SW"], ["16 ", " 28 ", "SW"], ["11 ", " 21 ", "WSW"], ["12 ", " 24 ", "NW"], ["15 ", " 27 ", "W"], ["16 ", " 30 ", "W"], ["19 ", " 35 ", "W"], ["20 ", " 34 ", "W"], ["21 ", " 35 ", "W"], ["24 ", " 35 ", "WNW"], ["20 ", " 32 ", "NW"], ["19 ", " 30 ", "NW"], ["13 ", " 21 ", "NW"], ["10 ", " 15 ", "WNW"], ["10 ", " 15 ", "W"], ["8 ", " 10 ", "WSW"], ["10 ", " 14 ", "SW"], ["13 ", " 18 ", "SW"], ["11 ", " 20 ", "WSW"], ["12 ", " 23 ", "SW"], ["14 ", " 23 ", "SW"], ["14 ", " 23 ", "SW"], ["14 ", " 24 ", "SW"], ["14 ", " 23 ", "SW"], ["12 ", " 20 ", "SW"], ["10 ", " 16 ", "SW"], ["10 ", " 17 ", "SSW"], ["11 ", " 18 ", "S"], ["13 ", " 20 ", "S"], ["12 ", " 18 ", "S"], ["12 ", " 18 ", "SSW"], ["10 ", " 18 ", "SW"], ["12 ", " 17 ", "WSW"], ["12 ", " 19 ", "WSW"], ["10 ", " 19 ", "WSW"], ["13 ", " 24 ", "WSW"], ["13 ", " 24 ", "WSW"], ["15 ", " 27 ", "SW"], ["18 ", " 32 ", "SW"], ["20 ", " 33 ", "SW"], ["18 ", " 32 ", "SW"], ["20 ", " 34 ", "SW"], ["21 ", " 36 ", "SW"], ["20 ", " 34 ", "SW"], ["19 ", " 33 ", "SW"], ["19 ", " 33 ", "SW"], ["17 ", " 30 ", "SW"], ["17 ", " 30 ", "SW"], ["11 ", " 17 ", "W"], ["8 ", " 13 ", "WNW"], ["7 ", " 12 ", "WNW"], ["5 ", " 8 ", "NW"], ["5 ", " 5 ", "NW"], ["5 ", " 6 ", "NW"], ["6 ", " 8 ", "NW"], ["7 ", " 12 ", "NW"], ["7 ", " 9 ", "WNW"], ["6 ", " 8 ", "WNW"], ["5 ", " 5 ", "W"], ["6 ", " 7 ", "SW"], ["9 ", " 13 ", "SSW"], ["9 ", " 13 ", "SSW"], ["10 ", " 16 ", "SSW"], ["14 ", " 21 ", "SSW"], ["12 ", " 19 ", "SSW"], ["11 ", " 17 ", "SSW"], ["11 ", " 18 ", "S"], ["12 ", " 20 ", "SSW"], ["13 ", " 21 ", "SSW"]]

    @windhash = []
    big_windhash = [:day_1, :day_2, :day_3, :day_4, :day_5, :day_6, :day7, :day_8, :day_9, :day_10]
    def build_day(dayspan, thatday)
      keys = ['h02', 'h05', 'h08', 'h11', 'h14', 'h17', 'h20', 'h23']

      day = keys.zip(dayspan)
      @windhash << day

    end


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

    all_data = Hash[big_windhash.zip(@windhash)]
    all_data.transform_values do |data|
      data.map { |hour| hour.flatten! }
    end
    all_data
    wind_looks_like_this = {:day_1=>[["h01", "6 ", " 8 ", "NNW"],
                                    ["h04", "5 ", " 6 ", "NNE"],
                                    ["h07", "2 ", " 2 ", "ENE"],
                                    ["h10", "4 ", " 5 ", "S"],
                                    ["h13", "5 ", " 6 ", "SSE"],
                                    ["h16", "6 ", " 7 ", "SSE"],
                                    ["h19", "6 ", " 8 ", "SSE"],
                                    ["h22", "11 ", " 16 ", "S"]],
                            :day_2=>[["h01", "11 ", " 16 ", "S"]]
                            }
    p "--------------------------------------"
    p "--------------------------------------"
    @wanted_winddirecttion = ['NE', 'NNE', 'NNW', 'NW']
    def wind_evaluation(all_data)
      @windy_days = {}
      all_data = all_data.each do |day, data|
        data.each do |hour|
          p data
          h = hour[0].gsub('h', '').to_i
          min_wind = hour[1].to_i
          max_wind = hour[2].to_i
          wind_direction = hour[3]
          if @wanted_winddirecttion.include? wind_direction
            if min_wind >= 10 && h >= 5  && h <= 20
              @windy_days[day] = hour
            end
          end
        end
      end
    end

    wind_evaluation(all_data)
    p @windy_days
    # def what_day(num)
    #   case num
    #   when 1
    #     return "today"
    #   when 2
    #     return "tomorrow"
    #   when 3..10
    #     return "on the #{(Date.today + num).to_s}"
    #   end
    # end

    # def buildup_content
    #   if @windy_days.length == 1
    #     rc = HTTP.post("https://slack.com/api/chat.postMessage", params: {
    #             token: ENV['SLACK_API_TOKEN'],
    #             channel: '#allgemein',
    #             text: "Hey, Surfs up on #{what_day(@windy_days.flatten[3])} with #{@windy_days.flatten[0]} to #{@windy_days.flatten[1]} knots from #{@windy_days.flatten[2]}at #{@windy_days.flatten[4].gsub('h', '').to_i} o'clock",
    #             as_user: true
    #       })
    #     puts JSON.pretty_generate(JSON.parse(rc.body))
    #   elsif @windy_days.length.zero?
    #     rc = HTTP.post("https://slack.com/api/chat.postMessage", params: {
    #           token: ENV['SLACK_API_TOKEN'],
    #           channel: '#allgemein',
    #           text: "No surf this week bra ",
    #           as_user: true
    #       })
    #     puts JSON.pretty_generate(JSON.parse(rc.body))
    #   else
    #     @windy_days.each do |day|
    #       rc = HTTP.post("https://slack.com/api/chat.postMessage", params: {
    #         token: ENV['SLACK_API_TOKEN'],
    #         channel: '#allgemein',
    #         text: "Hey, Surfs up #{what_day(day[3])} with #{day[0]} to #{day[1]} knots from #{day[2]} at #{day[4].gsub('h', '').to_i} o'clock",
    #         as_user: true
    #       })
    #       puts JSON.pretty_generate(JSON.parse(rc.body))
    #     end
    #   end
    # end
    # buildup_content
#   end
# end
