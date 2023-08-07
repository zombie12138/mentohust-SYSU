# SYSU东校区特供锐捷认证

原作者[项目](https://github.com/ivechan/mentohust-SYSU)在[hyrathb大侠](https://github.com/hyrathb/mentohust)的基础修改, 但是

请遵守GPL3.0协议

由于东校区从H3C认证改为锐捷认证, 并且和7年前深圳的认证有很多不同, 尤其是START和CHALLENGE包后面部分改动很大...但是源代码意外能用...问题最大的是心跳包文(20s)改成了用户名请求(30s), 造成之前的代码总认为用户名请求超时.

## 使用

参考[Guide](https://github.com/KumaTea/MentoHUST-SYSU-Guide)

一定要认证后dhcp, 使用命令为

``` bash
./mentohust -uusername -ppassword -neth0 -b3  -d2 -w
```

因为线路故障可能会导致程序关闭, 我是配合[脚本](script/check_and_restart.sh)使用的
