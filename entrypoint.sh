#!/bin/bash
set -e

# Initialize an empty array for arguments
args=()

# Iterate through each argument passed to the script
for arg in "$@"; do
    # Replace literal '$Z_AI_TOKEN' with the value of the environment variable Z_AI_TOKEN
    # using bash string replacement: ${var//pattern/replacement}
    expanded_arg="${arg//\$Z_AI_TOKEN/$Z_AI_TOKEN}"
    
    # Add the (potentially modified) argument to the array
    args+=("$expanded_arg")
done

# Execute the original command (mcp-proxy) with the modified arguments
exec mcp-proxy "${args[@]}"
