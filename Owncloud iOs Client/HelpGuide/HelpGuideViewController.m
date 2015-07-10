//
//  HelpGuideViewController.m
//  Owncloud iOs Client
//
//  Created by Noelia Alvarez on 8/7/15.
//
//

#import "HelpGuideViewController.h"
#import "MyCustomAnimation.h"
#import "AppDelegate.h"
#import "UIColor+Constants.h"

@interface HelpGuideViewController ()

@property (nonatomic, strong) UIImageView *wordmark;
@property (nonatomic, strong) UIImageView *owncloudLogo;

@property (nonatomic, strong) UIImageView *btnAllHelpPage;
@property (nonatomic, strong) UIImageView *btnHelpPage0;
@property (nonatomic, strong) UIImageView *btnHelpPage1;
@property (nonatomic, strong) UIImageView *btnHelpPage2;
@property (nonatomic, strong) UIImageView *btnHelpPage3;
@property (nonatomic, strong) UIImageView *btnHelpPage4;
@property (nonatomic, strong) UIImageView *btnHelpPage5;

//Multiaccount view
@property (nonatomic, strong) UIImageView *iphoneAccounts;


@property (nonatomic, strong) UILabel *welcomeLabel;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UILabel *thirdLabel;
@property (nonatomic, strong) UILabel *fourthLabel;
@property (nonatomic, strong) UILabel *fifthLabel;

@property (nonatomic, strong) UIButton *signInButton;


@end

@implementation HelpGuideViewController

- (instancetype)init
{
    if ((self = [super init])) {
        self.numberOfPages = 6;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        self.numberOfPages = 6;
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.numberOfPages = 6;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.accessibilityLabel = @"HelpGuide";
    self.scrollView.accessibilityIdentifier = @"HelpGuide";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureViews];
    [self configureAnimations];
    
}

- (void)configureViews
{
    self.owncloudLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"companyLogoHelp"]];
    [self.contentView addSubview:self.owncloudLogo];
    
    self.wordmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ownCloud"]];
    [self.contentView addSubview:self.wordmark];
    
    [self configureTextLabelsAndButtons];
    [self configurePageControlImages];
    [self configureView4];
}

- (void)configureTextLabelsAndButtons{
    
    self.welcomeLabel = [UILabel new];
    self.welcomeLabel.text = NSLocalizedString(@"title_help_slide_0", nil);
    self.welcomeLabel.textColor = [UIColor colorOfLoginText];
    //    UIFont *appFont = [UIFont fontWithName:@"HelveticaNeue" size:16];
    //    self.firstLabel.font = appFont;
    [self.welcomeLabel sizeToFit];
    [self.contentView addSubview:self.welcomeLabel];
    
    self.firstLabel = [UILabel new];
    self.firstLabel.text = NSLocalizedString(@"title_help_slide_1", nil);
    self.firstLabel.textColor = [UIColor colorOfLoginText];
    [self.firstLabel sizeToFit];
    [self.contentView addSubview:self.firstLabel];
    
    self.secondLabel = [UILabel new];
    self.secondLabel.text = NSLocalizedString(@"title_help_slide_2", nil);
    self.secondLabel.textColor = [UIColor colorOfLoginText];
    [self.secondLabel sizeToFit];
    [self.contentView addSubview:self.secondLabel];
    
    self.thirdLabel = [UILabel new];
    self.thirdLabel.text = NSLocalizedString(@"title_help_slide_3", nil);
    self.thirdLabel.textColor = [UIColor colorOfLoginText];
    [self.thirdLabel sizeToFit];
    [self.contentView addSubview:self.thirdLabel];
    
    self.fourthLabel = [UILabel new];
    self.fourthLabel.text = NSLocalizedString(@"title_help_slide_4", nil);
    self.fourthLabel.textColor = [UIColor colorOfLoginText];
    [self.fourthLabel sizeToFit];
    [self.contentView addSubview:self.fourthLabel];
    
    self.fifthLabel = [UILabel new];
    self.fifthLabel.text = NSLocalizedString(@"title_help_slide_5", nil);
    self.fifthLabel.textColor = [UIColor colorOfLoginText];
    [self.fifthLabel sizeToFit];
    [self.contentView addSubview:self.fifthLabel];
    
    self.signInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.signInButton setTitle:NSLocalizedString(@"sign_in_button_help_guide", nil) forState:UIControlStateNormal];
    [self.signInButton setBackgroundColor:[UIColor colorOfLoginButtonBackground]];
    [self.signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[self.signInButton setImage:[UIImage imageNamed:@".jpg"]   forState:UIControlStateSelected];
    [self.signInButton addTarget:self action:@selector(stayPressed:) forControlEvents:UIControlEventTouchDown];
    //[self.signInButton setBackgroundImage:[UIImage imageNamed:@"MainAppIcon_40-40@3x.png"] forState:UIControlStateNormal];
    //self.signInButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.contentView addSubview:self.signInButton];
}

