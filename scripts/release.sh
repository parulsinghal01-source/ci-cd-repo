#!/bin/bash

echo "Starting Release Process"

VERSION=$(date +%Y.%m.%d.%H%M)

echo "New Version: v$VERSION"

git tag -a "v$VERSION" -m "Release v$VERSION"
git push origin 'v$VERSION'

echo "Release tagged successfully"

