# Document state synchronization with offline mode
In this paper we focus on solving the issues caused by going offline inside a state synchronizing network. In order to keep the state consistent across all clients in a network, various synchronization methods are used. These methods expect all clients to be available at any time and don't describe situations where some of the clients go offline and later attempt to reconnect. First we analyze a sample of synchronization methods, while Comparing the ways they could support offline mode. After that we choose the most fitting method and provide a detailed description of possible modifications allowing client reconnections without loss of data or state conflicts. Finally we implement  and compare these modifications.

## Credits
Author: **Šimon Kocúrek**  
Leader:  **Peter Gurský**  
