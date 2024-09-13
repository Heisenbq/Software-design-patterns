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

# 2 подпункт
def min_odd_digit_of_number(number)
	res_digit = 11
	while number > 0
		digit = number%10
		number /= 10
		if digit < res_digit && digit%2!=0 then res_digit=digit end
	end
	if res_digit==11 then return "Число не содержит нечетные цифры" end
	return res_digit
end

# 3 подпункт

# def max(num1,num2)
# 	if num1>num2 then return num1 end
# 	return num2
# end

# def mutually_primes(number1,number2)
# 	bigger = max(number1,number2)
# 	div=2
# 	while div<bigger
# 		if number1%div==0 && number2%div==0 then return false end
# 		div+=1
# 	end
# 	return true
# end
def euclidean_gcd(a, b)
  a_copy = a
  b_copy = b
  while b_copy != 0
    a_copy, b_copy = b_copy, a_copy % b_copy
  end
  a_copy
end

def mutually_primes(number1,number2)
	divider=euclidean_gcd(number1,number2)
	if divider == 1 then return true end
	return false
end

def sum_of_dividers_mutually_primes(number)
	sum_of_div=0
	number_copy=number
	sum_digits=0
	multi_digits=1

	while number_copy > 0
		digit = number_copy%10
		number_copy /= 10
		sum_digits+=digit
		multi_digits*=digit
	end
	div=2
	puts number
	while div*div <= number
		if number%div==0 && mutually_primes(div,sum_digits)&& !mutually_primes(div,multi_digits)  then sum_of_div+=2 end

		div+=1
	end
	return sum_of_div
end


