#function for vpc listing in az
#function for S3 bucket listing
#!/bin/bash
function testfun1 {
    echo "Getting the S3 list ....."
    aws s3 ls | cut -d " " -f 3
}

testfun() {
    aws ec2 describe-vpcs | jq ".Vpcs[].VpcId" | tr -d '"'
}

testfun1
echo '--------------------------'
testfun
-----------------------------------------
get_VPC() {
    echo "Running the function to list the VPCs in $1"
    VPC_list=$(aws ec2 describe-vpcs | jq .Vpcs[].VpcId | tr -d '"')
    for VPCs in $(echo VPV_list); do
        echo "the VPC Id is $VPCs"
        echo "========================="
    done

}
get_VPC $1
----------------------------------------------------
#function with break and continue commands

#!/bin/bash
numfun() {
    for I in {1..10}; do
        echo $I
        if [ $I -eq 5 ]; then
            echo "$I reache value 5 and now I am breaking"
            break
        fi
        sleep 1
    done
}
numfun

-------------------

#!/bin/bash
delete_Vols() {
    vols=$(aws ec2 describe-volumes | jq ".Volumes[].Volumeid" | tr -d '"')
    for vol in $vols; do
        size=$(aws ec2 describe-volumes --volume-ids $vol | jq ".Volumes[].Size")
        if [ $size -gt 5 ]; then
            echo "$vol is a production volume dont delete"
        else
            echo "Deleting volumes $vol"
            aws ec2 delete-volume --volume-id $vol
        fi
    done
}
delete_vols
