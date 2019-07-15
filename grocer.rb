
def consolidate_cart(cart)
  # code here
 new_cart = {}
 cart.each do |items_array|
   items_array.each do |item, attribute_hash|
     new_cart[item] ||= attribute_hash
     new_cart[item][:count] ? new_cart[item][:count] += 1 : new_cart[item][:count] = 1 
   end
 end
 new_cart
end


  
def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    coupon.each do |attribute, value|
      name = coupon[:item]
      if cart[name] && cart[name][:count] >= coupon[:num]
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] +=1 
        else
          cart["#{name} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], :clearance => cart[name][:clearance], :count => 1}
        end
      cart[name][:count] -= coupon[:num]
      end
  end
end
cart 
end


def apply_clearance(cart)
  # code here
  cart.each do |item, attribute_hash| 
    if attribute_hash[:clearance] == true 
      attribute_hash[:price] = (attribute_hash[:price] *
      0.8).round(2) 
    end 
  end 
cart 
end

def checkout(cart, coupons)
  # code here
end
