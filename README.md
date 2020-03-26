# HomeLede 版本说明
+ 基于Lede OpenWrt 及来自Lienol和若干自行维护的软件包（Feed）
+ 结合家庭x86软路由场景需要定制了软件包

对家庭路由高频功能进行了测试（x86软路由），保证可用。

## 家庭路由场景功能
+ 支持UPnP（支持EMule，BitComet，家庭摄像头，PS4，XBOX）
+ 支持CIFS文件共享协议，挂载NAS、Samba、Windows文件夹
+ 支持单线多拨
+ 支持多拨负载均衡
+ 支持DNS去广告 + 国内域名加速 + 去污染 + 最优访问速度筛选
+ 支持DDNS，可以通过域名随时获得家庭路由器IP
+ 支持SSH远程访问
+ 支持远程唤醒（WOL）
+ 支持定时唤醒（Time WOL）
+ 支持全功能Docker，可自由扩展功能（FQ）
+ 支持SSH远程访问
+ 支持SFTP，可通过常见SSH客户端随意传输文件
+ 安装OpenVMTools，优化在虚拟化环境运行速度
+ 支持Aria2，HTTP、磁力链、BT下载，挂载NAS后可远程下载至NAS
+ 支持百度网盘远程下载
+ 提供视觉效果较好的皮肤
+ 支持透明出国


感谢Lean（coolsnowwolf），Lienol，CTCGFW等等作者。

PS：去广告综合解决方案使用方法请见 https://www.cnblogs.com/zlAurora/p/12433266.html

==============================================================================

中文：如何编译自己需要的 OpenWrt 固件

注意：
1. **不**要用 **root** 用户 git 和编译！！！
2. 国内用户编译前最好准备好梯子
3. 默认登陆IP 192.168.1.1, 密码 password

编译前：
1. 首先装好 Ubuntu 64bit，推荐  Ubuntu 18 LTS x64
2. 至少30G空闲硬盘空间
3. 2G以上内存，建议4G

编译时:
1. 更新apt-get包信息，命令行输入
`sudo apt-get update`

2. 安装编译依赖包，命令行输入
`sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3.5 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib`

3. `git clone https://github.com/xiaoqingfengATGH/HomeLede.git homeLede`命令下载好源代码，然后 cd homeLede 进入目录

4.  `./prepareCompile.sh`

5. `make download v=s` 下载dl库（国内请尽量全局科学上网）,如果程序下载失败，也可以提取网址自行下载后放入dl文件夹，此文件夹通常不需要删除

6.  `make menuconfig` 

7. 最后选好你要的路由，输入 `make -j1 V=s` （-j1 后面是线程数。第一次编译推荐用单线程，国内请尽量全局科学上网）即可开始编译你要的固件了。

编译成功后，再次编译可以启动多线程编译。如4核心8线程i7上开启16线程使用`make -j16 V=sc`

本套代码保证肯定可以编译成功。里面包括了 R20 所有源代码，包括 IPK 的。

去广告订阅地址默认内置来自以下源，如有去广告的误杀漏杀问题可以到这里报告：

https://github.com/privacy-protection-tools/anti-AD