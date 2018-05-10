import Adafruit_BBIO.GPIO as GPIO
import time

GPIO.setup("P2_1", GPIO.OUT)
GPIO.output("P2_1", GPIO.HIGH)
time.sleep(1)
GPIO.output("P2_1", GPIO.LOW)
time.sleep(1)
GPIO.output("P2_1", GPIO.HIGH)
time.sleep(1)
GPIO.output("P2_1", GPIO.LOW)
