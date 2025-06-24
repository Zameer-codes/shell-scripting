# Linux Command Cheat Sheet for Software Engineers

## ��� Essential Navigation & File Operations

### Directory Navigation
```bash
pwd                          # Print working directory
ls -la                       # List all files with permissions
ls -ltr                      # List by time, newest last
cd ~                         # Go to home directory
cd -                         # Go to previous directory
find . -name "*.py"          # Find Python files recursively
find . -type f -size +100M   # Find files larger than 100MB
```

### File Operations
```bash
cp -r source/ dest/          # Copy directory recursively
mv old_name new_name         # Move/rename files
rm -rf directory/            # Remove directory forcefully
ln -s /path/to/file symlink  # Create symbolic link
rsync -av source/ dest/      # Sync directories efficiently
```

## ��� File Content & Text Processing

### Viewing & Editing
```bash
cat file.txt                 # Display file content
less file.txt                # Page through file (q to quit)
head -n 20 file.txt          # First 20 lines
tail -f app.log              # Follow log file in real-time
tail -n 100 error.log        # Last 100 lines
vim filename                 # Edit with vim (i=insert, :wq=save&quit)
```

### Text Processing (Critical for Log Analysis)
```bash
grep -r "error" logs/        # Search for "error" in all log files
grep -i "exception" *.log    # Case-insensitive search
grep -n "TODO" *.py          # Show line numbers
grep -A 5 -B 5 "error" app.log  # Show 5 lines before/after match

awk '{print $1, $3}' file.txt   # Print columns 1 and 3
sed 's/old/new/g' file.txt       # Replace all occurrences
cut -d',' -f1,3 data.csv         # Extract columns from CSV

sort file.txt                    # Sort lines
uniq -c                          # Count unique lines
wc -l file.txt                   # Count lines in file
```

## ��� Process Management & System Monitoring

### Process Control
```bash
ps aux                       # List all running processes
ps aux | grep python         # Find Python processes
pgrep -f "node server.js"    # Find process ID by command
kill -9 PID                  # Force kill process
killall python              # Kill all Python processes
nohup command &              # Run command in background
jobs                         # List background jobs
fg %1                        # Bring job 1 to foreground
```

### System Monitoring
```bash
top                          # Real-time process monitor
htop                         # Better version of top
free -h                      # Memory usage (human readable)
df -h                        # Disk space usage
du -sh directory/            # Directory size
iostat 2                     # I/O statistics every 2 seconds
netstat -tulpn               # Network connections and ports
ss -tulpn                    # Modern alternative to netstat
```

## ��� Network & Connectivity

### Network Diagnostics
```bash
ping google.com              # Test connectivity
curl -I https://api.com      # HTTP headers only
curl -X POST -H "Content-Type: application/json" \
  -d '{"key":"value"}' https://api.com/endpoint
wget -O file.zip https://url.com/file.zip  # Download file
nc -zv host 22              # Test if port is open
traceroute google.com       # Trace network path
```

### Service Management (systemd)
```bash
systemctl status nginx       # Check service status
systemctl start nginx        # Start service
systemctl stop nginx         # Stop service
systemctl restart nginx      # Restart service
systemctl enable nginx       # Enable on boot
journalctl -u nginx -f       # Follow service logs
```

## ��� Development Workflow Commands

### Git Integration
```bash
git log --oneline -10        # Last 10 commits, one line each
git diff HEAD~1              # Compare with previous commit
git status --porcelain       # Machine-readable status
git branch -r                # List remote branches
git clean -fd                # Remove untracked files/directories
```

### Build & Deployment
```bash
make clean && make           # Clean build
npm run build 2>&1 | tee build.log  # Save build output to log
./configure --prefix=/usr    # Configure with custom prefix
screen -S build              # Start named screen session
screen -r build              # Reattach to screen session
tmux new -s deploy           # Create tmux session
tmux attach -t deploy        # Attach to tmux session
```

## ��� Docker & Containerization

