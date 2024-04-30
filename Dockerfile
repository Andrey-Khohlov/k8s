FROM ubuntu:latest
LABEL authors="xgb"

ENTRYPOINT ["top", "-b"]