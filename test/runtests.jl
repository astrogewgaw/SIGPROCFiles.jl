using Test
using SIGPROCFiles

@testset "SIGPROCFiles.jl" begin
    @testset "Header data" begin
        m = SIGPROCFiles.loadhdr("./data/test.fil")
        @test m == Dict(
            :az_start => -1.0,
            :barycentric => 0,
            :data_type => 0,
            :fch1 => 1465.0,
            :foff => -1.0,
            :ibeam => 0,
            :machine_id => 0,
            :nbeams => 1,
            :nbits => 8,
            :nchans => 336,
            :nifs => 1,
            :pulsarcentric => 0,
            :rawdatafile => "./small.fil",
            :source_name => "src1",
            :src_dej => 135752.112,
            :src_raj => 122637.6361,
            :telescope_id => 6,
            :tsamp => 0.00126646875,
            :tstart => 58682.620316710374,
            :za_start => -1.0,
        )
    end

    @testset "Filterbank data" begin
        m, d = SIGPROCFiles.loadfil("./data/test_1bit.fil")
        @test all(d[65, 101:110] .≈ [1, 1, 0, 0, 0, 0, 0, 0, 1, 1])

        m, d = SIGPROCFiles.loadfil("./data/test_2bit.fil")
        @test all(d[65, 101:110] .≈ [0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        m, d = SIGPROCFiles.loadfil("./data/test_4bit.fil")
        @test all(d[65, 101:110] .≈ [7, 4, 3, 11, 6, 10, 10, 9, 6, 7])

        m, d = SIGPROCFiles.loadfil("./data/test_8bit.fil")
        @test all(d[65, 101:110] .≈ [121, 94, 94, 124, 151, 118, 132, 74, 112, 65])

        m, d = SIGPROCFiles.loadfil("./data/test_32bit.fil")
        @test all(d[65, 101:110] .≈ [1.166237, -0.84468514, 0.874816, 1.4028563, -0.98618776, -0.80890864, -1.6307002, 1.1306021, 0.50498164, -1.6316832])
    end

    @testset "Time series data" begin
        for fname in ["test_i8.tim", "test_ui8.tim", "test_f32.tim"]
            m, d = SIGPROCFiles.loadtim("./data/$fname")
            @test all(d .≈ [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0])
        end
    end
end
