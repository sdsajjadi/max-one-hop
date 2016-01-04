% Weighted Max-Min Fairness Algorithm
% Written by Dawood Sajjadi (www.sdsajjadi.ir) - January 3rd, 2016

% INPUT VECTORS
% The demands of the given flows.
% Each number represents the demand of a single flow.
%Demands = [4, 2, 10, 4];
Demands = [1 2  10 20 100 100];

% The corresponding weights of the given flows.
% the elements with the same index from Demands & Weights are bonded. 
%Weights = [2.5, 4, 0.5, 1];
Weights = [10 10 20 20 40 100];

% The total capacity (Capacity & Demands have the same unit)
%Capacity = 16;
Capacity = 100;

% STEP1: Normalizing the values of the given wights
Norm_factor = Capacity / sum(Weights);
Norm_weights = Norm_factor .* Weights;

% STEP2: Resource allocation to the given flows based on the Norm_weights
% First allocate the resources to non-greedy flows.
% The demands of non-greedy flows are less than the allocated resources
Allocated = Inf(1,length(Demands));
Residual = zeros(1,length(Demands));

for i = 1:length(Demands)     
     % If the requested demand is less than the normalized weight of a flow
     % First, allocate the resource to the respective flow (demand).
     % Second, store the residual (extra) norm_weights of non-greedy flows.
     if Norm_weights(i) >= Demands(i)  % if the flow i is non-greedy.
         Allocated(i) = Demands(i);
         Residual(i) = Norm_weights(i) - Demands(i);
     % otherwise, allocate the calculated norm_weight to the greedy flow.  
     else
         Allocated(i) = Norm_weights(i);
     end    
end

% Sum of the residual (extra) resources
Total_Residual = sum(Residual);

% Until the Total_Residual resources are not distibuted among the greedy
% flows, keep running the While loop.
while Total_Residual > 0
    
    % Normalize the weights of the greedy flows
    Norm_factor = Total_Residual / sum(Norm_weights(Residual(:)==0));
    
    % Add the Norm_factor to the allocated resources of greedy flows
    % Run the following loop for all the greedy flows
    Total_Residual = 0;
    for i = find(~Residual)
        if (Norm_factor * Norm_weights(i)) + Allocated(i) >= Demands(i)
           Residual(i)  = Allocated(i) + (Norm_factor * Norm_weights(i)) - Demands(i);
           Total_Residual = Total_Residual + Residual(i);
           Allocated(i) = Demands(i);
        else
           Allocated(i) = Allocated(i) + (Norm_factor * Norm_weights(i));
        end
    end  
end    

% The final answer (allocated resources) are stored in Allocated matrix
Demands
Allocated
