
function L=TourCost(tour,model)

    n=numel(tour);

%     tour=[tour tour(1)];
    
    L1=0; % Cost for length of path
    for i=1:n-1
        if model.z(tour(i)) ~= model.z(tour(i+1))
            L1 = L1 + 2*model.D(tour(i),tour(i+1));
        else 
            L1 = L1 + model.D(tour(i),tour(i+1));
        end
        % L1 = L1 + model.D(tour(i),tour(i+1));
    end
    
    L = L1;
end