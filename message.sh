#!/usr/bin/env bash
# TODO
echo "================================================================================"
echo "Uploader for Unity Cloud Build"
echo "================================================================================"
usage() {
echo "ucb-post-build.sh [?] [BUILD_PATH]"
echo " [1] build output path. Provided by UCB."
echo " [2] Path to build file e.g. IPA file. Provided by UCB."
echo " [3] build target name. Provided by UCB."
echo " [4] platform: ios|android. Provided by UCB"
echo " [?] additional build parameters"
echo " TESTFLIGHT_USER parameter must be set to a valid TestFlight username for uploading the IPA."
echo " TESTFLIGHT_PASSWORD parameter must be set to a password matching the TestFLight user."
echo " FIREBASE_TOKEN parameter must be set to the Firebase authorization token. See 'firebase login:ci'."
echo " FIREBASE_APP_ID parameter must be set to the Firebase App Id for this build"
echo " FIREBASE_GROUPS comma separated list of firebase groups to send build to"
echo " BUILD_FILE_NAME name of the build file e.g. 'wormhole.apk'"
exit 1
}
if [ -z $FIREBASE_TOKEN ]
then
echo "FIREBASE_TOKEN not set"
usage
fi
if [ -z $FIREBASE_APP_ID ]
then
echo "FIREBASE_APP_ID not set"
usage
fi
if [ -z $FIREBASE_GROUPS ]
then
echo "FIREBASE_GROUPS not set"
usage
fi
if [ -z $BUILD_FILE_NAME ]
then
echo "BUILD_FILE_NAME not set"
usage
fi
if [ -z $TESTFLIGHT_USER ]
then
echo "TESTFLIGHT_USER not set"
usage
fi
if [ -z $TESTFLIGHT_PASSWORD ]
then
echo "TESTFLIGHT_PASSWORD not set"
usage
fi
echo "================================================================================"
echo "Checking settings"
echo "================================================================================"
BUILD_OUTPUT_PATH=${1}
UNITY_PLAYER_PATH=${2}
BUILD_TARGET=${3}
BUILD_PLATFORM=${4}
echo BUILD_OUTPUT_PATH=$BUILD_OUTPUT_PATH
echo UNITY_PLAYER_PATH=$UNITY_PLAYER_PATH
echo BUILD_TARGET=$BUILD_TARGET
echo BUILD_PLATFORM=$PLATFORM
echo "Node version: $(npm -v)"
echo "NPM version $(npm -v)"
echo "NPX version $(npx -v)"
echo "Uploading to Firebase"
echo "FIREBASE_APP_ID=$FIREBASE_APP_ID"
echo "FIREBASE_GROUPS=$FIREBASE_GROUPS"
echo "BUILD_FILE_NAME=$BUILD_FILE_NAME"
echo "BUILD_NUMBER=$BUILD_NUMBER"
echo "FIREBASE_APP_ID=$FIREBASE_APP_ID"
echo "FIREBASE_TOKEN=$FIREBASE_TOKEN"