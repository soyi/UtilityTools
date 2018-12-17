//
//  AutoCoding.h
//
//  Version 2.2.3
//
//  Created by Nick Lockwood on 19/11/2011.
//  Copyright (c) 2011 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/AutoCoding
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AutoCoding) <NSSecureCoding>

+ (NSDictionary<NSString *, Class> *)codableProperties;
- (void)setWithCoder:(NSCoder *)aDecoder;
- (void)doEncodeWithCoder:(NSCoder *)aCoder;

@property (nonatomic, readonly) NSDictionary<NSString *, Class> *codableProperties;
@property (nonatomic, readonly) NSDictionary<NSString *, id> *dictionaryRepresentation;

+ (nullable instancetype)objectWithContentsOfFile:(NSString *)path;
- (BOOL)writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile;

@end

/**
 归档的实现
 1.遵循 <NSCopying>
 2.在 @implementation 后添加 QMAutoCodingImplementation
 */
#define AutoCodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self setWithCoder:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self doEncodeWithCoder:encoder]; \
}

#define QMAutoCodingImplementation AutoCodingImplementation

NS_ASSUME_NONNULL_END
