provider "google" {
  project     = var.PROJECT_NAME
  region      = var.REGION_NAME
}

resource "google_bigquery_dataset" "market_data" {
  dataset_id                  = "market_data"
  description                 = "This is the dataset holding market data."
  location                    = "US"
}

resource "google_bigquery_table" "nbbo" {
  table_id = "nbbo"
  dataset_id = google_bigquery_dataset.market_data.dataset_id
  schema = <<EOF
[
    {
      "description": "trade date",
      "mode": "REQUIRED",
      "name": "trade_date",
      "type": "DATE"
    },
    {
      "description": "timestamp",
      "mode": "REQUIRED",
      "name": "timestamp",
      "type": "DATETIME"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "symbol",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "bid",
      "type": "FLOAT"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "bid_size",
      "type": "INTEGER"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "ask",
      "type": "FLOAT"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "ask_size",
      "type": "INTEGER"
    }
]
EOF
}

resource "google_bigquery_dataset" "order_data" {
  dataset_id                  = "order_data"
  description                 = "This is a dataset for your proprietary order data."
  location                    = "US"
}

resource "google_bigquery_table" "orders" {
  table_id = "orders"
  dataset_id = google_bigquery_dataset.order_data.dataset_id
  schema = <<EOF
[
    {
      "description": "trade date",
      "mode": "REQUIRED",
      "name": "trade_date",
      "type": "DATE"
    },
    {
      "description": "timestamp",
      "mode": "REQUIRED",
      "name": "timestamp",
      "type": "DATETIME"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "trading_model",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "account",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "order_id",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "event",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "symbol",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "exchange",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "side",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "size",
      "type": "INTEGER"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "price",
      "type": "FLOAT"
    },
    {
      "description": "",
      "mode": "REQUIRED",
      "name": "tif",
      "type": "STRING"
    },
    {
      "description": "",
      "mode": "NULLABLE",
      "name": "prev_size",
      "type": "INTEGER"
    },
    {
      "description": "",
      "mode": "NULLABLE",
      "name": "prev_price",
      "type": "FLOAT"
    },
    {
      "description": "",
      "mode": "NULLABLE",
      "name": "fill_size",
      "type": "INTEGER"
    },
    {
      "description": "",
      "mode": "NULLABLE",
      "name": "fill_price",
      "type": "FLOAT"
    },
    {
      "description": "",
      "mode": "NULLABLE",
      "name": "exec_id",
      "type": "STRING"
    }
]
EOF
}
