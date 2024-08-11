using Evogames

## 000000010001100000101000110010100001
# Doing: timing brute-force search of binary strings

function bfsearch(s)
    l = length(s)
    n = parse(Int64, s, base = 2)
    out = ""

    for i in 1:2 ^ l
        if i == n
            out = Base.bin(UInt64(i), l, false)
            break
        end
    end
    out
end

@time let 
    a = "111111111111111111111111111111111111111111"
    println(length(a))

    s = bfsearch(a)    # 42 bits in about 10 seconds on one CPU. That's the absolute upper bound
    @assert s == a
end

## 0011010010001100000101000110010100001
# TODO: Build Huffman code from word frequencies
# - build prefix tree as well, to use in decoding above


## 0011010010001100000101000110010100001
# TODO: check whether a given string encodes a valid sentence
# - build a dict of all prefixes of codewords
# - if temp is not a codeword, is it a prefix? if not, exit and return invalid
# - if it is a codeword, decode it, append word to sdec

function decode(s, enc)
    dec = Dict(value => key for (key, value) in enc)
    temp = ""
    sdec = ""

    # build prefix dict
    # ...
    
    for c in s
        temp = string(temp, string(c))

        if haskey(dec, temp)
            sdec = string(sdec, dec[string(temp)])
            temp = ""   # reset temp
        end
    end
    sdec
end

let 
    enc = Dict(
        " "=>"1", 
        "\n"=>"01", 
        "a"=>"001", 
        "b"=>"0001", 
        "c"=>"00001", 
        "bc"=>"000001", 
        "abc"=>"000000"
    )
    s = "abc b\nbc b\na c"
    senc = encode(s, enc)

    # ...

end


## 0011010010001100000101000110010100001
# TODO: Check whether a valid sentence is a valid program
# - use Meta.parse

@time let
    s = "1 +"
    exp = Meta.parse(s)

    if isa(exp.args[1], Base.Meta.ParseError)
        print("caught it")
    end
end


## 0011010010001100000101000110010100001
# TODO: Evaluate programs

@time let 
    s = "a=4;(x->x^2)(a)"
    exp = Meta.parse(s)
    Meta.eval(exp)
end


## 0011010010001100000101000110010100001
# TODO: Example programs and their encodings
