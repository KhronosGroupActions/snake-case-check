# Snake Case Check

A docker image containing a Snake Case Check script. Uses a multi-stage build to reduce the size of the docker image.

#### Proposed Usage

```bash
python3 /usr/local/bin/snake_case.py $TARGET_BRANCH > snake-report.txt
# Checking this file to see if its empty or not indicates if there are snake case errors
if [ $(grep -c '@@' snake-report.txt) -gt 0 ]; then cat snake-report.txt; exit 1; fi
```

### Supported Versions

| Version |                       Image                        |
| :-----: | :------------------------------------------------: |
| latest  | ghcr.io/khronosgroupactions/snake-case-check:latest |
|  1.0.0  | ghcr.io/khronosgroupactions/snake-case-check:1.0.0  |