// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.18;

import {console2} from "lib/forge-std/src/console2.sol";
import {
    Counter,
    OptimismGoerliParameters,
    OptimismParameters,
    Setup
} from "script/Deploy.s.sol";
import {Test} from "lib/forge-std/src/Test.sol";

contract Bootstrap is Test {
    using console2 for *;

    Counter public counter;

    function initializeOptimismGoerli() public {
        BootstrapOptimismGoerli bootstrap = new BootstrapOptimismGoerli();
        (address counterAddress) = bootstrap.init();

        counter = Counter(counterAddress);
    }

    function initializeOptimism() public {
        BootstrapOptimismGoerli bootstrap = new BootstrapOptimismGoerli();
        (address counterAddress) = bootstrap.init();

        counter = Counter(counterAddress);
    }

    /// @dev add other networks here as needed (ex: Base, BaseGoerli)
}

contract BootstrapOptimism is Setup, OptimismParameters {
    function init() public returns (address) {
        address counterAddress = Setup.deploySystem();

        return counterAddress;
    }
}

contract BootstrapOptimismGoerli is Setup, OptimismGoerliParameters {
    function init() public returns (address) {
        address counterAddress = Setup.deploySystem();

        return counterAddress;
    }
}

// add other networks here as needed (ex: Base, BaseGoerli)
