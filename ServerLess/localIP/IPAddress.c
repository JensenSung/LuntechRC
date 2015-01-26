//
//  IPAddress.c
//  IPAddress
//
//  Created by chen on 11/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#include "IPAddress.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/sockio.h>
#include <net/if.h>
#include <errno.h>
#include <net/if_dl.h>
#import "igrsutil_LAN.h"
#include "Igrs_Definition_C.h"

#define    min(a,b)    ((a) < (b) ? (a) : (b))
#define    max(a,b)    ((a) > (b) ? (a) : (b))

#define BUFFERSIZE    4000

//extern char myIPAddress[50];


 char *if_names[MAXADDRS];
 char *ip_names[MAXADDRS];
 char *hw_addrs[MAXADDRS];
unsigned long ip_addrs[MAXADDRS];
static int   nextAddr = 0;

void InitAddresses()
{/*
    int inet_sock;
    struct ifreq myifr;
    
    struct sockaddr_in    *sin;
    
    char temp[80];    
    
    
    inet_sock = socket(AF_INET, SOCK_DGRAM, 0);
    strcpy(myifr.ifr_name, "lo");
    
    if (ioctl(inet_sock, SIOCGIFADDR, &myifr) == 0) 
    {
        perror("ioctl");
        printf("%s\n", inet_ntoa(((struct sockaddr_in*)&(myifr.ifr_addr))->sin_addr));
    }
    printf("%s", myifr.ifr_name);
    
    
    
    sin = (struct sockaddr_in *)&myifr.ifr_addr;
    strcpy(temp, inet_ntoa(sin->sin_addr));
    
    
    printf("%s", myifr.ifr_name); 
    printf("%s", temp);  
    
    */
    int i;
    for (i=0; i<MAXADDRS; ++i)
    {
        if_names[i] = ip_names[i] = hw_addrs[i] = NULL;
        ip_addrs[i] = 0;
    }
    
    sprintf(myIPAddress, "");
}

void FreeAddresses()
{
    int i;
    for (i=0; i<MAXADDRS; ++i)
    {
        if (if_names[i] != 0) free(if_names[i]);
        if (ip_names[i] != 0) free(ip_names[i]);
        if (hw_addrs[i] != 0) free(hw_addrs[i]);
        ip_addrs[i] = 0;
    }
    InitAddresses();
}

int GetIPAddresses()
{
    UPCCOMMONDEFINE
    int                 i, len, flags;
    char                buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    struct ifconf       ifc;
    struct ifreq        *ifr, ifrcopy;
    struct sockaddr_in    *sin;
    
    char temp[80];
    
    int sockfd;
    
    for (i=0; i<MAXADDRS; ++i)
    {
        if_names[i] = ip_names[i] = NULL;
        ip_addrs[i] = 0;
    }
    
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0)
    {
        perror("socket failed");
        return FAIL;
    }
    
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) < 0)
    {
        perror("ioctl error");
        return FAIL;
    }
    
    lastname[0] = 0;
    
    for (ptr = buffer; ptr < buffer + ifc.ifc_len; )
    {
        ifr = (struct ifreq *)ptr;
        len = max(sizeof(struct sockaddr), ifr->ifr_addr.sa_len);
        ptr += sizeof(ifr->ifr_name) + len;    // for next one in buffer
        
        if (ifr->ifr_addr.sa_family != AF_INET)
        {
            continue;    // ignore if not desired address family
        }
        
        if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL)
        {
            *cptr = 0;        // replace colon will null
        }
        
        if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0)
        {
            continue;    /* already processed this interface */
        }
        
        memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
        
        ifrcopy = *ifr;
        ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
        flags = ifrcopy.ifr_flags;
        if ((flags & IFF_UP) == 0)
        {
            continue;    // ignore if interface not up
        }
        
        if_names[nextAddr] = (char *)malloc(strlen(ifr->ifr_name)+1);
        if (if_names[nextAddr] == NULL)
        {
            return FAIL;
        }
        strcpy(if_names[nextAddr], ifr->ifr_name);
        
        sin = (struct sockaddr_in *)&ifr->ifr_addr;
        strcpy(temp, inet_ntoa(sin->sin_addr));
        
        ip_names[nextAddr] = (char *)malloc(strlen(temp)+1);
        if (ip_names[nextAddr] == NULL)
        {
            return FAIL;
        }
        strcpy(ip_names[nextAddr], temp);

        printf("%s", ifr->ifr_name);  
        printf("\n%s\n", ip_names[nextAddr]);
        
        char eth[20] = "";
     
        if (isTargetSimulator == 1) {
            sprintf(eth, "en1");
        }
        else {
            sprintf(eth, "en0");
        }
        
        
        if (strcmp(ifr->ifr_name, eth) == 0)
        {
            sprintf(myIPAddress, "%s", ip_names[nextAddr]);
            //break;
            //return SUCCESS;
        }
        else if (strcmp(ifr->ifr_name, "bridge0") == 0)
        {
            sprintf(myIPAddress, "%s", ip_names[nextAddr]);
        }
        
        ip_addrs[nextAddr] = sin->sin_addr.s_addr;
        ++nextAddr;
    }
    nextAddr = 0;
    //sprintf(myIPAddress, "\n%s\n", ip_names[1]);
    close(sockfd); 
    printf("ip address is:%s", myIPAddress);
    if (strlen(myIPAddress) > 0 ) {
        return SUCCESS;
    }
    else
    {
        printf("ip address is illegal");
        return FAIL;
    }
    
}

int GetHWAddresses()
{
    int i;
    char temp[80]="00:11:22:33:44:55";
    
    for (i=0; i<MAXADDRS; ++i)
    {
        hw_addrs[i] = NULL;
    }
    
    for (i=0; i<strlen(temp); ++i)
    {
        hw_addrs[i] = temp[i];
    }
    
    return 0;
}

int deviceIPAddressUpdate()
{  
    InitAddresses();
    return (GetIPAddresses());

    //GetHWAddresses();
    //FreeAddresses();
}