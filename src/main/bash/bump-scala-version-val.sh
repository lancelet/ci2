#!/bin/bash
#   Copyright 2016 Commonwealth Bank of Australia
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# Bumps version number for variables i.e. `val scalazVersion = "1.2"`
# Usage bump-scala-version-val.sh valname version

set -o nounset
set -o errexit

restr="s/\\(.*val $1 *= *\\\"\\)[^\\\"]*/\\1$2/g"

for f in *.sbt; do
  [ -e $f ] && sed -i.bak "$restr" $f
done

for f in project/*.scala; do
  [ -e $f ] && sed -i.bak "$restr" $f
done

for f in project/*.sbt; do
  [ -e $f ] && sed -i.bak "$restr" $f
done
