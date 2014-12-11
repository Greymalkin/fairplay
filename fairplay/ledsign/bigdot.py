import serial

PREAMBLE = chr(0) * 5 + chr(1) + 'Z00' + chr(2)
# 5xNUL + SOH = Start of message
# Z = For all signs
# 00 = At all addresses
# STX = start message

CONFIG = PREAMBLE + 'E$AAU0100FF00'
# E = process a command
# $ = Command type: $ = Write config table command
# A = Type of file for this directory slot: A = Text file
# A = Label for the file (think of it as the file name)
# U = Keyboard Lock/Unlock flag: U = unlocked (accessable by keyboard)
# 0100 = number of bytes for the file: 0100 = 256 bytes (100 hex)
# FF = Start time: FF = On Always
# 00 = stop time: 00 = unused because of the FF in prior section

EOT = chr(4)
MODE = chr(27) + ' '

CODES = {
    'COLOR_RED': chr(28) + '1',
    'COLOR_GREEN': chr(28) + '2',
    'COLOR_YELLOW': chr(28) + '3',
    'SPEED_1': chr(21),
    'SPEED_2': chr(22),
    'SPEED_3': chr(23),
    'SPEED_4': chr(24),
    'SPEED_5': chr(25),
    'NEW_PAGE': chr(12),
    'NEW_LINE': chr(13),
    'FLASH_OFF': chr(7) + '0',
    'FLASH_ON': chr(7) + '1',
    'WIDE_ON': chr(29) + '11',
    'WIDE_OFF': chr(29) + '10',
    'MODE_ROTATE': MODE + 'a',
    'MODE_HOLD': MODE + 'b',
    'MODE_FLASH': MODE + 'c',
    'MODE_ROLL_UP': MODE + 'e',
    'MODE_ROLL_DOWN': MODE + 'f',
    'MODE_ROLL_LEFT': MODE + 'g',
    'MODE_ROLL_RIGHT': MODE + 'h',
    'MODE_WIPE_UP': MODE + 'i',
    'MODE_WIPE_DOWN': MODE + 'j',
    'MODE_WIPE_RIGHT': MODE + 'k',
    'MODE_SCROLL': MODE + 'l',
    'MODE_AUTO_MODE': MODE + 'm',
    'MODE_ROLL_IN': MODE + 'o',
    'MODE_ROLL_OUT': MODE + 'p',
    'MODE_WIPE_IN': MODE + 'r',
    'MODE_WIPE_OUT': MODE + 's',
    'MODE_TWINKLE': MODE + 'n0',
    'MODE_SPARKLE': MODE + 'n1',
    'MODE_SNOW': MODE + 'n2',
    'MODE_INTERLOCK': MODE + 'n3',
    'MODE_SWITCH': MODE + 'n4',
    'SPECIAL_SLIDE': MODE + 'n5',
    'SPECIAL_SPRAY': MODE + 'n6',
    'SPECIAL_STARBURST': MODE + 'n7',
    'GRAPHICS_WELCOME': MODE + 'n8',
    'GRAPHICS_SLOT_MACHINE': MODE + 'n9',
    'GRAPHICS_THANK_YOU': MODE + 'nS',
    'GRAPHICS_NO_SMOKING': MODE + 'nU',
    'GRAPHICS_DRINK_DRIVE': MODE + 'nV',
    'GRAPHICS_ANIMAL': MODE + 'nW',
    'GRAPHICS_FIREWORKS': MODE + 'nX',
    'GRAPHICS_CAR': MODE + 'nY',
    'GRAPHICS_BOMB': MODE + 'nZ',
}


class BigDot():
    def __init__(self, device):
        self.serial = serial.Serial(device, 9600)
        self.serial.write(bytearray(CONFIG + EOT, 'ascii'))

    def show_message(self, message):
        if message[0] in CODES:
            data = ''.join([CODES[x] if x in CODES else x for x in message])
            self.serial.write(bytearray(PREAMBLE + 'AA' + data + EOT, 'ascii'))
