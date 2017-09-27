//
//  Macros.h
//  QuickBooks
//
//  Created by xi on 16/6/28.
//  Copyright © 2016年 xi. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#import "UtilsMacros.h"

#ifdef DEBUG
#define MLog(...) MLog(__VA_ARGS__)
#else
#define MLog(...)
#endif

#define MLogFunc QBLog(@"%s", __func__)

#define GLOBAL_COLOR RGB(255, 53, 93)
#define GLOBAL_BACKGROUND_COLOR RGB(248, 248, 248)

#endif /* Macros_h */
