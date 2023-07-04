echo ********		Mounting all ntfs hard disks		*************

ntfsfix /dev/sda2
ntfsfix /dev/sda3

mkdir /media/mohsh/EDU
mkdir /media/mohsh/Prog
mkdir /media/mohsh/SSD

echo mounting points created

mount -t ntfs /dev/sda2 /media/mohsh/Prog
mount -t ntfs /dev/sda3 /media/mohsh/EDU
mount -t ntfs /dev/nvme0n1p3 /media/mohsh/SSD

echo Disks mounted successfully

