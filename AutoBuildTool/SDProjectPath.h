//
//  SDProjectPath.h
//  AutoBuildTool
//
//  Created by 李志威 on 2020/4/22.
//  Copyright © 2020 li010. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDProjectPath : NSObject

+ (instancetype)shareProjectPath;

//获取项目路径
- (NSString*)projectPath;

//获取IPA路径
- (NSString*)projectIPAPath;

//获取build路径
- (NSString*)projectXcodeBuildPath:(NSString*)type;

//删除DerivedData文件夹下所有文件
+ (void)deleteDerivedDataSubFolder;

@end

NS_ASSUME_NONNULL_END
