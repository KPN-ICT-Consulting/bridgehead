#/*
# * Copyright (c) 2018 KPN
# *
# * Permission is hereby granted, free of charge, to any person obtaining
# * a copy of this software and associated documentation files (the
# * "Software"), to deal in the Software without restriction, including
# * without limitation the rights to use, copy, modify, merge, publish,
# * distribute, sublicense, and/or sell copies of the Software, and to
# * permit persons to whom the Software is furnished to do so, subject to
# * the following conditions:
# *
# * The above copyright notice and this permission notice shall be
# * included in all copies or substantial portions of the Software.
#
# * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#*/

locals {
	bucket_name 	= "${format("%s%s", var.bucket["s3_bucket_name"], var.isStaging ? "-dev" : "-prod")}"
	dynamodb_name 	= "${format("%s%s", "terraform-state-lock-dynamo", var.isStaging ? "-dev" : "-prod")}"
}

provider "aws" {
	profile = "default"
	region = "${var.region}"
}

#
# S3 BUCKET FOR TF STATE
#
resource "aws_s3_bucket" "state_bucket" {
	count					= "${var.createStateStorage == "true" ? 1 : 0}"
	
	bucket 					= "${local.bucket_name}"
	acl    					= "private"
	
	#policy 					= "${file("${path.module}/policies/s3.json")}"
	
	versioning {
		enabled 			= "${var.bucket["s3_bucket_versioning"]}"
	}
	
	lifecycle {
		prevent_destroy		= true
	}
	
	tags {
		Name 				= "${var.bucket["bucket_name_tag"]}"
	}
}

# DynamoDB table for locking state file
#
resource "aws_dynamodb_table" "dynamodb_tf_state_lock" {
	count					= "${var.createStateStorage == "true" ? 1 : 0}"
	
	name 					= "${local.dynamodb_name}"
	hash_key 				= "LockID"
	read_capacity			= 20
	write_capacity			= 20
		
	attribute {
		name				= "LockID"
		type				= "S"
	}
	
	tags {
		Name				= "DynamoDB Terraform State Lock Table"
	}
}
