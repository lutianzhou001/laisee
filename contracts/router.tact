import "message.tact";


contract Router with Deployable, Resumable, OwnableTransferable {
    stopped: Bool;
    seq: Int as uint64;
    owner: Address;
    process_fee: Int as uint64;
    override const storageReserve: Int = ton("0.1");

    init(owner: Address, seq: Int, whiteList: List<Address>){
        self.seq = seq;
        self.owner = owner;
        self.stopped = false;
        self.process_fee = ton("0.025");
    }

    receive (msg: setSenderWhiteList) {
        if (msg.sender != self.owner) {
            require(false, "only owner can set the white list");
        } else {
            // set the white list
        }
    }

    receive(msg: TokenNotification){
        if (msg.sender != self.owner) {
            require(false, "only owner can create a laisee");
        } else {
            require(msg.amount > 0, "amount = 0");
            let payloadRaw: Slice = msg.forward_payload;
            
            // receive the token and forward it to the laisee contract
            if (res.op == self.createLaiSee {
            // deploy the laisee contract
            send(SendParameters{
                value: self.DEPLOY_VALUE,
                to: to,
                mode: SendPayGasSeparately | SendIgnoreErrors,
                bounce: false,
                body: "deploy for the router".asComment(),
                code: opInit.code,
                data: opInit.data
            });

            msg_value = (msg_value - self.DEPLOY_VALUE);
            let forward_ton_amount: Int = (msg_value - transfer_jetton_fee);
            send(SendParameters{
                to: context.sender,
                value: msg_value,
                mode: SendPayGasSeparately | SendIgnoreErrors,
                bounce: false,
                body: TokenTransfer{
                    query_id: msg.query_id,
                    amount: msg.amount,
                    destination: to,
                    response_destination: msg.from,
                    custom_payload: null,
                    forward_ton_amount: forward_ton_amount,
                    forward_payload: payload
                }.toCell()
            });
            // emit();
            return;
        }
    }

    receive(msg: WithdrawGas) {
        if (!self.isInWhiteList(msg.sender)) {
            require(false, "only owner can call this function");
        } else {
            // withdraw the token to the owner
            SendParameters() {
                // ...
            }
        }   
    }

    receive(msg: ClaimLaisee) {
        if (!self.isInWhiteList(msg.sender)) {
            require(false, "only owner can claim the laisee");
        } else {
            // receive the claim request and forward it to the laisee contract
            // step 1: claim gas to the sender
            SendParameters() {
                // ...
            }
            // step 2: claim the laisee
            SendParameters() {
                // ...
            }
            emit();
        }
    }

    receive(msg: RefundLaiSeeWithWhiteListSender) {
        if (!self.isInWhiteList(msg.sender)) {
            require(false, "only owner can call this function");
        } else {
            // call the refund function
        }
    }

    receive(msg: ClaimLaiSeeWithSignature) {
        // claim the laisee with signature
    }

    fun isInWhiteList(address: Address) : Bool {
        // check if the address is in the white list
        return true;
    }
}
