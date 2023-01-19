### Flutter build commands

#### flutter build apk

Generates a fat apk in release mode.
Release build usually takes longer as it has to
build resources in an optimized way.

This apk contains code for all CPU abi/arch.
For example its size is : 30 mb

```bash
flutter build apk
```

### Splitted apks

Creates multiple(three) apk files instead of one big/fat apk file. The size of splitted is smaller than the fat apk.
The size of each splitted apk is : 19.8 mb


```
flutter build apk --split-per-abi

```



### AppBundle
Required app format to upload in the play store. 

It is designed by Google in a way that it decreses the download size for users. 



```
flutter build appbundle
```