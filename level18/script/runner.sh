FOUNDRY_PROFILE=level18 forge create --contracts level18/src/L18_Caller__Recovery.sol --rpc-url sepolia --private-key $PRIV_KEY L18_Caller__Recovery
FOUNDRY_PROFILE=level18 forge script level18/script/L18_Solution__Recovery.sol --rpc-url sepolia --broadcast --skip-simulation
cast balance 0xCF62575aa4f9E954a6Eb6c0A6d7E534375025F30 --rpc-url sepolia