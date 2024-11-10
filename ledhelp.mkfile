yay -Sy gpiozero rpi-gpio
sudo chown $user:$user /dev/gpiochip0
sudo chown $user:$user /dev/gpiomem
sudo chown $user:$user /dev/mem


in 
/etc/udev/rules.d/pins.rules

SUBSYSTEM=="bcm2835-gpiomem", KERNEL=="gpiomem", GROUP="gpio", MODE="0660"
SUBSYSTEM=="gpio", KERNEL=="gpiochip*", ACTION=="add", PROGRAM="/bin/sh -c 'chown root:gpio /sys/class/gpio/export /sys/class/gpio/unexport ; chmod 220 /sys/class/gpio/export /sys/class/gpio/unexport'"
SUBSYSTEM=="gpio", KERNEL=="gpio*", ACTION=="add", PROGRAM="/bin/sh -c 'chown root:gpio /dev/mem /dev/gpiomem /dev/gpiochip0 /sys%p/active_low /sys%p/direction /sys%p/edge /sys%p/value ; chmod 660 /sys%p/active_low /sys%p/direction /sys%p/edge /sys%p/value'"

/usr/lib/udev/rules.d/99-spi-permissions.rules

SUBSYSTEM=="*gpiomem*", GROUP="gpio", MODE="0660"

SUBSYSTEM=="gpio", GROUP="gpio", MODE="0660"
SUBSYSTEM=="gpio*", PROGRAM="/bin/sh -c '\
chown -R root:gpio /sys/class/gpio && chmod -R 770 /sys/class/gpio; \
chown -R root:gpio /sys/devices/virtual/gpio && \
chmod -R 770 /sys/devices/virtual/gpio; \
chown -R root:gpio /sys$devpath && chmod -R 770 /sys$devpath \
