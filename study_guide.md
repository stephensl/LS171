# Study Guide for LS171: Networking Foundations

  ## The Internet 

    - Network infrastructure (devices, routers, switches, cables)
    - Protocols (allows infrastructure to function)
  
  ### Mental Model of what internet is, and how it works. 

  In order to develop a mental model of what the internet is, it is crucial to first address what a network is. In a social context, a network may be comprised of other people with whom you have a connection and a means to communicate.
  The connection that enables this communication may be a relationship or some level of mutual understanding that it is possible and appropriate to interact with each other.
  
  In a computer networking context, a network is formed when two or more devices are connected in such a way that enables communication and information sharing. The connection that enables this communication is a combination of the physical and logical infrastructure of the network.

  In a social network, we can effectively communicate with another person only if there are established agreements governing the communication. These agreements may include language choice, message flow, communication medium (voice, text, sign, etc.) as well as mutually understood contextual or cultural considerations. For example, if I call my friend on the phone at 3am and I am shouting in Greek, it is unlikely that the communication will be received or responded to in any useful way. This is because a phone call like this violates the mutually agreed upon rules that my friend and I adhere to in order to communicate- namely appropriate times of day, language choice, and level of volume. Consequently, the communication was not productive (assuming my goal was not to create confusion). 

  Similarly, computer networks utilize established and agreed upon protocols in order to ensure that communication is reliably and securely facilitated. Humans are typically more astute in recognizing nuance and adapting to unexpected changes in communication protocol, while computers require strict compliance. However, like communication among members of your social network, the protocol being used is determined by the context. Different protocols are utilized at various points during the communication process in order to ensure that information can be sent, received, and understood properly. 

  If we keep the analogy of a human social network in play, and consider a scenario in which you are extremely interested in learning how to snowboard. You talk with others in your network and deduce that not one of them has any useful information that could help you in learning more about it. However, a particular member of the network knows of another group of people who are avid snowboarders and offers to connect you with that network. Since you do not have a way to communicate with this unknown network, you ask the connecting member of your network to pass along your questions to the snowboarder network. The snowboarder network then receives the questions, and passes them back to your mutual connection, who then passes the information back to you. 

  This example, of reaching beyond your Local Area Network, and accessing resources from other networks is a simplified function of the internet. The internet is a global system of communication that allows for information sharing to occur between networks. If a network is two or more devices that are connected in a way that facilitates communication, the internet is a network of networks. Inter-network communication occurs when two or more networks are able to share information, and the internet does this on a massive scale. The internet includes the physical and logical infrastructure necessary to allow networks all over the world to connect with each other and share information. 

   

  ### Characteristics of physical network.

  Underlying all of the protocols and layers of abstraction, network communication is dependent on physical pieces of infrastructure. 
    - networked devices
    - cables 
    - wires 
    - radio waves 

  - Limited by physical laws and rules 
    - speed of light
    - distance radio waves can reach

  - Physical layer concerned with transfer of bits. 
    - converted into signals (electrical, light, radio)

  - Two Main Characteristics in terms of performance: 
    
    - Latency 
      - Measure of the *time* it takes for a data to travel from sender to receiver. 
      - Different types, and together contribute to overall latency of a network connection.
      
    - Bandwidth 
      - Measure of *amount* of data that can be sent in a particular unit of time. 
      - varies across the network, not constant. 
      - bandwidth the connection receives is the lowest amount at a particular point in the connection. 



  ### Lower level protocol functions.
  
  #### Link|Data Link : interface between workings of physical network and more logical layers above. 

    - Ethernet Protocol: at Data Link/Link layer 
      - defines how devices on network are identified (MAC Addresses)
      - how data should be formatted for transmission (Ethernet frames)
      - focus is communication between devices on the same local network.

     - Frames: key components are Source and Destination MAC addresses and Data Payload 
        - PDU encapsulates data from Internet/Network layer. 
        - physical layer is stream of bits
          - ethernet frame structures bits logically 
            - defines which bits are payload, and which are metadata for transporting frame. 

    Ethernet provides a bridge between the physical infrastructure of the network and the higher-level protocols that handle tasks like routing data to the correct destination (the network layer), ensuring reliable transmission (the transport layer), and managing applications' network connections (the application layer).



    #### Internet|Network Layer: facilitate communication between hosts on different networks

      - Internet Protocol 
        - enables communication between two networked devices anywhere in world.
      
      - Primary Features:
        - Routing capability via IP addressing 
        - Encapsulation of data into packets 

      - IP Addresses 
        - Logical, unlike MAC Addresses
        - Assigned as required to devices as they join a network.
          - Defined by network hierarchy ranges.
            - Network address: start of range
              - Used to identify specific network segment.
                - Similar to central post office looking for district post office.
                  - Doesn't need to have every house address, just the district that serves houses in that range of addresses.
                    - Then the central post office routes to correct district, who delivers to individual house. 
            - Broadcast address: end of range
            - Addresses between these can be allocated to individual devices on the network.

      - Sub-netting
        
        - Splitting network into smaller subnets to create hierarchical tiers for routing.
          - Like splitting a city into neighborhoods
            - Each subnet operates as its own smaller network within the larger network. 
            - Router reads the network address, and sends data to correct neighborhood
              - Once arrived in correct neighborhood, delivered based on the rest of the IP address (Host Address)

        - Benefits  
          - Efficiency 
            - Routers do not need to store info about every device on the network
              - Only need the subnet information
              - Lets subnet routers/switches handle the final leg to the target device. 
          - Reduces network congestion
            - Local traffic can stay isolated within subnet
        
        - Routing and Routing Tables 
          - All routers on the network store a local routing table. 
            - When router receives IP packet...
              - examines destination IP against list of network addresses in routing table. 
              - matching network address determines where in hierarchy subnet exists
              - Used to route packet. 

        - IPv4 vs IPv6
          - IPv4 32 bits in length (4 eight bit sections) logical maximum addresses: 4.3 billion
          - IPv6 128 bits (eight 16-bit blocks), increases to 340 undecillion.
            - Different header structure 
            - Lack of error checking (leaves to Link Layer checksum)
            - 8 sets of hexadecimal characters, each containing 16 bits of information. The first 4 sets are used to locate a specific network on the internet. The last 4 sets are typically used to identify a particular interface or device within that network.

      *** Being able to transport data from one device to another is not sufficient to ensure that a specific application on the client can access the correct service on the server.**


      



  ### IP addresses and port numbers 

  #### Transport Layer
  
  **TCP provides set of ports within each host. Along with network and host addresses from the internet layer, this forms a socket and allows for many processes within a single host to use TCP simultaneously.**

  - IP addressing can get us as far as the host, but not to particular application/process. 
    - May have numerous applications running on same machine or a host application that needs information from a particular application on another host. 
    - We need a way to transmit multiple data inputs (from numerous application sources) over a single host-to-host channel and separate them out at the destination so data is distributed correctly. 

  - Multiplexing and Demultiplexing: 
    - Multiple applications may need to send data simultaneously. 
    - Sending multiple signals over a single channel is multiplexing
      - Receiving a single stream of data and separating it out into multiple streams is demultiplexing. 

  - Ports 
    - Identifiers for processes running on a host.
      - Range of 0-65535

    **Source and Destination Port Numbers are included in the PDU for the Transport Layer**

      - Data from application layer is encapsulated as the data payload in this PDU, and the source and destination port numbers within the PDU can be used to direct data to specific processes on a host. 

      - Entire PDU is then encapsulated as data payload in an IP packet.
        - IP addresses in packet header used to direct data from one host to another. 
        - Once the packet arrives to host, port numbers used to direct data to specific application. 
        
        **The IP Address and Port Number together enables end-to-end communication between specific applications on different devices.**
          - This combination of IP Address and Port number may be thought of as: 
            - Communication end point or *socket* for transfer of data between applications running on hosts. 

      - Socket 
        - Conceptually:
          - A communication end-point consisting of an IP Address and Port Number. 
          - Used to create **connections** between applications
        - Implementation:
          - instantiating socket-objects 
            - UNIX Socket
              - Communicating between local processes on machine
            - Internet sockets (TCP/IP socket)
              - mechanism for inter-process communication between networked processes usually on different machines.
        
      - Socket Connections
      
        - Connectionless System 
          - One socket object defined by IP address of host computer and port assigned to particular process. 
            - Socket object calls listen() method to wait for incoming messages matching IP/port pair. 
              - Messages could come from anywhere at any time, and are processed as they arrive.

        - Connection-Oriented System
          - Socket object defined by host IP and process port (just like connectionless system)
            - Socket object calls listen() method to wait for incoming messages matching IP/port pair. 
          - When message arrives... 
            - instantiate new socket object
              - defined by local IP/Port number and the IP/Port number of the process/host that sent the message. 
              - new socket listens exclusively for messages where all four pieces of information matched
                - Combination of 4 pieces of information known as *four-tuple*. 

        *Messages that do not match the four-tuple are still picket up by the original socket, which would then instantiate another new socket object for the new connection.*
        
          - Connection-oriented benefits: 
            - dedicated virtual connection between specific processes on one host and specific processes on another. 
              - Allows for implementing rules for managing communication
                - order of messages
                - acknowledgements
                - retransmission
            - rules effectively put in place to add more reliability to the communication. 


    #### Network Reliability is Engineered 

    #### The fundamental elements required for reliable data transfer:
  
    1. In-order delivery: data is received in the order that it was sent
      
    2. Error detection: corrupt data is identified using a checksum
      
    3. Handling data loss: missing data is retransmitted based on acknowledgements and timeouts
      
    4. Handling duplication: duplicate data is eliminated through the use of sequence numbers


  - Network up to and including the Internet Protocol is effectively unreliable. 
    - Ethernet and IP include checksum data to test for corruption, but if it is corrupted, it is simply discarded.
      - There is no provision for retransmission. 

  **The possibility of data being lost and not replaced is what makes the network up to this point unreliable.**

    Pipelining: 
      - multiple messages transferred at one time
        - sender implements a 'window' setting max number of messages that can be in pipeline at one time.
          - once received acknowledgements for messages in window, window moves forward.
            - as acknowledgements are received, more can be sent. 

      - Benefits of pipelining:
        - more efficient use of bandwidth
          - transmitting more data rather than waiting on acknowledgements
          - improves throughput (amount of work done in given amount of time)
        - balancing reliability and performance
  
  ### How DNS works.





  ### Client/Server Model and role of HTTP in model







  ## TCP & UDP 

  ### TCP
  - Provides reliable data transfer
    - data integrity
    - de-duplication
    - in-order delivery
    - retransmission of lost data.
  - Utilizes
    - data encapsulation
    - multiplexing
  
  - Limitations
    - performance due to complexity

    #### TCP Segments
      - Header
        - Source Port and Destination Port
          - provides multiplexing capability
        - Fields related to reliable transfer of data 
          - Sequence Number 
          - Acknowledgement Number 
          - Checksum 
            - renders lower level checksums redundant
              - IPv6 headers don't include checksum for this reason (left to Transport and/or Link layer)
        - Window Size
          - related to Flow Control 
        - Flags
          - related to connection state

    #### TCP Connections
      - 3 way Handshake 
        - Sender sends SYN message (TCP Segment `SYN` flag set to `1`)
        - Upon receipt, receiver sends TCP Segment with `SYN` and `ACK` flags set to `1`
        - Upon receipts, sender sends TCP Segment with `ACK` flag set to `1`
          - Upon sending `ACK` sender can start transmitting application data. 
            - BUT receiver cannot respond until receives `ACK`. 
        *One of main use cases is synchronizing `SYN` the sequence numbers use during the connection.*

     
      **Due to significant overhead, actual data transfer once connection established must be efficient**

        - Flow Control- assists in reliability and efficiency
          - Prevents sender from overwhelming receiver with too much data at once. 
            - Data waiting to be processed is stored in buffer
              - potential queuing latency
            - Flow control prevents buffer from overflowing leading to data loss.
          - `WINDOW` field
            - each side of connection lets other know how much data willing to accept
              - dynamic, and may change during course of connection
                - ex. if buffer getting full, receiver can set lower amount in `WINDOW` field
                - assist in making best use of available bandwidth
          
          * Flow control prevents sender from overwhelming receiver, but does not prevent either sender or receiver from overwhelming the underlying network. 

          - Congestion Avoidance
            - Occurs when more data transmitted than network capacity to process and transmit the data. 
              - Bandwidth issue
              - May lead to data loss, higher latency, reduced throughput
            - Example: 
              - TCP retransmits lost data 
                - if high data loss, high retransmission rates and congestion
                - uses data loss as feedback mechanism to detect and avoid congestion
                  - may reduce size of transmission window accordingly
          

      #### TCP Limitations
      - Overhead (additional processing to facilitate main role of data transport)
        - establishing connections
          - Round Trip Latency in establishing connection
            - time for message to be sent, and ack received
        - retransmission of lost data
          - Retransmission Latency
            - time from packet loss until retransmission received
      - Head of Line Blocking
        - occurs as result of in-order delivery of segments. 
          - aspect of reliability
          - if one segment missing...
            - segments later in sequence are buffered until retransmitted segment received/processed.
              - may increase queuing delay latency. 

      

      ### UDP
        - Connectionless protocol 
          - No waiting for connection establishment
          - Can just begin sending data
          - Lower latency
            - No waiting for acknowledgements or retransmission
            - No in order delivery to cause potential queuing delays
        - Provides Source Port/Destination Port 
          - multiplexing capability 

        - UDP vs TCP Offerings
          - No guarantee of message delivery: *unreliable*
            - No retransmission of lost data 
          - No in-order delivery 
          - No connection state tracking: *connectionless*
          - No Flow Control or Congestion Avoidance

          - UDP Benefits
            - Faster and more flexible 
            - Customizable
              - UDP can be used as a template to built out other necessary functions:
                - ex. in-order delivery, but no retransmission, etc. 
            - Useful in applications that require fast transmission of data with acceptable occasional data loss. 





  ## URLs





  ## HTTP & Request/Response Cycle 





  ## Security 










