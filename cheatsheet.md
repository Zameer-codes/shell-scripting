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


# Flags/Options 
# Complete `find` Command Guide

## 🔍 Basic Syntax
```bash
find [path] [expression] [action]
```

## 📂 Path Options
```bash
find .                    # Search current directory
find /home/user           # Search specific directory
find /var/log /tmp        # Search multiple directories
find ~                    # Search home directory
find /                    # Search entire filesystem (be careful!)
```

## 🎯 Name-based Search Options

### `-name` (Case Sensitive)
```bash
find . -name "*.py"           # All Python files
find . -name "config.json"    # Exact filename
find . -name "test*"          # Files starting with "test"
find . -name "*log*"          # Files containing "log"
find . -name "?.txt"          # Single character + .txt
```

### `-iname` (Case Insensitive)
```bash
find . -iname "*.PDF"         # Finds both .pdf and .PDF
find . -iname "readme*"       # Finds README, readme, ReadMe, etc.
```

### `-path` and `-ipath` (Full Path Matching)
```bash
find . -path "*/node_modules/*"     # Files in node_modules anywhere
find . -path "*/src/*.js"           # JS files in src directories
find . -ipath "**/BUILD/**"         # Case insensitive path search
```

## 📁 Type-based Search Options

### `-type` (File Types)
```bash
find . -type f              # Regular files only
find . -type d              # Directories only
find . -type l              # Symbolic links only
find . -type s              # Sockets
find . -type p              # Named pipes (FIFOs)
find . -type c              # Character devices
find . -type b              # Block devices
```

### Practical Type Examples
```bash
find /var/log -type f -name "*.log"    # Log files only (not directories)
find . -type d -name "*test*"          # Test directories
find . -type l                         # Find all symlinks
```

## 📏 Size-based Search Options

### `-size` (File Size)
```bash
find . -size +100M          # Files larger than 100 MB
find . -size -1k            # Files smaller than 1 KB
find . -size 50c            # Files exactly 50 bytes
find . -size +1G            # Files larger than 1 GB
find . -size +100M -size -1G  # Files between 100MB and 1GB
```

**Size Units:**
- `c` = bytes
- `k` = kilobytes (1024 bytes)
- `M` = megabytes (1024 KB)
- `G` = gigabytes (1024 MB)
- `T` = terabytes (1024 GB)

## ⏰ Time-based Search Options

### `-mtime` (Modification Time in Days)
```bash
find . -mtime -7            # Modified in last 7 days
find . -mtime +30           # Modified more than 30 days ago
find . -mtime 1             # Modified exactly 1 day ago
```

### `-mmin` (Modification Time in Minutes)
```bash
find . -mmin -60            # Modified in last 60 minutes
find . -mmin +120           # Modified more than 120 minutes ago
```

### `-atime` and `-amin` (Access Time)
```bash
find . -atime -1            # Accessed in last day
find . -amin -30            # Accessed in last 30 minutes
```

### `-ctime` and `-cmin` (Change Time - metadata changes)
```bash
find . -ctime -1            # Metadata changed in last day
find . -cmin -60            # Metadata changed in last 60 minutes
```

### `-newer` (Newer than Reference File)
```bash
find . -newer reference.txt    # Files newer than reference.txt
find . -type f -newer /etc/passwd  # Files newer than /etc/passwd
```

## 🔐 Permission-based Search Options

### `-perm` (Exact Permissions)
```bash
find . -perm 755            # Exactly 755 permissions
find . -perm u=rwx,g=rx,o=rx  # Same as above, symbolic notation
```

### `-perm -` (At Least These Permissions)
```bash
find . -perm -644           # At least readable by owner/group, readable by others
find . -perm -u+w           # At least writable by owner
```

### `-perm /` (Any of These Permissions)
```bash
find . -perm /222           # Writable by anyone (owner, group, or others)
find . -perm /u+w,g+w,o+w   # Same as above, symbolic notation
```

### Security-focused Permission Searches
```bash
find . -perm 777            # World-writable files (security risk)
find . -perm -4000          # Files with SUID bit set
find . -perm -2000          # Files with SGID bit set
find . -perm -1000          # Files with sticky bit set
```

## 👤 Ownership Search Options

### `-user` and `-uid`
```bash
find . -user john           # Files owned by user 'john'
find . -uid 1000            # Files owned by UID 1000
find . -user $(whoami)      # Files owned by current user
```

### `-group` and `-gid`
```bash
find . -group developers    # Files owned by 'developers' group
find . -gid 100             # Files owned by GID 100
```

### `-nouser` and `-nogroup`
```bash
find . -nouser              # Files with no valid user
find . -nogroup             # Files with no valid group
```

## 🔧 Depth and Traversal Options

### `-maxdepth` and `-mindepth`
```bash
find . -maxdepth 1 -name "*.txt"    # Only in current directory
find . -maxdepth 3 -type d          # Directories up to 3 levels deep
find . -mindepth 2 -name "*.py"     # Start searching from 2 levels down
```

### `-prune` (Skip Directories)
```bash
find . -name node_modules -prune -o -name "*.js" -print
# Skip node_modules directories when searching for JS files

find . -path "*/.*" -prune -o -type f -print
# Skip hidden directories
```

## 🎯 Logical Operators

### `-and` (or just space)
```bash
find . -name "*.py" -and -size +1k     # Python files larger than 1KB
find . -name "*.py" -size +1k          # Same as above (implicit AND)
```

### `-or`
```bash
find . -name "*.py" -or -name "*.js"   # Python OR JavaScript files
find . \( -name "*.py" -or -name "*.js" \) -and -size +1k
# Python or JS files that are larger than 1KB
```

