def stock_picker(stockprices)
	daytobuyandsell = []
	maxprofit = 0
	stockprices.each do |price|
		indexofprice = stockprices.index(price)
		maxprice = (indexofprice == stockprices.length-1) ? price : stockprices[indexofprice+1..-1].max
		indexofmaxprice = stockprices.index(maxprice)
		profit = maxprice - price
		if profit > maxprofit
			maxprofit = profit
			daytobuyandsell = [indexofprice, indexofmaxprice]
		end
	end
	daytobuyandsell
end

p (stock_picker([1, 23, 12, 34, 90, 32, 47, 76]))