<!-- It's Christmas time in Whoville, and Cindy Lou has just received her ceremonial apple during the feast. Little did the other Whovillians know, but Cindy has been on the Keto diet for the past six months, and can't possibly introduce that blood sugar spike to her system. 

In her benevolence, she has decided to send the apple to her ole pal the Grinch as a gesture of goodwill. Her only concern is that the apple will freeze on the way up Mt. Crumpit, and if the Grinch receives a frozen apple, it may be misconstrued as a sign of hostility from the Whos. It is important that the apple reach the Grinch reliably, and free of frost corruption. 

Luckily, the physics of life on a snowflake have enabled fruit products to be transported reliably and securely over the Winternet, which is facilitated by increasingly larger Whoville civil servants.

The main requirement for transport over the Winternet is that the fruit product be processed and packaged appropriately for the journey. Fortunately for Cindy Lou, this can be done from the comfort of her seat at the feast. 

Let's see how this process works and what it teaches us about data moving through layers of a network: 

  - Step 1: Cindy has the apple in her hands. She writes a nice card to accompany the gift, and is ready to send it. The apple and card are arranged nicely, and packaged for transport.  

  This is the Application Layer. We are concerned with the structure of the message and the data it should contain. Cindy is sending the apple to the Grinch as the data payload in a HTTP POST Request. The Grinch acts as the server who will receive the data/resource. The way in which the data is processed is up to the Grinch.


  - Step 2: The gift is received by the first helper who whispers some magic words about reliability and in-order delivery before placing the received package in a larger container with information about the 

  This is the Transport Layer -->





