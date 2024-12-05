#!/bin/bash
ENTER="n"
NAME=""
VMID=""
TEMPLATE=""
POOL=""
# Image Configuration
conf_image() {
virt-customize -a $TEMPLATE --update
virt-customize -a $TEMPLATE --install qemu-guest-agent
virt-customize -a $TEMPLATE --ssh-inject root:file:$PWD/my_keys.txt
virt-customize -a $TEMPLATE ---run-command 'systemctl enable --now qemu-guest-agent'
}
# Creating a template
create_vm() {
qm create $VMID --name $NAME --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk $VMID impish-server-cloudimg-amd64.img $POOL
qm set $VMID --scsihw virtio-scsi-pci --scsi0 $POOL:vm-9000-disk-0
qm set $VMID --boot c --bootdisk scsi0
qm set $VMID --ide2 $POOL:cloudinit
qm set $VMID --serial0 socket --vga serial0
qm set $VMID --agent enabled=1

}
# Launching the script
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

cat << EOF
 ##                      #          #  #  #  #  
#  #                     #          #  #  ####  
#     ###    ##    ###  ###    ##   #  #  ####  
#     #  #  # ##  #  #   #    # ##  #  #  #  #  
#  #  #     ##    # ##   #    ##     ##   #  #  
 ##   #      ##    # #    ##   ##    ##   #  #
EOF
sleep 2
echo "Press enter to continue [y/n]"
read ENTER
if [ $ENTER = "y" ] ;
    then 
	echo "I'm starting to configure and create a template"
	conf_image
	create_vm;
	else 
	echo "NO"
	exit;
fi