#!/bin/bash
for f in `cat test`;
do
        aws s3api put-public-access-block \
                --bucket $f \
                --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true" --profile holyswaggerapp;
done
