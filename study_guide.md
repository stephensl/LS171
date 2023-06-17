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
    - means by which protocols at different layers can work together.
  
  - Each layer encapsulates data from the layer above as its data payload, and packages it as PDU for the layer below. 

  - Encapsulation provides separation of layers, as they do not need to know anything about the other layers, only that they need to encapsulate some data received from the layer above and provide the result of the encapsulation to the layer below. 

    - Lower layer provides a "service" to the layer above. 

   

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
  
  ### How DNS works
    - Domain Name System 
      - Distributed database
        - translates domain name to IP address to be used to make request to server.
      - DNS Servers
        - large, hierarchical network
        - routes to DNS server containing corresponding IP address

    #### DNS Sequence in Web Browser 
      1. Enter URL like http://google.com in web browser 
      
      2. Browser creates HTTP request, packaged and sent to device's network interface. 

      3. If device has record of IP address for domain name in DNS cache, will use cached address. 

      4. If IP address not cached, a DNS request made to Domain Name System for IP address of domain.

      5. Packaged up HTTP request goes over internet to server with matching IP address. 

      6. Server accepts request and sends response over internet back to network interface, which provides it to the browser. 

      7. Browser displays response in form of web page. 


      #### HTTP Request Key Point as Text Based Protocol 
        - When browser issues request, simply sending some text to an IP address. 
          - Because client (web browser) and server have an agreement/protocol (HTTP) the server can take apart the request, understand its components and send a response back to web browser. 
        - Web browser then processes response strings into understandable content. 


      #### HTTP is a Stateless Protocol 
        - each request/response pair is completely independent of previous one.
          - Server does not store information or state between requests
            - if request breaks en route to server, no cleanup required
              - HTTP is resilient
              - HTTP makes it difficult to simulate statefulness in web applications.
                - Developers must implement semblance of state in other ways, on top of HTTP.

        ##### Stateful Web Applications
          
        - Sessions

            - Session Identifier (session id)
              - unique token issued by server to client
                - client appends token to requests to allow server to identify client
                - used as key for accessing stored data on server 

              - server must work hard to simulate stateful experience: 
                 - check to see if session id included in request
                 - validate session id 
                 - retrieve session data based on session id
                 - recreate application state (HTML for web req) from session data
                 - send back to client
              - Server also must implement rules on expiration, and session data storage. 
              - Every request still gets response, even if nearly identical to previous.

        - Cookies
            - session id sent to client in form of a cookie (key to access data on server)
            - piece of data sent from server and stored in client (browser) during RR cycle
              - Used to store session information and identify client in persistent manner
           
           *Actual session data stored on server, but client side cookie is compared to server-side session data on each request to identify the current session.*


        - AJAX (Asynchronous JavaScript)

          - Allows browser to issue requests and process responses without a full page refresh.

          - Responses to AJAX requests are processed by a `callback`
            - piece of logic pass to some function to be executed after a certain event has happened.
              - in this case, callback is triggered when response is returned
                - callback that is generating asynchronous requests/responses is updating the HTML
            
          - AJAX Key point
            - AJAX requests are just like normal requests: they are sent to the server with all the normal components of an HTTP request, and the server handles them like any other request. The only difference is that instead of the browser refreshing and processing the response, the response is processed by a callback function, which is usually some client-side JavaScript code.

        - URL Parameters
            - Though limited in utility due to max size and security concerns
            - It's possible to send simple, limited data via URL parameters; this is one way in which we can simulate a stateful application.
            

  ### Client/Server Model and role of HTTP in model

    - Client
      - Most common is Web Browser (though many apps/tools issue HTTP requests)
        - responsible for issuing HTTP requests and processing HTTP response in user friendly manner
    - Server 
      - Devices capable of handling inbound requests
        - role is to accept the request and issue a response back








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



# HTTP 
  - Functioning of web as combination of multiple technologies.
  - HTTP was designed for simplicity and interoperability
    - This simplicity makes it difficult to develop and secure web applications
      - Statelessness: challenging to implement features that depend on statefulness
      - Lack of security: no built in security mechanism

