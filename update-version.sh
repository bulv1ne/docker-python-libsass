#!/bin/sh

pip install -U libsass

echo FROM python:3.5 > Dockerfile
echo RUN pip install -U pip >> Dockerfile
echo RUN pip install $(pip freeze | grep libsass) >> Dockerfile

VERSION=$(pip freeze | grep libsass | sed 's/.*==//')

git commit Dockerfile -m "Update libsass to $VERSION"

git tag -a $VERSION -m "Update to version $VERSION"
