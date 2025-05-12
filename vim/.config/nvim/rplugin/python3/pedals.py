import pynvim
import threading
import time
from evdev import InputDevice, categorize, ecodes, list_devices
import time
import logging

logging.basicConfig(level=logging.WARN)

def find_joystick():
    while True:
        devices = [InputDevice(path) for path in list_devices()]
        for device in devices:
            if 'Leonardo' in device.name:
                logging.warning(f"Found device: {device.name}")
                return device
        logging.warning("Waiting for joystick...")
        time.sleep(1)


@pynvim.plugin
class PedalsPlugin(object):
    last_mode = None
    axis1 = 1.0
    joystick = None
    dummy = False

    def insert_mode(self):
        self.nvim.command('stopinsert')
        self.nvim.command('startinsert')

    def replace_mode(self):
        self.nvim.command('stopinsert')
        self.nvim.command('startreplace')

    def normal_mode(self):
        self.nvim.command('stopinsert')

    def switch_mode(self, mode):
        if self.last_mode == mode:
            return
        self.last_mode = mode
        logging.warning(f"new mode {mode}")
        if not self.nvim:
            return
        if mode == 'insert':
            self.nvim.async_call(self.insert_mode)
        elif mode == 'replace':
            self.nvim.async_call(self.replace_mode)
        elif mode == 'normal':
            self.nvim.async_call(self.normal_mode)

    def joystick_loop(self):
        while True:
            try:
                if not self.joystick:
                    self.joystick = find_joystick()
                for event in self.joystick.read_loop():
                    if event.type == ecodes.EV_ABS and event.code == ecodes.ABS_Y:
                        self.axis1 = event.value / 1000.0

                    if self.axis1 < 0.2:
                        self.switch_mode('replace')
                    elif self.axis1 < 0.7:
                        self.switch_mode('insert')
                    else:
                        self.switch_mode('normal')
            except Exception as e:
                self.joystick = None
                logging.exception("Exception occurred in thread")

    def __init__(self, nvim):
        self.nvim = nvim
        thread = threading.Thread(target=self.joystick_loop, daemon=True)
        thread.start()

    @pynvim.command('PedalsShowAxis', nargs='*', range='')
    def pedals_show_axis(self, args, range):
        self.nvim.current.line = (f"Axis 1: {self.axis1:.3f}")

    @pynvim.autocmd('BufEnter', pattern='*.*', eval='expand("<afile>")', sync=True)
    def on_bufenter(self, filename):
        pass

if __name__ == '__main__':
    p = PedalsPlugin(None)
    input()
