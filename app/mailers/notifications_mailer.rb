class NotificationsMailer < ActionMailer::Base
  default :from => "convenientmailinfo@gmail.com"
  default :to => "support@convenientcalendar.com"

  def new_message(message)
    @message = message
    mail(:subject => "Convenient Article List Inquiry")
  end
end
