

contract LaiSee with Deployable, Resumable, OwnableTransferable {
    init(router: Address, user: Address) {
        self.router = router;
        self.user = user;
    }

    receive(msg: ClaimLaiSee) {
        // receive the claim request and forward it to the router contract
        // send the amount of token to the sender
        if (msg.sender != self.router) {
            require(false, "only router can call this function");
        } else {
            // ClaimLaisee
        }
    }
}