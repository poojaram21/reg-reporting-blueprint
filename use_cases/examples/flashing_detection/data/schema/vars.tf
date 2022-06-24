variable "PROJECT_ID" {
	type		= string
	description	= "The GCP project name to use for your flashing reporting schema"
}

variable "REGION_NAME" {
	type		= string
	description	= "The GCP region in which to populate the sample flashing report data"
	default		= "us-central1"
}
