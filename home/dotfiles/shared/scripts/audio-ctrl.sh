#!/usr/bin/env bash

kitty --class audio-output -e bash -c "$(cat <<'EOF'
clear
echo ""
echo "Audio"
wpctl status | awk '
/^Audio$/     { in_audio=1; next }
/^Video$/     { in_audio=0 }
in_audio {
    if ($0 ~ /^ ├─ Sinks:/) {
        print $0
        in_sinks=1; in_sources=0; next
    }
    if ($0 ~ /^ ├─ Sources:/) {
        print $0
        in_sources=1; in_sinks=0; next
    }
    if ($0 ~ /^ ├─/ || $0 ~ /^ └─/) {
        in_sinks=0; in_sources=0
    }

    if (in_sinks || in_sources) {
        print
    }
}
'
echo ""

echo "Default Sink: $(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -oP '^id \K[0-9]+')"
echo "Default Source: $(wpctl inspect @DEFAULT_AUDIO_SOURCE@ | grep -oP '^id \K[0-9]+')"
echo ""
echo "Change with: wpctl set-default <index>"
echo ""
bash
EOF
)"
