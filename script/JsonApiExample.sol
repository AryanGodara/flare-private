// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {JsonApiExample} from "src/JsonApiExample.sol";
import {Script} from "forge-std/Script.sol";

interface IJsonApiExample {
function addWeather(bytes memory attestationData) external;
}

contract JsonApiExampleScript is Script {
address public jsonApiAddress = 0xf37e9ACe5D12a95C72Cb795A9178E6fFF34040eE;
string private constant VERIFIER_SERVER_URL = "http://localhost:3000/IJsonApi/prepareResponse";

function getAttestationData(uint256 timestamp) internal view returns (bytes memory) {
// Manual HTTP request function as Foundry does not have fetch capabilities
// Use Inline API data for simplicity or implement HTTP request logic externally
// Here, we simulate attestation data, as Foundry does not support HTTP natively
return hex"1234..."; // placeholder for actual attestation data
}

function run() external {
vm.startBroadcast();

JsonApiExample jsonApi = JsonApiExample(jsonApiAddress);

// Simulate timestamp for API call
uint256 timestamp = 1729858394;
bytes memory attestationData = getAttestationData(timestamp);

// Call addWeather with attestationData
jsonApi.addWeather(attestationData);

vm.stopBroadcast();
}
}
