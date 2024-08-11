using Evogames
using Test

@testset "Evogames.jl" begin

    # encode and decode
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
        @test senc == "000000010001100000101000110010100001"

        # decode
        sdec = decode(senc, enc)

        @test sdec == s

    end

end