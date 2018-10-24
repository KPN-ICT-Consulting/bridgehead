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

# ==== Default Region ====
variable "region" {
	description = "Region to setup"
}

#
# Bucket for TF state
#
variable "bucket" {
	description = "Terraform State S3 bucket configuration"
	type = "map"
	default = {
		s3_bucket_name			= "kma-terraform"
		bucket_name_tag 		= "Terraform State"
		s3_bucket_versioning 	= "true"			# true if enabled, false is disabled
	}
}

variable "isStaging" {
	description = "set to true if the Staging environment should be created. For Production set to false."
}
variable "createStateStorage" {
	description = "set to true if we need to create the buckets. See explanation in comment"
}
