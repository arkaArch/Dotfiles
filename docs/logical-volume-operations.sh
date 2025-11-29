# Steps to create a lvm partition:

# Create a physical volume:
$pvcreate /dev/nvme0n1p1
# To see a physical volume(s):
$pvdisplay

# Create a volume group from physical volume(s):
$vgcreate name_of_volume_group /dev/nvme0n1p1 /dev/nvme0n1p2
# To see a volume group with:
$vgdisplay  or  $vgs

# Create logical volume(s) from the volume group:
lvcreate -L 30G name_of_volume_group -n name_of_logical_volume
# To see available logical volumes:
$lvdisplay  or  $lvs



# Allocate extra space(10GB) from "volgroup" to "root" named logical volume:
$lvextend -L +10g -n /dev/mapper/fedora-root

# The above command doesn't extend the space the "root" volume group:
# To extend the partition:
$resize2fs /dev/mapper/fedora-root

# Note: Shrinking in lvm is a bad idea. Try to avoid it AMAP. It can be destructive:

# Create a snapshot of the "root" volume:
$sudo lvcreate -L 5GB -s -n root-snap-19-08-2024 /dev/mapper/fedora-root

# Restore a snapshot:
$sudo lvconvert --merge /dev/fedora/root-snap-19-08-2024
 
# Remove a snapshot:
$sudo lvremove /dev/fedora/root-snap-19-08-2024
