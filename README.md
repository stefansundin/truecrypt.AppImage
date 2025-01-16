AppImage of TrueCrypt 7.1a, using binary from [truecrypt.deb](https://github.com/stefansundin/truecrypt.deb) and libraries from Ubuntu.

To build, run:

```shell
./download.sh
./build.sh
```

Remember to clean the `dependencies` and `truecrypt.AppDir` directories after you update `dependencies.txt`:

```shell
git clean -fdX dependencies truecrypt.AppDir
```

## Known issues

- You have to run the AppImage with `sudo`.
- The first time you try to mount something, it fails with a `Failed to set up a loop device` error, after a long wait. Try again and it will work.
