# Mental Model of the Internet 

  - The internet is a "network of networks" 
  - Allows networks all over the world to connect and share information
  - Provides the physical and logical infrastructure that enables inter-network communication


# Protocols and Why Important

  - Protocols are established and agreed upon rules that support successful communication. 
    - define how data is formatted, transmitted, received, acknowledged over a network.
    - ensure that devices can communicate by following the same rules. 

  - Different protocols to address *different aspects* of network communication. 
    - Syntactical rules governing speech vs flow/order rules governing speech.
      - TCP/HTTP : different aspects of communication 
          - TCP: transfer of msg
          - HTTP: structure of msg
  
  - Different protocols to address *same aspect*, but in a different way for specific use case.
    - Message flow and order
      - Different protocol depending on context, but same *aspect* of communication. 
        - Ex. TCP/UDP : both concerned with transferring messages between applications, but do so differently. 


# Layer Models 
  - Used in order to abstract away some of the complexity of network communication and allow us to examine relevant processes in a structured and modular way. 

  - OSI vs TCP/IP

    - OSI: concerned with functions that each layer provides
      - physical addressing, logical addressing, routing, etc. 

    - TCP/IP: concerned with scope of communication within each layer
      - within a local network, between networks, etc.


# Encapsulation
  Encapsulation is a key concept in understanding how network communication happens among different layers and protocols. 
  
  - Each layer encapsulates data from the layer above as its data payload, and packages it as PDU for the layer below. 

  - Encapsulation provides separation of layers, as they do not need to know anything about the other layers, only that they need to encapsulate some data received from the layer above and provide the result of the encapsulation to the layer below. 

    - Lower layer provides a "service" to the layer above. 




