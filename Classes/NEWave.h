//
//  NEWave.h
//  NEWave
//
//  Created by Nslson on 2017/2/15.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEWave : UIView

/**
 speed ,default 10
 */
@property (nonatomic , assign) CGFloat waveSpeed;

/**
 frquency ,default 0.5
 */
@property (nonatomic , assign) CGFloat waveFrequency;

/**
 real layer color
 */
@property (nonatomic , strong) UIColor * realWaveColor;

/**
 mask layer color
 */
@property (nonatomic , strong) UIColor * maskWaveColor;

@property (nonatomic , assign) float progress;

-(void)startAnimation;

-(void)stopAnimation;
@end
