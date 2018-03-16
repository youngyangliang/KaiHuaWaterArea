//
//  BaseMapView.m
//  KaiHuaWaterArea
//
//  Created by 杨亮 on 2018/3/16.
//  Copyright © 2018年 booway.com. All rights reserved.
//

#import "BaseMapView.h"

@implementation BaseMapView
+(GMSMapView *) mapWithFrame:(CGRect) frame{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:29.127678 longitude:118.412105 zoom:10];
    GMSMapView *mapView = [GMSMapView mapWithFrame:frame camera:camera];
    [mapView setMinZoom:1 maxZoom:18];
    mapView.settings.myLocationButton = YES;
    
    return mapView;
}
@end
