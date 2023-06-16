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


