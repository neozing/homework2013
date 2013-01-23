#!/bin/bash

boot_input=$1
source_input=$2
output_file=$3
bootloader_install=$4/sbin/grub-install
image_size=$5
#mkdiskimage -M ${output_file} ${image_size} 255 63
#parted -s ${output_file} mkfs 1 ext2

dd if=/dev/zero of=${output_file} bs=1M count=${image_size}
fdisk  ${output_file}

# mount whole disk
loop_disk=/dev/loop0 #`sudo losetup -f`
sudo losetup ${loop_disk} ${output_file}
 
# mount first partition
loop_dev=/dev/loop1 #`sudo losetup -f`
temp_dir=`mktemp -d /tmp/pack-XXXXX`
sudo losetup -o 1048576 ${loop_dev} ${output_file}

# format to ext3
sudo mkfs -t ext3 ${loop_dev}

# dirty code here ...
sudo mkdir -p ${temp_dir}/boot/grub

# mount & copy files from rootfs
sudo mount ${loop_dev} ${temp_dir}
sudo cp -R ${source_input}/* ${temp_dir}

# dirty code here ...
sudo mkdir -p ${temp_dir}/boot/grub

# dirty code again ...
sudo bash -c "cat > ${temp_dir}/boot/grub/device.map" << EOF
(hd0)   /dev/loop0
(hd0,1) /dev/loop1
EOF

# install bootloader
sudo ${bootloader_install} --no-floppy --boot-directory=${temp_dir}/boot ${loop_disk}

# dirty code and again
sudo bash -c "cat > ${temp_dir}/boot/grub/grub.cfg" << EOF
set timeout=5
set default=0
menuentry "My Linux kernel" {
    set root=(hd0,1)
    linux /boot/vmlinuz
    initrd /boot/initramfs.img
}
EOF

# copy kernel, initramfs
sudo cp ${boot_input}/* ${temp_dir}/boot

sudo touch ${temp_dir}/.`date +%Y%m%d_%H%M%S`

# unmount, detach loop devices
sudo umount ${temp_dir}
sudo losetup -d ${loop_disk} ${loop_dev}
