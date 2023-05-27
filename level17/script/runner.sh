FOUNDRY_PROFILE=level17 forge create --contracts level17/src/L17_Caller__Preservation.sol --rpc-url sepolia --private-key $PRIV_KEY L17_Caller__Preservation
FOUNDRY_PROFILE=level17 forge script level17/script/L17_Solution__Preservation.sol --rpc-url sepolia --broadcast --skip-simulation
FOUNDRY_PROFILE=level17 forge script level17/script/L17_Solution__Preservation.sol --rpc-url sepolia --broadcast --skip-simulation
cast storage 0xbF7Bf5E01140E872c140D5661Ca6E9a2324A2079 2
