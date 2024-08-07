#!/bin/bash

git tag -d 0.3.2
git push origin --delete 0.3.2
git tag 0.3.2
git push origin 0.3.2

