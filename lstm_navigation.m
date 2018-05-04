%%
close all;

nvertices = 10;
mu_side = 1;
sigma_side = .5;
xylim = 2;

npolygons = 16;

allvertices = cell(npolygons,1);

for ipolygon = 1:npolygons
    
    vertex_angles = sort( rand([nvertices 1]) );
    vertex_lengths = randn([nvertices 1])*sigma_side + mu_side;
    
    %
    vertices_z = exp(1i*2*pi*vertex_angles) .* vertex_lengths;
    vertices = [real(vertices_z) imag(vertices_z)];
    allvertices{ipolygon} = vertices;
    
    vertices_cycle = [vertices ; vertices(1,:)];
    
    figure;
    plot(vertices_cycle(:,1),vertices_cycle(:,2));
    axis equal;
    xlim(xylim*[-1 1]);
    ylim(xylim*[-1 1]);
    
    
end