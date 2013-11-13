//
//  PublickViewController.m
//  text
//
//  Created by John on 13-11-13.
//  Copyright (c) 2013年 TTgg. All rights reserved.
//

#import "PublickViewController.h"
#import "textcell.h"

@interface PublickViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation PublickViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithDataSource:(NSArray *)array
{
    self = [super init];
    if (self)
    {
        self.dataSource = array;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(95,100)];
    

    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

    
    UICollectionView *ccc = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) collectionViewLayout:flowLayout];
    
    [ccc registerClass:[textcell class] forCellWithReuseIdentifier:@"simpleCell"];
    ccc.delegate = self;
    ccc.dataSource = self;
    [self.view addSubview:ccc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -- mark collection delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    textcell *mycell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    
    NSDictionary *dic = self.dataSource[indexPath.item];
    mycell.myimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[dic objectForKey:@"id"]]];
    mycell.backgroundColor = [UIColor yellowColor];
    mycell.mylable.text = [dic objectForKey:@"title"];
    
    return mycell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.item);

}

@end
