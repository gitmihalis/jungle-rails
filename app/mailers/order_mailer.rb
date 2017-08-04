class OrderMailer < ApplicationMailer

  def receipt(order)
    @order = order
    @url = 'http://www.example.org'
    mail(to: @order.email, subject: "Your receipt for Order##{@order.id}")
  end

end
