# Bibliotheken laden
from gpiozero import LED
from time import sleep

# Initialisierung von GPIO17 als LED (Ausgang)
led = LED(17)

# Wiederholung einleiten
while True:
    # LED einschalten
    led.on()
    # 0,17 Sekunden warten
    sleep(0.17)
    # LED ausschalten
    led.off()
    # 1 Sekunde warten
    sleep(1)
