# Study Guide for LS171: Networking Foundations

  ## The Internet 

  
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

     - Frames: 
        - PDU encapsulates data from Internet/Network layer. 
        - physical layer is stream of bits
          - ethernet frame structures bits logically 
            - defines which bits are payload, and which are metadata for transporting frame. 
            - key components are Source and Destination MAC addresses and Data Payload 

    Ethernet provides a bridge between the physical infrastructure of the network and the higher-level protocols that handle tasks like routing data to the correct destination (the network layer), ensuring reliable transmission (the transport layer), and managing applications' network connections (the application layer).


    #### Internet|Network Layer: facilitate communication between hosts on different networks

      - Internet Protocol 
        - enables communication between two networked devices anywhere in world.
      
      - Primary Features:
        - Routing capability via IP addressing 
        - Encapsulation of data into packets 




      



  ### IP addresses and port numbers 



  
  
  ### How DNS works.





  ### Client/Server Model and role of HTTP in model







  ## TCP & UDP 




  ## URLs





  ## HTTP & Request/Response Cycle 





  ## Security 










