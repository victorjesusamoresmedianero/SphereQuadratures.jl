# Adding Some useful functions
import CSV

function readquadrature(filename::String, delimiter)
    quadFile = CSV.read(joinpath(@__DIR__,"quadDir", filename), delim = delimiter)
    return collect(quadFile.r1), collect(quadFile.r2),
           collect(quadFile.r3), collect(quadFile.w)
end