## Application Layer
  - Not application itself
    - Set of protocols providing communication services to applications.  
      - Protocols at this layer most directly interact with application.
  
  ### Primary Concern 
    - Focus on the structure of the message and data it should contain. 
      - Relies on lower level protocols to handle establishment and flow of communications.
        - How message gets from point A to point B

  ### Application Layer Protocols 
    - Rules for how applications communicate at at syntactical level. 
      - Many different protocols at Application layer depending on use case. 
        - HTTP primary protocol for web communications

  #### Internet vs Web
    - Internet
      - network of networks
      - physical infrastructure and protocols that allow infrastructure to function
        - Ultimate goal is communication between networks.
    - World Wide Web
      - *service* accessed via the internet.
      - vast information system comprised of resources
        - navigable by URL 
    **HTTP is primary means for applications to interact with resources that comprise the web**

  
  #### Web Background/History 
    - Information system of structured resources connected by hyperlinks. 
      - Uniformity necessary for: 
        - rendered viewing
        - easily located
        - request standardization 
      
      - Initially achieved by combination of HTML, URI, and HTTP.

        - HTML
          - Hypertext Markup Language
            - structuring text documents 
              - used anchor element and href attribute to link to other resources. 

        - URI 
          - Uniform Resource Identifier
            - string of characters identifying particular resource.

        - HTTP 
          - Hypertext Transfer Protocol 
            - set of rules providing uniformity to transfer of resources between applications.
              - agreement or message format for how machines communicate with each other. 
            - Request-Response Protocol 

  ## URLs
    - Uniform Resource Locator 
      - similar to an house address or phone number needed to communicate with friend
      - most frequently used aspect of general Uniform Resource Identifier (URI) concept, which specifies how resources located.
      - URLs are a subset of URIs that in addition to identifying resource, provide network location

    ### URL Components with example: `http://www.example.com:88/home?item=book`
      * at minimum, must contain scheme and host. 

      - `http:` 
        - Scheme
          - defines which family of protocols to use to access resource
          - scheme names should be lowercase, protocol names uppercase.
            - http:
            - ftp:
            - mailto:
            - git: 

      - `www.example.com`
        - Host
          - tells client where resource is hosted/located

      - `:88`
        - Port (assumed to be part of URL)
          - only required to specify if other than default
            - Defaults: http(:80) and https(:443)

      - `/home` 
        - Path (optional)
          - which local resource is being requested
          - may point to specific resource on the host
            - ex. http://www.example.com/home/index.html

      - `?item=book`
        - Query String (optional)
          - comprised of Query Parameters 
          - used to send data to the server

      #### URLs and Filepaths
        - Early days of web, path represented a physical file location on Web server.
          
          - Much of the content generated dynamically now
            - Dynamic generation happens on server side via: 
              - frameworks/apps combine templates with stored data to produce HTML pages, which form the body of an HTTP response. 
            
            - Client side frameworks
              - less common
                - HTTP response contains raw data
                - Data manipulated by app running in browser before rendered

          - NOTES on URL path 
            - Although these server-side and client-side frameworks differ in their implementation, one thing they have in common is that the way the path portion of the URL is used is determined by the application logic, and doesn't necessarily bear any relationship to an underlying file structure on the server.

            - The way that the path is used will vary according to the specific implementation of the application or framework, but often involves URL pattern-matching to match the path to a pre-defined 'route' which then executes some specific logic.


        
      #### Query Strings/Parameters 
        - Usually only used in HTTP GET requests 

        - Example URL: `http://www.example.com?search=ruby&results=10`
        
        - `?` indicates start of query string 
        
        - `search=ruby` query parameter=value
        
        - `&` reserved character, adding more parameters to string
        
        - `results=10` query parameter=value

      **Query strings are passed to the server through the URL, how they are utilized is up to server side code**

        - Query String Limitations
          - max length 
          - name/value pairs visible in URL
          - spaces and certain characters cannot be used, or must be URL encoded

      ##### URL Encoding 
        - URLs designed to only accept certain characters in the standard 128-character ASCII character set. 
          
          - Characters must be encoded if: 
            
            - No corresponding character within standard ASCII. 
              - includes all extended ASCII characters, and 2, 3, and 4 byte UTF-8 characters. 
            
            - Unsafe character, may be misinterpreted or used to encode other characters
              - `%` 
              - spaces
              - quotation marks
              - `#` 
              - `< >`, `{ }`, `[ ]`, `~`, etc.

            - Special characters in URL scheme.
              - serve a particular purpose and must be encoded
                - `/`
                - `?`
                - `:`
                - `@`
                - `&`

            - Safe URL Characters
              - Alphanumeric
              - Special Characters
                - `$`, `-`, `.`, `+`, `!`, `'`, `()`, `"`, `,`
              - Reserved characters when used for their reserved purpose.
                - if not being used for reserved purpose, must be encoded.








  ## HTTP & Request/Response Cycle 

    Client and Server (regardless of type of server/software) will communicate in much the same way..via HTTP
      - Only specific functionality may vary based on use case. 
    
    ### What happens when you enter a URL into a web browser?

    1. Client enters URL in search bar. `http://espn.com/`
    
    
    2. Browser generates `GET` request

      - HTTP Request must include required: 
        - METHOD
          - `GET`, `POST`
        - PATH
          - identifies location on server
        - HEADER
          - `Host` header
      
      - Optional:
        - Parameters
        - other headers
        - Body

      - Omissions
        - Domain name not included, though included in `Host` Header
          - used to determine which server to send request to
            - not part of request itself
          - once connection has been created between client and server, domain name becomes redundant. 
    

    
    3. Sends request to server over network (encapsulated through the lower layers and transported)


    
    4. Server receives request:
      
      - Performs tasks based on:  
        - functionality of server
        - software programming
      
      - Example: workflow for Ruby web application
        1. Verify user session
        2. Load tasks from database
        3. Render HTML


      
      5. Server sends response 
        - Status Line
          - Status Code and Text
          - `200 OK`
        - Headers
          - `Content-Type:text/html`
        - Body
          - optional
          - html code used by browser to render page
            - `<html><body>...` 


        
        6. Response received by client
          - Checks `Content-Type` header
            - acts accordingly
              - Example: receiving HTML for webpage, will display for user. 


  Required for HTTP Request/Response Messages

    Required HTTP Request Components: 
      - These components comprise the "start/request-line":
        - Method
        - Path 
          - AKA "request uri"
        - Version of protocol being used.
      
      - Host Header
        - since HTTP/1.1

    - Optional for Requests
      - Parameters
      - All other headers
      - Body
        

    
    
    Required HTTP Response Components
      - Status Line
        - includes HTTP version, status code, and status message
      
    
    
    Optional for Response (kind of)
        - Headers
          - even if no data, must include blank line indicating end of headers

    Optional for Response (for sure)
        - Body

      


    ### GET Requests
      - GET requests are used to retrieve a resource, and most links are GETs.
      - The response from a GET request can be anything, but if it's HTML and that HTML references other resources, your browser will automatically request those referenced resources. A pure HTTP tool will not.

    ### POST Requests
      - Send or submit data to the server
        - Ex. username/password, larger files
          - sensitive data we don't want to include in URL
      - HTTP Body (optional)
        - data being transmitted in HTTP message
          - can contain HTML, images, audio, etc.

    ### Browser Abstraction
      - hides a lot of underlying HTTP request/response cycle
        - when loading webpage, will generate GET requests for all elements
        - when provided `Location` header in HTTP response header, issues `GET` to that location automatically. 
      - browser provides lots of built-in functionality/abstraction vs simple HTTP tools


    ### HTTP Headers
      - allow client/server to send additional information during RR cycle. 
        - colon separated name:value pairs in plain text

      - Request Headers 
        - provide more info about client and resource to be fetched. 
          - `Host`: domain name of server 
          - `Accept-Language`: list of acceptable languages
          - `User-Agent`: string identifying client
          - `Connection`: type of connection client would prefer

    **Most important components to understand about an HTTP request are:**

      - HTTP method
      - path (the resource name and any query parameters)
      - headers
      - message body (for POST requests)

    ### HTTP Responses 
      - Data returned by server 

      - Components of HTTP Response
        
        - Status Codes
          - sent by server indicates status of request
            - 200: OK
            - 302: FOUND (changed temporarily, usually redirected)
              - redirect to new URL
                - when browser sees response 302, checks `Location` response header for new URL. 
            - 404: NOT FOUND
            - 500: INTERNAL SERVER ERROR

        - Response Headers 

          - Common headers: 
            - Content-Encoding: type of encoding used on data
            - Server: name of server  
            - Location: notify client of new resource location
            - Content-Type: type of data response contains

    **The most important parts of an HTTP response are:**
      - status code
      - headers
      - message body, which contains the raw response data


  ## Server Side
    - Web Server
      - serves web pages, static assets, files, images, css, js, etc. 
      - role is simple retrieval for resources NOT requiring processing
    
    - Application Server
      - Server side code
        - Application and/or Business Logic
      - Utilizes Data Store to access persistent information

    - Data Store
      - persistent data store
      - utilized to induce statefulness


  #### HTTP/TCP/IP Interaction
    - HTTP is relying on a TCP/IP connection (most of the time).
    
    1. The client (usually a web browser) establishes a TCP connection with the server. This is done using the TCP/IP protocol, which is responsible for ensuring the reliable transmission of data over the internet.

    2. Once the TCP connection is established, the client and server perform the SSL/TLS handshake over the TCP connection. This handshake involves the exchange of encryption keys and the establishment of a secure SSL/TLS session.

    3. Once the secure session is established, HTTP data is transmitted over this secure session. The HTTP data is encrypted by SSL/TLS before being sent over the TCP connection.

    - In an HTTPS connection, both TCP and SSL/TLS are used. 
      - TCP = actual transmission of data packets, 
      - SSL/TLS = secure the HTTP data that is being transmitted.





  ## Security 

  - Building in HTTP is difficult

    ### Potential Issues
      - Stealing browser session id
        - Crafting message to server impersonating you
      - Searching cookies
      - Packet sniffing

      HTTP is just text. 

      ### Secure HTTP (HTTPS)
        - Encryption prior to transport over network.

