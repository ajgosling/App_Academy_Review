def reverser(str, &block)
    block.call(str.reverse)
end

def word_changer(sent, &block)
    sent.split.map {|word| block.call(word)}.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    [prc1.call(num), prc2.call(num)].max
end

def and_selector(arr, prc1, prc2)
    arr.select {|el| prc1.call(el) && prc2.call(el)}
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index do |el, idx|
        if idx.even?
            prc1.call(el)
        else
            prc2.call(el)
        end
    end
end