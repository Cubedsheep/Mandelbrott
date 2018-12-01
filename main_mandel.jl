using ImageView, TestImages, Images, Colors, FileIO
include("calcJulia.jl");

# overview sea-horse valley
#grid = linspace(-0.725+0.05im, -0.775+0.1im, 1000, 1000);
# test
grid = linspace(-2.56-1.08im, 1.28+1.08im, 1920, 1080);
iterations = 500
"""
palette = diverging_palette(240.0, 80.0, 2*iterations,
                            mid=0.125)[1:iterations];
"""
palette = diverging_palette(250, 20, iterations, mid=0.35, c=1)
#grey_grid = color_map_julia(grid, seed);
#grey_grid = grey_grid';
#save("test.png", Gray.(sqrt.(grey_grid ./ 255)));
#channelview(grey_grid)

color_grid = color_map_mandel(grid, palette, 2, iterations, map_color, RGB(0,0,0))
color_grid = color_grid'
save("mandelbrot.png", color_grid)
