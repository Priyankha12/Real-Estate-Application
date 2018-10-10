class RealtorMailer < ApplicationMailer
  default from: "postmaster@mg.realtordomain.com"
  def reply_email
    @message = params[:replies]
    mail(to:params[:hunter] , subject: 'Reply to inquiry', from: 'postmaster@mg.realtordomain.com' )
  end

end
