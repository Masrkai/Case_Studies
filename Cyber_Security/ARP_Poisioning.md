# **Technical Documentation: ARP Poisoning Attack**

---

## **Introduction to ARP Poisoning**

ARP (Address Resolution Protocol) poisoning, also known as **ARP spoofing**, **ARP cache poisoning**, or **ARP flood attack**, is a type of cyber attack that exploits the inherent trust in local network communication. The attack allows an attacker to intercept, modify, or stop data in transit between devices on a Local Area Network (LAN).

### **Why ARP is Vulnerable**

ARP is a stateless protocol used to map IP addresses to MAC (Media Access Control) addresses. It operates at Layer 2 of the OSI model and does **not** authenticate responses. This means any device can claim to be another by sending unsolicited ARP replies, which the target device will accept and cache.

---

## **How ARP Poisoning Works: Step-by-Step**

### **1. Understanding Normal ARP Operation**

- When Device A wants to communicate with Device B, it checks its ARP cache for Device B’s MAC address.
- If the MAC address is not found, Device A broadcasts an **ARP request**: "Who has IP address X.X.X.X? Tell Y.Y.Y.Y."
- Device B responds with its MAC address: "I am X.X.X.X, my MAC is AA:BB:CC:DD:EE:FF."
- Device A updates its ARP cache and uses this MAC address for future communication.

### **2. The Attack Process**

1. **Reconnaissance**: The attacker scans the network to identify IP and MAC addresses of target devices (e.g., a gateway and a victim).
2. **Spoofing ARP Replies**: The attacker sends fake ARP replies to both the victim and the gateway, claiming:
   - "I am the gateway (X.X.X.1), my MAC is AT:TA:CK:ER:MA:CA" (to the victim)
   - "I am the victim (X.X.X.2), my MAC is AT:TA:CK:ER:MA:CA" (to the gateway)
3. **Cache Poisoning**: Both the victim and the gateway update their ARP caches with the attacker’s MAC address.
4. **Man-in-the-Middle (MitM)**: All traffic between the victim and the gateway now flows through the attacker, who can inspect, modify, or drop packets.

---

## **Example Packet Inspection**

### **Before Attack (Normal ARP Reply)**

```plaintext
Ethernet II, Src: DeviceB (AA:BB:CC:DD:EE:FF), Dst: DeviceA (11:22:33:44:55:66)
Address Resolution Protocol (reply)
    Sender MAC: AA:BB:CC:DD:EE:FF (DeviceB)
    Sender IP: 192.168.1.2
    Target MAC: 11:22:33:44:55:66 (DeviceA)
    Target IP: 192.168.1.1
```

### **After Attack (Spoofed ARP Reply)**

```plaintext
Ethernet II, Src: Attacker (AT:TA:CK:ER:MA:CA), Dst: DeviceA (11:22:33:44:55:66)
Address Resolution Protocol (reply)
    Sender MAC: AT:TA:CK:ER:MA:CA (Attacker)
    Sender IP: 192.168.1.1 (Gateway)
    Target MAC: 11:22:33:44:55:66 (DeviceA)
    Target IP: 192.168.1.1
```

- **Note**: The attacker’s MAC is now associated with the gateway’s IP in DeviceA’s ARP cache.

---

## **Detecting ARP Poisoning**

### **1. Manual Detection**

- **Check ARP Cache**: On Windows, use `arp -a`; on Linux, use `arp -n`. Look for duplicate IPs or unexpected MAC addresses.
- **Monitor ARP Traffic**: Use tools like Wireshark to inspect ARP packets. Unusual ARP replies (unsolicited or frequent) are red flags.

### **2. Automated Detection**

- **ARPwatch**: A tool that monitors ARP traffic and alerts on MAC/IP changes.
- **Dynamic ARP Inspection (DAI)**: A security feature on switches that validates ARP packets against a trusted database.

### **3. Symptoms of an Attack**

- Network slowdowns or intermittent connectivity.
- Unexpected logouts or session hijacking.
- Unusual traffic patterns or duplicate IP conflicts.

---

## **Preventing ARP Poisoning**

### **1. Static ARP Entries**

- Manually set ARP entries using `arp -s [IP] [MAC]` (not scalable for large networks).

### **2. Port Security**

- Configure switches to limit the number of MAC addresses per port and disable dynamic MAC learning.

### **3. ARP Spoofing Detection Tools**

- **Arpwatch**: Logs and alerts on ARP changes.
- **XArp**: Actively probes the network for ARP anomalies.

### **4. Network Segmentation**

- Use VLANs to isolate sensitive devices and limit the impact of an attack.

### **5. Encryption and Authentication**

- Use VPNs, HTTPS, or SSH to encrypt traffic, making interception less useful.
- Implement 802.1X port-based authentication to ensure only authorized devices connect.

### **6. Dynamic ARP Inspection (DAI)**

- Available on managed switches, DAI intercepts and validates ARP packets, dropping spoofed ones.

---

## **Mitigation Steps if Compromised**

1. **Clear ARP Cache**: Use `arp -d *` (Windows) or `ip -s -s neigh flush all` (Linux).
2. **Identify the Attacker**: Trace the spoofed MAC to its port using switch logs.
3. **Isolate the Attacker**: Disable the port or block the MAC address.
4. **Update Security Policies**: Enforce DAI, port security, and regular network audits.

---

## **Conclusion**

ARP poisoning is a serious threat due to ARP’s lack of authentication. Understanding how it works, recognizing the signs, and implementing preventive measures are critical for network security. Regular monitoring and the use of automated tools can significantly reduce the risk of such attacks.

**Further Reading:**

- [RFC 826: ARP Protocol](https://tools.ietf.org/html/rfc826)
- [Cisco: Dynamic ARP Inspection](https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst6500/ios/12-2SX/configuration/guide/book/dynarp.html)
