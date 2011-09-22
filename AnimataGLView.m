/*
  AnimataGLView.m
  CocoaAnimata

  Created by Michael Forrest on 14 Sep.
  Copyright 2009 Grimaceworks. All rights reserved.

  CocoaAnimata is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  CocoaAnimata is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with CocoaAnimata. If not, see <http://www.gnu.org/licenses/>.

*/

#import "AnimataGLView.h"


@implementation AnimataGLView
-(void) drawRect: (NSRect) bounds
{
	[[self openGLContext] makeCurrentContext];
	glShadeModel(GL_SMOOTH);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
	
	glEnable(GL_TEXTURE_2D);
	glEnable(GL_NORMALIZE);
	
	glClearColor(0, 0, 0, 0);
	glClear(GL_COLOR_BUFFER_BIT);
	
	[camera setupPerspectiveWithWidth:[self bounds].size.width height:[self bounds].size.height];
	
	glPushMatrix();
	
	[self drawContent];
	
	glPopMatrix();
	glFlush();
	
}
-(void) drawContent{
	// override this
}
-(void) awakeFromNib{
	camera = [[Camera alloc] init];
	[toolController addObserver:self forKeyPath:@"currentTool" options:NSKeyValueObservingOptionNew context:NULL];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
	[[self window] invalidateCursorRectsForView:self];
	
}
-
(void) dealloc {
	[toolController removeObserver:self forKeyPath:@"currentTool"];
	[camera release];
	[toolController release];
	
	[super dealloc];
}

- (BOOL)acceptsFirstResponder{
	return YES;
}

- (void)resetCursorRects{
	[super resetCursorRects];
	NSCursor *cursor;
  cursor = [toolController currentTool].cursor;
  [self addCursorRect:[self bounds] cursor:cursor];
	[cursor setOnMouseEntered:YES];
}

#pragma mark -
#pragma mark Input
- (void)mouseDown:(NSEvent*)theEvent{
	NSPoint  mouseLoc = [self convertPoint:[theEvent locationInWindow] fromView:nil];
	[[toolController currentTool] mouseDown: mouseLoc camera:camera sender:self];	
	[self drawRect:[self bounds]];
}
- (void)mouseDragged:(NSEvent*)theEvent{
	[[toolController currentTool] mouseDragged:theEvent camera:camera sender:self];
		//[[self window]  drawRect:[self bounds]];
	[self drawRect:[self bounds]];

}


- (void)keyDown:(NSEvent*)theEvent{
	if([theEvent keyCode] == SPACE_BAR && toolController.currentTool !=toolController.panTool){
		[toolController temporarilySelect:[toolController panTool]];
	}
	[[self window] invalidateCursorRectsForView:self];
}
- (void)keyUp:(NSEvent*)theEvent{
	if([theEvent keyCode] == SPACE_BAR) [toolController revertTemporarySelection];
	[[self window] invalidateCursorRectsForView:self];	
}

@end
