% 4x4 grid network
adj_matrix = [ 
0 1  0  0  1 0  0 0  0 0 0 0  0 0  0  0; %1
1 0  1  0  0 1  0 0  0 0 0 0  0 0  0  0; %2
0 1  0  1  0 0  1 0  0 0 0 0  0 0  0  0; %3
0 0  1  0  0 0  0 1  0 0 0 0  0 0  0  0; %4
1 0  0  0  0 1  0 0  1 0 0 0  0 0  0  0; %5
0 1  0  0  1 0  1 0  0 1 0 0  0 0  0  0; %6
0 0  1  0  0 1  0 1  0 0 1 0  0 0  0  0; %7
0 0  0  1  0 0  1 0  0 0 0 1  0 0  0  0; %8
0 0  0  0  1 0  0 0  0 1 0 0  1 0  0  0; %9
0 0  0  0  0 1  0 0  1 0 1 0  0 1  0  0; %10
0 0  0  0  0 0  1 0  0 1 0 1  0 0  1  0; %11
0 0  0  0  0 0  0 1  0 0 1 0  0 0  0  1; %12
0 0  0  0  0 0  0 0  1 0 0 0  0 1  0  0; %13
0 0  0  0  0 0  0 0  0 1 0 0  1 0  1  0; %14
0 0  0  0  0 0  0 0  0 0 1 0  0 1  0  1; %15
0 0  0  0  0 0  0 0  0 0 0 1  0 0  1  0];%16
vertices_weights = [6 5 4 3 2 1 7 8 9 10 1 20 3 4 5 200];
%------------------------------------------------------------
[row,col] = size(adj_matrix);
% Building Constraint matrix [we need to have an equation for each edge]
% So each row of matrix A represents an equation
A = [];
for i = 1:row
    for j = 1:row
       tmp = zeros(1,col);
       if adj_matrix(i,j) == 1
           tmp(1,i) = -1;
           tmp(1,j) = -1;
           % append new constraint to A
           A = [A;repmat(tmp,1,1)];
       end  
    end
end
% Remove duplicated equations
A = unique(A, 'rows');
[r,c] = size(A);
% Initialize the variables of linear program
b = -ones(r,1);
f = vertices_weights;
LB = zeros(1,row);
UB = ones(1,row);
% Solve linear program
X = linprog(f,A,b,[],[],LB,UB);
% Perform rounding (2-approvimation algorithm)
Ans = zeros(row,1);
for k = 1:row
    if X(k,1) >= 0.5
        Ans(k,1) = 1;
        fprintf('Vertex %d is a member of min vertex cover.\n',k);
    end
end
