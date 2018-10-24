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

#
# IAM Users
#
resource "aws_iam_user" "iam_root" {
	name = "${var.iam_root}"
	path = "/cal/"
}

# The most important part is the iam:PassRole. With that, this user can give roles to ECS tasks.
# In theory the user can give the task Admin rights. To make sure that does not happen we restrict
# the user and allow him only to hand out roles in /ecs/ path. You still need to be careful not
# to have any roles in there with full admin rights, but no ECS task should have these rights!
resource "aws_iam_user_policy" "iam_root_policy" {
	name = "iam_root_policy"
	user = "${aws_iam_user.iam_root.name}"
	
	policy = "${file("${path.module}/policies/root.json")}"
}

resource "aws_iam_access_key" "iam_root" {
	user = "${aws_iam_user.iam_root.name}"
}
