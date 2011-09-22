//
//  Layer.h
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

#import <Foundation/Foundation.h>
#import "Vector3D.h"
#import "XMLModel.h"
#import "Texture.h"
#import "Mesh.h"
#import "Skeleton.h"
@interface Layer : XMLModel {
	
	NSMutableArray * layers;
	NSString * name;

	Texture * texture;	
	Mesh * mesh;
	Skeleton * skeleton;
	
	Vector3D * position;
	
	CGFloat alpha;
	CGFloat scale;

}
@property (nonatomic,readonly) NSImage * image;
@property (nonatomic, retain) NSString *name; 
@property (nonatomic, retain) Texture *texture;
@property (nonatomic, retain) Mesh * mesh;
@property (nonatomic, retain) Skeleton * skeleton;
@property (nonatomic, retain) NSMutableArray *layers;

@property (nonatomic, retain) Vector3D * position;

@property (nonatomic) CGFloat alpha;
@property (nonatomic) CGFloat scale;


-(void) draw:(NSOpenGLView*)canvas;



//-(void)addAttributes:(NSDictionary *)attributeDict;
//-(void) simulate:(int) times;
//-(void) grabBones:(NSMutableArray*)allBones;
//
//

@end

