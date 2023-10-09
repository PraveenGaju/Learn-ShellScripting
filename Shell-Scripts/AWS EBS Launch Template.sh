#creating EBS in multiple AZs
#!/bin/bash
azs {'us-east-1a' 'us-east-1b' 'us-east-1c' 'us-east-1d'}
I=1
for az in ${azs[@]}
do
    ec2 create-volume --volume-type gp2 --size 1 --availability-zone $az \
        --tag-specifications 'ResourceType=volume,Tags=[{Key=name,Value=EBSvol-'${I}'},{Key=cost-center,Value=cc123}]'
    I=$((I + 1))
    sleep 1
done
