#!/usr/bin/env bash

set -ex

JENKINS_CRUMB=$(
    curl -s \
    --user ${JENKINS_USER}:${JENKINS_TOKEN} \
    "${JENKINS_API_URL}/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)"
)
curl -s -X POST -H $JENKINS_CRUMB \
-F "jenkinsfile=<Jenkinsfile" \
--user ${JENKINS_USER}:${JENKINS_TOKEN} \
${JENKINS_API_URL}/pipeline-model-converter/validate
