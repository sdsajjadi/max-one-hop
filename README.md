In communication networks, multiplexing and the division of scarce resources, max-min fairness is said to be achieved by an allocation if and only if the allocation is feasible and an attempt to increase the allocation of any participant necessarily results in the decrease in the allocation of some other participant with an equal or smaller allocation.

In best-effort statistical multiplexing, a first-come first-served (FCFS) scheduling policy is often used. The advantage with max-min fairness over FCFS is that it results in traffic shaping, meaning that an ill-behaved flow, consisting of large data packets or bursts of many packets, will only punish itself and not other flows. Network congestion is consequently to some extent avoided.

Fair queuing is an example of a max-min fair packet scheduling algorithm for statistical multiplexing and best effort packet-switched networks, since it gives scheduling priority to users that have achieved lowest data rate since they became active. In case of equally sized data packets, round-robin scheduling is max-min fair.

In this code, we implemented the weighted version of max-min fairness algorithm in MATLAB.
