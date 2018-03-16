//
//  TileLayer.m
//  KaiHuaWaterArea
//
//  Created by 杨亮 on 2018/3/16.
//  Copyright © 2018年 booway.com. All rights reserved.
//

#import "TileLayer.h"

@implementation TileLayer
@end
/*
 参数：lyrs =
 m：路线图
 t：地形图
 p：带标签的地形图
 s：卫星图
 y：带标签的卫星图
 h：标签层（路名、地名等）
 */

@interface TileLayerNormal()
@property (nonatomic, strong) FMDatabasePool *normalPool;
@end

@implementation TileLayerNormal

- (instancetype)init{
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        NSLog(@"%@",docDir);
        NSString *docDir0 = [docDir stringByAppendingString:@"/normalLayer.sqlitedb"];
        FMDatabasePool *normalPool = [FMDatabasePool databasePoolWithPath: docDir0];
        self.normalPool = normalPool;
    }
    return self;
}
-(UIImage *)tileForX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom{
    
    __block UIImage *normalImage = nil;
    [self.normalPool inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery: @"SELECT image FROM tiles WHERE z=? AND x=? AND y=?", [NSNumber numberWithUnsignedInteger: zoom],[NSNumber numberWithUnsignedInteger: x],[NSNumber numberWithUnsignedInteger: y]];
        if (YES == [result next]) {
            normalImage = [UIImage imageWithData:[result dataForColumnIndex:0]];
        }
        [result close];
    }];
    
    if (normalImage) {
        return normalImage;
    }
    
    NSString *url = [NSString stringWithFormat:@"http://mt2.google.cn/vt/lyrs=m&x=%lu&y=%lu&z=%lu", x, y, zoom];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *urlImage = [UIImage imageWithData:data];
    if (urlImage) {
        return urlImage;
    }
    return kGMSTileLayerNoTile;
}
@end

@implementation TileLayerSatellite
-(UIImage *)tileForX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom{
    NSString *url = [NSString stringWithFormat:@"http://mt2.google.cn/vt/lyrs=y&x=%lu&y=%lu&z=%lu", x, y, zoom];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *urlImage = [UIImage imageWithData:data];
    if (urlImage) {
        return urlImage;
    }
    return kGMSTileLayerNoTile;
}
@end