#### Protocol: Transport Layer Security (`TLS`)

    - TLS is a cryptographic protocol used to increase security over computer networks. 

    - The primary goal of the TLS protocol is to provide privacy, data integrity, and authenticity between two or more communicating computer applications.
      - Confidentiality: encryption 
      - Data Integrity: cryptographic functions/authentication codes
      - Authenticity: digital certificates and asymmetric encryption

  #### TLS Encryption

    - TLS uses a system of trusted certificates to establish an encrypted connection. 
    - Certificates issued by certificate authorities (CAs), to help verify the identities of involved parties. 
    - When a client and server communicate, they exchange these certificates to establish the authenticity of both parties, set up a secure line of communication, and exchange security keys prior to encryption.
    - Once the secure connection is established, data transferred between the server and client is encrypted and secure from eavesdropping or tampering.



  #### Same Origin Policy 
    - Unrestricted interaction between resources originating from the same origin, but restricts certain interactions between resources originating from different origins. 

      - Origin: scheme, host, and port
        - http://mysite.com/doc1 and http://mysite.com/doc2 have SAME origin.
          - both have different origin than https://mysite.com/doc3 (different scheme)

          - Example: 
            - If a script from http://espn.com tries to make a request to http://github.com, the browser would recognize this as a cross-origin request. 

            *The origin of a script is determined by the URL of the document that loaded it, not where the script itself was written or where it's being executed. So if a script is loaded as part of a webpage from http://espn.com, its origin is http://espn.com, even if the script itself was written by a third-party advertiser or hosted on a different server. Script is confined to the context of the webpage that loaded it.*



  #### Session Hijacking

    - Session plays important role in simulating statefulness, but comes with security risks. 
      
      - session id: random string and comes in form of cookie stored on client
        - included in requests
        - allows server to recognize session
          - ex. not having to re-authenticate every time visit page

    - Attack: 
      - If attacker knows session id, can access web applications with same access as the user. 
        - user will not even know attacker accessing session without knowing username/password

    - Defense:
      
      - Resetting sessions
        - authentication
          - successful login must cancel old session id, and create new one
        - Commonly implemented before accessing sensitive information
          - Re-authenticate
          - Session ID changes
          - Attacker cannot access with old session id


      - Session Expiration
        - setting expiration time on sessions to limit window of using same session id

      - HTTPS across entire application
        - minimize chance of leaking session id 

          


  #### Cross Site Scripting(XSS)
      
  - Vulnerability: 
    - allowing user to input HTML or JavaScript that is displayed on site directly
      - POST to server.
    - If server side code does not sanitize input, user input added to the page contents and the browser will interpret and execute the HTML/JS files. 

    - Attacker could use JavaScript to access session id of every visitor, then impersonate them later. 
      - Would PASS Same Origin Policy! (origin is url of page that loaded it)

    
  - Defense: 
    - Always sanitize user input. 
      - Enforce rules on problematic input
    
    - Escape all user input data when displaying it
      - If need to input HTML/JS, escape it so browser does not interpret it as code.
        - Use HTML Entities 
          - combinations of ASCII characters used to replace HTML character
            - tells client to display character as is, and not process it. 














