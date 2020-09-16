"""
This module provides tools to perform numerical integration on the sphere
for that, it provides different quadratures:

1. intSBazant21: Bazant quadrature 21 points
2. SlanSphere10k: Quadrature Slan 10000 points
3. intPpal: Quadrature with just 3 points in the ppal dir
"""
module SphereQuadratures

include("./Types.jl")
export SphereQuadraturervec

include("./Utils.jl")
export readquadrature

"""
This function computes the integral over the unit sphere of f(r1,r2,r3)
using the SphereQuadrature quad.

f: function of 3 director cosines f(r1,r2,r3)
quad: SphereQuadrature with fields r1v,r2v,r3v,wv
"""
function computeSphereQuad(f::Function, quad::SphereQuadraturervec)
    r1Vec = quad.r1Vec
    r2Vec = quad.r2Vec
    r3Vec = quad.r3Vec
    wVec = quad.wVec
    wsum = sum(wVec)
    Sintegral = (0.)*f(r1Vec[1], r1Vec[2], r1Vec[3])
    for i = 1 : length(r1Vec)
        r1 = r1Vec[i]
        r2 = r2Vec[i]
        r3 = r3Vec[i]
        w = wVec[i]/wsum
        Sintegral += f(r1,r2,r3)*w
    end
    return Sintegral
end

# Bazant Quadrature
BazantSphere21 = SphereQuadraturervec(readquadrature("BazantSphere21.txt", " ")...)

intSBazant21(f) = computeSphereQuad(f, BazantSphere21)

# Slan Quadrature 10k points

SlanSphere10k = SphereQuadraturervec(readquadrature("SlanSphere10k.txt", ";")...)

intSlan10k(f) = computeSphereQuad(f, SlanSphere10k)

# Ppal Quadrature

PpalQuadrature = SphereQuadraturervec(readquadrature("ppaldir.txt", " ")...)

intPpal(f) = computeSphereQuad(f, PpalQuadrature) 

export computeSphereQuad, intSBazant21, intSlan10k, intPpal

export BazantSphere21, SlanSphere10k, PpalQuadrature 

end #module
