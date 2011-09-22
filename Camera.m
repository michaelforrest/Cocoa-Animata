//
//  Camera.m
//  CocoaAnimata
//
//  Created by Michael Forrest on 12 Sep.
/*
  Copyright 2009 Grimaceworks. All rights reserved.

	Based on Animata
  Copyright (C) 2007 Peter Nemeth, Gabor Papp, Bence Samu
	Kitchen Budapest, <http://animata.kibu.hu/>

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
*///

#import "Camera.h"


@implementation Camera
@synthesize target;
- (id) init {
	self = [super init];
	if (self != nil) {
		
		target = [[Vector3D alloc] initWithX:0 y:0 z:0];
		
		distance = 150.0f;
		fov = 90.f;
		zNear = 0.1f;
		zFar = 1000.f;
		
		
	}
	return self;
}

-(void) setupPerspectiveWithWidth:(CGFloat)width height:(CGFloat) height{


	aspect = (double)width / (double)height;
	fov = (180.0 * 2.0 * atan2(height/2, distance)) / M_PI;

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(fov, aspect, zNear, zFar);
	glViewport(0, 0, width, height);
	
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluLookAt(target.x, target.y, target.z-distance,
						target.x, target.y, target.z, 
						0, -1, 0);
	
	
//	
	
}	

- (void) dealloc {
	[target release];
	[super dealloc];
}


@end
