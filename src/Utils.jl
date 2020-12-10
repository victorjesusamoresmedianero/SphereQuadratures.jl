# Adding Some useful functions
import CSV
import DataFrames

function readquadrature(filename::String, delimiter)
    quadFile = CSV.read(joinpath(@__DIR__,"quadDir",filename) , DataFrame, delim = delimiter)
    return quadFile.r1, quadFile.r2,
           quadFile.r3, quadFile.w
end
