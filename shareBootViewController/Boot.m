//
//  Boot.m
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "Boot.h"
#import "Login.h"

@interface Boot ()

@end

@implementation Boot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str = [NSString stringWithFormat:@"login_1.jpg"];
    UIImage *image = [UIImage imageNamed:str];
    UIImageView *iView = [[UIImageView alloc] initWithImage:image];
    iView.frame = self.view.bounds;
    [self.view addSubview:iView];
    [self performSelector:@selector(changeView) withObject:self afterDelay:3];
}

- (void)changeView {
    UIWindow *window = self.view.window;
    Login* main = [[Login alloc] init];
    main.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.9 animations:^{
        main.view.transform = CGAffineTransformIdentity;
    }];
    
    window.rootViewController = main;
    
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
