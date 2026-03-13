@interface VMHUDView : UIView
@property (strong, nonatomic) UIView *clippingView;
@property (strong, nonatomic) NSString *bundleID;
@property (strong) void (^valueDidChange)(CGFloat);
@property (nonatomic) CGFloat curScale;
@property (nonatomic) BOOL boostEnabled;
- (void)initScale;
- (void)changeScale:(CGFloat)dScale;
@end
