# To see available volumegroup:
vgs

# To see available logical volumes:
lvs

# Allocate extra space(10GB) from "volgroup0" to "root"
lvextend -L +10g -n /dev/mapper/arch-root

# The above command doesn't extend the space the "root" volume group:
# To extend the partition:
resize2fs /dev/mapper/arch-root

# Note: Shrinking in lvm is a bad idea. Try to avoid it AMAP. It can be destructive:

# Create a snapshot of the "root" volume:
sudo lvcreate -L 5GB -s -n root-snap-19-08-2024 /dev/mapper/arch-root

# Restore a snapshot:
sudo lvconvert --merge /dev/arch/root-snap-19-08-2024

# Remove a snapshot:
sudo lvremove /dev/arch/root-snap-19-08-2024
