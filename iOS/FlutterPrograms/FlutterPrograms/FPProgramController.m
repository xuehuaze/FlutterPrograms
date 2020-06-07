//
//  FPProgramController.m
//  FlutterPrograms
//
//  Created by GuHaijun on 2019/2/26.
//  Copyright © 2019 GuHaijun. All rights reserved.
//

#import "FPProgramController.h"
#import "NSLayoutConstraint+NNVisualFormat.h"

@interface FPProgramController ()

@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation FPProgramController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.åå
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.closeButton];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@(CGSizeMake(42, 32)));
        make.right.offset(-20);
        make.top.offset((fp_safeAreaTopMargin() + 25));
    }];
}

- (void)closeAction {
    if (self.navigationController) {
        [self.navigationController popToViewController:self animated:true];
    }
    else {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

- (BOOL)loadDefaultSplashScreenView {
    return false;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

nn_lazygetter(UIButton, closeButton, {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    [button setTitle:@"ㄨ" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 16;
    button.layer.borderColor = button.titleLabel.textColor.CGColor;
    button.layer.borderWidth = 0.5;
    button.layer.masksToBounds = true;
    button.translatesAutoresizingMaskIntoConstraints = false;
    [button addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton = button;
})


@end
