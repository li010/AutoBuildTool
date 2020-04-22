# AutoBuildTool
##无侵入式iOS自动化构建
###使用说明
1.需要提前配置好项目所需证书和描述文件,手动/自动皆可;
2.clone项目到本地,按照步骤进行**项目配置**和**Xcode配置**,直接`command R`;等待结束后,会在指定目录生成IPA包,并自动上传到配置好的蒲公英;
###项目配置
1. 编译模式
     支持debug和release两种模式
     ```
    //支持的编译模式
    typedef enum{
    SDXcodeBuildType_Debug,
    SDXcodeBuildType_Release
}SDXcodeBuildType;
    ```
    ```
    //在main函数设置编译模式
     [SDXcodeBuild SDXcodeBuildProjectSetBuildType:[SDXcodeBuild SDXcodeBuildType:SDXcodeBuildType_Release]];
    ```
2. 项目配置
    ```
    //项目路径
    #define SD_ProjectPath @"/Users/项目路径"
    
    //项目名称
    #define SD_ProjectName @"项目名称"
    
    //输出包路径
    #define SD_IPAPath @"输出包路径"
    
    //蒲公英_app_key
    #define SD_PgyerUserKey @"11"
    //蒲公英user_Key
    #define SD_PgyerAPIKey @"22"
    ```


###Xcode配置
因为Xcode从8.3版本废弃了**PackageApplication**,所以要先把**PackageApplication**文件导入到Xcode目录
    1.导入路径
    >/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/
    
2.**PackageApplication**
    >**PackageApplication**资源在clone的工程Resource目录下
    
3.终端执行两个命令
        `sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer/`
        输入密码回车
`chmod +x /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/PackageApplication`
直接回车,至此项目配置完成
