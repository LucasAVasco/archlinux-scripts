#!/bin/bash
#
# Monitor traffic over the nftables firewall

set -eof pipefail

# Trace chain creation
nft add table inet trace_table
nft add chain inet trace_table trace_chain { type filter hook prerouting priority -1500\; }
nft add rule inet trace_table trace_chain meta nftrace set 1

# Cleanup
remove_trace_table() {
	nft delete chain inet trace_table trace_chain
	nft delete table inet trace_table
}
trap remove_trace_table EXIT

# Monitor
nft monitor trace
