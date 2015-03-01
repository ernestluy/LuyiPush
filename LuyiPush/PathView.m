//
//  PathView.m
//  LuyiPush
//
//  Created by 卢一 on 14-11-8.
//  Copyright (c) 2014年 卢一. All rights reserved.
//

#import "PathView.h"

@implementation PathView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [UIColor yellowColor];
    }
    return self;
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    //[self draw
    //self.layer.
    //self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)] CGPath];
}

@end
