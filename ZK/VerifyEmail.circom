pragma circom 2.1.5;

include "@zk-email/zk-regex-circom/circuits/common/from_addr_regex.circom";
include "@zk-email/circuits/email-verifier.circom";
include "@zk-email/circuits/utils/regex.circom";
include "./stockSymbolRegex.circom";

template Verifier(maxHeadersLength, maxBodyLength, n, k, exposeFrom) {
    assert(exposeFrom < 2);

    signal input emailHeader[maxHeadersLength];
    signal input emailHeaderLength;
    signal input pubkey[k];
    signal input signature[k];
    signal input emailBody[maxBodyLength];
    signal input emailBodyLength;
    signal input bodyHashIndex;
    signal input precomputedSHA[32];


    signal output pubkeyHash;
    // signal output stockSymbol;


    component EV = EmailVerifier(maxHeadersLength, maxBodyLength, n, k, 0);
    EV.emailHeader <== emailHeader;
    EV.pubkey <== pubkey;
    EV.signature <== signature;
    EV.emailHeaderLength <== emailHeaderLength;
    EV.bodyHashIndex <== bodyHashIndex;
    EV.precomputedSHA <== precomputedSHA;
    EV.emailBody <== emailBody;
    EV.emailBodyLength <== emailBodyLength;

    pubkeyHash <== EV.pubkeyHash;


    if (exposeFrom) {
        signal input fromEmailIndex;

        signal (fromEmailFound, fromEmailReveal[maxHeadersLength]) <== FromAddrRegex(maxHeadersLength)(emailHeader);
        fromEmailFound === 1;

        var maxEmailLength = 255;

        signal output fromEmailAddrPacks[9] <== PackRegexReveal(maxHeadersLength, maxEmailLength)(fromEmailReveal, fromEmailIndex);
    }


    // This computes the regex states on each character in the email body. 
    // signal (stockSymbolFound, symbol[maxBodyLength]) <== stockSymbolRegex(maxBodyLength)(emailBody);
    // stockSymbolFound === 1;

    // var maxStockSymbolLength = 5;
    // signal stockSymbolUserNamePacks[1] <== PackRegexReveal(maxBodyLength, maxStockSymbolLength)(symbol, stockSymbolIndex);
   
    // stockSymbol <== stockSymbolUserNamePacks[0];
}


component main = Verifier(576,192, 121, 17, 0);