<!-- It's Christmas time in Whoville, and Cindy Lou has just received her ceremonial apple during the feast. Little did the other Whovillians know, but Cindy has been on the Keto diet for the past six months, and can't possibly introduce that blood sugar spike to her system. 

In her benevolence, she has decided to send the apple to her ole pal the Grinch as a gesture of goodwill. Her only concern is that the apple will freeze on the way up Mt. Crumpit, and if the Grinch receives a frozen apple, it may be misconstrued as a sign of hostility from the Whos. It is important that the apple reach the Grinch reliably, and free of frost corruption. 

Luckily, the physics of life on a snowflake have enabled fruit products to be transported reliably and securely over the Winternet, which is facilitated by increasingly larger Whoville civil servants.

The main requirement for transport over the Winternet is that the fruit product be processed and packaged appropriately for the journey. Fortunately for Cindy Lou, this can be done from the comfort of her seat at the feast. 

Let's see how this process works and what it teaches us about data moving through layers of a network: 

  - Step 1: Cindy has the apple in her hands. She writes a nice card to accompany the gift, and is ready to send it. The apple and card are arranged nicely, and packaged for transport.  

  This is the Application Layer. We are concerned with the structure of the message and the data it should contain. Cindy is sending the apple to the Grinch as the data payload in a HTTP POST Request. The Grinch acts as the server who will receive the data/resource. The way in which the data is processed is up to the Grinch.


  - Step 2: The gift is received by the first helper who whispers some magic words about reliability and in-order delivery before placing the received package in a larger container with information about the 

  This is the Transport Layer -->





