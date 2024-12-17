# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

If you use random partitioning, you'll get all of the data evenly distributed. So it wouldn't matter that most of the AquaByte's data is being collected at a specific time.
However, when you want to find a specific piece of data you have to search all of the boats for it so your queries will take longer to run.

## Partitioning by Hour

This is a good method if you need to prioritize finding the information in a specific place. However, as a tradeoff you might end up getting the information distributed reallu unevenly between the boats which would happen in the case of AquaByte.

## Partitioning by Hash Value

Has Values has similar benefits and downsides as random partitioning, things will be evenly distributed but information has to be searched through all of the boats in many cases.
However, if you have a specific value, you can find the hash for it and only search for it on one boat. This is a benefit over the random partitioning method.
