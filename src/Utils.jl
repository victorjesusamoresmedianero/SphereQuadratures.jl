# Adding Some useful functions
import CSV

function readquadrature(filename::String, delimiter)
    quadFile = CSV.read(joinpath(@__DIR__,"quadDir", filename), delim = delimiter)
    return quadFile.r1, quadFile.r2,
           quadFile.r3, quadFile.w
end
