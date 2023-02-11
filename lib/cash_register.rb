class CashRegister
    
  def initialize(employee_discount = nil)
    @employee_discount = employee_discount
    @total = 0.0
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times { @items << title }
  end

  def apply_discount
    if @employee_discount
      @total -= (@total * @employee_discount / 100)
      "After the discount, the total comes to $#{@total.round(2)}."
    else
      "There is no discount to apply."
    end
  end

  def items(title = nil, price = nil, quantity = nil)
    if title && price && quantity
      @items.map { |item| [item, price, quantity] }
    else
      @items.dup
    end
  end

  def void_last_transaction
    @total = 0.0
    @items = []
    
  end
end
