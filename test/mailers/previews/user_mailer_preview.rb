# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def jobs_done_preview
    UserMailer.jobs_done(User.first)
  end
end
