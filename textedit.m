// Get bridge with: sdef /Applications/iTunes.app | sdp -fh --basename iTunes
// Build with: gcc -ObjC -framework Foundation -framework ScriptingBridge itunes.m

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import <ScriptingBridge/ScriptingBridge.h>
#import "TextEdit.h"

int main()
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	TextEditApplication *textEdit = [SBApplication applicationWithBundleIdentifier:@"com.apple.TextEdit"];

	NSLog(@"Documents count = %d", [[textEdit documents] count]);
	[textEdit open:[NSURL fileURLWithPath:@"/Users/todd.foster/.profile"]];
	NSLog(@"Documents count = %d", [[textEdit documents] count]);

	[[[textEdit documents] objectAtIndex:0] saveAs:nil in:[NSURL fileURLWithPath:@"/Users/todd.foster/Desktop/deleteMe.html"]];

	[textEdit quitSaving:TextEditSavoNo];

	[textEdit release];
	textEdit = nil;
	[pool release];
}
