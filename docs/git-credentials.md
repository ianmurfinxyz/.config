# Managing git credentials

On Linux can use libsecret to manage credentials:

https://wiki.archlinux.org/title/GNOME/Keyring

and can use 'seahorse' as a gui front end to it.

git can be configured to use an external credential helper via the command:

```
$ git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
```

this example sets lib secret as the credential helper.

Hence install the 'libsecret' and the 'seahorse' arch packages and then set 
lib secret as the credential helper.

That should then just work the next time you attempt to push to a remote.

More information on git credentials can be found on the git docs,

```
https://git-scm.com/docs/gitcredentials
```
