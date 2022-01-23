#!/bin/bash
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'
echo -e "${CYAN}  Apache -> ${NC}${YELLOW}$(sudo systemctl status httpd | grep Active | awk '{print $2}')${NC}\n${CYAN}  MySQL  -> ${NC}${YELLOW}$(sudo systemctl status mysql | grep Active | awk '{print $2}')${NC}\n${CYAN}  MariaDB -> ${NC}${YELLOW}$(sudo systemctl status httpd | grep Active | awk '{print $2}')${NC}"
