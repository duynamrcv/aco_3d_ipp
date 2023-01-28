
function model=CreateModel(P)

%     P = load('Point.mat')

    x=P(:,1)'; % 21 points
    
    y=P(:,2)';
    
    z=P(:,3)';
    n=numel(x); % number of vertex
    
    D=zeros(n,n); % Distance between two vertex
    
    for i=1:n-1
        for j=i+1:n
            delta_x = x(i)-x(j);
            delta_y = y(i)-y(j);
            delta_z = z(i)-z(j);
            if norm([delta_x, delta_y]) < 50
                D(i,j) = 1.2*norm([delta_x, delta_y, delta_z])...
                        + norm([delta_x, delta_y]) ...
                        + 2*norm([delta_z]);
            else
                D(i,j) = 1.2*norm([delta_x, delta_y, delta_z])...
                    + 4*norm([delta_x, delta_y]) ...
                    + 2*norm([delta_z]);
            end
%             D(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2+(z(i)-z(j))^2);
            
            D(j,i)=D(i,j);
            
        end
    end
    
    model.n=n;
    model.x=x;
    model.y=y;
    model.z=z;
    model.D=D;

end