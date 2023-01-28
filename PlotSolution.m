
function PlotSolution(tour,model)

%     tour=[tour tour(1)];
    
    plot3(model.x(tour),model.y(tour),model.z(tour),'k-o',...
        'LineWidth',1.5,...
        'MarkerSize',5,...
        'MarkerEdgeColor','k',...
        'MarkerFaceColor',[0 .75 .75]);
    
    axis equal;
    grid on;
    
	alpha = 0.1;
	
    xmin = min(model.x);
    xmax = max(model.x);
    dx = xmax - xmin;
    xmin = floor((xmin - alpha*dx)/10)*10;
    xmax = ceil((xmax + alpha*dx)/10)*10;
    xlim([xmin xmax]);
    
    ymin = min(model.y);
    ymax = max(model.y);
    dy = ymax - ymin;
    ymin = floor((ymin - alpha*dy)/10)*10;
    ymax = ceil((ymax + alpha*dy)/10)*10;
    ylim([ymin ymax]);
    
    title('Inspection path');
end