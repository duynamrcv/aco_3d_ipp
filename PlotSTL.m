% function PlotSTL(model)
%     % PLOTSTL
%     figure();
%     grid on;
%     hold on;
%     scatter3(model(:,1), model(:,2), model(:,3), '.',...
%             'MarkerEdgeColor','k',...
%             'MarkerFaceColor','flat');
%     T = delaunay(model(:,1),model(:,2));
%     trimesh(T, model(:,1), model(:,2), model(:,3),...
%             "FaceAlpha",0, "FaceColor", 'red');
%     colormap jet;
%     view([130,40]);
%     axis('equal');
%     xlabel('x [m]');
%     ylabel('y [m]');
%     zlabel('z [m]');
% end

function PlotSTL(model)
    % PLOTSTL
    figure();
    grid on;
    hold on;
%     scatter3(model(:,1), model(:,2), model(:,3), '.',...
%             'MarkerEdgeColor','k',...
%             'MarkerFaceColor','flat');
%     T = delaunay(model(:,1),model(:,2));
%     trimesh(T, model(:,1), model(:,2), model(:,3),...
%             "FaceAlpha",0, "FaceColor", 'red');
    
    scatter3(model(:,1), model(:,2), model(:,3),300,model(:,3), '.');
    plot3(model(:,1), model(:,2), model(:,3), '-k');
    colormap jet;
    view([120,20]);
    axis('equal');
    xlabel('x [m]');
    ylabel('y [m]');
    zlabel('z [m]');
end