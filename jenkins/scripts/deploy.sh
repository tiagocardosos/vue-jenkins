#!/usr/bin/env sh

echo 'The following "npm" command builds your Node.js/Vue.js application for'
echo 'production in the local "build" directory (i.e. within the'
echo '"/var/jenkins_home/workspace/vue-jenkins" directory),'
echo 'correctly bundles React in production mode and optimizes the build for'
echo 'the best performance.'
set -x
npm run build
set +x

echo 'The following "npm" command runs your Node.js/Vue.js application in'
echo 'development mode and makes the application available for web browsing.'
echo 'The "npm start" command has a trailing ampersand so that the command runs'
echo 'as a background process (i.e. asynchronously). Otherwise, this command'
echo 'can pause running builds of CI/CD applications indefinitely. "npm start"'
echo 'is followed by another command that retrieves the process ID (PID) value'
echo 'of the previously run process (i.e. "npm start") and writes this value to'
echo 'the file ".pidfile".'
set -x
http-server ./dist -p 3000 &
sleep 1
echo $! > .pidfile
set +x

echo 'Now...'
echo 'Visit http://159.89.228.239:3000 to see your Node.js/Vue.js application in action.'
echo '(This is why you specified the "args ''-p 3000:3000''" parameter when you'
echo 'created your initial Pipeline as a Jenkinsfile.)'

set -x
mkdir ../project1
mkdir ../project2
cd ../project1
touch file1.txt
set +x
