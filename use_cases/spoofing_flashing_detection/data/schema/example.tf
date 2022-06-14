provider "google" {
  project     = "poojaram-test-proj"
  region      = "us-central1"
}

resource "google_bigquery_dataset" "gts_dataset_1" {
  dataset_id                  = "market_data_test"
  friendly_name               = "test_dataset"
  description                 = "This is a test dataset for GTS/Strike Project."
  location                    = "US"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "test_table_1" {
  table_id = "nbbo_test"
  dataset_id = google_bigquery_dataset.gts_dataset_1.dataset_id
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

resource "google_bigquery_dataset" "gts_dataset_2" {
  dataset_id                  = "private_data_test"
  friendly_name               = "test_dataset"
  description                 = "This is a test dataset for GTS/Strike Project."
  location                    = "US"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "test_table_2" {
  table_id = "orders_test"
  dataset_id = google_bigquery_dataset.gts_dataset_2.dataset_id
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


