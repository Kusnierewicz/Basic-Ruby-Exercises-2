def bubble_sort(lsToSort)
	(lsToSort.length * lsToSort.length).times do
		lsToSort.each_with_index do |value, index|
			if index == lsToSort.length - 1
				next
			end
			compared1 = value
			compared2 = lsToSort[index + 1]
			if compared1 > compared2
				lsToSort[index] = compared2
				lsToSort[index + 1] = compared1
			end
		end
	end
	return lsToSort
end

#print bubble_sort([4,3,78,2,0,2,5,7,9,2,4,5,7,1,0])

def bubble_sort_by(lsToSort)
	(lsToSort.length * lsToSort.length).times do
		lsToSort.each_with_index do |value, index|
			if index == lsToSort.length - 1
				next
			end
			compared1 = value
			compared2 = lsToSort[index + 1]
			if compared1.length > compared2.length
				lsToSort[index] = compared2
				lsToSort[index + 1] = compared1
			end
		end
	end
	return lsToSort
end

#print bubble_sort_by(["hi","hello","hey"])
print bubble_sort_by(["hi","hello","hey"]) {|left,right| right.length - left.length}