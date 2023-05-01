module SIGPROCFiles

using PackedIntegers

struct InvalidFile <: Exception end
Base.showerror(io::IO, e::InvalidFile) = print(io, "This is not a SIGPROC file.")

const NBITS2DTYPES = Dict(
    1 => UInt8,
    2 => UInt8,
    4 => UInt8,
    8 => UInt8,
    16 => UInt16,
    32 => Float32,
)

const METATYPES = Dict(
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
)

str(s) = String(read(s, read(s, Int32)))

function load(f::AbstractString)
    open(f) do s
        load(s)
    end
end

function load(s::IOStream)
    meta = Dict()
    magic = str(s)
    magic != "HEADER_START" && throw(InvalidFile())
    while true
        key = str(s)
        key == "HEADER_END" && break
        typ = METATYPES[Symbol(key)]
        meta[Symbol(key)] = (typ == String) ? str(s) : read(s, typ)
    end
    nbits = meta[:nbits]
    dtype = NBITS2DTYPES[nbits]
    data = Array{dtype}(read(s))
    data = nbits ∈ [1 2 4] ? unpack(data; n=nbits) : data
    data = reshape(data, Int64(meta[:nchans]), :)
    meta, data
end

end
