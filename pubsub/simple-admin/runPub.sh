#!/bin/bash
# © Copyright IBM Corporation 2020
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script starts an instance of a sample MQ application.
# This sample, amqspub, is provided with the MQ SDK package.
# Use of this sample also demonstrates how 'non reconnectable'
# applications can be enabled to autoreconnect, in this case via
# the CCDT.

# The application will connect using the details within the CCDT.JSON
# file which is found in the same directory as this script (once
# createCluster.sh has been run)
rel_dir="$(dirname "$0")"
export MQCHLLIB=$rel_dir
export MQCHLTAB=CCDT.JSON

# Check that the CCDT.JSON file exists before starting the application
if [ -f "$MQCHLLIB/$MQCHLTAB" ]; then

# Start a single instance of the sample application
$MQ_INSTALLATION_PATH/samp/bin/amqspub 'demo/testtopic' *ANY_QM

else
  echo "$MQCHLLIB/$MQCHLTAB not found"
fi
