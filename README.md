# mdpp

Search .mobileprovision file from '~/Library/MobileDevice/Provisioning Profiles/' directory

## Requirements
- macOS
- Swift 4.0

## Install

```
$ git clone https://github.com/keygx/mdpp-cli-swift.git
$ cd mdpp-cli-swift
$ make install
```
```
$ mdpp help
```

## Uninstall

```
$ make uninstall
```

## Usage

```
USAGE:
    mdpp commands [options] [arguments...]
    
EXAMPLE:
    mdpp cleanup [ --delete | --move ]
    mdpp expired
    mdpp help
    mdpp list
    mdpp search [ profile name | keyword ]
    mdpp version
    
COMMANDS:
    cleanup   Move or delete, expired profiles or old profiles.
    expired   List the expired profiles.
    help      Display help.
    list      List the installed profiles.
    search    List search results from profile name or keywords.
    version   Display version.
    
OPTIONS:
    --delete    cleanup --delete : Delete. (Default)
    --move      cleanup --move   : Move to temp folder. ex. ~/Desktop/Expired-Profiles-YYYYMMdd-HHmmss/
```

## Example

For example, set the current date and time to 2017/10/06

```
keygx@Mac:~$ mdpp list
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2017-08-08 05:01:36 +0000
ModifiedDate:   2017-07-27 13:26:28 +0000

-------------------------------
ProfileName:    Bar
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
ExpirationDate: 2017-07-12 09:17:07 +0000
ModifiedDate:   2016-07-12 09:35:34 +0000

-------------------------------
ProfileName:    Baz
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbaz.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbaz.mobileprovision
ExpirationDate: 2018-10-02 04:54:15 +0000
ModifiedDate:   2017-10-02 06:48:57 +0000

==> count: 3


```
```
keygx@Mac:~$ mdpp search Foo
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2017-08-08 05:01:36 +0000
ModifiedDate:   2017-07-27 13:26:28 +0000

==> count: 1


```
```
keygx@Mac:~$ mdpp expired
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2017-08-08 05:01:36 +0000
ModifiedDate:   2017-07-27 13:26:28 +0000

-------------------------------
ProfileName:    Bar
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
ExpirationDate: 2017-07-12 09:17:07 +0000
ModifiedDate:   2016-07-12 09:35:34 +0000

==> count: 2


```
```
keygx@Mac:~$ mdpp cleanup
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2017-08-08 05:01:36 +0000
ModifiedDate:   2017-07-27 13:26:28 +0000

-------------------------------
ProfileName:    Bar
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
ExpirationDate: 2017-07-12 09:17:07 +0000
ModifiedDate:   2016-07-12 09:35:34 +0000

==> count: 2


```

## License

mdpp is released under the MIT license. See LICENSE for details.

## Author

Yukihiko Kagiyama (keygx) <https://twitter.com/keygx>
