#!/bin/bash
# https://www.quora.com/What-is-the-difference-between-jitter-and-ping
# Ping is an application, typically utilizing ICMP echo-request and echo-reply messages to measure the reachability, and round-trip time (RTT) to a destination and back. Half of RTT is what we commonly refer to as latency, the time it takes to go in one direction. If you tell ping to go 100 times, you will notice that RTT typically will vary across the sampling. The RTT change from one test to the next, is the jitter, or how latency is changing with time.

ping www.google.com

# In this test, I have used ping 10 times to measure the RTT to www.google.com. The first attempt returned in 16.7 milliseconds. So the RTT at that moment was 16.7 ms, latency would be approximately half at 8.8 ms. Looking at the next result, with an RTT of 12.9, an approximate latency of 6.5 ms, represents a jitter of 2.3 ms (8.8 - 6.5). If every ping was the same result at 16.7 ms, then jitter would be 0.
# Jitter values > 30 ms are noticed in real time applications such as voice and video (e.g. Skype), but most applications are tolerant of much greater degrees of jitter.
