#!/bin/bash

git add .
git commit -m "sync: $(date +"%Y-%m-%d %H:%M:%S")"
git push origin main