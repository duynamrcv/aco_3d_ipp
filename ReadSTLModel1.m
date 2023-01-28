function model = ReadSTLModel1()
%READSTL
model = stlread('model1.stl');
% model = model(model(:,3) >= 3000,:);
% model(:,3) = model(:,3) - 30;
% 
% part1 = model(model(:,3) < 10000,1:2);
% part2 = model(model(:,3) > 38000 & model(:,3)<42000,1:2);
% for z= 1:3000:50001
%     part1(:,3) = z;
%     model = [model; part1];
% end
% 
% for z= 50000:3000:75000
%     part2(:,3) = z;
%     model = [model; part2];
% end
model = model*3;
Rx = [1     0   0;...
      0     0   1;...
      0    -1   0];
Rz = [-1    0   0;...
      0    -1   0;...
      0     0   1];
model = model*Rx*Rz - min(model(:,3));
end

