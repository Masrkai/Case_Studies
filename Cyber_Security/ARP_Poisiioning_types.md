# Types

## **1. Passive ARP Cache Poisoning**

- **How it works**: The attacker sends **unsolicited ARP replies** (gratuitous ARP) to the victim, claiming to be the gateway or another host.
- **Key point**: The victim **does not request** these replies. The OS updates the ARP cache automatically upon receiving the reply.
- **Example Packet**:

  ```
  Ethernet II, Src: Attacker_MAC, Dst: Victim_MAC
  ARP (reply)
      Sender MAC: Attacker_MAC
      Sender IP: Gateway_IP
      Target MAC: Victim_MAC
      Target IP: Victim_IP
  ```

- **Why it works**: ARP is stateless and trusts replies by default.

---

## **2. Gratuitous ARP (GARP)**

- **How it works**: The attacker sends ARP replies **broadcast** to the entire network, announcing a new MAC for an IP (e.g., the gateway).
- **Key point**: No request is needed. All devices update their ARP cache if they receive the GARP.
- **Example Packet**:

  ```
  Ethernet II, Src: Attacker_MAC, Dst: Broadcast (ff:ff:ff:ff:ff:ff)
  ARP (reply)
      Sender MAC: Attacker_MAC
      Sender IP: Gateway_IP
      Target MAC: 00:00:00:00:00:00
      Target IP: Gateway_IP
  ```

- **Why it works**: Used for redundancy/failover in legitimate networks, but abused for poisoning.

---

## **3. ARP Request Spoofing**

- **How it works**: The attacker sends **spoofed ARP requests** to the victim, pretending to be another host (e.g., the gateway).
- **Key point**: The victim may send a reply, but the attacker’s goal is to trigger cache updates or flood the victim.
- **Example Packet**:

  ```
  Ethernet II, Src: Attacker_MAC, Dst: Broadcast
  ARP (request)
      Sender MAC: Attacker_MAC
      Sender IP: Gateway_IP
      Target MAC: 00:00:00:00:00:00
      Target IP: Victim_IP
  ```

- **Why it works**: Can be used to map the network or trigger cache updates.

---

## **4. ARP Flooding (DoS)**

- **How it works**: The attacker floods the network with **fake ARP requests/replies**, overwhelming the victim’s ARP cache.
- **Key point**: The victim’s cache fills with junk entries, causing network disruption.
- **Example Packet**:

  ```
  Ethernet II, Src: Random_MAC, Dst: Broadcast
  ARP (request/reply)
      Sender MAC: Random_MAC
      Sender IP: Random_IP
      Target MAC: Random_MAC
      Target IP: Random_IP
  ```

- **Why it works**: Exploits the limited size of ARP caches.

---

## **5. Man-in-the-Middle (MitM) via ARP Poisoning**

- **How it works**: The attacker poisons **both the victim and the gateway**, intercepting all traffic between them.
- **Key point**: Requires two-way poisoning (victim ↔ attacker ↔ gateway).
- **Example Packets**:
  - To victim: "I am the gateway."
  - To gateway: "I am the victim."
- **Why it works**: All traffic flows through the attacker, enabling interception/modification.

---

## **Summary Table**

| Technique                | Packet Type         | Target          | Goal                          |
|--------------------------|---------------------|-----------------|-------------------------------|
| Passive Cache Poisoning  | Unsolicited ARP     | Single host     | Update ARP cache silently      |
| Gratuitous ARP (GARP)    | Broadcast ARP reply | All hosts       | Force cache update            |
| ARP Request Spoofing     | Spoofed ARP request | Single host     | Trigger replies/map network   |
| ARP Flooding             | Mass ARP requests   | Network         | DoS via cache overflow        |
| MitM via ARP Poisoning   | Two-way ARP replies | Victim & gateway| Intercept/modify traffic      |

---

**Ahmed, would you like to see a Wireshark filter or lab setup for any of these specific techniques?** Or do you want to dive deeper into how to detect/prevent each type?
