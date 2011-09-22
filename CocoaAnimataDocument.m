//
//  CocoaAnimata
//
//  Created by Michael Forrest on 5 Sep.
//  Copyright Grimace\works 2009 . All rights reserved.
//

#import "CocoaAnimataDocument.h"

@implementation CocoaAnimataDocument


- (NSString *)windowNibName
{
    return @"DocumentWindow";
}

- (id) init {
	self = [super init];
	if (self != nil) {
		root = [[Layer alloc] init];
		[root setName:@"root"];
	}
	return self;
}

- (void) dealloc
{
	[root release];
	[super dealloc];
}


- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
    [super windowControllerDidLoadNib:aController];
}

-(Layer *) getRootLayer{
	return root;
}

// SAVE
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If the given outError != NULL, ensure that you set *outError when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

		if ( outError != NULL ) {
			*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
		}
		return nil;
}
// LOAD
- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
		//assume typeName == ".nmt"?
		NSError *error;
		NSXMLDocument *responseXML = [[NSXMLDocument alloc] initWithData:data options:NSXMLDocumentTidyXML error:&error];
		if (!responseXML) {
			NSLog(@"Error reading response: %@", error);
			return NO;
		}
	
		
		NSXMLElement * element = [[[responseXML rootElement] children] objectAtIndex:0];
		NSString *path = [[[self fileURL] path] stringByDeletingLastPathComponent];

		@try{
			root = [[Layer alloc] initWithXML: element inFolder:path];
		}
		@catch (ImageNotFoundException * e) {
			// TODO: Offer to help user find missing file
			
		}
		return YES;
}

@end
