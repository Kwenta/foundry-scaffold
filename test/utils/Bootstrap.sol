// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.18;

import {console2} from "lib/forge-std/src/console2.sol";
import {
    Counter,
    OptimismSepoliaParameters,
    OptimismParameters,
    Setup
} from "script/Deploy.s.sol";
import {Test} from "lib/forge-std/src/Test.sol";

contract Bootstrap is Test {
    using console2 for *;

    Counter internal counter;

    function initializeLocal() internal {
        BootstrapLocal bootstrap = new BootstrapLocal();
        (address counterAddress) = bootstrap.init();

        counter = Counter(counterAddress);
    }

    function initializeOptimismSepolia() internal {
        BootstrapOptimismSepolia bootstrap = new BootstrapOptimismSepolia();
        (address counterAddress) = bootstrap.init();

        counter = Counter(counterAddress);
    }

    function initializeOptimism() internal {
        BootstrapOptimismSepolia bootstrap = new BootstrapOptimismSepolia();
        (address counterAddress) = bootstrap.init();

        counter = Counter(counterAddress);
    }

    /// @dev add other networks here as needed (ex: Base, BaseSepolia)
}

contract BootstrapLocal is Setup {
    function init() public returns (address) {
        address counterAddress = Setup.deploySystem();

        return counterAddress;
    }
}

contract BootstrapOptimism is Setup, OptimismParameters {
    function init() public returns (address) {
        address counterAddress = Setup.deploySystem();

        return counterAddress;
    }
}

contract BootstrapOptimismSepolia is Setup, OptimismSepoliaParameters {
    function init() public returns (address) {
        address counterAddress = Setup.deploySystem();

        return counterAddress;
    }
}

// add other networks here as needed (ex: Base, BaseSepolia)
