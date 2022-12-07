# Data Warehouse Implementation

## Implementing a data warehouse?

* Monitoring
* Integrating
* Processing
* Managing

## Multi-tiered architecture

* Different from multi-layer architecture

## Monitoring

* Source Types: relational, flat file,...
* Incremental vs. Refresh

## Integrating

* Cleaning Data
* Loading Data
  * Incremental vs. Refresh
  * Offline vs. Online
  * Frequency of loading
  * Parallel/Partitioned load

## Processing

* Derived warehouse data
  * Indexes
  * Aggregation
  * Materialized views

* When to update derived data?

* How? - Incremental vs. Refresh

* Materialized Views

* Cube Aggregates Lattice

* Dimension Hierarchies

* Interesting Hierarchy

* Indexing OLAP data: bitmap index

* Joining data
  * Equality Joins with one column
    * Cost metrics: I/O cost
    * Nested Loops join
    * Block Nested Loops Join
    * Index Nested Loops Join
    * Sort-Merge Join
    * Hash Join

## Row Store and Column Store

* Column Store
  * C-Store
  * Vertica

## Google BigQuery (Dremel)
