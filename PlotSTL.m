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
    figure(1);
    grid on;

    % scatter3(model(:,1), model(:,2), model(:,3),300,model(:,3), '.');
    % plot3(model(:,1), model(:,2), model(:,3), '-');

    gm = fegeometry('model1.stl');
    % scale(gm.Vertices,3);
    gm = gm.scale(3);
    gm = gm.rotate(90,[0 0 0],[1 0 0]); % rotate 90 about x-axis
    gm = gm.rotate(180,[0 0 0],[0 0 1]); % rotate 90 about x-axis
    gm = gm.translate([75 75 70]);
    pdegplot(gm);    

    colormap sky;
    view([120,20]);
    axis('equal');
    xlabel('x [m]');
    ylabel('y [m]');
    zlabel('z [m]');
end