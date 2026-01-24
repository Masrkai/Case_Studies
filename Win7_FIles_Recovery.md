# Case Study: Data Retrieval and Virtualization of a Legacy Windows 7 Installation

**1. Background and Context**
The subject workstation underwent a hardware storage migration, wherein the primary Hard Disk Drive (HDD) was replaced with a Solid State Drive (SSD) to optimize system performance. Subsequently, the host hardware (chassis and upgraded SSD) was transferred to a third party. The original physical HDD remained in the possession of the author for archival purposes.

**2. Problem Statement**
Following the hardware transfer, a requirement was identified to retrieve critical user data stored on the original HDD. The direct installation of this drive into a secondary machine was not the preferred solution. Instead, the objective is to leverage virtualization technology to interface with the legacy storage medium.

**3. Technical Environment**

* **Source Media:** 1x Physical Hard Disk Drive (HDD) containing a pre-installed Windows 7 Operating System.
* **Host System:** Current workstation running a Linux-based Operating System.
* **Hypervisor:** QEMU/KVM (Kernel-based Virtual Machine) managed via Virt-Manager (libvirt).

**4. Case Study Objectives**
The primary goals of this technical study are as follows:

* **Data Recovery:** To successfully mount and retrieve specific files from the existing file system on the HDD.
* **OS Virtualization:** To configure a Virtual Machine (VM) capable of booting the legacy Windows 7 installation directly from the physical HDD.
* **Authentication:** To access the Windows 7 user environment and authenticate into the user account to facilitate file recovery.