### `-not` (or `!`)
```bash
find . -not -name "*.tmp"              # Everything except .tmp files
find . ! -name "*.tmp"                 # Same as above
find . -type f -not -path "*/node_modules/*"  # Files not in node_modules
```

## 🚀 Action Options

### `-print` (Default Action)
```bash
find . -name "*.py" -print          # Print found files (default)
find . -name "*.py" -print0         # Print with null separator (safe for spaces)
```

### `-ls` (Detailed Listing)
```bash
find . -name "*.py" -ls             # Show detailed info like 'ls -l'
```

### `-exec` (Execute Command)
```bash
find . -name "*.py" -exec ls -l {} \;           # Run 'ls -l' on each file
find . -name "*.py" -exec grep -l "import" {} \; # Find files containing "import"
find . -name "*.tmp" -exec rm {} \;             # Delete all .tmp files
find . -name "*.py" -exec cp {} backup/ \;      # Copy all .py files to backup/

# More efficient with + (runs command once with multiple files)
find . -name "*.py" -exec ls -l {} +
find . -name "*.tmp" -exec rm {} +
```

### `-execdir` (Execute in File's Directory)
```bash
find . -name "Makefile" -execdir make clean \;  # Run 'make clean' in each directory
```

### `-ok` (Interactive Execute)
```bash
find . -name "*.tmp" -ok rm {} \;    # Ask before deleting each file
```

### `-delete` (Delete Files)
```bash
find . -name "*.tmp" -delete         # Delete all .tmp files
find . -type d -empty -delete        # Delete empty directories
```

## 📊 Advanced Examples for Development

### Find Large Files in Project
```bash
find . -type f -size +50M -exec ls -lh {} \; | sort -k5 -hr
```

### Find Recently Modified Source Files
```bash
find . \( -name "*.py" -o -name "*.js" -o -name "*.java" \) -mtime -7
```

### Find Executable Files
```bash
find . -type f -executable -name "*"
```

### Find Files Modified After Last Git Commit
```bash
find . -type f -newer .git/COMMIT_EDITMSG -not -path "./.git/*"
```

### Find Duplicate File Names (Different Directories)
```bash
find . -type f -printf '%f\n' | sort | uniq -d
```

### Clean Up Development Environment
```bash
# Find and delete node_modules directories
find . -name "node_modules" -type d -exec rm -rf {} +

# Find Python cache directories
find . -name "__pycache__" -type d -delete

# Find and delete compiled files
find . \( -name "*.pyc" -o -name "*.class" -o -name "*.o" \) -delete
```

### Security Auditing
```bash
# Find world-writable files
find . -type f -perm -002

# Find SUID/SGID files
find / -type f \( -perm -4000 -o -perm -2000 \) 2>/dev/null

# Find files with no owner
find . -nouser -nogroup
```

## 🔥 Pro Tips for MAANG/FAANG Interviews

1. **Combine with other commands:**
   ```bash
   find . -name "*.log" -exec grep -l "ERROR" {} \; | wc -l
   ```

2. **Use parentheses for complex logic:**
   ```bash
   find . \( -name "*.py" -o -name "*.js" \) -and -not -path "*/node_modules/*"
   ```

3. **Handle filenames with spaces:**
   ```bash
   find . -name "*.txt" -print0 | xargs -0 ls -l
   ```

4. **Performance considerations:**
   - Use `-maxdepth` to limit search scope
   - Use `-prune` to skip unnecessary directories
   - Use `find ... -exec command {} +` instead of `find ... -exec command {} \;` for better performance

5. **Always test destructive commands:**
```bash
# Test first
find . -name "*.tmp" -print
# Then execute
find . -name "*.tmp" -delete
```


# ls Command Flags Reference
## Basic Display Options
```bash
-l = Long format (detailed info: permissions, owner, size, date)
-a = All files (including hidden files starting with .)
-A = Almost all (like -a but excludes . and ..)
-d = Directory itself (don't list contents, just show directory info)
-h = Human readable sizes (1K, 234M, 2G instead of bytes)
-f = Don't sort, list in directory order (fastest)
```

## Sorting Options
```bash
-t = Sort by modification time (newest first)
-S = Sort by file size (largest first)
-r = Reverse order
-U = Don't sort (like -f but still format)
```

## Additional Info
```bash
-i = Show inode numbers
-s = Show file sizes in blocks
-n = Show numeric UID/GID instead of names
-o = Long format without group info
-g = Long format without owner info
```

## Display Format
```bash
-1 = One file per line
-C = List in columns (default for terminal)
-x = List in rows instead of columns
-m = Comma-separated list
```

## File Type Indicators
```bash
-F = Add type indicators (/ for directories, * for executables, @ for symlinks)
-p = Add / after directory names only
--color = Colorize output (auto/always/never)
```

## Time Options
```bash
-u = Show access time instead of modification time
-c = Show change time instead of modification time
--full-time = Show full timestamp
```

## Common Combinations
```bash
bashls -la      # Long format + all files (most common)
ls -lh      # Long format + human readable sizes
ls -ltr     # Long format + sort by time + reverse (oldest first)
ls -latr    # All files + long format + time sorted + reverse
ls -lS      # Long format + sort by size
ls -ld */   # Show only directories in long format
```

## Pro Development Combos
```bash
bashls -la | grep "^d"     # Show only directories
ls -la | grep "\.py$"  # Show only Python files
ls -ltr | tail -5      # Show 5 most recently modified files
ls -lSh | head -10     # Show 10 largest files with readable sizes
```