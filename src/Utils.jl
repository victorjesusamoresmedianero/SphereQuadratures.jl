# Adding Some useful functions
import CSV
import DataFrames

function readquadrature(filename::String, delimiter)
    quadFile = CSV.File(joinpath(@__DIR__,"quadDir",filename) , delim = delimiter)|> DataFrames.DataFrame
    return quadFile.r1, quadFile.r2,
           quadFile.r3, quadFile.w
end
