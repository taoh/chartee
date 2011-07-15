//
//  Section.m
//  https://github.com/zhiyu/chartee/
//
//  Created by zhiyu on 7/11/11.
//  Copyright 2011 zhiyu. All rights reserved.
//

#import "Section.h"

@implementation Section

@synthesize isInitialized;
@synthesize paging; 
@synthesize selectedIndex;
@synthesize frame;
@synthesize paddingLeft;
@synthesize paddingRight;
@synthesize paddingTop;
@synthesize paddingBottom;
@synthesize padding;
@synthesize series;
@synthesize yAxises;
@synthesize xAxises;

-(void)addYAxis:(int)pos{
    YAxis *yaix = [[YAxis alloc] init];
	yaix.position = pos;
	[self.yAxises addObject:yaix];
	[yaix release];
}

-(void)removeYAxis:(int)index{
    [self.yAxises removeObjectAtIndex:index];
}

-(void)addYAxises:(int)num at:(int)pos{

}

-(void)removeYAxises{
    [self.yAxises removeAllObjects];
}

-(void)initYAxises{
    for(int i=0;i<[self.yAxises count];i++){
	    [[self.yAxises objectAtIndex:i] setIsInitialized:NO];
	}
}

-(void)nextPage{
	if(self.selectedIndex < [self.series count] - 1){
		self.selectedIndex++;
	}else{
		self.selectedIndex = 0;
	}
	[self initYAxises];
}

- (id)init{
	self = [super init];
    if (self) {
		self.isInitialized   = NO;
		self.paging          = NO;
		self.selectedIndex   = 0;
		self.paddingLeft     = 40;
		self.paddingRight    = 0;
		self.paddingTop      = 0;
		self.paddingBottom   = 0;
		self.padding         = nil;
		NSMutableArray *sers = [[NSMutableArray alloc] init];
		self.series          = sers; 
		[sers release];
		NSMutableArray *yas = [[NSMutableArray alloc] init];
		self.yAxises        = yas; 
		[yas release];
		NSMutableArray *xas = [[NSMutableArray alloc] init];
		self.xAxises        = xas; 
		[xas release];
    }
	return self;
}

- (void)dealloc {
    [super dealloc];
	[padding release];
	[series release];
	[yAxises release];
	[xAxises release];
}

@end
