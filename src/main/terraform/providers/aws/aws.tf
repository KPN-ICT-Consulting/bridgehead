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

provider "aws" {
	#shared_credentials_file = "${path.cwd}/tf-temp/credentials"
	profile = "bridgehead"
	profile = "default"
	region = "${var.region}"
}

#
# S3 bucket for storing TF state
#
module "s3_buckets" {
	source = "./s3"
	
	count					= "${var.bucket["count"]}"
	
	s3_bucket_name			= "${format("%s%s", var.bucket["s3_bucket_name"], var.isStaging ? "-dev" : "-prod")}"
	bucket_name_tag			= "${var.bucket["bucket_name_tag"]}"
	s3_bucket_versioning	= "${var.bucket["s3_bucket_versioning"]}"
}

module "iam" {
	source = "./iam"
	
	iam_root = "${var.iam_root}"
}