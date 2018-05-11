//
//  AdView.m
//  xiaoheiheLib
//
//  Created by CoDancer on 2018/5/11.
//

#import "AdView.h"

@interface AdView()

@property (nonatomic, strong) UIImageView *adImgView;

@end

@implementation AdView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.adImgView];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.adImgView.frame = self.bounds;
}

- (UIImageView *)adImgView {
    
    if (!_adImgView) {
        _adImgView = [UIImageView new];
        _adImgView.image = [UIImage imageNamed:@"adtestimg"];
    }
    return _adImgView;
}

@end
