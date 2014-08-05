//
//  DetailViewController.m
//  Biorhtthm
//
//  Created by Jianhai Yu on 14/7/26.
//  Copyright (c) 2014年 JianhaiYu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    UIImageView *_imageView;
    UILabel *pValueLabel;
    UILabel *iValueLabel;
    UILabel *mValueLabel;
    
    NSString *todayPValue;
    NSString *todayIValue;
    NSString *todayMValue;
    
    UIProgressView *pProgressView;
    UIProgressView *iProgressView;
    UIProgressView *mProgressView;
    UIScrollView *scrollView;
}

@synthesize userName,age,totalDays,pValue,iValue,mValue;
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 88, 568, 0.5)];
    self.view.backgroundColor = [UIColor greenColor];
//    titleLabel.backgroundColor = [UIColor colorWithRed:20 green:20 blue:20 alpha:0.6];
    titleLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:titleLabel];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(10, 60, 60, 30);
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 85, 100, 40)];
    nameLabel.text = [NSString stringWithFormat:@"姓名: %@",userName];
    [self.view addSubview:nameLabel];
    UILabel *ageLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 85, 100, 40)];
    ageLabel.text = [NSString stringWithFormat:@"年龄: %d",age];
    [self.view addSubview:ageLabel];
    UILabel *totalDaysLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 85, 100, 40)];
    totalDaysLabel.text = [NSString stringWithFormat:@"天数: %d",totalDays];
    [self.view addSubview:totalDaysLabel];
    
    UILabel *pLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 342, 40, 40)];
    pLabel.text = @"体力:";
    [self.view addSubview:pLabel];
    
    UILabel *iLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 342, 40, 40)];
    iLabel.text = @"智力:";
    [self.view addSubview:iLabel];
    
    UILabel *mLabel = [[UILabel alloc]initWithFrame:CGRectMake(390, 342, 40, 40)];
    mLabel.text = @"情绪:";
    [self.view addSubview:mLabel];
    
    

    pProgressView = [[UIProgressView alloc]initWithFrame:CGRectMake(50, 362, 80, 40)];
    pProgressView.progressViewStyle = UIProgressViewStyleDefault;
    if (((float)pValue/100) < 0.0) {
        pProgressView.progress =(-(float)pValue/100);
        pProgressView.progressTintColor = [UIColor colorWithRed:(255-pValue) green:0 blue:0 alpha:1];
    } else {
        pProgressView.progress = (float)pValue/100;
    }
    [self.view addSubview:pProgressView];
    
    iProgressView = [[UIProgressView alloc]initWithFrame:CGRectMake(240, 362, 80, 40)];
    iProgressView.progressViewStyle = UIProgressViewStyleDefault;
//    iProgressView.progress = (float)iValue/100;
    if (((float)iValue/100) < 0.0) {
        iProgressView.progress =(-(float)iValue/100);
        iProgressView.progressTintColor = [UIColor colorWithRed:(255-iValue) green:0 blue:0 alpha:1];
    } else {
        iProgressView.progress = (float)iValue/100;
    }
    [self.view addSubview:iProgressView];
    
    mProgressView = [[UIProgressView alloc]initWithFrame:CGRectMake(430, 362, 80, 40)];
    mProgressView.progressViewStyle = UIProgressViewStyleDefault;
