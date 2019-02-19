FROM archlinux/base
RUN pacman -Syu --noconfirm
# installing yay
RUN pacman -S --noconfirm git binutils sudo go make gcc fakeroot awk
RUN git clone https://aur.archlinux.org/yay.git
RUN useradd builder -m
RUN passwd -d builder
RUN printf 'builder ALL=(ALL) ALL\n' | tee -a /etc/sudoers
RUN chmod 777 /yay
RUN su - builder -c "cd /yay && makepkg -s"
RUN pacman -U --noconfirm /yay/yay-*.pkg.tar*
