//
//  CatZanButton.m
//  CatZanButton
//
//  Created by MyMac on 15/11/1.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "CatZanButton.h"

@interface CatZanButton ()

@property (nonatomic,strong) UIImageView *zanImageView;

@property (nonatomic,strong) CAEmitterLayer *effectLayer;

@property (nonatomic,strong) CAEmitterCell *effectCell;

@property (nonatomic,strong) UIImage *zanImage;

@property (nonatomic,strong) UIImage *unZanImage;

@end

@implementation CatZanButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(0, 0, 30, 30)];
        self.zanImage = [UIImage imageNamed:@"Zan"];
        self.unZanImage = [UIImage imageNamed:@"UnZan"];
        self.type = CatZanButtonTypeFirework;
        [self initBaseLayout];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.zanImage=[UIImage imageNamed:@"Zan"];
        self.unZanImage=[UIImage imageNamed:@"UnZan"];
        self.type=CatZanButtonTypeFirework;
        [self initBaseLayout];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame zanImage:(UIImage *)zanImage unZanImage:(UIImage *)unZanImage{
    self=[super initWithFrame:frame];
    if (self) {
        self.zanImage=zanImage;
        self.unZanImage=unZanImage;
        self.type=CatZanButtonTypeFirework;
        [self initBaseLayout];
    }
    return self;
}

- (void)initBaseLayout{
    self.isZan = NO;
    switch (self.type) {
        case CatZanButtonTypeFirework: {
            
            self.effectLayer = [CAEmitterLayer layer];
            [self.effectLayer setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            [self.layer addSublayer:self.effectLayer];
            [self.effectLayer setEmitterShape:kCAEmitterLayerCircle];
            [self.effectLayer setEmitterMode:kCAEmitterLayerOutline];
            [self.effectLayer setEmitterPosition:CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.5)];
            [self.effectLayer setEmitterSize:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            
            self.effectCell = [CAEmitterCell emitterCell];
            [self.effectCell setName:@"zanShape"];
            [self.effectCell setContents:(__bridge id)[UIImage imageNamed:@"EffectImage"].CGImage];
            [self.effectCell setAlphaSpeed:-1.0f];
            [self.effectCell setLifetime:1.0f];
            [self.effectCell setBirthRate:0];
            [self.effectCell setVelocity:50];
            [self.effectCell setVelocityRange:50];
            
            [self.effectLayer setEmitterCells:@[self.effectCell]];
            
            self.zanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            [self.zanImageView setImage:self.unZanImage];
            [self.zanImageView setUserInteractionEnabled:YES];
            [self addSubview:self.zanImageView];
            
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zanAnimationPlay)];
            tapGesture.numberOfTapsRequired = 1;
            [self.zanImageView addGestureRecognizer:tapGesture];
            
            break;
        }
        case CatZanButtonTypeFocus: {
            
            break;
        }
        default: {
            break;
        }
    }
}

- (void)zanAnimationPlay{
    [self setIsZan:!self.isZan];
    
    if (self.clickHandler != nil) {
        self.clickHandler(self);
    }
    
    switch (self.type) {
        case CatZanButtonTypeFirework: {
            
            [self.zanImageView setBounds:CGRectMake(0, 0, 0, 0)];
            [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:5 options:UIViewAnimationOptionCurveLinear animations:^{
                
                [self.zanImageView setBounds:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
                if (self.isZan) {
                    CABasicAnimation *effectLayerAnimation = [CABasicAnimation animationWithKeyPath:@"emitterCells.zanShape.birthRate"];
                    [effectLayerAnimation setFromValue:[NSNumber numberWithFloat:100]];
                    [effectLayerAnimation setToValue:[NSNumber numberWithFloat:0]];
                    [effectLayerAnimation setDuration:0.0f];
                    [effectLayerAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
                    [self.effectLayer addAnimation:effectLayerAnimation forKey:@"ZanCount"];
                }
                
            } completion:^(BOOL finished) {
                
            }];
            
            break;
        }
        case CatZanButtonTypeFocus: {
            
            break;
        }
        default: {
            break;
        }
    }
    
}

- (void)setIsZan:(BOOL)isZan{
    _isZan=isZan;
    if (isZan) {
        [self.zanImageView setImage:self.zanImage];
    }else{
        [self.zanImageView setImage:self.unZanImage];
    }
}

@end
