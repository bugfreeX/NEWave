# NEWave
* Wave animation

![](https://github.com/XieXieZhongxi/CATransition/blob/master/screenshot/UIViewController.gif)


###Sample Code
* circle
```objective-c
self.circleView.layer.cornerRadius = CGRectGetHeight(self.circle1View.bounds) / 2;
self.circleView.realWaveColor = [UIColor colorWithRed:0.035 green:0.678 blue:0.988 alpha:1.00];
self.circleView.maskWaveColor = [[UIColor colorWithRed:0.035 green:0.678 blue:0.988 alpha:1.00] colorWithAlphaComponent:0.4];
self.circleView.progress = 0.5;
self.circleView.waveSpeed = 10;
self.circleView.waveFrequency = 0.5;
//start animation
[self.circleView startAnimation];

//stop animation
[self.circleView stopAnimation];
```


