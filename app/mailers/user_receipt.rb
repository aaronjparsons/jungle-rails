class UserReceipt < ApplicationMailer
  def receipt_email(order)
    @order = order
    @line_items = LineItem.all.where(order_id: @order.id)
    mail(to: @order.email, subject: "Order # #{@order.id} Confirmation")
  end

end
