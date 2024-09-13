def min_for(array)
	min = array[0]
	for i in 1...array.size do
        if array[i] < min then
            min = array[i]
        end
    end

    return min
end

def min_while(array)
	min = array[0]
	i=1
	while i<array.length
		if array[i]<min then
			min = array[i]
		end	
	end
	
	return min
end	

def num_of_first_el_for(array)
	for i in 0..array.size do
		if array[i] > 0 then 
			return i+1
		end
	end

	return "Array not containts of positive elements"
end

def num_of_first_el_while(array)
	i=0
	while i<array.length
		if array[i]>0 then
			return i+1
		end	
		i+=1
	end

	return "Array not containts of positive elements"
end