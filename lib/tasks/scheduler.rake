desc "tweets to twitter.com/blockwork_cc"
task update_twitter_feed: :environment do
  Spot.all.each do |spot|
    ScraperJob.perform_now(spot)
  end
end
