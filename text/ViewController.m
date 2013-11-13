//
//  ViewController.m
//  text
//
//  Created by TTgg on 13-11-13.
//  Copyright (c) 2013年 TTgg. All rights reserved.
//

#import "ViewController.h"
#import "textcell.h"
#import "PublickViewController.h"
@interface ViewController ()

@property (nonatomic, strong) NSMutableArray    *totalArray;

@end

@implementation ViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.totalArray = [NSMutableArray array];
    
    list = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"iphone5" ofType:@"plist"]];
    
    for (int i = 0; i < [list count]; i++)
    {
        NSNull *null = [NSNull null];
        [self.totalArray addObject:null];
    }
    
    [self.mysccr setContentSize:CGSizeMake(320*list.count, self.mysccr.frame.size.height)];
    [self.mysccr setPagingEnabled:YES];
    self.mysccr.bounces = NO;
    [self loadViewController:0];
}

- (void)loadViewController:(NSInteger)index
{
    if (index < 0 || index > list.count)
    {
        return;
    }
    PublickViewController *viewController = self.totalArray[index];
    if ((NSNull *)viewController == [NSNull null])
    {
        viewController = [[PublickViewController alloc] initWithDataSource:list[index]];
        
        [self.totalArray replaceObjectAtIndex:index withObject:viewController];
    }
    if (viewController.view.superview == nil)
    {
        viewController.view.frame = CGRectMake(320 * index, 0, self.mysccr.frame.size.width, self.mysccr.frame.size.height);
        [self.mysccr addSubview:viewController.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = (scrollView.contentOffset.x + scrollView.frame.size.width / 2) / 320;
    [self loadViewController:index - 1];
    [self loadViewController:index];
}

@end
