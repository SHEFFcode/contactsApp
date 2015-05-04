//
//  JSON.h
//  contactsApp
//
//  Created by Yuriy Shefer on 4/21/15.
//  Copyright (c) 2015 SHEFFcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactDetailViewController.h"

@interface JSON : NSObject

@property (strong, nonatomic) NSMutableArray *jsonArray;
@property (strong, nonatomic) NSMutableData * data;

@property (strong, nonatomic) NSMutableData * detailData;
@property (strong, nonatomic) NSMutableArray *jsonDetailArray;

@property(nonatomic,assign) NSInteger indexPath;

@property (nonatomic, retain) ViewController *delegate;

- (void) parse;

@end
