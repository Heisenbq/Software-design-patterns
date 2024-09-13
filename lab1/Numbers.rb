# 1 подпункт
def not_divisible_by3(number)
	if (number<0) then return 0 end
	div=2
	amount = 0
	while div*div<=number
		if number%div==0 && div%3!=0 then
			if div*div==number then amount+=1
			else amount+=2 
			end
		end
		div+=1
	end
	return amount
end





