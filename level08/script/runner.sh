FOUNDRY_PROFILE=level08 forge create --contracts level08/src/L8_Caller__Force.sol --rpc-url sepolia --private-key $PRIV_KEY --value 1wei L8_Caller__Force
cast send 0xBFdae884d2fa0F0b2AF36c0C58C3f728C3A9De7c "forceFundsTransfer()" --rpc-url sepolia --private-key $PRIV_KEY