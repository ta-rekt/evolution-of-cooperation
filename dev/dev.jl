## 010011101001111000011101000111001
# Doing: encoding and decoding


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