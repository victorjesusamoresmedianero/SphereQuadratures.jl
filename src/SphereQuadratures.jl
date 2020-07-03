module SphereQuadratures

include(joinpath(".","Types.jl"))
export SphereQuadrature

include(joinpath(".","Utils.jl"))
export readquadrature

"""
This function computes the integral over the unit sphere of f(r1,r2,r3)
using the SphereQuadrature quad.

f: function of 3 director cosines f(r1,r2,r3)
quad: SphereQuadrature with fields r1v,r2v,r3v,wv
"""
function computeSphereQuad(f::Function, quad::SphereQuadrature)
    r1Vec = quad.r1Vec
    r2Vec = quad.r2Vec
    r3Vec = quad.r3Vec
    wVec = quad.wVec
    sum = 0.
    for i = 1 : length(r1Vec)
        r1 = r1Vec[i]
        r2 = r2Vec[i]
        r3 = r3Vec[i]
        w = wVec[i]
        sum += f(r1,r2,r3)*w
    end
    return sum
end

BazantSphere21 = SphereQuadrature(readquadrature("BazantSphere21.txt")...)

intSBazant21(f) = computeSphereQuad(f, BazantSphere21)

export computeSphereQuad, intSBazant21

export BazantSphere21

end #module
