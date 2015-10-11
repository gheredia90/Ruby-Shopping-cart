class Item
 attr_reader :price
 def initialize(price)
    @price = price
 end
end

class Oranges < Item
  def initialize(price)
    super(price)
  end
end

class Bananas < Item
  def initialize(price)
    super(price)
  end
end

class Apples < Item
  def initialize(price)
    super(price)
  end
end

class Grapes < Item
  def initialize(price)
    super(price)
  end
end

class Watermelon < Item
  def initialize(price)
    super(price)
  end
end

class Cart
  def initialize(name)
  	@name = name
    @total_items = []
    @total_price = 0
  end

  def add_item(item)
  	@total_items.push(item)
  end
  
  def calculate_total
  	 suma = 0
  	 num_apples = 0

  	 #Recorremos el array de items
  	 for elements in @total_items
  	 	#De cada 2 manzanas, sólo añadimos una a la lista
        if elements.class == Apples
        	num_apples += 1        	
        end
        if (num_apples == 0) || ((num_apples % 2) != 0)

        	#Descuento del 10% en melones los fines de semana 
        	if elements.class == Watermelon
  	 		  require 'date'
              current_day = Time.now.strftime('%u')
              if current_day == 6 || current_day == 7
              	  suma += 0.9*elements.price              	  
              else
              	  suma += elements.price
              end	  
  	 	    else
            
  	 	      suma += elements.price    	 	      
  	 	    end	    
  	 	end
  	 end

  	 #Guardamos el total en la variable @total_price
  	 @total_price = suma
  	 
  	 
  	 #Descuento si hay más de 5 items en la lista
  	 if @total_items.length > 5
  	 	@total_price *= 0.95
     end

     #Descuento si el precio total es superior a 100 EUR
  	 if @total_price > 100
  	 	@total_price -= 10
     end
     #Descuento si el precio total es superior a 100 EUR

  	 puts "Your total today is #{@total_price} EUR."
  	 @total_price	
  end	

end


#Código de ejemplo para probarlo
oranges = Oranges.new(2)
bananas = Bananas.new(3)
grapes = Grapes.new(1)
watermelon = Watermelon.new(3)
apples = Apples.new(2)


my_cart = Cart.new("Primera tienda")

my_cart.add_item(oranges)
my_cart.add_item(bananas)
my_cart.add_item(apples)
my_cart.add_item(oranges)
my_cart.add_item(watermelon)
my_cart.add_item(grapes)
my_cart.add_item(apples)

my_cart.calculate_total

