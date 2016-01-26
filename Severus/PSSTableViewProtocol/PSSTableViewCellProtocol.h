//
//  PSSTableViewCellProtocol.h
//  Severus
//
//  Created by Dai Qinfu on 16/1/21.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSSTableViewCellProtocol <NSObject>

- (void)bindingData:(id)dataModel;

@end