# Variables used in constructing HTTPS request
host="www.espn.com"
port="443"
http_method="GET"
path="/golf/leaderboard/_/tournamentId/401243230"
headers="Host: $host\r\nConnection: close\r\n\r\n"
request="$http_method $path HTTP/1.1\r\n$headers"

# Execute the OpenSSL command and redirect the output to a file
openssl s_client -connect "$host:$port" -crlf <<< "$request" > response.txt



Latency 
The Elements of Latency

We can think of latency as a measure of delay. Data starts at one location at a certain point in time. At a later point in time, it reaches another location. The difference between those two points in time is the delay. The earlier analogy with a car driving along a road was a very simplified version of what constitutes latency. There are actually different types of delay that go together to determine the overall latency of a network connection.

    Propagation delay: this is the amount of time it takes for a message to travel from the sender to the receiver, and can be calculated as the ratio between distance and speed. Propagation delay is basically what was explained by our car analogy earlier.

    Transmission delay: the journey of data from point A to point B on a network typically won't be made over one single cable. Instead, the data will travel across many different wires and cables that are all inter-connected by switches, routers, and other network devices. Each of these elements within the network can be thought of as an individual 'link' within the overall system. Transmission delay is the amount of time it takes to push the data onto the link. In terms of our driving analogy, you can think of it as the time taken to navigate an intersection or interchange between different roads. We'll explore this idea further with the traceroute program later in this assignment.

    Processing delay: Data travelling across the physical network doesn't directly cross from one link to another, but is processed in various ways . We'll look at what this processing entails in more detail in a later assignment. This is probably stretching our driving analogy somewhat, but imagine if at every interchange there was some sort of checkpoint; the amount of time it takes to be processed at the checkpoint is the processing delay.

    Queuing delay: Network devices such as routers can only process a certain amount of data at one time. If there is more data than the device can handle, then it queues, or buffers, the data. The amount of time the data is waiting in the queue to be processed is the queuing delay. In our driving analogy, this would be the time spent in a queue of traffic waiting to cross the checkpoint.

The total latency between two points, such as a client and a server, is the sum of all the delays above. This value is usually given in milliseconds (ms).

There are some other terms that you may encounter in a discussion about latency:

    Last-mile latency: A lot of the delays described above can take place within the parts of the network which are closest to the end points. This is often referred to as 'last-mile latency' and relates to the delays involved in getting the network signal from your ISP's network to your home or office network. The 'hops' within the core part of the network are longer with less interruptions for transmission, processing, and queuing. At the network edge, there are more frequent and shorter hops as the data is directed down the network hierarchy to the appropriate sub-network. You can think of the network edge as the 'entry point' into a network like a home or corporate LAN.

    Round-trip Time (RTT): A latency calculation often used in networking is Round-trip Time (RTT). This is the length of time for a signal to be sent, added to the length of time for an acknowledgement or response to be received.