### Docker Commands
```bash
docker ps -a                 # List all containers
docker images               # List images
docker logs -f container_id  # Follow container logs
docker exec -it container_id bash  # Interactive shell
docker system df            # Docker disk usage
docker system prune         # Clean up unused resources
docker-compose up -d        # Start services in background
docker-compose logs -f service_name  # Follow service logs
```

## ��� Performance & Troubleshooting

### System Analysis
```bash
lsof -i :8080               # What's using port 8080
lsof -p PID                 # Files opened by process
strace -p PID               # Trace system calls
tcpdump -i eth0 port 80     # Capture HTTP traffic
vmstat 2                    # Virtual memory stats every 2s
sar -u 2 5                  # CPU usage, 2s interval, 5 times
```

### File Permissions & Security
```bash
chmod 755 script.sh         # rwx for owner, rx for group/others
chmod +x script.sh          # Make executable
chown user:group file       # Change ownership
sudo -u username command    # Run as different user
umask 022                   # Set default permissions
find . -perm 777            # Find world-writable files
```

## ��� Advanced Search & Filtering

### Log Analysis Patterns
```bash
# Find errors in last hour
find /var/log -name "*.log" -mmin -60 -exec grep -l "ERROR" {} \;

# Count HTTP status codes
awk '{print $9}' access.log | sort | uniq -c | sort -nr

# Monitor live log for specific patterns
tail -f app.log | grep --line-buffered "ERROR\|WARN"

# Extract JSON fields from logs
grep "api_call" app.log | jq '.response_time' | sort -n

# Find large files modified recently
find . -type f -size +50M -mtime -7 -ls
```

## ��� Productivity Shortcuts

### Command Line Efficiency
```bash
!!                          # Repeat last command
!vi                         # Repeat last command starting with 'vi'
ctrl+r                      # Reverse search command history
ctrl+a                      # Move to beginning of line
ctrl+e                      # Move to end of line
ctrl+k                      # Delete from cursor to end
ctrl+u                      # Delete from cursor to beginning
alt+.                       # Insert last argument of previous command
```

### Aliases for Speed (add to ~/.bashrc)
```bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias h='history'
alias c='clear'
alias df='df -h'
alias du='du -sh'
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
```

## ��� Environment & Configuration

### Environment Variables
```bash
export NODE_ENV=production   # Set environment variable
echo $PATH                   # Show PATH variable
env | grep NODE              # Show all NODE_* variables
source ~/.bashrc             # Reload bash configuration
which python                 # Find command location
whereis nginx                # Find binary, source, manual locations
```

### File Archiving & Compression
```bash
tar -czf backup.tar.gz directory/     # Create compressed archive
tar -xzf backup.tar.gz               # Extract compressed archive
zip -r archive.zip directory/        # Create zip archive
unzip -l archive.zip                 # List zip contents
gzip file.txt                        # Compress file
gunzip file.txt.gz                   # Decompress file
```

## ��� Pro Tips for MAANG/FAANG Environments

1. **Always use `-h` flag** for human-readable output (df -h, du -h, free -h)
2. **Combine commands with pipes** for powerful data processing
3. **Use `screen` or `tmux`** for long-running processes
4. **Master `grep`, `awk`, `sed`** for log analysis - essential for production debugging
5. **Learn `jq`** for JSON processing in API-heavy environments
6. **Use `watch`** command to monitor changing outputs: `watch -n 2 'ps aux | grep python'`
7. **Practice shell scripting** - automate repetitive tasks
8. **Know your system limits**: `ulimit -a` shows current limits
9. **Use `history | grep command`** to find previously used commands quickly
10. **Always check disk space** before large operations: `df -h`

## ��� Emergency Commands (Production Issues)

```bash
# Quick system health check
free -h && df -h && uptime && ps aux --sort=-%cpu | head -20

# Find what's eating disk space
du -sh /* 2>/dev/null | sort -hr | head -10

# Kill runaway processes
ps aux --sort=-%cpu | head -20  # Find CPU hogs
pkill -f "problematic_process"  # Kill by name pattern

# Network troubleshooting
ss -tulpn | grep :80           # Check if service is listening
curl -I -m 10 https://service.com  # Quick health check with timeout

# Log rotation emergency
> /var/log/large.log           # Truncate log file (use carefully!)
```
