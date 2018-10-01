class RealtorMailer < ApplicationMailer

  def reply_email
    @message = params[:replies]
    mail(to:params[:hunter] , subject: 'Reply to inquiry', from: params[:realtor] )
  end

end
