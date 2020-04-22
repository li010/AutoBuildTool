//
//  main.m
//  AutoBuildTool
//
//  Created by 李志威 on 2020/4/22.
//  Copyright © 2020 li010. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDXcodeBuild.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        [SDXcodeBuild SDXcodeBuildProjectSetBuildType:[SDXcodeBuild SDXcodeBuildType:SDXcodeBuildType_Release]];
    }
    return 0;
}
