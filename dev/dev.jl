## 010011101001111000011101000111001
# Doing: encoding and decoding

# A simple self-delimiting code
function encode(s, enc)
    senc = ""
    lines = split(s, "\n")
    ll = length(lines)

    for (il, l) in enumerate(lines)
        words = split(l, " ")
        lw = length(words)

        for (iw, w) in enumerate(words)
            senc = string(senc, enc[string(w)])

            if iw < lw
                senc = string(senc, enc[" "])
            end
        end

        if il < ll
            senc = string(senc, enc["\n"])
        end
    end
    senc
end

function decode(s, enc)
    dec = Dict(value => key for (key, value) in enc)
    temp = ""
    sdec = ""
    
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
        "\n"=>"1", 
        " "=>"01", 
        "a"=>"001", 
        "b"=>"0001", 
        "c"=>"00001", 
        "bc"=>"000001", 
        "abc"=>"000000"
    )
    s = "abc b\nbc b\na c"
    senc = encode(s, enc)

    println(senc)
    println(length(senc))
    @assert senc == "000000010001100000101000110010100001"

    # decode
    sdec = decode(senc, enc)

    @assert sdec == s

end

## 000000010001100000101000110010100001
# Doing: timing brute-force search of binary strings

function bfsearch(s)
    l = length(s)
    n = parse(Int64, s, base = 2)
    o = ""

    for i in 1:2 ^ l
        if i == n
            o = Base.bin(UInt64(i), l, false)
            break
        end
    end
    o
end

@time let 
    a = "01000010000100001000010000100001000010101010"
    println(length(a))

    s = bfsearch(a)    # 44 bits in about 10 seconds on one CPU
    @assert s == a
end