//
//  TileLayer.h
//  KaiHuaWaterArea
//
//  Created by 杨亮 on 2018/3/16.
//  Copyright © 2018年 booway.com. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>

@interface TileLayer : GMSSyncTileLayer

@end

//普通底图
@interface TileLayerNormal:GMSSyncTileLayer

@end

//卫星底图
@interface TileLayerSatellite:GMSSyncTileLayer

@end
