#   Copyright 2014 Commonwealth Bank of Australia
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

#!/bin/bash -euv

if [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH == "master" ]]; then
    if [ $# -eq 0 ]; then
        sbt -Dsbt.global.base=$TRAVIS_BUILD_DIR/ci ';set publishTo in ThisBuild := Some("commbank-releases-ivy" at "http://commbank.artifactoryonline.com/commbank/ext-releases-local-ivy"); set publishMavenStyle in ThisBuild  := false; publish'
    else
        for project in $@; do
            echo "Publishing $project"
            sbt -Dsbt.global.base=$TRAVIS_BUILD_DIR/ci ";project $project; set publishTo in ThisBuild := Some(\"commbank-releases-ivy\" at \"http://commbank.artifactoryonline.com/commbank/ext-releases-local-ivy\"); set publishMavenStyle in ThisBuild  := false; publish"
        done
    fi
else
    echo "Not on master. Nothing to deploy"
fi