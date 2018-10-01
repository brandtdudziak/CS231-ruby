#Ruby program
#Description:
    #Goals: Use blocks to complete the Towers of Hanoi Problem

def call_block
    puts 'Start'
    yield
    yield
    puts 'End'
end

def call_block2
    yield
end

def call_block3
    yield('block3', 2)
end


call_block {puts "BLOCK"}
call_block2 do
    puts 'this is block 2'
end
call_block3 {|str, num| puts 'this block ' + str + ' takes ' + num.to_s + ' arguments'}

testArray = [4, 7, 1, 9, 3]

#blocks for moving through array and for moving curr to correct position
def printArr(arr)
    puts 'The array is ' + arr.to_s
end

printArr(testArray)

def insertion(arr)
    puts 'Running insertion sort on array: ' + arr.to_s
    #yield to block and pass as arguments the array and the current element looking at - the block puts the element at the correct position
        #in the block - iterate down from start arg and do swaps
    'this is the return'
end

puts insertion(testArray)

testArray.each {|a| puts 'WOW ' + a.to_s}

#0 = even, 1 = odd
def printEvenOdd(arr, i)
    newArray = []
    for el in arr
        if el%2 == i
            newArray.push(el)
        end
    end
    puts newArray.to_s
end

printEvenOdd(testArray, 1)


def printEven(arr)
    newArray = []
    for el in arr
        newArray.push yield el
    end
    puts newArray.to_s
end

printEven(testArray) do |el|
    if el%2 == 0
        el
    else
        puts 'toss ' + el.to_s
        'X'
    end
end


def printEven1(arr)
    for el in arr
        yield el
    end
    puts 'END'
end

evenArray = []
puts evenArray.to_s

printEven1(testArray) do |el|
    if el%2 == 0
        evenArray.push(el)
    else
        puts 'toss ' + el.to_s
    end
end

puts evenArray.to_s

def recur(sum, i)
    if i <= 0
        return sum
    end
    sum = sum + i
    recur(sum, i-1)
end

puts recur(0, 4)



#testArray.each {|a| puts 'WOW ' + a.to_s}
=begin
def merge(arr)
    puts "Running merge sort on array: " + arr.to_s
    puts yield arr
    1
end

mergeSortedArray = merge(testArray) do |arr|
    puts 'Array given to block: ' + arr.to_s
    arr.to_s
end

merge(testArray) {|arr| arr.to_s}
=end
#something can call a block's def twice
#An outer block (merge) that calls an inner block (split)
#merge(arr1,arr2) - merges two lists into one (build up new array, then return) - merge is a block that can call within other block?
#block recursively splits at top then merges

#puts 'Merge sorted array: ' + mergeSortedArray.to_s

=begin
def mergeSort(arr)
    puts "Running merge sort on array: " + arr.to_s
    temp = copyArr(arr, [])
    splitMerge(temp, 0, arr.length-1, arr)
end
=end

=begin
def splitMerge(temp, lo, hi, arr)
    if hi <= lo
        return
    end
    mid = (hi+lo)/2
    splitMerge(arr, lo, mid, temp)#replace these with block calls so not recursive?
    splitMerge(arr, mid+1, hi, temp)
    merge(temp, lo, mid, hi, arr)
    return arr
end
=end

=begin
def merge(arr, lo, mid, hi, temp)
    counterOne = lo
    counterTwo = mid+1
    i = lo
    while i <= hi
        if counterOne == mid+1 || (counterTwo <= hi && arr[counterOne] > arr[counterTwo])
            temp[i] = arr[counterTwo]
            counterTwo = counterTwo + 1
        else
            temp[i] = arr[counterOne]
            counterOne = counterOne + 1
        end
        i = i+1
    end
    #i = lo
   # while i <= hi
    #    arr[i] = temp[i]
    #    i = i+1
   # end
end
=end

class Card
    attr_accessor :value
    def initialize(value)
       @value = value
    end
    def toString()
        return 'This card is of value ' + @value.to_s
    end
end

class Deck
    attr_accessor :cards
    def initialize(size)
        @cards = []
        i = 0
        while i < size
            @cards.push(Card.new(i))
            i = i + 1
        end
    end
    def toString()
        arr = []
        for card in @cards
            arr.push(card.toString())
        end
        return arr
    end
    def changeCard(card, value)
        @cards[card] = Card.new(value)
    end
end

deckTest = Deck.new(8)
puts deckTest.toString().to_s

deckTest.changeCard(2, 10)
puts deckTest.toString().to_s
    
jack = Card.new(3)
puts jack.toString()

queen = Card.new(4)
puts queen.value.to_s

king = Card.new(1)
king.value = 6
puts king.toString()
    
testArray = [7, 4, 1, 8, 3, 2, 5, 6]