- (void)configurePageControlImages
{
    self.btnAllHelpPage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btnAllHelpGrey"]];
    [self.contentView addSubview:self.btnAllHelpPage];
    self.btnHelpPage0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btnHelpPage0"]];
    [self.contentView addSubview:self.btnHelpPage0];
    self.btnHelpPage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btnHelpPage1"]];
    [self.contentView addSubview:self.btnHelpPage1];
    self.btnHelpPage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btnHelpPage2"]];
    [self.contentView addSubview:self.btnHelpPage2];
    self.btnHelpPage3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btnHelpPage3"]];
    [self.contentView addSubview:self.btnHelpPage3];
    self.btnHelpPage4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btnHelpPage4"]];
    [self.contentView addSubview:self.btnHelpPage4];
    self.btnHelpPage5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btnHelpPage5"]];
    [self.contentView addSubview:self.btnHelpPage5];
}

- (void)configureView4 {
    self.iphoneAccounts = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test1"]];
    [self.contentView addSubview:self.iphoneAccounts];
}

- (void)configureAnimations
{
    [self configureScrollViewAnimations];
    [self configurePageControlAnimations];
    
    [self configureOwnCloudLogoAnimations];
    [self configureWordmarkAnimations];

    [self configureLabelAnimations];
    [self animateCurrentFrame];
}

- (void)configureScrollViewAnimations
{
    // change the scrollView's background color for each page
    IFTTTColorAnimation *backgroundColorAnimation = [IFTTTColorAnimation animationWithView:self.scrollView];
    [backgroundColorAnimation addKeyframeForTime:0 color:[UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]];
    [backgroundColorAnimation addKeyframeForTime:1 color:[[UIColor cyanColor] colorWithAlphaComponent:0.4f]];
    [backgroundColorAnimation addKeyframeForTime:2 color:[[UIColor greenColor] colorWithAlphaComponent:0.4f]];
    [backgroundColorAnimation addKeyframeForTime:3 color:[[UIColor yellowColor] colorWithAlphaComponent:0.4f]];
    [backgroundColorAnimation addKeyframeForTime:4 color:[[UIColor yellowColor] colorWithAlphaComponent:0.4f]];
    [backgroundColorAnimation addKeyframeForTime:5 color:[[UIColor yellowColor] colorWithAlphaComponent:0.4f]];

    [self.animator addAnimation:backgroundColorAnimation];
}

