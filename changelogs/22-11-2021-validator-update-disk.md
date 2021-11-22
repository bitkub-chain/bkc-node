
# Upgrade Validator Disk

- Time 19.00 - 21.00
- Date 22 Nov 2021

Step (POC)
1. Create VM Sync full
2. Create DataDisk 
3. Mount Data Disk to `/bkc-node` to Data Disk
```bash
// Create folder
sudo mkdir /bkc-node
// Format disk to ext4
sudo mkfs -t ext4 /dev/vdb
// Mount Volumn
sudo mount /dev/vdb /bkc-node/
// Change Owner 
sudo chown -R $USER /bkc-node
// Verify Disk Size
cd /bkc-node &&  df -h .
// BackUp file system file mount
cp /etc/fstab /etc/fstab.bak
// Add mount dist to fstab
sudo nano /etc/fstab
/dev/vdb       /bkc-node   ext4    defaults,nofail        0       0
```
4. With for Sync Success
5. Create Snapshot at 18.30 (ref1)


Step Validator
1. Create Data Disk from Snapshot from Ref1
2. Verify Diskname
```
lsblk
```
#### If non match /dev/vdb Unmount Other Disk And reboot
3. Mount Disk
```bash
// Create folder
sudo mkdir /bkc-node
cp /etc/fstab /etc/fstab.bak
// Add mount dist to fstab
sudo nano /etc/fstab
/dev/vdb       /bkc-node   ext4    defaults,nofail        0       0
// Automatic Mount
mount -a
// Change Owner 
sudo chown -R $USER /bkc-node
// Verify Disk Size
cd /bkc-node &&  df -h .

mkdir -R /bkc-node/mainnet/data/geth
```

4. Copy Keystore
```bash
cp -rp /root/bkc-node/bkc-mainnet/node0/keystore /bkc-node/mainnet/data/keystore
```

5. Copy nodekey
```
cp /root/bkc-node/bkc-mainnet/node0/geth/nodekey /bkc-node/mainnet/data/geth/nodekey
```

## 6. Update flag
- `--bootnodes`
```
enode://edf49592304cfb4b1b54813adfe92c0ddae9f1c8f30d43f6565c08795b429c317b59eea78b330b2d845c26cb2f80f40915927d5dcddebc9025937cf1cf328e32@94.74.118.9:30303,enode://f9430f3733b5104415d8742483b671dfe41e1067e762382b8681ddae2664c940f212479a3ee5a6081e4dd6c21c8209b3a5d0317070e55e07abdab35c5b9b1738@110.238.117.147:30303,enode://2279c2f50e28c6c6dd1ed4f9f97683ed1c97fb3f7c5dd5ccbdeccd6e681988052048a4e2c611ead0e8e3874537a398cd1346505401e1fb9d1646f673ab734660@159.138.241.128:30303,enode://898056729fe1c3cc07a5fdf86b5f172e95e69bbc22edb066a3b9f80d734e8a2865bf4496cc1b2a4c3a1053afbca32b2cfc8add6e8def0166af903fbf4b20bc31@159.138.252.184:30303
```

- `--datadir`
```
/bkc-node/mainnet/data
```

- `--identity`
```
bkc-mainnet-validator-${number}
```

- `--cache`
```
8192
```
