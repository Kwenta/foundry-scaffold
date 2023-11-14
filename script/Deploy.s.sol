// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.18;

import {BaseSepoliaParameters} from
    "script/utils/parameters/BaseSepoliaParameters.sol";
import {BaseParameters} from "script/utils/parameters/BaseParameters.sol";
import {OptimismSepoliaParameters} from
    "script/utils/parameters/OptimismSepoliaParameters.sol";
import {OptimismParameters} from
    "script/utils/parameters/OptimismParameters.sol";
import {Script} from "lib/forge-std/src/Script.sol";
import {Counter} from "src/Counter.sol";

/// @title Kwenta deployment script
/// @author JaredBorders (jaredborders@pm.me)
contract Setup is Script {
    function deploySystem() public returns (address) {
        Counter counter = new Counter();
        return address(counter);
    }
}

/// @dev steps to deploy and verify on Base:
/// (1) load the variables in the .env file via `source .env`
/// (2) run `forge script script/Deploy.s.sol:DeployBase --rpc-url $BASE_RPC_URL --etherscan-api-key $BASESCAN_API_KEY --broadcast --verify -vvvv`
contract DeployBase is Setup, BaseParameters {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        Setup.deploySystem();

        vm.stopBroadcast();
    }
}

/// @dev steps to deploy and verify on Base Sepolia:
/// (1) load the variables in the .env file via `source .env`
/// (2) run `forge script script/Deploy.s.sol:DeployBaseSepolia --rpc-url $BASE_SEPOLIA_RPC_URL --etherscan-api-key $BASESCAN_API_KEY --broadcast --verify -vvvv`
contract DeployBaseSepolia is Setup, BaseSepoliaParameters {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        Setup.deploySystem();

        vm.stopBroadcast();
    }
}

/// @dev steps to deploy and verify on Optimism:
/// (1) load the variables in the .env file via `source .env`
/// (2) run `forge script script/Deploy.s.sol:DeployOptimism --rpc-url $OPTIMISM_RPC_URL --etherscan-api-key $OPTIMISM_ETHERSCAN_API_KEY --broadcast --verify -vvvv`
contract DeployOptimism is Setup, OptimismParameters {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        Setup.deploySystem();

        vm.stopBroadcast();
    }
}

/// @dev steps to deploy and verify on Optimism Sepolia:
/// (1) load the variables in the .env file via `source .env`
/// (2) run `forge script script/Deploy.s.sol:DeployOptimismSepolia --rpc-url $OPTIMISM_SEPOLIA_RPC_URL --etherscan-api-key $OPTIMISM_ETHERSCAN_API_KEY --broadcast --verify -vvvv`

contract DeployOptimismSepolia is Setup, OptimismSepoliaParameters {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        Setup.deploySystem();

        vm.stopBroadcast();
    }
}
