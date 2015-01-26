
//  ServerBrowser.m
//  Chatty
//
//  Copyright (c) 2009 Peter Bakhyryev <peter@byteclub.com>, ByteClub LLC
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//  
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.

#import "ServerBrowserDelegate.h"
#import "ServerBrowser.h"
#import "FriendListViewController.h"

FriendListViewController *g_FriListCtr;

// A category on NSNetService that's used to sort NSNetService objects by their name.
@interface NSNetService (BrowserViewControllerAdditions)
- (NSComparisonResult) localizedCaseInsensitiveCompareByName:(NSNetService*)aService;
@end

@implementation NSNetService (BrowserViewControllerAdditions)
- (NSComparisonResult) localizedCaseInsensitiveCompareByName:(NSNetService*)aService {
	return [[self name] localizedCaseInsensitiveCompare:[aService name]];
}
@end


// Private properties and methods
@interface ServerBrowser ()

// Sort services alphabetically
- (void)sortServers;

@end


@implementation ServerBrowser

@synthesize servers;
@synthesize TVNames;
//@synthesize delegate;

// Initialize
- (id)init {
    self=[super init];
    if (!self) {
        return nil;
    }
    servers = [[NSMutableArray alloc] init];
    TVNames = [[NSMutableArray alloc] init];
    return self;
}


// Cleanup
- (void)dealloc {
    if ( servers != nil ) {
        [servers release];
        servers = nil;
    }
    if ( TVNames != nil ) {
        [TVNames release];
        TVNames = nil;
    }
//  self.delegate = nil;
    [super dealloc];
}


// Start browsing for servers
- (BOOL)start {
  // Restarting?
    if ( netServiceBrowser != nil ) {
        [self stop];
    }

	netServiceBrowser = [[NSNetServiceBrowser alloc] init];
	if( !netServiceBrowser ) {
		return NO;
	}

	netServiceBrowser.delegate = self;
	[netServiceBrowser searchForServicesOfType:@"_igrs._tcp." inDomain:@""];
  
  return YES;
}


// Terminate current service browser and clean up
- (void)stop {
    if ( netServiceBrowser == nil ) {
        return;
    }

    [netServiceBrowser stop];
    [netServiceBrowser release];
    netServiceBrowser = nil;

    [servers removeAllObjects];
    [TVNames removeAllObjects];
}


// Sort servers array by service names
- (void)sortServers {
  //[servers sortUsingSelector:@selector(localizedCaseInsensitiveCompareByName:)];
}


#pragma mark -
#pragma mark NSNetServiceBrowser Delegate Method Implementations



- (NSString *)copyStringFromTXTDict:(NSDictionary *)dict which:(NSString*)which {
	// Helper for getting information from the TXT data
	NSData* data = [dict objectForKey:which];
	NSString *resultString = nil;
	if (data) {
		resultString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	}
	return resultString;
}


// New service was found
- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing {
    NSLog(@"有设备上线了：%@",netService.name);
    
    //just order netService to do resolve to invoke "netServiceDidResolveAddress" to judge if TV
    [netService setDelegate:self];
    [netService resolveWithTimeout:0.0];

    if ( ! [servers containsObject:netService] )
    {
        [servers addObject:netService];
    }
}


// Service was removed
- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing 
{

    NSLog(@"有设备下线了：%@",netService.name);
    [servers removeObject:netService];
    
    if ( [TVNames containsObject:netService] )
    {
        NSLog(@"this is TV：%@",netService.name);
        [TVNames removeObject:netService];
        [[NSNotificationCenter defaultCenter] postNotificationName: @"updateServerList" object: nil];
    }

  [self sortServers];

}


- (void)netServiceDidResolveAddress:(NSNetService *)netService 
{	
    NSDictionary* dict = [[NSNetService dictionaryFromTXTRecordData:[netService TXTRecordData]] retain];	
	NSString* myType = [self copyStringFromTXTDict:dict which:@"type"];
    [dict release];
    
    bool isTV = (   ([myType caseInsensitiveCompare:@"tv"] == NSOrderedSame) ||
                    ([myType caseInsensitiveCompare:@"union"] == NSOrderedSame) ||
                    ([myType caseInsensitiveCompare:@"stb"] == NSOrderedSame));
    
    if (isTV)
    {
        NSLog(@"this is TV:%@",netService.name);
        if ( ! [TVNames containsObject:netService] )
        {
            [TVNames addObject:netService];
            [[NSNotificationCenter defaultCenter] postNotificationName: @"updateServerList" object: nil];
        }
     }
    else
    {
        NSLog(@"NOT TV:%@",netService.name);
    }
    [myType release];

}




@end
