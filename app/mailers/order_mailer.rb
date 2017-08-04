class OrderMailer < ApplicationMailer

  def receipt(order)
    @order = order
    mail(to: order.email, subject: "Your receipt for Order##{order.id}")
  end
  
end
