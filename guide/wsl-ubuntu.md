# Ubuntu-22.04 on WSL 環境構築
|項目|値|
|---|---|
|Distro Name|Ubuntu-Lammps|
|User Name|toko|
|Host Name|host|
~~~sh
PS C:\home> wsl --list --online
# > Ubuntu-22.40
PS C:\home> wsl --install --distribution Ubuntu-22.04 --web-download
# > Enter new UNIX username: toko
# > New password: ********
# > Retype new password: ********
toko@host:~$ exit
PS C:\home> wsl --list --verbose
# >   NAME          STATE    VERSION
# > * Ubuntu-22.04  Stopped  2
PS C:\home> wsl --export Ubuntu-22.04 C:\Linux\Ubuntu-22.04.tar
PS C:\home> wsl --unregister Ubuntu-22.04
PS C:\home> wsl --import Ubuntu-Lammps C:\Linux\lammps C:\Linux\ubuntu-22.04.tar
~~~
|項目|値|
|---|---|
|名前|Ubuntu-Lammps|
|コマンドライン|C:\WINDOWS\system32\wsl.exe -d Ubuntu-Lammps --user toko|
|開始ディレクトリ|~|

~~~sh
toko@host:~$ sudo apt update
toko@host:~$ sudo apt full-upgrade -y
toko@host:~$ sudo apt autoremove -y
toko@host:~$ exit
~~~
~~~sh
PS C:\home> wsl --shutdown
~~~
---
[戻る](../README.md)
