using ImageView, TestImages, Images, Colors, FileIO
include("calcJulia.jl")

grid = linspace(-2-1im, 2+1im, 1000, 500)
seed = -0.70176-0.3842im
grey_grid = color_map_julia(grid, seed)
grey_grid = grey_grid'
save("test.png", Gray.(sqrt.(grey_grid ./ 255)))
#channelview(grey_grid)
