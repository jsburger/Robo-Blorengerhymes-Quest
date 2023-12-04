/// @description 

ds_grid_destroy(DepthGrid)
for (var i = 0; i < array_length(surfaces); i++) {
	surface_free(surfaces[i])
}

