//
//  xiaoheiheLib.mm
//  xiaoheiheLib
//
//  Created by CoDancer on 2018/5/11.
//  Copyright (c) 2018年 ___ORGANIZATIONNAME___. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CaptainHook/CaptainHook.h"
#include <notify.h>
#import "AdView.h"

#define MAINSCREEN [UIScreen mainScreen].bounds
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

static AdView *adImgView = nil;

CHDeclareClass(MaxWebBBSNewsViewController);

CHOptimizedMethod0(self, void, MaxWebBBSNewsViewController, viewDidLoad)
{
    NSLog(@"进入hook的方法中0");
	CHSuper0(MaxWebBBSNewsViewController, viewDidLoad);
    NSLog(@"控制器:%@",self);
    Ivar ivar = class_getInstanceVariable([self class], "_view");
    UIView *controllerView = object_getIvar(self, ivar);
    NSLog(@"控制器的视图:%@",controllerView);
    adImgView = [[AdView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60 - 60, SCREEN_WIDTH, 60)];
    adImgView.layer.zPosition = 1;
    [controllerView addSubview:adImgView];
    NSLog(@"进入hook的方法中");
}

__attribute__((constructor)) static void entry()
{
    NSLog(@"注入的入口");
    CHLoadLateClass(MaxWebBBSNewsViewController);
    CHHook0(MaxWebBBSNewsViewController, viewDidLoad);
}