- (void)configurePageControlAnimations
{
    [self keepView:self.btnAllHelpPage onPages:@[@(0), @(1), @(2), @(3), @(4), @(5)]];
    [self keepView:self.btnHelpPage0 onPages:@[ @(0), @(1), @(2), @(3), @(4), @(5)]];
    [self keepView:self.btnHelpPage1 onPages:@[ @(0), @(1), @(2), @(3), @(4), @(5)]];
    [self keepView:self.btnHelpPage2 onPages:@[ @(0), @(1), @(2), @(3), @(4), @(5)]];
    [self keepView:self.btnHelpPage3 onPages:@[ @(0), @(1), @(2), @(3), @(4), @(5)]];
    [self keepView:self.btnHelpPage4 onPages:@[ @(0), @(1), @(2), @(3), @(4), @(5)]];
    [self keepView:self.btnHelpPage5 onPages:@[ @(0), @(1), @(2), @(3), @(4), @(5)]];
    
    NSLayoutConstraint *btnAllHelpPageCenterYConstraint = [NSLayoutConstraint constraintWithItem:self.btnAllHelpPage
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                    multiplier:1.8f constant:0.f];
    [self.contentView addConstraint:btnAllHelpPageCenterYConstraint];
    
    NSLayoutConstraint *btnHelpPage0CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.btnHelpPage0
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.contentView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                      multiplier:1.8f constant:0.f];
    [self.contentView addConstraint:btnHelpPage0CenterYConstraint];
    
    NSLayoutConstraint *btnHelpPage1CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.btnHelpPage1
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                    multiplier:1.8f constant:0.f];
    [self.contentView addConstraint:btnHelpPage1CenterYConstraint];
    
    NSLayoutConstraint *btnHelpPage2CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.btnHelpPage2
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                    multiplier:1.8f constant:0.f];
    [self.contentView addConstraint:btnHelpPage2CenterYConstraint];
    
    NSLayoutConstraint *btnHelpPage3CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.btnHelpPage3
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                    multiplier:1.8f constant:0.f];
    [self.contentView addConstraint:btnHelpPage3CenterYConstraint];
    
    NSLayoutConstraint *btnHelpPage4CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.btnHelpPage4
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                    multiplier:1.8f constant:0.f];
    [self.contentView addConstraint:btnHelpPage4CenterYConstraint];
    
    NSLayoutConstraint *btnHelpPage5CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.btnHelpPage5
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeCenterY
                                                                                    multiplier:1.8f constant:0.f];
    [self.contentView addConstraint:btnHelpPage5CenterYConstraint];
    

    IFTTTAlphaAnimation *btnAllHelpPageAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.btnAllHelpPage];
    [btnAllHelpPageAlphaAnimation addKeyframeForTime:0 alpha:1.f];
    [btnAllHelpPageAlphaAnimation addKeyframeForTime:1 alpha:1.f];
    [btnAllHelpPageAlphaAnimation addKeyframeForTime:2 alpha:1.f];
    [btnAllHelpPageAlphaAnimation addKeyframeForTime:3 alpha:1.f];
    [btnAllHelpPageAlphaAnimation addKeyframeForTime:4 alpha:1.f];
    [btnAllHelpPageAlphaAnimation addKeyframeForTime:5 alpha:1.f];
    [self.animator addAnimation:btnAllHelpPageAlphaAnimation];
    
    IFTTTAlphaAnimation *btnHelpPage0AlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.btnHelpPage0];
    [btnHelpPage0AlphaAnimation addKeyframeForTime:0 alpha:1.f];
    [btnHelpPage0AlphaAnimation addKeyframeForTime:1 alpha:0.f];
    [btnHelpPage0AlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [btnHelpPage0AlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [btnHelpPage0AlphaAnimation addKeyframeForTime:4 alpha:0.f];
    [btnHelpPage0AlphaAnimation addKeyframeForTime:5 alpha:0.f];
    [self.animator addAnimation:btnHelpPage0AlphaAnimation];
    
    IFTTTAlphaAnimation *btnHelpPage1AlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.btnHelpPage1];
    [btnHelpPage1AlphaAnimation addKeyframeForTime:0 alpha:0.f];
    [btnHelpPage1AlphaAnimation addKeyframeForTime:1 alpha:1.f];
    [btnHelpPage1AlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [btnHelpPage1AlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [btnHelpPage1AlphaAnimation addKeyframeForTime:4 alpha:0.f];
    [btnHelpPage1AlphaAnimation addKeyframeForTime:5 alpha:0.f];
    [self.animator addAnimation:btnHelpPage1AlphaAnimation];
    
    IFTTTAlphaAnimation *btnHelpPage2AlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.btnHelpPage2];
    [btnHelpPage2AlphaAnimation addKeyframeForTime:0 alpha:0.f];
    [btnHelpPage2AlphaAnimation addKeyframeForTime:1 alpha:0.f];
    [btnHelpPage2AlphaAnimation addKeyframeForTime:2 alpha:1.f];
    [btnHelpPage2AlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [btnHelpPage2AlphaAnimation addKeyframeForTime:4 alpha:0.f];
    [btnHelpPage2AlphaAnimation addKeyframeForTime:5 alpha:0.f];
    [self.animator addAnimation:btnHelpPage2AlphaAnimation];
    
    IFTTTAlphaAnimation *btnHelpPage3AlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.btnHelpPage3];
    [btnHelpPage3AlphaAnimation addKeyframeForTime:0 alpha:0.f];
    [btnHelpPage3AlphaAnimation addKeyframeForTime:1 alpha:0.f];
    [btnHelpPage3AlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [btnHelpPage3AlphaAnimation addKeyframeForTime:3 alpha:1.f];
    [btnHelpPage3AlphaAnimation addKeyframeForTime:4 alpha:0.f];
    [btnHelpPage3AlphaAnimation addKeyframeForTime:5 alpha:0.f];
    [self.animator addAnimation:btnHelpPage3AlphaAnimation];
    
    IFTTTAlphaAnimation *btnHelpPage4AlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.btnHelpPage4];
    [btnHelpPage4AlphaAnimation addKeyframeForTime:0 alpha:0.f];
    [btnHelpPage4AlphaAnimation addKeyframeForTime:1 alpha:0.f];
    [btnHelpPage4AlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [btnHelpPage4AlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [btnHelpPage4AlphaAnimation addKeyframeForTime:4 alpha:1.f];
    [btnHelpPage4AlphaAnimation addKeyframeForTime:5 alpha:0.f];
    [self.animator addAnimation:btnHelpPage4AlphaAnimation];
    
    IFTTTAlphaAnimation *btnHelpPage5AlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.btnHelpPage5];
    [btnHelpPage5AlphaAnimation addKeyframeForTime:0 alpha:0.f];
    [btnHelpPage5AlphaAnimation addKeyframeForTime:1 alpha:0.f];
    [btnHelpPage5AlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [btnHelpPage5AlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [btnHelpPage5AlphaAnimation addKeyframeForTime:4 alpha:0.f];
    [btnHelpPage5AlphaAnimation addKeyframeForTime:5 alpha:1.f];
    [self.animator addAnimation:btnHelpPage5AlphaAnimation];
}

- (void)configureOwnCloudLogoAnimations
{
    // now, we animate the ownCloudLogo
    // keep the owncloudLogo centered when we're on pages 1 and 2.
    // It will slide from the right between pages 0 and 1, and slide out to the left between pages 2 and 3.
    [self keepView:self.owncloudLogo onPages:@[@(0), @(1) ]];
    
    NSLayoutConstraint *ownCloudLogoCenterYConstraint = [NSLayoutConstraint constraintWithItem:self.owncloudLogo
                                                                                attribute:NSLayoutAttributeCenterY
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.contentView
                                                                                attribute:NSLayoutAttributeCenterY
                                                                               multiplier:1.f constant:0.f];
    [self.contentView addConstraint:ownCloudLogoCenterYConstraint];
    
    // Move the owncloudLogo from a bit higher than center on page 1 to a bit lower on page 2, by an amount relative to the height of the view.
    IFTTTConstraintMultiplierAnimation *ownCloudLogoCenterYAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                  constraint:ownCloudLogoCenterYConstraint
                                                                                                                   attribute:IFTTTLayoutAttributeHeight
                                                                                                               referenceView:self.contentView];
    [ownCloudLogoCenterYAnimation addKeyframeForTime:0 multiplier:-0.1f withEasingFunction:IFTTTEasingFunctionEaseOutQuad];
    [ownCloudLogoCenterYAnimation addKeyframeForTime:1 multiplier:0.2f];
    [self.animator addAnimation:ownCloudLogoCenterYAnimation];
    
    // Rotate the wordmark a full circle from page 1 to 2
    IFTTTRotationAnimation *ownCloudLogoRotationAnimation = [IFTTTRotationAnimation animationWithView:self.owncloudLogo];
    [ownCloudLogoRotationAnimation addKeyframeForTime:0 rotation:0.f];
    [ownCloudLogoRotationAnimation addKeyframeForTime:1 rotation:360.f];
    [self.animator addAnimation:ownCloudLogoRotationAnimation];
    
    // Scale down the company logo by 75% between pages 0 and 1
    IFTTTScaleAnimation *ownCloudLogoScaleAnimation = [IFTTTScaleAnimation animationWithView:self.owncloudLogo];
    [ownCloudLogoScaleAnimation addKeyframeForTime:0 scale:1.f];
    [ownCloudLogoScaleAnimation addKeyframeForTime:1 scale:0.80f];
    [self.animator addAnimation:ownCloudLogoScaleAnimation];
    
    // fade the owncloud in on page 0 and out on page 2
    IFTTTAlphaAnimation *owncloudLogoAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.owncloudLogo];
    [owncloudLogoAlphaAnimation addKeyframeForTime:0 alpha:1.f];
    [owncloudLogoAlphaAnimation addKeyframeForTime:1 alpha:1.f];
    [owncloudLogoAlphaAnimation addKeyframeForTime:2 alpha:0.f];
    [owncloudLogoAlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [owncloudLogoAlphaAnimation addKeyframeForTime:4 alpha:0.f];
    [owncloudLogoAlphaAnimation addKeyframeForTime:5 alpha:0.f];
    [self.animator addAnimation:owncloudLogoAlphaAnimation];
}

- (void)configureWordmarkAnimations
{
    // let's animate the wordmark
    // keep the wordmark centered on pages 1 and 2, slide it in fast from the right between page 0 and 1, and slide it out fast to the left between pages 2 and 3.
    [self keepView:self.wordmark
           onPages:@[ @(2), @(1), @(2), @(1) ]
           atTimes:@[ @(0), @(1), @(2), @(3) ]];
    
    // keep the wordmark vertically centered on top of the ownCloudLogo
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.wordmark
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.owncloudLogo
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:0.5f constant:0.f]];
    
    // Rotate the wordmark a full circle from page 1 to 2
    IFTTTRotationAnimation *wordmarkRotationAnimation = [IFTTTRotationAnimation animationWithView:self.wordmark];
    [wordmarkRotationAnimation addKeyframeForTime:1 rotation:0.f];
    [wordmarkRotationAnimation addKeyframeForTime:2 rotation:360.f];
    [self.animator addAnimation:wordmarkRotationAnimation];
//    // Rotate the wordmark a full circle from page 1 to 2
//    IFTTTRotationAnimation *wordmarkRotationAnimation = [IFTTTRotationAnimation animationWithView:self.wordmark];
//    [wordmarkRotationAnimation addKeyframeForTime:1 rotation:0.f];
//    [wordmarkRotationAnimation addKeyframeForTime:2 rotation:360.f];
//    [self.animator addAnimation:wordmarkRotationAnimation];
    
    // Scale down the wordmark by 75% between pages 1 and 2
    IFTTTScaleAnimation *wordmarkScaleAnimation = [IFTTTScaleAnimation animationWithView:self.wordmark];
    [wordmarkScaleAnimation addKeyframeForTime:1 scale:1.f];
    [wordmarkScaleAnimation addKeyframeForTime:2 scale:0.75f];
    [self.animator addAnimation:wordmarkScaleAnimation];
}

- (void)configureLabelAnimations
{
    // lay out labels' vertical positions
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.welcomeLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:0.4f constant:0.f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.firstLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:0.4f constant:0.f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.secondLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.5f constant:0.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.thirdLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:0.4f constant:0.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.fourthLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:0.4f constant:0.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.fifthLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:0.4f constant:0.f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.signInButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.f constant:0.f]];
    
    // lay out the labels' horizontal positions (centered on each page)
    [self keepView:self.welcomeLabel onPage:0];
    [self keepView:self.firstLabel onPage:1];
    [self keepView:self.secondLabel onPage:2];
    [self keepView:self.thirdLabel onPage:3];
    [self keepView:self.fourthLabel onPage:4];
    [self keepView:self.fifthLabel onPage:5];
    [self keepView:self.signInButton onPage:5];
    
    // apply a 3D zoom animation to the first label
    IFTTTTransform3DAnimation * labelTransform = [IFTTTTransform3DAnimation animationWithView:self.welcomeLabel];
    IFTTTTransform3D *tt1 = [IFTTTTransform3D transformWithM34:0.03f];
    IFTTTTransform3D *tt2 = [IFTTTTransform3D transformWithM34:0.3f];
    tt2.rotate = (IFTTTTransform3DRotate){ -(CGFloat)(M_PI), 1, 0, 0 };
    tt2.translate = (IFTTTTransform3DTranslate){ 0, 0, 50 };
    tt2.scale = (IFTTTTransform3DScale){ 1.f, 2.f, 1.f };
    [labelTransform addKeyframeForTime:0 transform:tt1];
    [labelTransform addKeyframeForTime:0.5f transform:tt2];
    [self.animator addAnimation:labelTransform];
    
    // fade out the first label
    IFTTTAlphaAnimation *firstLabelAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.welcomeLabel];
    [firstLabelAlphaAnimation addKeyframeForTime:0 alpha:1.f];
    [firstLabelAlphaAnimation addKeyframeForTime:0.35f alpha:0.f];
    [self.animator addAnimation:firstLabelAlphaAnimation];
    
    // custom animate the fourth label
    MyCustomAnimation *fourthLabelAnimation = [MyCustomAnimation animationWithView:self.fourthLabel];
    [fourthLabelAnimation addKeyframeForTime:1.5f shadowOpacity:0.f];
    [fourthLabelAnimation addKeyframeForTime:2 shadowOpacity:1.f];
    [fourthLabelAnimation addKeyframeForTime:2.5f shadowOpacity:0.f];
    [self.animator addAnimation:fourthLabelAnimation];
    
    self.thirdLabel.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.thirdLabel.layer.shadowRadius = 1.f;
    self.thirdLabel.layer.shadowOffset = CGSizeMake(1.f, 1.f);
    
    // Fade out the last label by dragging on the last page
    IFTTTAlphaAnimation *lastLabelAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.fifthLabel];
    [lastLabelAlphaAnimation addKeyframeForTime:3 alpha:1.f];
    [lastLabelAlphaAnimation addKeyframeForTime:3.35f alpha:0.f];
    [self.animator addAnimation:lastLabelAlphaAnimation];
}

-(void)stayPressed:(UIButton *) sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app showLoginView];
}

@end
