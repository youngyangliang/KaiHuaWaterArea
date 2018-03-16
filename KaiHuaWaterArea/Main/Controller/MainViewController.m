//
//  MainViewController.m
//  KH_WaterArea
//
//  Created by 杨亮 on 2018/3/15.
//  Copyright © 2018年 booway.com. All rights reserved.
//

#import "MainViewController.h"
#import "BaseMapView.h"
#import "TileLayer.h"

@interface MainViewController ()<GMSMapViewDelegate>
@property (nonatomic, strong) GMSMapView *mapView;
@property (nonatomic, strong) TileLayerNormal *tileLayerNormal;
@property (nonatomic, strong) TileLayerSatellite *tileLayerSatellite;
@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configMapView];
    [self setUpUI];
}

-(void)configMapView{
    GMSMapView *mapView = [BaseMapView mapWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.mapView = mapView;
    mapView.delegate = self;
    [self.view addSubview:mapView];
    
}

-(void)setUpUI{
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"平面图",@"卫星图"]];
    seg.selectedSegmentIndex = 0;
    [self.view addSubview:seg];
    [seg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.right.mas_equalTo(-50);
    }];
     [seg addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    TileLayerNormal *tileLayerNormal = [[TileLayerNormal alloc] init];
    tileLayerNormal.map = self.mapView;
    tileLayerNormal.tileSize = 512;
    self.tileLayerNormal = tileLayerNormal;
    
    TileLayerSatellite *tileLayerSatellite = [[TileLayerSatellite alloc] init];
    tileLayerSatellite.tileSize = 512;
    self.tileLayerSatellite = tileLayerSatellite;
}

-(void)segmentValueChanged:(UISegmentedControl *)seg{
    
    NSUInteger index = seg.selectedSegmentIndex;
    switch (index) {
        case 0:
        {
            self.tileLayerSatellite.map = nil;
            self.tileLayerNormal.map = self.mapView;
        }
            break;
        case 1:
        {
            self.tileLayerNormal.map = nil;
            self.tileLayerSatellite.map = self.mapView;
        }
            break;
            
        default:
            break;
    }
}


@end
