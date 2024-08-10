#!/bin/bash

# Exit on any error
set -e

# Define variables
TOMCAT_DIR="/opt/tomcat"
APP_NAME="spring-petclinic"
APP_FILE=$(ls /opt/tomcat/webapps/spring-petclinic-*.jar | head -n 1)  # Adjust if deploying WAR files

# Functions
stop_tomcat() {
    echo "Stopping Tomcat..."
    sudo systemctl stop tomcat
}

start_tomcat() {
    echo "Starting Tomcat..."
    sudo systemctl start tomcat
}

remove_old_app() {
    echo "Removing old application..."
    # Remove old application version
    sudo rm -f ${TOMCAT_DIR}/webapps/${APP_NAME}*.jar
}

deploy_new_app() {
    echo "Deploying new application..."
    # Deploy new application version
    sudo cp /opt/tomcat/webapps/${APP_NAME}-*.jar ${TOMCAT_DIR}/webapps/
}

# Main script execution
echo "Starting deployment..."

stop_tomcat

remove_old_app

deploy_new_app

start_tomcat

echo "Deployment completed successfully!"
