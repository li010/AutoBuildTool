//
//  SDXcodeBuild.h
//  AutoBuildTool
//
//  Created by 李志威 on 2020/4/22.
//  Copyright © 2020 li010. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    SDXcodeBuildType_Debug,
    SDXcodeBuildType_Release
}SDXcodeBuildType;

NS_ASSUME_NONNULL_BEGIN

@interface SDXcodeBuild : NSObject

+ (NSString *)SDXcodeBuildType:(SDXcodeBuildType)type;
+ (void)SDXcodeBuildProjectSetBuildType:(NSString*)buildType;

@end

NS_ASSUME_NONNULL_END
