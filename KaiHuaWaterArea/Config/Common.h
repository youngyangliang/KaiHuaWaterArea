//
//  Common.h
//  KaiHuaWaterArea
//
//  Created by 杨亮 on 2018/3/16.
//  Copyright © 2018年 booway.com. All rights reserved.
//

#ifndef Common_h
#define Common_h


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA(r,g,b,a)            [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGB(r,g,b)               RGBA(r,g,b,1)

#endif /* Common_h */
