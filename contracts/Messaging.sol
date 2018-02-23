pragma solidity ^0.4.17;
/**
 * @title MessagingContract
 * @dev Message operations with feed checks
 */
contract MessagingContract {
    struct Message {
        string data;
        string senderName;
    }
    struct Feed {
        Message[] messages;
        string name;
    }
    event FeedCreated(uint256 feedId,string feedName);
    event MessageSent(uint256 feedId, uint256 msgId, string messsage,string sender);
    Feed[] feeds;
    /// Create a new ballot with $(_numProposals) different proposals.
    function MessagingContract(string firstFeedName) public {
        newFeed(firstFeedName);
    }
    function newFeed(string name) public returns (uint256) {
        feeds[feeds.length++].name = name;
        FeedCreated(feeds.length - 1,name);
        return feeds.length - 1;
    }
    function feedMessage(uint256 feedId,string data,string alias) public {
        feeds[feedId].messages[feeds[feedId].messages.length++] = Message(data,alias);
        MessageSent(feedId,feeds[feedId].messages.length-1,data,alias);
    }
}