class OrderMailer < ActionMailer::Base
  default from: "orders@divmsmac.com"

  def email_meagan(order)
    @greeting = "You have a new order, Ms. Mmacaron"
    @order = order 

    mail to: "nikhammerellis@gmail.com", subject: "New Order - Ms. Mmacaron"
  end
end
