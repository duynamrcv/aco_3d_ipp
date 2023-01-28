
clc;
clear;
close all;

%% Problem Definition
P = load('Point.mat');

model=CreateModel(P.X);

CostFunction=@(tour) TourCourse(tour,model);

nVar=model.n;


%% ACO Parameters

MaxIt=100;      % Maximum Number of Iterations

nAnt=50;       % Number of Ants (Population Size)

Q=1;

tau0=10*Q/(nVar*mean(model.D(:)));	% Initial Phromone

alpha=1;        % Phromone Exponential Weight
beta=1;         % Heuristic Exponential Weight

rho=0.05;       % Evaporation Rate


%% Initialization

eta=1./model.D;             % Heuristic Information Matrix, 1/distance

tau=tau0*ones(nVar,nVar);   % Phromone Matrix

BestCost=zeros(MaxIt,1);    % Array to Hold Best Cost Values

% Empty Ant
empty_ant.Tour=[];
empty_ant.Cost=[];

% Ant Colony Matrix
ant=repmat(empty_ant,nAnt,1);

% Best Ant
BestSol.Cost=inf;


%% ACO Main Loop

for it=1:MaxIt
    
    % Move Ants
    for k=1:nAnt
        
        ant(k).Tour=randi([1 nVar]); % returns 1 random value between 1 and no. of cities}
        ant(k).Tour = 1;
        for l=2:nVar
            
            i=ant(k).Tour(end);
            
            P=tau(i,:).^alpha.*eta(i,:).^beta; % the probability of next point
            
            P(ant(k).Tour)=0;
            
            P=P/sum(P);
            
            j=RouletteWheelSelection(P);
            
            ant(k).Tour=[ant(k).Tour j];
            
        end
        
        ant(k).Cost=CostFunction(ant(k).Tour);
        
        if ant(k).Cost<BestSol.Cost
            BestSol=ant(k);
        end
        
    end
    
    % Update Phromones
    for k=1:nAnt
        
        tour=ant(k).Tour;
        
        tour=[tour tour(1)]; %#ok
        
        for l=1:nVar
            
            i=tour(l);
            j=tour(l+1);
            
            tau(i,j)=tau(i,j)+Q/ant(k).Cost;
            
        end
        
    end
    
    % Evaporation
    tau=(1-rho)*tau;
    
    % Store Best Cost
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
end

%% Results

stl = ReadSTLModel1();
PlotSTL(stl);
PlotSolution(BestSol.Tour,model);
hold off;

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
