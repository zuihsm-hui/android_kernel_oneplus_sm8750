### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=OnePlus 13 Kernel (OP5D0DL1)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=OP5D0DL1
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
BLOCK=/dev/block/by-name/boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot; # 自动识别 boot 或 init_boot 分区并解包

# ⚠️ 已移除默认模板中的 init.rc / fstab.tuna 等废弃补丁
# 现代内核刷机只需替换 Image.gz 和 dtb，保留原厂 Ramdisk 即可。
# 任何不必要的 ramdisk 修改都会导致 Android 14/15 无法开机。

write_boot; # 自动重新打包并刷入当前活动槽位 (boot_a 或 boot_b)
## end boot install