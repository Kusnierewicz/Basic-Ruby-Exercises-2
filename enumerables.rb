module Enumerable
	def my_each
		for i in self
			yield(i)
		end
		self
	end
	def my_each_with_index
		for i in self
			yield(self[i], i)
		end
		self
	end

	def my_select
		newarray = []
		self.my_each do |poz|
			if yield(poz)
				newarray.push(poz)
			end
		end
		newarray
		#select returns a new object (e.g. array) filled with only 
		#those original items where the block you gave it returned true
	end

	def my_all?
		self.my_each do |poz|
			unless yield(poz)
				return false
			end
		end
		return true
		#all? returns true/false and answers the question, 
		#{}"do ALL the elements of this object pass the test in my block?". 
		#Every time the block runs it must return true for this method to return true.
	end

	def my_any?
		self.my_each do |poz|
			if yield(poz)
				return true
			end
		end
		return false
		#any? returns true/false (see the question mark?) and answers the question, 
		#{}"do ANY of the elements in this object pass the test in my block?". 
		#If your block returns true on any time it runs, any? will return true.
	end

	def my_none?
		self.my_each do |poz|
			if yield(poz)
				return false
			end
		end
		return true
		#none? returns true only if NONE of the elements in 
		#the object return true when the block is run.
	end

	def my_count(var = 0)
		return self.size unless block_given? or var != 0
		num = 0
		self.my_each do |poz|
			if block_given?
				if yield(poz)
					num += 1
				end
			elsif var != 0
				if poz == var
					num += 1
				end
			end
		end
		num
	end

	def my_map
		newarray = []
		self.my_each do |poz|
			if yield(poz)
				newarray.push(yield(poz))
			end
		end
		newarray
		#map returns a new array filled with whatever gets 
		#returned by the block each time it runs.
	end
	def my_map(&proced)
		newarray = []
		self.my_each do |poz|
			if block_given?
				newarray.push(yield(poz))
			else
				newarray.push(proced.call(poz))
			end
		end
		return newarray
		#map returns a new array filled with whatever gets 
		#returned by the block each time it runs.
	end

	def my_map
		newarray = []
		self.my_each do |poz|
			if yield(poz)
				newarray.push(yield(poz))
			end
		end
		return newarray
		#map returns a new array filled with whatever gets 
		#returned by the block each time it runs.
	end

	def my_inject(num = 0)
		if block_given?
			self.my_each do |poz|
				num = yield(num, poz)
			end
		end
		num
		#Up until now, all the methods we've seen run essentially independent operations on each element 
		#of our array or hash. What if we want to do something that keeps track of the result as we iterate? 
		#Like, say, summing up the elements of an array?
		#For that we need to use #inject (aka #reduce), which passes not just the element but whatever was 
		#returned by the previous iteration into the block. You can either specify the initial value or it will 
		#just default to the first item of the array. It ultimately returns whatever the result of the last 
		#iteration is.
	end

	def multiply_els(array)
		result = array.my_inject(0) {|sum, i| sum * i}
		return result
	end

end