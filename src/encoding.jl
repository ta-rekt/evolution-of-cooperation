export encode
function encode(s, enc)
    senc = ""
    lines = split(s, "\n")
    nl = length(lines)

    for (il, l) in enumerate(lines)
        words = split(l, " ")
        nw = length(words)

        for (iw, w) in enumerate(words)
            senc = string(senc, enc[string(w)])

            if iw < nw
                senc = string(senc, enc[" "])
            end
        end

        if il < nl
            senc = string(senc, enc["\n"])
        end
    end
    senc
end

export decode
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
