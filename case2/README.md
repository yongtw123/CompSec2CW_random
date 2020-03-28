Case 2： Data Synchronization Resource-Freeing Attack(RFA)
====================================================================

Attack Introduction
---------------------------------------------------------------------
The basic idea of the second case is to exploit the writeback mechanism for disk data synchronization. There are multiple ways to trigger 
the data synchronization, including periodically writeback and insufficient memory. Here i'm using C system call `sync()` included in
`unistd.h` to trigger data writeback. Particularly, data synchronization triggered by `sync` could be exploited to slow down system-wide I/O 
performance, launch resource-freeing attack and build covert channels. Since the I/O performence is hard to measure and covert channel 
attack is hard to implement, we mainly focus on the RFA attack towards the docker cgroup which can be launched by data synchronization.

## How To Get Started

1. Install `docker` on your local environment following the instruction link mentioned earlier.

2. Switch to the root user.

        $ su

3. Change the shell scripts execution permission:

        $ chmod +x case2_attacker_setup.sh
        
        $ chmod +x case2_victim_setup.sh

4. execute `case2_attacker_setup.sh`

        $ ./case2_attacker_setup.sh

5. Open another terminal and execute `case2_victim_setup.sh`

        $ ./case2_victim_setup.sh
    
6. Open a new terminal and run `top` or `docker stats` to check the CPU utilization of `attacker container` and `victim container`. 

7. As a result you will find that the `attacker container` process takes up about `56%` of CPU resources and `victim container` process only takes up about `37%` of
CPU resources where the two container processes are binded to the same core with the same cpu share proportion `--cpuset-cpus 0 --cpu-shares 512`.  Whereas, if i don't launch the attack, the two container processes will have the same CPU utilization ratio `47%` which is indicated in contrast experiment. 
In fact, as the two container processes are binded to the same core with the same cpu share proportion, the CPU utilizations of this two containers are expected to be the same with the control of `cgroups`. Apparently, there is a significant reduction on the CPU utilization of `victim container` when you launching the data synchronization attack.
Hence, our attack can successfully break the rein of `cgroups` on docker containers.
    
    
    
    
   
