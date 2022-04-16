class WindMailer < ApplicationMailer
  def new_wind_info
  @user = params[:user]

  mail(to: @user.email, subject: "Wind Review from today #{Date.today}")
end
end
