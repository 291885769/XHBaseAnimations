//
//  PathMenusViewController2.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/15.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "PathMenusViewController2.h"
#import "AwesomeMenu.h"
@interface PathMenusViewController2 ()<AwesomeMenuDelegate>

@end

@implementation PathMenusViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self oc];
}
-(void)oc{
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    // Default Menu
    
    //    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem5 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem6 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem7 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem8 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //    AwesomeMenuItem *starMenuItem9 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
    //                                                           highlightedImage:storyMenuItemImagePressed
    //                                                               ContentImage:starImage
    //                                                    highlightedContentImage:nil];
    //
    //    NSArray *menuItems = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, starMenuItem6, starMenuItem7,starMenuItem8,starMenuItem9, nil];
    //
    //    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-addbutton.png"]
    //                                                       highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
    //                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
    //                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    //
    //    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem menuItems:menuItems];
    //    menu.delegate = self;
    
    
    
    // Path-like customization
    
    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem5 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, nil];
    
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-addbutton.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem menuItems:menus];
    menu.menuGrapyType=SDiffuseMenuGrapyTypeLine;
    menu.delegate = self;
    
    menu.menuWholeAngle =M_PI_2;
    menu.rotateAngle =M_PI_2;
    menu.farRadius = 410.0f;
    menu.endRadius = 300.f;
    menu.nearRadius = 50.0f;
    menu.animationDuration = 3.f;
    menu.startPoint = CGPointMake(50.0, 410.0);
    
    
    [self.view addSubview:menu];
    
    
}
/* ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ */
/* ⬇⬇⬇⬇⬇⬇ GET RESPONSE OF MENU ⬇⬇⬇⬇⬇⬇ */
/* ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ */

- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
}
- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu {
    NSLog(@"Menu was closed!");
}
- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"Menu is open!");
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
