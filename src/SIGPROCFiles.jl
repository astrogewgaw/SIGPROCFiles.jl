module SIGPROCFiles

export loadhdr
export loadtim
export loadfil

using PackedIntegers

struct InvalidFile <: Exception end
Base.showerror(io::IO, _::InvalidFile) = print(io, "This is not a valid SIGPROC file.")

str(s) = String(read(s, read(s, Int32)))

function loadhdr(f::AbstractString)
    open(f) do s
        loadhdr(s)
    end
end

function loadhdr(s::IOStream)
    meta = Dict()
    magic = str(s)
    magic != "HEADER_START" && throw(InvalidFile())
    while true
        key = str(s)
        key == "HEADER_END" && break
        typ = Dict(
            :filename => String,
            :telescope_id => Int32,
            :telescope => String,
            :machine_id => Int32,
            :data_type => Int32,
            :rawdatafile => String,
            :source_name => String,
            :barycentric => Int32,
            :pulsarcentric => Int32,
            :az_start => Float64,
            :za_start => Float64,
            :src_raj => Float64,
            :src_dej => Float64,
            :tstart => Float64,
            :tsamp => Float64,
            :nbits => Int32,
            :nsamples => Int32,
            :fch1 => Float64,
            :foff => Float64,
            :fchannel => Float64,
            :nchans => Int32,
            :nifs => Int32,
            :refdm => Float64,
            :flux => Float64,
            :period => Float64,
            :nbeams => Int32,
            :ibeam => Int32,
            :hdrlen => Int32,
            :pb => Float64,
            :ecc => Float64,
            :asini => Float64,
            :orig_hdrlen => Int32,
            :new_hdrlen => Int32,
            :sampsize => Int32,
            :bandwidth => Float64,
            :fbottom => Float64,
            :ftop => Float64,
            :obs_date => String,
            :obs_time => String,
            :signed => Int8,
            :accel => Float64,
        )[Symbol(key)]
        meta[Symbol(key)] = (typ == String) ? str(s) : read(s, typ)
    end
    meta
end

function get(s, nbits)
    data = reinterpret(Dict(
            1 => UInt8,
            2 => UInt8,
            4 => UInt8,
            8 => UInt8,
            16 => UInt16,
            32 => Float32,
        )[nbits], read(s))
    nbits ∈ [1 2 4] ? unpack(data; n=nbits) : data
end

function loadtim(f::AbstractString)
    open(f) do s
        loadtim(s)
    end
end

function loadtim(s::IOStream)
    meta = loadhdr(s)
    nbits = meta[:nbits]
    data = get(s, nbits)
    meta, data
end

function loadfil(f::AbstractString)
    open(f) do s
        loadfil(s)
    end
end

function loadfil(s::IOStream)
    meta = loadhdr(s)
    nbits = meta[:nbits]
    data = get(s, nbits)
    data = reshape(data, Int64(meta[:nchans]), :)
    meta, data
end

end
