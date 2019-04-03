def delete_nth(order,max_occur)
  clean = []
  order.map{ |n| 
    if order.count(n) > max_occur 
      (1..order.count(n)-max_occur).map{ |t|
        order.delete_at(order.rindex(n))
      }
    end
    clean = order
  }
  clean
end