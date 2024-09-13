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


#Задание6
def read_array(path)
	array = File.read(path).split.map(&:to_i)
end

if ARGV.length ==2 then 
	array=read_array(ARGV[1])
	if array.size==0 then 
		puts "Array is empty."
	end

	case ARGV[0].to_i
	when 1
		puts "Min for: #{min_for(array)}"
	when 2
		puts "Min while: #{min_while(array)}"
	when 3
		puts "Num of first positive elem for: #{num_of_first_el_for(array)}"
	when 4
		puts "Num of first positive elem while: #{num_of_first_el_while(array)}"
	else
		puts "Not existed action!"
end
else 
	puts "Insert 2 args of programm!"
end