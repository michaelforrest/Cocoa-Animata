//
//  Mesh.m
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

#import "Mesh.h"


@implementation Mesh
@synthesize vertices;
@synthesize faces;

-(void) setup:(NSXMLElement*) xml{
	vertices = [[NSMutableArray alloc] init];
	faces = [[NSMutableArray alloc] init];
}
-(void) addVertices:(NSXMLElement*) xml{
	for (NSXMLElement * child in [xml children]) {
		[vertices addObject:[[Vertex alloc] initWithXML:child]];
	}
}
-(void) addFaces:(NSXMLElement*) xml{
	for (NSXMLElement * child in [xml children]) {
		[faces addObject:[[Face alloc] initWithXML:child andVertices:self.vertices]];		
	}
}


-(void) setupChild:(NSXMLElement*) child{
	if([[child name] isEqualToString:@"vertices"]) [self addVertices:child];
	if([[child name] isEqualToString:@"faces"]) [self addFaces:child];
}

- (void) dealloc {
	[vertices release];
	[faces release];
	[super dealloc];
}

-(void) draw:(NSOpenGLView*)canvas{
	
	//glColor3f(1.f, 1.f, 1.f);
	
	for (Face * face in faces){
		glBegin(GL_TRIANGLES);
		for (Vertex*v in face.vertices) {
			glTexCoord2f([v uvCoordinate].x, [v uvCoordinate].y);
			glVertex2f([v position].x , [v position].y);
		}
		glEnd();
		
	}
	
	//	for (unsigned int i = 0; i < faces->size(); i++)
	//	{
	//		Face *face = (*faces)[i];
	//		
	//		glColor4f(1.f, 1.f, 1.f, textureAlpha);
	//		glBegin(GL_TRIANGLES);
	//		glTexCoord2f(face->v[0]->texCoord.x, face->v[0]->texCoord.y);
	//		glVertex2f(face->v[0]->view.x, face->v[0]->view.y);
	//		glTexCoord2f(face->v[1]->texCoord.x, face->v[1]->texCoord.y);
	//		glVertex2f(face->v[1]->view.x, face->v[1]->view.y);
	//		glTexCoord2f(face->v[2]->texCoord.x, face->v[2]->texCoord.y);
	//		glVertex2f(face->v[2]->view.x, face->v[2]->view.y);
	//		glEnd();
	//		glColor3f(1.f, 1.f, 1.f);
	//	}
	//	
	//	glDisable(GL_TEXTURE_2D);
	
	
	
	//	for(NSInteger i = 0; i < [self.layer.mesh.faces count]; i++){
	//		Face * f = [self.layer.mesh.faces objectAtIndex:i]; 
	//		
	//		Vertex * v0 = [f.vertices objectAtIndex:0];
	//		Vertex * v1 = [f.vertices objectAtIndex:1];		
	//		Vertex * v2 = [f.vertices objectAtIndex:2];
	//		
	//		points[0] = v0.position.x;
	//		points[1] = v0.position.y;
	//		points[2] = v1.position.x;
	//		points[3] = v1.position.y;
	//		points[4] = v2.position.x;
	//		points[5] = v2.position.y;
	//		
	//		uvPoints[0] = v0.uvCoordinate.x;
	//		uvPoints[1] = v0.uvCoordinate.y;
	//		uvPoints[2] = v1.uvCoordinate.x;
	//		uvPoints[3] = v1.uvCoordinate.y;
	//		uvPoints[4] = v2.uvCoordinate.x;
	//		uvPoints[5] = v2.uvCoordinate.y;
	//		
	//		//NSLog(@"%f,%f(%f,%f)-%f,%f(%f,%f)-%f,%f(%f,%f)",points[0],points[1],uvPoints[0],uvPoints[1],points[2],points[3],uvPoints[2],uvPoints[3],points[4],points[5],uvPoints[4],uvPoints[5]);
	//		
	//		[canvas drawTexture:[layer.texture getTextureImage:canvas] points:points uvPoints:uvPoints size:vertexCount];
	//		
	//		
	//	}
	
	
	
	
}


@end
