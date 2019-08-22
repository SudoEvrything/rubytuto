stock_price = [1, 23, 12, 34, 90, 32, 47, 76]

def stock_picker(arr)
	
	maxprofit = 0
	bestdaytobuy = -1
	bestdaytosell = -1

	arr.each_with_index do |buyprice, day|
		break if day == arr.length - 1
		nextdayprices = arr.slice(day+1, arr.length)
		sellprice = nextdayprices.max
		next if sellprice < buyprice
		profitintheday = sellprice - buyprice
		next if profitintheday < maxprofit
		maxprofit = profitintheday
		bestdaytobuy = day
		bestdaytosell = arr.index(sellprice)
	end

	puts "Max profit = #{maxprofit}"
	puts "Buy = #{bestdaytobuy}, Sell = #{bestdaytosell}"

	return [bestdaytobuy, bestdaytosell]
end

stock_picker(stock_price)