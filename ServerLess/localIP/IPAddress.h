//
//  IPAdress.h
//  IPAddress
//
//  Created by chen on 11/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define MAXADDRS    32

extern char *if_names[MAXADDRS];
extern char *ip_names[MAXADDRS];
extern char *hw_addrs[MAXADDRS];
extern unsigned long ip_addrs[MAXADDRS];

// Function prototypes

void InitAddresses(void);
void FreeAddresses(void);
int GetIPAddresses(void);
int GetHWAddresses(void);
int deviceIPAddressUpdate(void);