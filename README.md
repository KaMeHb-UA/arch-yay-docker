Archlinux distribution with preinstalled yay that may be used directly from root. So you may simply write Dockerfiles like
```
FROM kamehb/archlinux-yay
RUN yay -Sy --noconfirm mjpg-streamer
```
