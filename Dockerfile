# Copyright (c) 2022, Arm Limited and Contributors
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 the "License";
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

FROM alpine:3.17 AS build

RUN apk update

RUN apk add flex flex-dev alpine-sdk

ADD assets/vk_convert.lex /tmp/vk_convert.lex

RUN set -x \
    && cd /tmp \
    && flex -+ vk_convert.lex \
    && gcc -o snake_case_check_flex lex.yy.cc -lstdc++

FROM alpine:3.17 AS final

RUN apk add --update git python3

COPY --from=build /tmp/snake_case_check_flex /usr/local/bin

ADD scripts/snake_case_check.py /usr/local/bin/snake_case_check.py
