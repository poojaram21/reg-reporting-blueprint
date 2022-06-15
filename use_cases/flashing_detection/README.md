# Example use case: Flashing Detection

This folder contains an example reporting solution for Flashing Detection on a financial exchange.
Flashing in a financial market is a type of <a href="https://en.wikipedia.org/wiki/Spoofing_(finance)">Spoofing</a> in which participants submit an order that is not intended to be fulfilled, but rather only to move the market materially in order to benefit a subsequent order. In the world of High Frequency Trading, these types of operations typically happen within milliseconds.

The code herein is designed to use the power of BigQuery to effortlessly scale these complex analytics to terabytes or beyond of data with no additional operational overhead.

This example was built in collaboration between Google and Strike Technologies Services LLC, a subsidiary of Global Trading Systems (GTS).

This example contains the following folders:
* `data`: contains an example schema as well as a Python script to generate sample data within that schema 
* `dbt`: contains a DBT project which specifies the source to report transformations

## How to tailor the code to your need

If you wish to use this solution in a real implementation, you may want to start by tailoring the following files to 
your needs:
* Example 1
* Example 2