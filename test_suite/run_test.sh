#!/bin/bash
set -e
set -x

which wget
which curl
which unzip
which javac
which java

wget -c 'http://selenium-release.storage.googleapis.com/2.46/selenium-java-2.46.0.zip'
unzip -o selenium-java-2.46.0.zip
javac -g -cp ".:./selenium-2.46.0/selenium-java-2.46.0.jar:./selenium-2.46.0/libs/*" -g SimpleTest.java
URL="http://127.0.0.1:4444/grid/admin/AutomationTestRunServlet?uuid=testRun1&threadCount=3&browser=chrome&os=windows"
STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" ${URL})
case ${STATUSCODE} in
    202)
      ;;
    201)
      sleep 250
      ;;
    *)
      exit ${STATUSCODE}
      ;;
esac
java -cp ".:./selenium-2.46.0/selenium-java-2.46.0.jar:./selenium-2.46.0/libs/*" SimpleTest
