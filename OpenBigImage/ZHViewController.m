//
//  ZHViewController.m
//  OpenBigImage
//
//  Created by zeng hui on 14-3-17.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHViewController.h"
#import "PZPhotoView.h"


@interface ZHViewController ()

@end

@implementation ZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    PZPhotoView *photoView = [[PZPhotoView alloc] initWithFrame:self.view.bounds];
    photoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    photoView.photoViewDelegate = self;
    
    [photoView displayImage:[UIImage imageNamed:@"si-datu-bua.jpg"]];

//    [photoView displayImage:[UIImage imageNamed:@"studio-wp-marketplace-permalink-1.jpg"]];

    [self.view addSubview:photoView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - PZPhotoViewDelegate
#pragma mark -

- (void)photoViewDidSingleTap:(PZPhotoView *)photoView {
    [self toggleFullScreen];
}

- (void)photoViewDidDoubleTap:(PZPhotoView *)photoView {
    // do nothing
}

- (void)photoViewDidTwoFingerTap:(PZPhotoView *)photoView {
    // do nothing
}

- (void)photoViewDidDoubleTwoFingerTap:(PZPhotoView *)photoView {
//    [self logLayout];
}

- (void)toggleFullScreen {
    if (self.navigationController.navigationBar.alpha == 0.0) {
        // fade in navigation
        
        [UIView animateWithDuration:0.4 animations:^{
            [[UIApplication sharedApplication] setStatusBarHidden:FALSE withAnimation:UIStatusBarAnimationNone];
            self.navigationController.navigationBar.alpha = 1.0;
            self.navigationController.toolbar.alpha = 1.0;
        } completion:^(BOOL finished) {
        }];
    }
    else {
        // fade out navigation
        
        [UIView animateWithDuration:0.4 animations:^{
            [[UIApplication sharedApplication] setStatusBarHidden:TRUE withAnimation:UIStatusBarAnimationFade];
            self.navigationController.navigationBar.alpha = 0.0;
            self.navigationController.toolbar.alpha = 0.0;
        } completion:^(BOOL finished) {
        }];
    }
}


@end
