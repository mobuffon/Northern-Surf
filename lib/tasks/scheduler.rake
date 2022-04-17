desc "tweets to twitter.com/blockwork_cc"
task update_twitter_feed: :environment do
  Spot.all.each do |spot|
    ScraperJob.perform_now(spot)
  end
  if (Date.today.cwday == 1) && (Time.now.hour == 15)
    User.all.each do |user|
      WindNotificationJob.perform_now(user)
    end
  end
end
