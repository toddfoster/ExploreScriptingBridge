// Get bridge with: sdef /Applications/iTunes.app | sdp -fh --basename iTunes
// Build with: gcc -ObjC -framework Foundation -framework ScriptingBridge itunes.m

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import <ScriptingBridge/ScriptingBridge.h>
#import "iTunes.h"

int main()
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	iTunesApplication *iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
	NSLog(@"%@", iTunes.currentTrack.name);
	[iTunes stop];
	[iTunes quit];
	[iTunes release];
	iTunes = nil;

	[pool release];
}
