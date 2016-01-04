A collection of codes for max-one-hop delivery project

1. Weighted Max-Min Fairness
------------------------------------
In communication networks, multiplexing and the division of scarce resources, max-min fairness is said to be achieved by an allocation if and only if the allocation is feasible and an attempt to increase the allocation of any participant necessarily results in the decrease in the allocation of some other participant with an equal or smaller allocation.

In best-effort statistical multiplexing, a first-come first-served (FCFS) scheduling policy is often used. The advantage with max-min fairness over FCFS is that it results in traffic shaping, meaning that an ill-behaved flow, consisting of large data packets or bursts of many packets, will only punish itself and not other flows. Network congestion is consequently to some extent avoided.

Fair queuing is an example of a max-min fair packet scheduling algorithm for statistical multiplexing and best effort packet-switched networks, since it gives scheduling priority to users that have achieved lowest data rate since they became active. In case of equally sized data packets, round-robin scheduling is max-min fair.

The first program (WeightedMaxMinFairness.m) implements the weighted version of max-min fairness algorithm in MATLAB.

2. Vertex Cover Problem
-------------------------------------
In the mathematical discipline of graph theory, a vertex cover (sometimes node cover) of a graph is a set of vertices such that each edge of the graph is incident to at least one vertex of the set. The problem of finding a minimum vertex cover is a classical optimization problem in computer science and is a typical example of an NP-hard optimization problem that has an approximation algorithm. Its decision version, the vertex cover problem, was one of Karp's 21 NP-complete problems and is therefore a classical NP-complete problem in computational complexity theory. Furthermore, the vertex cover problem is fixed-parameter tractable and a central problem in parameterized complexity theory. The minimum vertex cover problem can be formulated as a half-integral linear program whose dual linear program is the maximum matching problem.

The second program (VertexCover.m) implements a 2-Approximattion Algorithm for finding the Vertex Cover of a given graph. The inputs are the adjacency matrix of the given graph and the weights of all vertices.
