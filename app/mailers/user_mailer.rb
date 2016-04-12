class UserMailer < ApplicationMailer
  default from: 'hinchy@gmail.com'

  def jobs_done(user)
    @user = user
    mail(to: @user, subject: 'All tasks done for #{Date.today.strftime("%A %d %B, %Y")}')
  end


end
