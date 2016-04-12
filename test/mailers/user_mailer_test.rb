require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  def jobs_done_preview
    UserMailer.jobs_done(User.first)
  end
end
