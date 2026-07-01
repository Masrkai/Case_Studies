# WARNING

This is intended for delting the crap the modern society is pushing on us which is UNACCEPTABLE,
I have no regret breaking my phone in the process of finding if I truly need a software specially if it will help future me or anyone else to know how the hell these things are legal


## how to delete something !

enable USB debugging so we can use `ADB` android debug shell you can run it as follows

```bash
adb shell
```

don't panic that your terminal is gone, remember you are running a shell, a shell would take over your terminal this is normal

```bash
pm uninstall -k --user 0 <package>
```

now the package names will be in text files