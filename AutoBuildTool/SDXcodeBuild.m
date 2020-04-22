//
//  SDXcodeBuild.m
//  AutoBuildTool
//
//  Created by 李志威 on 2020/4/22.
//  Copyright © 2020 li010. All rights reserved.
//

#import "SDXcodeBuild.h"
#import "SDProjectConfig.h"
#import "SDProjectPath.h"

@implementation SDXcodeBuild

+ (NSString *)SDXcodeBuildType:(SDXcodeBuildType)type{
    if (type == SDXcodeBuildType_Debug) {
        return  @"Debug";
    }else{
        return @"Release";
    }
}

+ (void)SDXcodeBuildProjectSetBuildType:(NSString*)buildType{
    
    // 删除项目之前build的文件夹
    [SDProjectPath deleteDerivedDataSubFolder];
    
    //切到项目目录
        NSString *cd = [NSString stringWithFormat:@"cd %@",SD_ProjectPath];
    
    // 1.清理工程
        NSString *clean = [NSString stringWithFormat:@"/usr/bin/xcodebuild -workspace %@.xcworkspace -scheme %@  clean",SD_ProjectName,SD_ProjectName];
    
    // 2.编译项目
        NSString *build = [NSString stringWithFormat:@"/usr/bin/xcodebuild -workspace %@.xcworkspace -scheme %@ -sdk iphoneos -configuration %@ build" ,SD_ProjectName,SD_ProjectName,buildType];
    
        NSString *shell1 = [NSString stringWithFormat:@"%@\n %@\n %@\n",cd,clean,build];
        system([shell1 cStringUsingEncoding:NSUTF8StringEncoding]);
    
    // 3.输出包
        NSString *run = [NSString stringWithFormat:@"/usr/bin/xcrun -sdk iphoneos PackageApplication -v %@",[[SDProjectPath shareProjectPath] projectXcodeBuildPath:buildType]];
    
    // 4.上传到蒲公英
        NSString *upload = [NSString stringWithFormat:@"curl -F file=@%@ -F uKey=%@ -F _api_key=%@ https://www.pgyer.com/apiv2/app/upload",[NSString stringWithFormat:@"%@/%@.ipa",SD_IPAPath,SD_ProjectName],SD_PgyerUserKey,SD_PgyerAPIKey];
  
    // 5.运行
        NSString *shell = [NSString stringWithFormat:@" %@\n %@\n",run,upload];
        system([shell cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
