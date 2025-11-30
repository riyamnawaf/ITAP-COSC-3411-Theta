#!/bin/bash

echo "=========================================="
echo "   Scheduled Netcat Listener - Team Theta"
echo "=========================================="
echo ""

# ============================================================
# STEP 1: Get and Validate Port Number
# ============================================================

# Loop until we get a valid port (using for loop with break)
for i in {1..100}
do
    read -p "Enter port number (1024-65535): " port
    
    # Check if port is empty
    if [ -z "$port" ]; then
        echo "ERROR: Port cannot be empty! Please try again."
        echo ""
    # Check if port is less than 1
    elif [ "$port" -lt 1 ] 2>/dev/null; then
        echo "ERROR: Port must be a positive number!"
        echo ""
    # Check if port is less than 1024
    elif [ "$port" -lt 1024 ] 2>/dev/null; then
        echo "WARNING: Port $port requires root privileges!"
        read -p "Continue anyway? (yes/no): " confirm
        if [ "$confirm" = "yes" ]; then
            break
        else
            echo "Please choose a different port."
            echo ""
        fi
    # Check if port is greater than 65535
    elif [ "$port" -gt 65535 ] 2>/dev/null; then
        echo "ERROR: Port must be between 1 and 65535!"
        echo ""
    else
        # Port is valid, exit loop
        break
    fi
done

echo "✓ Port $port is valid"
echo ""

# ============================================================
# STEP 2: Choose Scheduling Option
# ============================================================

# Loop until we get a valid choice (using for loop with break)
for i in {1..100}
do
    echo "Select Scheduling Option:"
    echo "1) Start listener immediately"
    echo "2) Start listener after a delay"
    echo "3) Continuous listener (auto-restart)"
    echo ""
    read -p "Enter choice (1-3): " choice
    echo ""
    
    # Check if choice is valid
    if [ "$choice" = "1" ] || [ "$choice" = "2" ] || [ "$choice" = "3" ]; then
        break
    else
        echo "ERROR: Invalid choice! Please enter 1, 2, or 3."
        echo ""
    fi
done

# ============================================================
# STEP 3: Start Listener Based on Choice (using CASE)
# ============================================================

case $choice in
    1)
        # Option 1: Immediate Start
        echo "Starting listener immediately..."
        echo ""
        echo "=========================================="
        echo "Listener Status: ACTIVE"
        echo "Port: $port"
        echo "Time: $(date)"
        echo "=========================================="
        echo ""
        echo "Connect from another machine:"
        echo "  nc <this_machine_ip> $port"
        echo ""
        echo "Press CTRL+C to stop"
        echo ""
        
        nc -lvp "$port" -e /bin/bash
        ;;
    
    2)
        # Option 2: Delayed Start
        
        # Loop until we get valid delay time 
        for i in {1..100}
        do
            read -p "Enter delay in seconds: " delay
            
            if [ -z "$delay" ]; then
                echo "ERROR: Delay cannot be empty! Please try again."
                echo ""
            elif [ "$delay" -lt 1 ] 2>/dev/null; then
                echo "ERROR: Delay must be a positive number!"
                echo ""
            else
                break
            fi
        done
        
        echo ""
        echo "Scheduled start in $delay seconds"
        echo "Current time: $(date)"
        echo ""
        
        # Countdown using for loop with seq
        # seq creates a sequence from $delay down to 1
        for counter in $(seq $delay -1 1)
        do
            echo "Starting in $counter seconds..."
            sleep 1
        done
        
        echo ""
        echo "=========================================="
        echo "Listener Status: ACTIVE"
        echo "Port: $port"
        echo "Time: $(date)"
        echo "=========================================="
        echo ""
        echo "Connect from another machine:"
        echo "  nc <this_machine_ip> $port"
        echo ""
        echo "Press CTRL+C to stop"
        echo ""
        
        nc -lvp "$port" -e /bin/bash
        ;;
    
    3)
        # Option 3: Continuous Mode
        # Loop until we get valid interval 
        for i in {1..100}
        do
            read -p "Enter restart interval in seconds: " interval
            
            if [ -z "$interval" ]; then
                echo "ERROR: Interval cannot be empty! Please try again."
                echo ""
            elif [ "$interval" -lt 1 ] 2>/dev/null; then
                echo "ERROR: Interval must be a positive number!"
                echo ""
            else
                break
            fi
        done
        
        echo ""
        echo "=========================================="
        echo "CONTINUOUS MODE"
        echo "Port: $port | Interval: $interval sec"
        echo "=========================================="
        echo ""
        
        # For continuous mode, we MUST use 'while true'
        # because for loops have a finite number of iterations
        # while true creates an infinite loop that runs forever
        # until user presses CTRL+C
        attempt=1
        while true
        do
            echo "--- Attempt #$attempt - $(date) ---"
            echo "Listening on port $port..."
            echo ""
            
            nc -lvp "$port" -e /bin/bash
            
            echo ""
            echo "Connection closed. Restarting in $interval seconds..."
            echo ""
            sleep "$interval"
            attempt=$((attempt + 1))
        done
        ;;
    
    *)
        # This should never happen because we validated choice earlier
        echo "ERROR: Something went wrong!"
        ;;
esac

# ============================================================
# END OF SCRIPT
# ============================================================
