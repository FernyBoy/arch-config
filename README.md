# Arch Linux – Personal System Configuration

Este repositorio documenta y automatiza la instalación y configuración de **mi sistema personal Arch Linux**.

No está diseñado para ser genérico, seguro para terceros ni “plug and play”.
Asume familiaridad con Arch Linux, GNU/Linux, systemd, UEFI y administración manual del sistema.

El objetivo principal es la **reproducibilidad completa** de mi entorno.

---

## Alcance del repositorio

Este repositorio cubre:

- Instalación manual del sistema base Arch Linux
- Configuración del cargador de arranque (GRUB)
- Instalación de paquetes base y AUR
- Configuración del entorno gráfico (Qtile)
- Terminal, shell y utilidades
- Audio, compositor, display manager y temas
- Automatización mediante scripts modulares

No cubre:

- Soporte para hardware genérico
- Manejo de errores para sistemas ajenos
- Instalaciones parciales o personalizadas
- Uso como tutorial para principiantes

---

## Proceso de instalación del sistema

La instalación se divide en **dos fases claramente separadas**:

1. Instalación manual del sistema base Arch Linux
2. Configuración automatizada del entorno personal

---

## Fase 1: Instalación del sistema base (Arch Linux)

La instalación del sistema base **no está automatizada por diseño**.
Se considera parte del control explícito del sistema.

### Supuestos

- Sistema UEFI
- Instalación limpia
- Acceso a red durante todo el proceso
- Posible dual boot
- Control total del entorno

### 1. Configuración inicial (ISO)
Para cargar tu distribución de teclado (Por defecto es **us**)
```bash
loadkeys us
# o
loadkeys la-latin1
```

Para incrementar el tamaño de la fuente en la terminal
```
setfont ter-124n
```

### 2. Conexión a red

```bash
iwctl
device list
station <DISPOSITIVO> scan
station <DISPOSITIVO> get-networks
station <DISPOSITIVO> connect <SSID>
exit
```

#### Conexión a red privada
Crear el archivo **main.conf** en **/etc/iwd** con los datos:
```
[General]
EnableNetworkConfiguration=true
```

Crear el archivo **<NOMBRE_RED>.<TIPO_SEGURIDAD>** en **/var/lib/iwd** (por ejemplo UniSon.8021x) con los datos:
```
[Security]
EAP-Method=<Metodo> (PEAP)
EAP-Identity=<USUARIO>
EAP-Password=<CLAVE>
CACert=/etc/ssl/certs/ca-certificates.crt
EAP-PEAP-Phase2-Method=<Metodo> (MSCHAPV2)

[Settings]
AutoConnect=true
```

### 3. Sincronización de reloj

```bash
timedatectl set-ntp true
```

### 4. Particionado y montaje

```bash
lsblk
mkfs.ext4 /dev/<PARTICION_RAIZ>
mkswap /dev/<PARTICION_SWAP>
swapon /dev/<PARTICION_SWAP>
mount /dev/<PARTICION_RAIZ> /mnt
mount --mkdir /dev/<PARTICION_EFI> /mnt/boot/efi
```

### 5. Instalación del sistema base

```bash
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

### 6. Configuración básica del sistema

```bash
ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime
hwclock --systohc
pacman -S nvim
```

Editar locales en /etc/locale.gen:

```
en_US.UTF-8 UTF-8
```

```bash
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=us" > /etc/vconsole.conf
```

Hostname:

```bash
echo "<HOSTNAME>" > /etc/hostname
```

Editar hosts en /etc/hosts:

```
127.0.0.1   localhost
::1         localhost
127.0.1.1   <PC_NAME>.localhost <PC_NAME>
```

### 7. Red

```bash
pacman -S networkmanager
systemctl enable NetworkManager
passwd
```

### 8. GRUB

```bash
pacman -S grub efibootmgr os-prober
grub-install /dev/<DISCO_RAIZ>
pacman -S os-prober
```

Editar grub para habilitar otros sistemas en /etc/default/grub:
```
GRUB_DISABLE_OS_PROBER=false
```

```bash
grub-mkconfig -o /boot/grub/grub.cfg
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
```

### 9. Usuario

```bash
useradd -m <USUARIO>
passwd <USUARIO>
usermod -aG wheel,audio,video,storage <USUARIO>
pacman -S sudo
```

Editar el archivo sudoers en /etc/sudoers:
```
%wheel ALL=(ALL) ALL
```

### 10. Finalización

```bash
exit
umount -R /mnt
shutdown now
```

---

## Fase 2: Configuración automatizada del entorno

```bash
git clone https://github.com/FernyBoy/arch-config.git
cd arch-config
./YayInstaller/yayInstaller.sh
sudo ./AutoInstaller.sh
```

---

## Notas finales
- Al inicio de sddm, debes cambiar de Qtile(Wayland) a Qtile
- Puedes cambiar el orden de los sistemas en **/boot/grub/grub.cfg**
