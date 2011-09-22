//
//  Vector3D.h
//  GrimoniumAlpha
//
//  Created by Michael Forrest on 27 Jan.
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


@interface Vector3D : NSObject {
	CGFloat x;
	CGFloat y;
	CGFloat z;
}
@property(nonatomic,readwrite) CGFloat x;
@property(nonatomic,readwrite) CGFloat y;
@property(nonatomic,readwrite) CGFloat z;

-(id) initWithX: (CGFloat) anX y:(CGFloat)aY z:(CGFloat) aZ;
-(void) moveTo: (CGPoint) p;
@end