//    mProgressView.progress = (float)mValue/100;
    if (((float)mValue/100) < 0.0) {
        mProgressView.progress =(-(float)mValue/100);
        mProgressView.progressTintColor = [UIColor colorWithRed:(255-mValue) green:0 blue:0 alpha:1];
    } else {
        mProgressView.progress = (float)mValue/100;
    }
    [self.view addSubview:mProgressView];
   
    pValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 342, 50, 40)];
    pValueLabel.textAlignment = NSTextAlignmentRight;
    pValueLabel.text = [NSString stringWithFormat:@"%d%%",pValue];
    todayPValue = pValueLabel.text;
    [self.view addSubview:pValueLabel];
    
    iValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(320, 342, 50, 40)];
    iValueLabel.textAlignment = NSTextAlignmentRight;
    iValueLabel.text = [NSString stringWithFormat:@"%d%%",iValue];
    todayIValue = iValueLabel.text;
    [self.view addSubview:iValueLabel];
    
    mValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(500, 342, 50, 40)];
    mValueLabel.textAlignment = NSTextAlignmentRight;
    mValueLabel.text = [NSString stringWithFormat:@"%d%%",mValue];
    todayMValue = mValueLabel.text;
    [self.view addSubview:mValueLabel];
  
    
    
    [self setOritation];
    
//    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.frame = CGRectMake(2, 120, 564, 230);
//    [self.view addSubview:scrollView];
//    UIImage *image = [UIImage imageNamed:@"FWA10.jpg"];
//    _imageView = [[UIImageView alloc] initWithImage:image];
//    _imageView.frame = CGRectMake(0, 0, image.size.width, 230);
//    [scrollView addSubview:_imageView];
//    scrollView.contentSize = CGSizeMake(_imageView.frame.size.width, _imageView.frame.size.height);
//    scrollView.bounces = NO;
//    scrollView.showsHorizontalScrollIndicator = NO;

    
}
- (void)pickUpDateButtonClicked:(UIButton *)sender{
    
    if (sender.tag == 130) {
        int i = 0;
        i+=1;
//        for (int i=0; i<30; i++) {
            totalDays += 1;
//            double tp = (((360*totalDays)/23)*3.14)/180;
//            double ti = (((360*totalDays)/33)*3.14)/180;
//            double tm = (((360*totalDays)/28)*3.14)/180;
        double tp = ((6.18*totalDays)/23);
        double ti = ((6.18*totalDays)/33);
        double tm = ((6.18*totalDays)/28);
            pValue = (int)100*sin(tp);
            iValue = (int)100*sin(ti);
            mValue = (int)100*sin(tm);
            
            pValueLabel.text = [NSString stringWithFormat:@"%d%%",pValue];
            iValueLabel.text = [NSString stringWithFormat:@"%d%%",iValue];
            mValueLabel.text = [NSString stringWithFormat:@"%d%%",mValue];


            if (((float)pValue/100) < 0.0) {
                pProgressView.progress =(-(float)pValue/100);
                pProgressView.progressTintColor = [UIColor redColor];
            } else {
                pProgressView.progress = (float)pValue/100;
                pProgressView.progressTintColor = [UIColor blueColor];
            }

            if (((float)iValue/100) < 0.0) {
                iProgressView.progress =(-(float)iValue/100);
                iProgressView.progressTintColor = [UIColor redColor];
            } else {
                iProgressView.progress = (float)iValue/100;
                iProgressView.progressTintColor = [UIColor blueColor];
           }

            if (((float)mValue/100) < 0.0) {
                mProgressView.progress =(-(float)mValue/100);
                mProgressView.progressTintColor = [UIColor redColor];
            } else {
                mProgressView.progress = (float)mValue/100;
                mProgressView.progressTintColor = [UIColor blueColor];
            }

            
            
            
//            if (pValue > 0 && iValue > 0 && mValue > 0) {
//                NSLog(@"totalDays %d, i %d,pValue %d,   iValue %d,   mValue %d",totalDays, i, pValue, iValue, mValue);
//            }
            NSLog(@"totalDays %d,i %d, pValue %d,   iValue %d,   mValue %d",totalDays, i, pValue, iValue, mValue);
        }
//    }
 
//    NSDate *select  = [[UIDatePicker alloc] date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yy-MM-dd"];
//    NSString *dateAndTime = [dateFormatter stringFromDate:select];
//    NSLog(@"%@",dateAndTime);
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"选择日期" message: dateAndTime delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alert show];

}
- (void)backButtonClicked:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)setOritation {
    //设置状态栏旋转
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    //设置旋转动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    //设置导航栏旋转
    self.navigationController.navigationBarHidden = YES;
    [self prefersStatusBarHidden];
    //设置视图旋转
    self.view.bounds = CGRectMake(0, 54, self.view.frame.size.width, self.view.frame.size.height);
    self.view.transform = CGAffineTransformMakeRotation(-M_PI*1.5);
    [UIView commitAnimations];
    
    
    
    [self drawSinCurve];
}
- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

