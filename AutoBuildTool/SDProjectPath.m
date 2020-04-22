//
//  SDProjectPath.m
//  AutoBuildTool
//
//  Created by 李志威 on 2020/4/22.
//  Copyright © 2020 li010. All rights reserved.
//

#import "SDProjectPath.h"
#import "SDProjectConfig.h"

@implementation SDProjectPath

+ (instancetype)shareProjectPath{
    static SDProjectPath *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        path = [[SDProjectPath alloc]init];
    });
    return path;
}

- (NSString*)projectPath{
    return SD_ProjectPath;
}

- (NSString*)projectIPAPath{
    return SD_IPAPath;
}

- (NSString*)projectXcodeBuildPath:(NSString*)type{
        NSString *path ;
    
        NSArray *fileArr = [SDProjectPath getUserXcodeBuildPath];
        for (NSString *filePath in fileArr) {
            if ([filePath rangeOfString:[NSString stringWithFormat:@"%@",SD_ProjectName]].location != NSNotFound) {
                path  = [[SDProjectPath getUserXcodeDerivedDataPath] stringByAppendingString:[NSString stringWithFormat:@"/%@/Build/Products/%@-iphoneos/%@.app -o %@/%@.ipa",filePath,type,SD_ProjectName,SD_IPAPath,SD_ProjectName]];
                NSLog(@"%@---",path);
                return path;
            }
        }
    return path;
}


//删除DerivedData文件夹下所有文件
+ (void)deleteDerivedDataSubFolder{
    NSArray *fileArr = [SDProjectPath getUserXcodeBuildPath];
    
        for (NSString *filePath in fileArr) {
            if ([filePath rangeOfString:[NSString stringWithFormat:@"%@",SD_ProjectName]].location != NSNotFound) {
                NSString *path  = [[SDProjectPath getUserXcodeDerivedDataPath] stringByAppendingPathComponent:filePath];
                NSString *shell = [NSString stringWithFormat:@"rm -rf %@",path];
                system([shell cStringUsingEncoding:NSUTF8StringEncoding]);
            }
        }
}

+ (NSArray*)getUserXcodeBuildPath{
    NSArray *fileArr = [NSArray array];
    NSFileManager * fm = [NSFileManager defaultManager];
    fileArr = [fm contentsOfDirectoryAtPath:[SDProjectPath getUserXcodeDerivedDataPath] error:nil];
    return fileArr;
}

+ (NSString*)getUserXcodeDerivedDataPath{
    NSString *filePath = @"";
    NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    NSArray *cepationArr = [bundlePath componentsSeparatedByString:@"DerivedData"];
    if (cepationArr.count != 0) {
        filePath = [[cepationArr firstObject] stringByAppendingString:@"DerivedData"];
        [SDProjectPath certificatePathIn:filePath];
    }
    return filePath;
}


+ (void)certificatePathIn:(NSString *)projectPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:projectPath], @"无效的地址");
}

@end
