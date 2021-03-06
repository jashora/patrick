# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

context("Parameterized tests")

with_parameters_test_that("Running tests:", {
    if (test_name == "success") {
      testthat::expect_success(testthat::expect_true(case))
    } else {
      testthat::expect_failure(testthat::expect_true(case), "`case` isn't true")
    }
  },
  test_name = c("success", "fail", "null"),
  case = list(TRUE, FALSE, NULL),
)

with_parameters_test_that("Names are added", {
    testthat::expect_true(test_name == "")
  },
  case = TRUE
)

with_parameters_test_that("Cases are correctly evaluated:", {
    testthat::expect_length(vec, len)
  },
  cases(
    one = list(vec = 1, len = 1),
    ten = list(vec = 1:10, len = 10)
  )
)