- (void)drawSinCurve {
    UIGraphicsBeginImageContext(CGSizeMake(568*2, 230));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor]CGColor]);
    
//    //x
//    CGContextMoveToPoint(ctx, 2, 15);
//    CGContextAddLineToPoint(ctx, 2, 185);
//    for (int i = 0; i<17; i++) {
//        CGContextMoveToPoint(ctx, 2, 15+10*i);
//        CGContextAddLineToPoint(ctx, 4, 15+10*i);
//    }
    
    //y
//    CGContextMoveToPoint(ctx, 0, 100);
//    CGContextAddLineToPoint(ctx, 300, 100);
    for (int j = 0; j<568*2; j++) {
        CGContextMoveToPoint(ctx, 10+20*j , 99);
        CGContextAddLineToPoint(ctx, 10+20*j, 15);
        CGContextMoveToPoint(ctx, 10+20*j , 185);
        CGContextAddLineToPoint(ctx, 10+20*j, 101);
    }
    CGContextStrokePath(ctx);
    
    
    
    CGContextSetStrokeColorWithColor(ctx, [[UIColor blueColor]CGColor]);
    CGContextMoveToPoint(ctx, 10, 100);
    
    for (int z=0; z<568*2; z++) {
        float y = 2*sinf((((360*(9638+z))/(23*10))*M_PI)/180);
        
        CGContextAddLineToPoint(ctx, 10+z, 100-40*y);
    }
    CGContextStrokePath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor]CGColor]);
    CGContextMoveToPoint(ctx, 10, 100);
    
    for (int z=0; z<568*2; z++) {
        float y = 2*sinf((((360*(9638+z))/(33*10))*M_PI)/180);
        
        CGContextAddLineToPoint(ctx, 10+z, 100-40*y);
    }
    CGContextStrokePath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, [[UIColor blackColor]CGColor]);
    CGContextMoveToPoint(ctx, 10, 100);
    
    for (int z=0; z<568*2; z++) {
        float y = 2*sin((((360*(9638+z))/(28*10))*M_PI)/180);
//        NSString *yValue = [NSString stringWithFormat:@"%f",y*50];
//        NSLog(@"intValue %d",[yValue intValue]);
        CGContextAddLineToPoint(ctx, 10+z, 100-40*y);
    }
    CGContextStrokePath(ctx);
    
    
//    
//    for (int z=0; z<568*2; z++) {
//        float y = 2*sin((((360*(9638+z))/28)*M_PI)/180);
//        NSString *yValue = [NSString stringWithFormat:@"%f",y*50];
//        NSLog(@"intValue %d",[yValue intValue]);
//        CGContextAddLineToPoint(ctx, 2+z, 100-40*y);
//    }
//
    
    scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(2, 100, 568, 230);
    [self.view addSubview:scrollView];
    //    UIImage *image = [UIImage imageNamed:@"FWA10.jpg"];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    _imageView = [[UIImageView alloc] initWithImage:image];
    _imageView.frame = CGRectMake(2, 0,568*2, 230);
    [scrollView addSubview:_imageView];
    scrollView.contentSize = CGSizeMake(_imageView.frame.size.width, _imageView.frame.size.height);
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;

}

#pragma mark 度转弧度
- (float)huDuFromdu:(float)du
{
    return M_PI*(du/180);
}
#pragma mark 计算sin cos
- (float)sin:(float)a
{
    return 2*sinf(a);
}
- (float)cos:(float)a
{
    return cosf(a);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end