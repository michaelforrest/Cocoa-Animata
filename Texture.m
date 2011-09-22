//
//  Texture.m
//  CocoaAnimata
//
//  Created by Michael Forrest on 13 Sep.
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

#import "Texture.h"


@implementation Texture
@synthesize location;
@synthesize textureName;
-(NSInteger) loadGlImage:(NSImage*) image{
	
	glEnable(GL_TEXTURE_2D);
	GLuint texture;
	
	glGenTextures(1, &texture);
	
	glBindTexture(GL_TEXTURE_2D, texture);
	
	//glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	

	
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	
	NSBitmapImageRep * bitmap = [NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]];
	
	GLenum format = [bitmap hasAlpha] ? GL_RGBA : GL_RGB;
	glTexImage2D(GL_TEXTURE_2D, 0, format, [image size].width, [image size].height, 0, format, GL_UNSIGNED_BYTE, [bitmap bitmapData]) ;
	GLenum error = glGetError();
	if(error > 0){
		NSLog(@"GL ERROR %i when loading image %@", error,image);
	}
	return texture;
}

-(void) loadTexture{
	NSImage * image = [[NSImage alloc] initWithContentsOfFile:self.location];
	if(image == nil) {
		NSException *exception = [ImageNotFoundException exceptionWithName:@"Required image not found"
															reason:[NSString stringWithFormat:@"The file %@ was not found", self.location]  userInfo:nil];
		@throw exception;
	}
	NSInteger glName = [self loadGlImage:image];
	
	NSDictionary * textureInfo =[NSDictionary dictionaryWithObjectsAndKeys:
															 image, @"image",
															 [NSNumber numberWithInt:glName], @"textureName",
															 nil]; 
	[LoadedGLTextures setObject:textureInfo forKey:self.location];
	self.textureName = [NSNumber numberWithInt:glName];
	
}

-(NSNumber *) textureName{
	if( textureName == nil){
		if(LoadedGLTextures == nil){
			LoadedGLTextures = [[NSMutableDictionary alloc] init];
		}
			if([LoadedGLTextures objectForKey:self.location] != nil){
			self.textureName = [(NSDictionary*)[LoadedGLTextures objectForKey:self.location] valueForKey:@"textureName"];
		}else{
			[self loadTexture];
		}
	}
	return textureName;
}


-(void) setup:(NSXMLElement*) xml{
	
	self.location = [self.folder stringByAppendingPathComponent:[[xml attributeForName:@"location"] stringValue]];
	
	
}
-(NSImage *) getImage{
	
	return [(NSDictionary*)[LoadedGLTextures objectForKey:self.location] valueForKey:@"image"];
}

- (void) dealloc {
	[textureName release];
	[location release];
	[super dealloc];
}

@end
