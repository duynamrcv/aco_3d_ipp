function model = ReadSTLModel1()
%READSTL
model = stlread('model1.stl');

model = model*3;
Rx = [1     0   0;...     % rotate 90 degrees about the x-axis
      0     0   1;...
      0    -1   0];
Rz = [-1    0   0;...     % rotate 180 degrees about the z-axis
      0    -1   0;...
      0     0   1];
model = model*Rx*Rz - min(model(:,3));
% model = model*Rx*Rz;
end

