#!/bin/sh

pip install -U libsass

echo FROM python:3.5 > Dockerfile
echo RUN pip install -U pip >> Dockerfile
echo RUN pip install $(pip freeze | grep libsass) >> Dockerfile

git commit Dockerfile -m "Update to version $(pip freeze | grep libsass)"
