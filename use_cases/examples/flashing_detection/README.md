# Example use case: Flashing Detection

This folder contains an example reporting solution for Flashing Detection on a financial exchange.
Flashing in a financial market is a type of <a href="https://en.wikipedia.org/wiki/Spoofing_(finance)">Spoofing</a> in which participants submit an order that is not intended to be fulfilled, but rather only to move the market materially in order to benefit a subsequent order. In the world of High Frequency Trading, these types of operations typically happen within milliseconds.

The code herein is designed to use the power of BigQuery to effortlessly scale these complex analytics to terabytes or beyond of data with no additional operational overhead.

This example was built in collaboration between Google and Strike Technologies Services LLC, a subsidiary of Global Trading Systems (GTS).

This example contains the following folders:
* `data`: contains an [example schema codified in Terraform](./data/schema/example.tf), as well as a Python script to generate sample data within that schema 
* `dbt`: contains a DBT project which specifies the source to report transformations

## How to run this example as-is

In order to run this example, first modify (at a minimum) the following properties in [environment-variables.sh](../../../environment-variables.sh):
* TF_VAR_FLASHING_BQ_MARKET_DATA - set this to be the name of the dataset in which you will store market data
* TF_VAR_FLASHING_BQ_ORDER_DATA - set this to be the name of the dataset in which you will store order data
* PROJECT_ID - the Google Cloud project in which you will create and store your market data and the flashing detection models. **Note:** By default it will choose the output of `gcloud config get-value project`

Then, [create and export service account credentials](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) for a service account with permissions to create datasets, views, and tables within the specified project.
Please consider the principle of least privilege in creating and securing the service account credentials file. [More information available here](https://cloud.google.com/iam/docs/best-practices-for-managing-service-account-keys).

Lastly, set the GOOGLE_APPLICATION_CREDENTIALS environment variable to point to the service account credentials keyfile. e.g. `export GOOGLE_APPLICATION_CREDENTIALS=/path/to/your/keyfile.json`

## How to tailor the code to your needs

If you wish to use this solution for your implementation, you may want to start by tailoring the following files to your needs:
1. [reg-reporting-blueprint/environment-variables.sh](../../../environment-variables.sh) - Contains various environment setup variables subsequently used by Terraform and DBT
2. [reg-reporting-blueprint/use_cases/examples/flashing_detection/data/schema/example.tf](./data/schema/example.tf) - Contains sample schemata for datasets and tables for market data and orders
3. reg-reporting-blueprint/use_cases/examples/flashing_detection/dbt/models/*.yml and *.sql - `*.sql` contains the definition of the models that lead us to finding the flashing events, while `*.yml` defines the description and contraints on the fields therein.