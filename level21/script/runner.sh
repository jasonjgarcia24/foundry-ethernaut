FOUNDRY_PROFILE=level21 forge create --contracts level21/src/L21_Caller__Denial.sol --rpc-url sepolia --private-key $PRIV_KEY L21_Caller__Denial

# Test
cast send $CONTRACT "withdraw()" --private-key $PRIV_KEY --rpc-url sepolia