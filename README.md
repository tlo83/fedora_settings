## DNF
```
max_parallel_downloads=20
```

## Citrix & MS Teams
[Citrix Workspace Download](https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html)

Fix for MS Teams and HDXAudio:
```
sudo dnf install libcxx-devel llvm-libunwind
ln -s /lib64/libunwind.so.8 /lib64/libunwind.so.1
```

Citrix Pulseaudio workaround
```
sudo bash -c 'cat <<EOF > /usr/bin/pulseaudio
echo "A fake pulseaudio bin just to make Citrix happy!"
EOF'
sudo chmod +x /usr/bin/pulseaudio
```
