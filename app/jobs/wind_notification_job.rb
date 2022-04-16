class WindNotificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    if !user.uspots.empty? && (!user.uspots.map { |uspot| uspot.spot.windy_days? }.include? false)
      WindMailer.with(user: user).new_wind_info.deliver_now
    end
  end
end
