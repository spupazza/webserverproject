class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def instructions
  end

  def products
  end

  def contact
  end
  
  def orderCompleted
 
   @order = Order.find(params[:id])
   @order.update_attribute(:status, "Paid with Paypal")
          
   end

end
