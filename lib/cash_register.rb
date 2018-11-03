class CashRegister
  attr_accessor :total, :last_transaction
  attr_reader :discount, :items

  def initialize(discount = nil)
    @total = 0.00
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times {
      @items << title
    }
    @last_transaction = quantity * price
  end
  
  def apply_discount
    if @discount
      @total -= @total * @discount / (100.to_f)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @last_transaction
  end
end