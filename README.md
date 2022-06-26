# mdpp

Search .mobileprovision file from '~/Library/MobileDevice/Provisioning Profiles/' directory

## Requirements

- macOS
- Swift 5

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
    mdpp expired [ --path | --json ]
    mdpp help
    mdpp list [ --path | --json ]
    mdpp open
    mdpp search [ profile name | keyword ] [ --path | --json ]
    mdpp version

COMMANDS:
    cleanup   Move or delete, expired profiles or old profiles.
    expired   List the expired profiles.
    help      Display help.
    list      List the installed profiles.
    open      Open '~/Library/MobileDevice/Provisioning Profiles/' directory
    search    List search results from profile name or keywords.
    version   Display version.

OPTIONS:
    --delete    cleanup --delete : Delete. (Default)
    --move      cleanup --move   : Move to temp folder. ex. ~/Desktop/Expired-Profiles-YYYYMMdd-HHmmss/
    --path      expired --path   : Output only file path
                list --path      : Output only file path
                search [ keyword ] --path : Output only file path
    --json      expired --json   : Output JSON format
                list --json      : Output JSON format
                search [ keyword ] --json : Output JSON format
```

## Example

For example, set the current date and time to 2020/10/06

```
keygx@Mac:~$ mdpp list
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2021-08-08 05:01:36 +0000
ModifiedDate:   2020-08-27 13:26:28 +0000

-------------------------------
ProfileName:    Bar
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
ExpirationDate: 2021-07-12 09:17:07 +0000
ModifiedDate:   2020-07-12 09:35:34 +0000

-------------------------------
ProfileName:    Baz
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbaz.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbaz.mobileprovision
ExpirationDate: 2021-10-02 04:54:15 +0000
ModifiedDate:   2020-10-02 06:48:57 +0000

==> count: 3


```

```
keygx@Mac:~$ mdpp search Foo
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2021-08-08 05:01:36 +0000
ModifiedDate:   2020-08-27 13:26:28 +0000

==> count: 1


```

```
keygx@Mac:~$ mdpp expired
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2020-08-08 05:01:36 +0000
ModifiedDate:   2019-08-27 13:26:28 +0000

-------------------------------
ProfileName:    Bar
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
ExpirationDate: 2020-07-12 09:17:07 +0000
ModifiedDate:   2019-07-12 09:35:34 +0000

==> count: 2


```

```
keygx@Mac:~$ mdpp cleanup
-------------------------------
ProfileName:    Foo
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
ExpirationDate: 2020-08-08 05:01:36 +0000
ModifiedDate:   2019-08-27 13:26:28 +0000

-------------------------------
ProfileName:    Bar
FileName:       xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
FilePath:       /Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision
ExpirationDate: 2020-07-12 09:17:07 +0000
ModifiedDate:   2019-07-12 09:35:34 +0000

==> count: 2


```

For '--json' output option.

```
keygx@Mac:~$ mdpp list --json
{"provisions":[{"modified":"2020-08-27T13:26:28+0000","profileName":"Foo","fileName":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision","expiration":"2021-08-08T05:01:36+0000","filePath":"\/Users\/keygx\/Library\/MobileDevice\/Provisioning Profiles\/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision"},{"modified":"2016-07-12T09:35:34+0000","profileName":"Bar","fileName":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision","expiration": "2017-07-12T09:17:07+0000","filePath":"\/Users\/keygx\/Library\/MobileDevice\/Provisioning Profiles\/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision"}]}

```

For '--path' output option.

```
keygx@Mac:~$ mdpp list --path
/Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxfoo.mobileprovision
/Users/keygx/Library/MobileDevice/Provisioning Profiles/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxbar.mobileprovision

```

## License

mdpp is released under the MIT license. See LICENSE for details.

## Author

Yukihiko Kagiyama (keygx) <https://twitter.com/keygx>
