//
//  ViewController.h
//  text
//
//  Created by TTgg on 13-11-13.
//  Copyright (c) 2013年 TTgg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    NSMutableArray *list;
    int flag;
}
@property (strong, nonatomic) IBOutlet UIScrollView *mysccr;

@end
