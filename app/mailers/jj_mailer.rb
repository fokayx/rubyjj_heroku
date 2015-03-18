class JjMailer < ApplicationMailer
  
  default from: 'kiddingche@gmail.com'

  def reserve_email(reserve)
    @reserve = reserve
    @url = 'http://rubyjj.test.com'
    mail(to: @reserve.email, subject: 'Thank You For Reserve.') 
  end
end
