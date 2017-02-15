//
//  NEWave.m
//  NEWave
//
//  Created by Nslson on 2017/2/15.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "NEWave.h"
typedef NS_ENUM(NSInteger,UIWaveType) {
    realType,
    maskType
};
@interface NEWave()
/* amplitude */
@property (nonatomic , assign) CGFloat waveAmplitude;
/* timer */
@property (nonatomic , strong) CADisplayLink * displayLink;
/* real wave */
@property (nonatomic , strong) CAShapeLayer * realWaveLayer;
/* mask wave */
@property (nonatomic , strong) CAShapeLayer * maskWaveLayer;
/* wave width */
@property (nonatomic , assign) CGFloat waveWidth;

@property (nonatomic , assign) CGFloat phase;
@end

@implementation NEWave

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setupSubViews{
    self.backgroundColor = [UIColor clearColor];
    self.waveWidth = CGRectGetWidth(self.bounds);
    self.waveAmplitude = CGRectGetHeight(self.bounds) * 0.04;
    self.clipsToBounds = YES;
    [self.layer addSublayer:self.maskWaveLayer];
    [self.layer addSublayer:self.realWaveLayer];
}

-(void)startAnimation{
    [self setupSubViews];
    [self.displayLink invalidate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)stopAnimation{
    [self.displayLink invalidate];
    [self.realWaveLayer removeAllAnimations];
    [self.maskWaveLayer removeAllAnimations];
    self.realWaveLayer.path = nil;
    self.maskWaveLayer.path = nil;
}

-(void)updateWave{
    self.phase += self.waveSpeed;
    self.realWaveLayer.path = [self createWavePathWithType:realType].CGPath;
    self.maskWaveLayer.path = [self createWavePathWithType:maskType].CGPath;
}

-(UIBezierPath *)createWavePathWithType:(UIWaveType)type{
    UIBezierPath * wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0;
    for (CGFloat x = 0; x < self.waveWidth + 1; x++) {
        endX = x;
        CGFloat y = 0;
        if (type == realType) {
            y = self.waveAmplitude * sinf(360.0 / self.waveWidth * (x  * M_PI / 180) * self.waveFrequency + self.phase * M_PI/ 180) + self.waveAmplitude;
        }else{
            y = self.waveAmplitude * cosf(360.0 / self.waveWidth * (x  * M_PI / 180) * self.waveFrequency + self.phase * M_PI/ 180) + self.waveAmplitude;
        }
        
        if (x == 0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        }else{
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }
    }
    
    CGFloat endY = CGRectGetHeight(self.bounds) + 10;
    [wavePath addLineToPoint:CGPointMake(endX, endY)];
    [wavePath addLineToPoint:CGPointMake(0, endY)];
    
    return wavePath;
}

-(CGFloat)waveSpeed{
    if (!_waveSpeed) {
        _waveSpeed = 10;
    }
    return _waveSpeed;
}

-(CGFloat)waveFrequency{
    if (!_waveFrequency) {
        _waveFrequency = 0.5;
    }
    return _waveFrequency;
}

-(UIColor *)realWaveColor{
    if (!_realWaveColor) {
        _realWaveColor = [UIColor greenColor];
    }
    return _realWaveColor;
}

-(UIColor *)maskWaveColor{
    if (!_maskWaveColor) {
        _maskWaveColor = [[UIColor greenColor] colorWithAlphaComponent:0.4];
    }
    return _maskWaveColor;
}


-(void)setProgress:(float)progress{
    _progress = progress;
    if (self.realWaveLayer && self.maskWaveLayer) {
        CGRect frame = self.bounds;
        frame.origin.y = frame.size.height * (1.0 - _progress);
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.realWaveLayer.frame = frame;
            weakSelf.maskWaveLayer.frame = frame;
        });
    }
}



-(CAShapeLayer *)realWaveLayer{
    if (!_realWaveLayer) {
        _realWaveLayer = [CAShapeLayer layer];
        _realWaveLayer.backgroundColor = [UIColor clearColor].CGColor;
        _realWaveLayer.fillColor = self.realWaveColor.CGColor;
        CGRect frame = self.bounds;
        frame.origin.y = frame.size.height * (1.0 - self.progress);
        _realWaveLayer.frame = frame;
    }
    return _realWaveLayer;
}

-(CAShapeLayer *)maskWaveLayer{
    if (!_maskWaveLayer) {
        _maskWaveLayer = [CAShapeLayer layer];
        _maskWaveLayer.backgroundColor = [UIColor clearColor].CGColor;
        _maskWaveLayer.fillColor = self.maskWaveColor.CGColor;
        CGRect frame = self.bounds;
        frame.origin.y = frame.size.height * (1.0 - self.progress);
        _maskWaveLayer.frame = frame;
    }
    return _maskWaveLayer;
}


@end
