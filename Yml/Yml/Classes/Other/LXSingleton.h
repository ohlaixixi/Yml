#define LXSingleton_h(name)  + (instancetype)shared##name

#if __has_feature(objc_arc) // arc环境

#define LXSingleton_m(name) \
+ (instancetype)shared##name{ \
return [[self alloc]init]; \
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static id instance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
\
- (id)copyWithZone:(nullable NSZone *)zone {\
return self;\
}

#else // 非arc环境
#define LXSingleton_m(name) \
+ (instancetype)shared##name{ \
return [[self alloc]init]; \
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static id instance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
\
- (id)copyWithZone:(nullable NSZone *)zone {\
return self;\
}\
- (oneway void)release{}\
- (instancetype)autorelease{\
return nil;\
}\
-(instancetype)retain{\
return self;\
}\
-(NSUInteger)retainCount{\
return 1;\
}

#endif

