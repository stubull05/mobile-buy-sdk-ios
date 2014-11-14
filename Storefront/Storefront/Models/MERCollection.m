//
//  MERCollection.m
//  Merchant
//
//  Created by Joshua Tessier on 2014-09-10.
//  Copyright (c) 2014 Shopify Inc. All rights reserved.
//

#import "MERCollection.h"

//Models
#import "MERImage.h"

@implementation MERCollection

- (void)updateWithDictionary:(NSDictionary *)dictionary
{
	[super updateWithDictionary:dictionary];
	
	_title = [dictionary[@"title"] copy];
	_handle = [dictionary[@"handle"] copy];
	_image = [MERImage convertObject:dictionary[@"image"]];
	_productsCount = dictionary[@"products_count"];
	_featured = [dictionary[@"featured"] boolValue];
}

- (NSComparisonResult)compare:(MERCollection*)otherCollection
{
	NSComparisonResult result = NSOrderedDescending;
	if (self.featured == otherCollection.featured) {
		result = [self.title compare:otherCollection.title];
	}
	else if (self.featured) {
		result = NSOrderedAscending;
	}
	return result;
}

@end