chmod +x /etc/passwd
cut -d':' -f1,3 /etc/passwd | sort
