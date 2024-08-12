#!/bin/bash
echo "Checking Java running"
sudo yum install java-17-amazon-corretto.x86_64 -y
java -version
