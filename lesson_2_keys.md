# Transport Layer 

**Networked applications need more than can be provided by IP:** 
  - Direct connection between applications 
  - Reliable network communication 


## Multiplexing and Demultiplexing 
  - How ports and IP addresses work together to provide this functionality. 

## Network Reliability is Engineered 

 #### The fundamental elements required for reliable data transfer:
  
  1. In-order delivery: data is received in the order that it was sent
    
  2. Error detection: corrupt data is identified using a checksum
    
  3. Handling data loss: missing data is retransmitted based on acknowledgements and timeouts
    
  4. Handling duplication: duplicate data is eliminated through the use of sequence numbers


  - Network up to and including the Internet Protocol is effectively unreliable. 
    - Ethernet and IP include checksum data to test for corruption, but if it is corrupted, it is simply discarded.
      - There is no provision for retransmission. 

      
**The possibility of data being lost and not replaced is what makes the network up to this point unreliable.**

## TCP vs UDP Tradeoffs 

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

  
        


