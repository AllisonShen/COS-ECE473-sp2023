// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./interfaces/IPriceFeed.sol";

contract PriceFeed is IPriceFeed {
    /* TODO: implement your functions here */
    AggregatorV3Interface internal priceFeedTSLA;
    AggregatorV3Interface internal priceFeedBNB;
    constructor() {
        // Replace with the actual proxy addresses for TSLA/USD and BNB/USD
        priceFeedTSLA = AggregatorV3Interface(0x982B232303af1EFfB49939b81AD6866B2E4eeD0B);
        priceFeedBNB = AggregatorV3Interface(0x7b219F57a8e9C7303204Af681e9fA69d17ef626f);
        // TSLA / USD: 0x982B232303af1EFfB49939b81AD6866B2E4eeD0B
        // BNB / USD: 0x7b219F57a8e9C7303204Af681e9fA69d17ef626f

    }
    function getLatestPrice() external view override returns (int, uint) {
        // Return the latest price feed for TSLA/USD and the current timestamp
        return (int(getLatestPriceBNB()), block.timestamp);
       }

        function getLatestPriceBNB() public view returns (uint) {
            (, int price, , , uint timestamp) = priceFeedBNB.latestRoundData();
            return uint(price);
        }

}