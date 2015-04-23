require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "email_meagan" do
    mail = OrderMailer.email_meagan
    assert_equal "Email meagan", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
