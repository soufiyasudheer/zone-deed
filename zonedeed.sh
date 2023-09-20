#!/bin/bash
# Author: SOUFIYA
# Tool Name: zone deed

# Display zone deed
toilet -f big ZONE DEED

# Creating a temporary file for saving data
mkdir tmp_ns
touch tmp_ns/tmp_nameserver.txt

# Collecting name server
read -p "Enter the domain: " a
dig $a ns +short | tee tmp_ns/tmp_nameserver.txt
count=$(cat tmp_ns/tmp_nameserver.txt | wc -l)
echo "Total ${count} name servers found"
# Prompt to save the name servers
read -p "Do you want to save the name servers? (Enter 'yes' or 'no'): " ns_save

if [[ $ns_save == "yes" || $ns_save == "YES" || $ns_save == "y" || $ns_save == "Y" ]]; then
    if [[ ! -z $a ]]; then
        mkdir -p "$a"
        cp -r tmp_ns/tmp_nameserver.txt "$a/nameservers.txt"
        echo "Name servers have been saved in '$a/nameservers.txt'"
    else
        echo "Domain is empty. Name servers not saved."
    fi
else
    echo "Name servers not saved."
fi

# Checking zone transfer
echo "Checking for zone transfer..."
while read line
do
    name=$line
    zonetransfer=$(dig axfr $a @$line)
    if [[ -z "$zonetransfer" ]]; then
        echo -e "Zone transfer for ${line} is not available."
    else
        echo -e "Zone transferring of ${line} : ${zonetransfer} \n" 
    fi
done < tmp_ns/tmp_nameserver.txt

# Cleaning Temporary files
rm -r tmp_ns
echo "Script execution completed"
