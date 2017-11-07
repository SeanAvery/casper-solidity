pragma solidity ^0.4.15;

contract Casper {
    /*
      EVENTS
    */

    /*
      DATA STRUCTURES
    */
    struct Validator {
      uint256 deposit;
      uint256 dynastyStart;
      uint256 dynastyEnd;
      address adrs;
      address withdrawAddress;
      uint256 prevCommitEpoch;
    }

    struct Vote {
      uint256 currentDynastyVotes;
      uint256 prevDynastyVotes;
      mapping(bytes32 => mapping(uint256 => bool)) votBitMap;
      bool isJustified;
      bool isFinalized;
    }

    /*
      STATE
    */
    /* VALIDATORS */
    mapping(uint256 => Validator) public validators;
    mapping(address => uint256) public validatorIndexes;
    uint256 validatorIndex;

    /* DYNASTY */
    uint256 public dynasty;
    uint256 public nextDynastyWeiDelta;
    uint256 public withdrawDelay;
    uint256 public totalCurrentDeposits;
    uint256 public totalPrevDeposits;
    Vote[] public Votes;

    /* EPOCHS */
    uint256 public currentEpoch;
    uint256 public computedCurrentEpoch;
    uint256 public epochLength;

    /*
      INITIALIZE
    */
    function Casper(
        uint256 _epochLength,
        uint256 _withdrawDelay
        ) {
        epochLength = _epochLength;
        withdrawDelay = _withdrawDelay;
        totalCurrentDeposits = 0;
        totalPrevDeposits = 0;
        dynasty = 0;
        currentEpoch = block.number/_epochLength;
    }

    /*
      PUBLIC FNS
    */
    function initializeEpoch() returns (bool) {
        computedCurrentEpoch = block.number / epochLength;
        computedCurrentEpoch = currentEpoch + 1;
        currentEpoch = computedCurrentEpoch;
        return true;
    }

    function deposit(address _validator, address _withdraw) payable returns (bool) {
        currentEpoch = block.number/epochLength;
        Validator memory v;
        v.deposit = 10;
        v.dynastyStart = dynasty;
        v.dynastyEnd = 2**255;
        v.adrs = _validator;
        v.withdrawAddress = _withdraw;
        v.prevCommitEpoch = 0;
        validators[validatorIndex] = v;
        return true;
    }

}
