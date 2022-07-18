class CashRegister
  attr_reader :discount
  attr_accessor :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(title, price, quantity=1)
    i = quantity
    until i == 0 do 
      @items << title
      i -= 1
    end

    @prices << price * quantity
    @total += price * quantity
  end

  def apply_discount
    self.total = Integer(@total - (@total * (discount/100.0)))
    discount != 0 ? "After the discount, the total comes to $#{ @total }." : "There is no discount to apply."
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    self.total -= @prices.last
    @prices.pop
  end

end