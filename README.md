# Lammps: WSL-Ubuntu22.04, Apptainer, GPU
Lammps を手軽に使いたいので、コンテナ化
* WSL-Ubuntu22.04
* Intel Core i5-10400F (Comet Lake 6 cores, 12 threads)
* NVIDIA GeForce RTX 3060 (Ampere 3584 cores, VRAM 12GB)

## 環境構築
* [Ubuntu-22.04 on WSL 環境構築](guide/wsl-ubuntu.md)
* Apptainer + Nvidia Container Toolkit

|項目|値|
|---|---|
|Host Name|host|
|User Name|toko|

### Apptainer + Nvidia Container Toolkit
https://apptainer.org/docs/admin/main/installation.html
#### nvidia-container-toolkit インストール
https://apptainer.org/docs/user/main/gpu.html<br>
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
~~~sh
toko@host:~$ curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
toko@host:~$ sudo apt update
toko@host:~$ sudo apt install -y nvidia-container-toolkit
~~~
#### Apptainer インストール
~~~sh
toko@host:~$ sudo add-apt-repository -y ppa:apptainer/ppa
toko@host:~$ sudo apt update
toko@host:~$ sudo apt install -y apptainer
~~~
##### 確認
~~~sh
toko@host:~/sif$ apptainer pull docker://tensorflow/tensorflow:latest-gpu
toko@host:~/sif$ apptainer run --nv --nvccli tensorflow_latest-gpu.sif
Apptainer> python
>>> from tensorflow.python.client import device_lib
>>> print(device_lib.list_local_devices())
# なにかしらの GPU の情報が表示されれば OK らしい？ 
>>> exit()
Apptainer> exit
~~~
## Lammps
### lammps-gpu.sif ファイル作成
~~~sh
toko@host:~/sif $ sudo apptainer build lammps-gpu.sif lammps-gpu.def
~~~
def ファイル記述のガイド:
https://apptainer.org/docs/user/main/definition_files.html
### 実行
~~~sh
toko@host:~/data/build_test $ apptainer exec --nv ~/sif/lammps-gpu.sif bash run.sh 
~~~
---
