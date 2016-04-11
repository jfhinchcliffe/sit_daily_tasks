class UserMailer < ApplicationMailer
  default from: 'notifcations@example.com'

  def jobs_done(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user, subject: 'All tasks done for #{Date.today.strftime("%A %d %B, %Y")}')
  end


end
