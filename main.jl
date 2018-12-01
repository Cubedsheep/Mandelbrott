using ImageView, TestImages, Images, Colors, FileIO
include("calcJulia.jl");

grid = linspace(-2-1im, 2+1im, 2000, 1000);
seed = 0.54641-0.2196754im;
iterations = 200
"""
palette = diverging_palette(240.0, 80.0, 2*iterations,
                            mid=0.125)[1:iterations];
"""
palette = diverging_palette(250, 20, 200, mid=0.2, c=1)
#grey_grid = color_map_julia(grid, seed);
#grey_grid = grey_grid';
#save("test.png", Gray.(sqrt.(grey_grid ./ 255)));
#channelview(grey_grid)

color_grid = color_map_julia(grid, seed, palette, 2, iterations, map_color, RGB(0,0,0))
color_grid = color_grid'
save("test_color.png", color_grid)

"""
TEST ZOOMED-IN IMAGE
grid = linspace(0.2+0.3im, 0.5+0.6im, 2000, 2000);
seed = -0.70176-0.3842im;
iterations = 200
palette = diverging_palette(240.0, 80.0, 2*iterations,
                            mid=0.125)[1:iterations];
#grey_grid = color_map_julia(grid, seed);
#grey_grid = grey_grid';
#save("test.png", Gray.(sqrt.(grey_grid ./ 255)));
#channelview(grey_grid)

color_grid = color_map_julia(grid, seed, palette, 2, iterations, map_color, RGB(0,0,0))
#color_grid = color_grid'
save("test_zoom.png", color_grid)
#color_grid
"""
