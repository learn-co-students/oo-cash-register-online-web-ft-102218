
#build a cash register class
#initia

class CashRegister

  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, amount, quantity=1)
    self.total += amount * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = amount * quantity
  end

  def apply_discount
    if @discount
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
       "After the discount, the total comes to $#{self.total}."
     else
       "There is no discount to apply."
     end
  end


  def void_last_transaction
    self.total = self.total - self.last_transaction
    #@total -+ @last_transaction -- Alternative from Anthony
  end

end
