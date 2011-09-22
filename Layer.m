//
//  Layer.m
//  CocoaAnimata
//
//  Created by Michael Forrest on 5 Sep.
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

#import "Layer.h"


@implementation Layer

@synthesize layers, name,position,alpha,scale;
@synthesize texture,skeleton,mesh;


-(void) addTexture:(NSXMLElement*) xml{
	self.texture = [[Texture alloc] initWithXML:xml inFolder:self.folder];
}
-(void) addMesh:(NSXMLElement*) xml{
	self.mesh = [[Mesh alloc] initWithXML:xml];
}
-(void) addSkeleton:(NSXMLElement*) xml{
}

-(void) setupChild:(NSXMLElement*) child{
		if([[child name] isEqualToString:@"layer"])	[self.layers addObject:[[Layer alloc] initWithXML:child inFolder:self.folder]];
		if([[child name] isEqualToString:@"texture"]) [self addTexture:child];
		if([[child name] isEqualToString:@"mesh"]) [self addMesh:child];
		if([[child name] isEqualToString:@"skeleton"]) [self addSkeleton:child];

}

-(void) setup:(NSXMLElement*) xml{
	self.name = [[xml attributeForName:@"name"] stringValue];
	
	self.position = [[Vector3D alloc] initWithX:[self number:xml forAttribute:@"x"]
																						y:[self number:xml forAttribute:@"y"]
																						z:[self number:xml forAttribute:@"z"]
									 ];
	
	self.layers = [[NSMutableArray alloc] initWithCapacity:5];

}
//@synthesize texture,mesh,skeleton;

-(NSImage *) image{
	if(self.texture != nil){
		return [texture getImage];
	}else{
		return nil;
	}
}

- (void) dealloc {
	
	[texture release];
	[mesh release];
	[skeleton release];
	[layers release];
	[super dealloc];
}

-(void) draw:(NSOpenGLView*)canvas{
	glPushMatrix();
	glTranslatef([position x], [position y], [position z]);
	
	
	//	if ([self.layer scale] < 1) 
	//		self.layer.scale = 1;
	//
	//	[canvas scale:self.layer.scale];
	glPushMatrix();
	if(mesh!=nil){
		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, [[texture textureName] intValue] );
		[mesh draw:canvas];
		glDisable(GL_TEXTURE_2D);
	}

	
	for(Layer * layer in layers){
		[layer draw:canvas];
	}
	
	
	glPopMatrix();
	glPopMatrix();
}


@end
