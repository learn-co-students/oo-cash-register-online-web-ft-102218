
class CashRegister

  attr_accessor :total,:discount, :item, :last_transaction_price, :last_transaction_item


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item = []
  end

  def add_item(title, price, quality = 1)
    @total = @total + (price * quality)
    @last_transaction_price = price
    @last_transaction_item = title

    if quality == 1
      @item << title
    else
      i = 0
      while i < quality
        @item << title
        i += 1
      end
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = @total * (1 - @discount * 0.01)
      return "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items
    @item
  end

  def void_last_transaction
    @total = @total - @last_transaction_price
    @item.delete(@last_transaction_item)
  end

end
