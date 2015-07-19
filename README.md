FBTimeObserver
================

Perform block after some time app beening in backgroung
```objective-c
[[FBUnactiveAppTimeObserver observer] registerObserver:self forTimeInterval:100 block:^{
    your code ...
}];
```

