# Internet Bandwidth Speed Testing with `curl` and `wget`

A practical guide to measuring download and upload throughput in MB/s from the command line — no third-party apps required.

---

## Understanding Units

Before running any test, be clear on units:

| Symbol | Meaning | Notes |
|--------|---------|-------|
| **MB/s** | Megabytes per second | File transfer speed — what this guide targets |
| **Mb/s** or **Mbps** | Megabits per second | ISP-advertised speed (divide by 8 to get MB/s) |

`curl`'s `%{speed_download}` variable reports in **bytes/second**. To convert to MB/s, divide by **1,048,576** (1024²). `wget` reports natively in KB/s or MB/s in its progress output.

---

## Reliable Test Servers

These servers are purpose-built for bandwidth testing and are maintained by reputable infrastructure providers. All URLs were verified as of March 2026.

### Hetzner (Europe & USA — 10 Gbps backbone)

Hetzner provides dedicated speed-test endpoints across multiple data centres. They are among the most reliable public test servers available.

| Region | Host | Files Available |
|--------|------|----------------|
| Falkenstein, DE | `fsn1-speed.hetzner.com` | 100MB, 1GB, 10GB |
| Nuremberg, DE | `nbg1-speed.hetzner.com` | 100MB, 1GB, 10GB |
| Helsinki, FI | `hel1-speed.hetzner.com` | 100MB, 1GB, 10GB |
| Ashburn, US | `ash-speed.hetzner.com` | 100MB, 1GB, 10GB |
| Hillsboro, US | `hil-speed.hetzner.com` | 100MB, 1GB, 10GB |

Example URL: `https://fsn1-speed.hetzner.com/100MB.bin`

### Tele2 (Europe — anycast, 10 Gbps)

Tele2's speedtest service uses IP anycasting to route you to the nearest node automatically. It also supports upload testing via FTP.

| Protocol | URL |
|----------|-----|
| HTTP download | `http://speedtest.tele2.net/100MB.zip` |
| HTTP download (large) | `http://speedtest.tele2.net/1GB.zip` |
| FTP upload target | `ftp://speedtest.tele2.net/upload/` |

### OVH (Global)

OVH hosts plain HTTP test files with no authentication required.

| File Size | URL |
|-----------|-----|
| 1 MB | `http://ovh.net/files/1Mb.dat` |
| 10 MB | `http://ovh.net/files/10Mb.dat` |
| 100 MB | `http://ovh.net/files/100Mb.dat` |

> **Choosing file size:** Use 100 MB for connections up to ~500 Mbps. Use 1 GB or larger for gigabit links to allow the measurement to stabilise.

---

## Download Speed Tests

### Using `wget`

`wget` displays a real-time progress bar with speed in KB/s or MB/s and prints a final average at completion. Redirect output to `/dev/null` to avoid writing to disk.

**Basic download test:**

```bash
wget -O /dev/null https://fsn1-speed.hetzner.com/100MB.bin
```

**Quiet mode — suppress verbose output, show only progress:**

```bash
wget -q --show-progress -O /dev/null https://fsn1-speed.hetzner.com/100MB.bin
```

**Reading the output:**

```
/dev/null        [=============================>] 100.00M  45.2MB/s    in 2.2s
2026-03-23 12:00:00 (45.2 MB/s) - '/dev/null' saved
```

The final line is the authoritative average speed in MB/s.

---

### Using `curl`

`curl` reports `%{speed_download}` in **bytes/second**. The commands below convert this directly to MB/s using `awk`.

**Basic download with human-readable MB/s output:**

```bash
curl -o /dev/null -s \
  -w "Download speed: %{speed_download} bytes/s\n" \
  https://fsn1-speed.hetzner.com/100MB.bin
```

**Clean MB/s output (converted inline with awk):**

```bash
curl -o /dev/null -s \
  -w "%{speed_download}" \
  https://fsn1-speed.hetzner.com/100MB.bin \
  | awk '{printf "Download: %.2f MB/s\n", $1/1048576}'
```

**Verbose timing breakdown (DNS, connect, transfer):**

```bash
curl -o /dev/null -s \
  -w "\n--- Timing ---\nDNS lookup:    %{time_namelookup}s\nConnect:       %{time_connect}s\nStart xfer:    %{time_starttransfer}s\nTotal time:    %{time_total}s\nAvg speed:     %{speed_download} bytes/s\n" \
  https://fsn1-speed.hetzner.com/100MB.bin
```

**Progress bar mode (visual, no silent flag):**

```bash
curl -# -o /dev/null \
  -w "\nAverage: %.0f bytes/s\n" \
  https://fsn1-speed.hetzner.com/100MB.bin
```

---

## Upload Speed Tests

Upload testing requires a server that accepts incoming data. Use `curl` with either HTTP PUT or FTP.

### HTTP Upload via `curl` (Tele2 — discard endpoint)

Generate a temporary test file using `/dev/zero`, upload it, then remove it:

```bash
# Create a 50 MB test file of zeroes
dd if=/dev/zero bs=1M count=50 2>/dev/null | \
curl -T - \
  -w "Upload speed: %{speed_upload} bytes/s\n" \
  http://speedtest.tele2.net/upload.php \
  -o /dev/null
```

**With MB/s conversion:**

```bash
dd if=/dev/zero bs=1M count=50 2>/dev/null | \
curl -T - \
  -w "%{speed_upload}" \
  http://speedtest.tele2.net/upload.php \
  -o /dev/null \
  | awk '{printf "Upload: %.2f MB/s\n", $1/1048576}'
```

### FTP Upload via `curl` (Tele2 — files auto-deleted on completion)

```bash
# Create a local test file first
dd if=/dev/zero of=/tmp/upload_test.bin bs=1M count=20

curl -T /tmp/upload_test.bin \
  ftp://speedtest.tele2.net/upload/ \
  -w "\nUpload speed: %{speed_upload} bytes/s\n"

# Clean up
rm /tmp/upload_test.bin
```

---

## Running Multiple Tests for Accuracy

A single test can be skewed by transient congestion. Run three consecutive tests and compare:

```bash
for i in 1 2 3; do
  echo -n "Run $i: "
  curl -o /dev/null -s \
    -w "%{speed_download}" \
    https://fsn1-speed.hetzner.com/100MB.bin \
    | awk '{printf "%.2f MB/s\n", $1/1048576}'
done
```

---

## Converting the Numbers

### Bytes/s to MB/s

```
MB/s = bytes/s ÷ 1,048,576
```

### MB/s to Mbps (to compare with ISP-quoted speeds)

```
Mbps = MB/s × 8
```

**Example:** `curl` reports `speed_download = 47,185,920 bytes/s`

- MB/s = 47,185,920 ÷ 1,048,576 = **45.0 MB/s**
- Mbps = 45.0 × 8 = **360 Mbps**

---

## Tips for Accurate Results

- **Close other network activity** before testing (streaming, backups, sync services).
- **Test from wired Ethernet**, not Wi-Fi, to isolate internet throughput from wireless overhead.
- **Use a geographically close server** — a physically distant server adds latency that can reduce measured throughput, especially on high-speed connections.
- **Use larger files on fast connections** — a 100 MB file on a 1 Gbps link completes in under a second and may not reach full speed. Use 1 GB or 10 GB files instead.
- **Run tests at different times of day** to identify peak-hour throttling by your ISP.
- `curl`'s `%{speed_download}` is an **average over the entire transfer**, not a peak. This is typically the most meaningful figure for bandwidth assessment.
