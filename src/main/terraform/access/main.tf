#/*
# * Copyright (c) 2018 KPN, 
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

# Note: This file is based upon the awslabs terraform demo, located at:
#
#     https://github.com/awslabs/apn-blog/blob/tf_blog_v1.0/terraform_demo/
#

module "aws" {
	source = "./providers/aws"
	
	region 		= "BRANCH_BASED_REGION"
	iam_root 	= "BRANCH_BASED_CAL_DEPLOYER"
  	isStaging	= "${var.staging}"
  	dynamodb	= "terraform-state-lock-dynamo-STAGING_ENV"
}

terraform {
	required_version = "> 0.7.0"
	backend "s3" {
		bucket 			= "kma-terraform-STAGING_ENV"
		dynamodb_table 	= "terraform-state-lock-dynamo-STAGING_ENV"
		key    			= "terraform/bridgehead-tfstate"
		region 			= "BRANCH_BASED_REGION"
	}
}

