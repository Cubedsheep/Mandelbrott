using Colors

"""
calculates the next value, given a value "z" and seed "c"
"""
function julia_bail_out(z, c, bound=2, iterations=100)
    for i = 1:iterations
        if abs(z) > bound
            return i
        end
        z = z^2 + c
    end
    return -Inf32
end

"""
calculates the next value, given a value "z" and seed "c" for teh mandelbrott
set
"""
function mandel_bail_out(c, bound=2, iterations=100)
    z = 0;
    for i = 1:iterations
        if abs(z) > bound
            return i
        end
        z = z^2 + c;
    end
    return -Inf32
end


"""
Iterates over the given array points::Array{ComplexF64} and calculates
the amount of steps required to bail out, or stops at the max number of steps
"""
function julia_set(grid, seed, bound, bailout)
    # map each value to the required amount of iterations
    bail_array = map(x -> julia_bail_out(x, seed, bound, bailout), grid)
    # return de gevonden waarden
    return bail_array
end

"""
Iterates over the given array points::Array{ComplexF64} and calculates
the amount of steps required to bail out, or stops at the max number of steps
for the mandelbrott set
"""
function mandel_set(grid, bound, bailout)
    # map each value to the required amount of iterations
    bail_array = map(x -> mandel_bail_out(x, bound, bailout), grid)
    # return de gevonden waarden
    return bail_array
end

"""
transforms the number of iterations to bail_out to with te given transform
function. Used for creating a colormap. It maps the values with -Inf as number
of iterations to the color c_inf
"""
function color_map_julia(grid, seed, palette, bound=2, bailout=100, cmap=map_gray
                        , c_inf=UInt8(0))
    bail_array = julia_set(grid, seed, bound, bailout)
    # transform the non -Inf values with cmap, set the others to c_inf
    col_array = map(n -> n == -Inf32 ? c_inf : cmap(n, bailout, palette),
                    bail_array)
    return col_array
end

"""
transforms the number of iterations to bail_out to with te given transform
function. Used for creating a colormap. It maps the values with -Inf as number
of iterations to the color c_inf for the mandelbrott set
"""
function color_map_mandel(grid, palette, bound=2, bailout=100, cmap=map_gray
                        , c_inf=UInt8(0))
    bail_array = mandel_set(grid, bound, bailout)
    # transform the non -Inf values with cmap, set the others to c_inf
    col_array = map(n -> n == -Inf32 ? c_inf : cmap(n, bailout, palette),
                    bail_array)
    return col_array
end


"""
function for converting n to a greyscale value, default colormap for
color_map_julia
"""
function map_gray(n, iter, palette)
    return UInt8(floor(UInt8, (clamp(n, typemin(UInt8), typemax(UInt8)))))
end

"""
same as greyscale but with collors
"""
function map_color(n, iter, palette)
    return palette[ceil(Int64, n)]
end

"""
function for creating an array with complex values between two corner values,
with n columns and m rows (so n distinct real parts and m distinct imaginary
parts)
"""
function linspace(start::Complex, finish::Complex, n::Integer, m::Integer)
    realParts = range(real(start), stop=real(finish), length=n)
    complexParts = [Complex(0, b) for b=range(imag(start),
                                        stop=imag(finish), length=m)]
    [ a + b for a=realParts, b=complexParts ]
end
