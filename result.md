```
$ /usr/bin/time ./rpath.sh
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/libexec/sudo
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
0.81user 0.51system 0:00.41elapsed 320%CPU (0avgtext+0avgdata 4492maxresident)k
0inputs+0outputs (4major+224171minor)pagefaults 0swaps
```

```
$ /usr/bin/time deno run -A ./rpath.ts
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/libexec/sudo
/usr/lib/aarch64-linux-gnu/pulseaudio
/usr/lib/aarch64-linux-gnu/pulseaudio
0.60user 0.17system 0:00.38elapsed 201%CPU (0avgtext+0avgdata 82576maxresident)k
0inputs+0outputs (1major+76110minor)pagefaults 0swaps
```
