require 'pry'

class CashRegister
  attr_accessor :total
  attr_reader :discount
  attr_writer :dollars

  def initialize (discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, amount = 1)
    @total += price * amount
    amount.times do
      @items << title
    end
  end 

  def items(item = nil, price = nil, amount = nil)
    if item && price && amount
      amount.times do
        @items << item
      end
      @items
    else
      @items
    end
  end

  def void_last_transaction
    return "No items have been added." if @items.empty?

    item = @items.pop
    item_price = @total / @items.length
    @total -= item_price
    "#{item}, has been removed. The new total is $#{@total}."
  end


  def apply_discount
    if discount > 0
      my_discount = @total * @discount/100
      @total = @total - my_discount
      "After the discount, the total comes to $#{@total}."
    else 
      "There is no discount to apply."
    end 
  end
end
