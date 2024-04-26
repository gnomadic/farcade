// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";

import {FarcadeTicket} from "../src/FarcadeTicket.sol";
import {console} from "forge-std/console.sol";

// # To deploy and verify the Dice NFT run this command below
// forge script script/deploy/DeployDice.s.sol:DeployDice --rpc-url sepolia --broadcast --verify -vvvv
contract DeployFarcadeTicket is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("MAINNET_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        FarcadeTicket ticket = new FarcadeTicket();
        console.log("FarcadeTicket deployed at address: ", address(ticket));

        vm.stopBroadcast();
    }
}
