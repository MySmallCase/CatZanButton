//
//  CatZanButton.h
//  CatZanButton
//
//  Created by MyMac on 15/11/1.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,CatZanButtonType) {
    CatZanButtonTypeFirework,
    CatZanButtonTypeFocus
};

@interface CatZanButton : UIButton

@property (nonatomic,assign) BOOL isZan;

@property (nonatomic,assign) CatZanButtonType type;

@property (nonatomic,copy) void (^clickHandler)(CatZanButton *zanButton);

- (instancetype)initWithFrame:(CGRect)frame zanImage:(UIImage *)zanImage unZanImage:(UIImage *)unZanImage;


@end
