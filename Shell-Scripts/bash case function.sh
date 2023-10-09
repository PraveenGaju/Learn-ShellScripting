#!/bin/bash
aws_regions=$1
case $aws_regions in
    eastus)
    echo "It has 6 AZs"
    ;;
    eastus2)
    echo "It has 3 Azs"
    ;;
    westus)
    echo "It has 3 Azs"
    ;;
    *)
    echo "region is not part of the list"
    ;;
esac
