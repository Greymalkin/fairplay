import socket

NUL = chr(0)
SOH = chr(1)
STX = chr(2)
EOT = chr(4)
MODE = chr(27) + ' '
PREAMBLE = NUL * 5 + SOH + 'Z'
# 5xNUL = Auto-baud detection
# SOH = Start of message
# Z = For all sign types

CODES = {
    '|COLOR_RED|': chr(28) + '1',
    '|COLOR_GREEN|': chr(28) + '2',
    '|COLOR_AMBER|': chr(28) + '3',
    '|COLOR_DIM_RED|': chr(28) + '4',
    '|COLOR_DIM_GREEN|': chr(28) + '5',
    '|COLOR_BROWN|': chr(28) + '6',
    '|COLOR_ORANGE|': chr(28) + '7',
    '|COLOR_YELLOW|': chr(28) + '8',
    '|COLOR_RAINBOW1|': chr(28) + '9',
    '|COLOR_RAINBOW2|': chr(28) + 'A',
    '|COLOR_MIX|': chr(28) + 'B',
    '|COLOR_AUTO|': chr(28) + 'C',

    '|SPEED_1|': chr(21),
    '|SPEED_2|': chr(22),
    '|SPEED_3|': chr(23),
    '|SPEED_4|': chr(24),
    '|SPEED_5|': chr(25),

    '|NEW_PAGE|': chr(12),
    '|NEW_LINE|': chr(13),

    '|FLASH_OFF|': chr(7) + '0',
    '|FLASH_ON|': chr(7) + '1',

    '|WIDE_ON|': chr(29) + '11',
    '|WIDE_OFF|': chr(29) + '10',

    '|MODE_ROTATE|': MODE + 'a',
    '|MODE_HOLD|': MODE + 'b',
    '|MODE_FLASH|': MODE + 'c',
    '|MODE_ROLL_UP|': MODE + 'e',
    '|MODE_ROLL_DOWN|': MODE + 'f',
    '|MODE_ROLL_LEFT|': MODE + 'g',
    '|MODE_ROLL_RIGHT|': MODE + 'h',
    '|MODE_WIPE_UP|': MODE + 'i',
    '|MODE_WIPE_DOWN|': MODE + 'j',
    '|MODE_WIPE_RIGHT|': MODE + 'k',
    '|MODE_SCROLL|': MODE + 'l',
    '|MODE_AUTO_MODE|': MODE + 'm',
    '|MODE_ROLL_IN|': MODE + 'o',
    '|MODE_ROLL_OUT|': MODE + 'p',
    '|MODE_WIPE_IN|': MODE + 'r',
    '|MODE_WIPE_OUT|': MODE + 's',
    '|MODE_TWINKLE|': MODE + 'n0',
    '|MODE_SPARKLE|': MODE + 'n1',
    '|MODE_SNOW|': MODE + 'n2',
    '|MODE_INTERLOCK|': MODE + 'n3',
    '|MODE_SWITCH|': MODE + 'n4',

    '|SPECIAL_SLIDE|': MODE + 'n5',
    '|SPECIAL_SPRAY|': MODE + 'n6',
    '|SPECIAL_STARBURST|': MODE + 'n7',
    '|GRAPHICS_WELCOME|': MODE + 'n8',
    '|GRAPHICS_SLOT_MACHINE|': MODE + 'n9',
    '|GRAPHICS_THANK_YOU|': MODE + 'nS',
    '|GRAPHICS_NO_SMOKING|': MODE + 'nU',
    '|GRAPHICS_DRINK_DRIVE|': MODE + 'nV',
    '|GRAPHICS_ANIMAL|': MODE + 'nW',
    '|GRAPHICS_FIREWORKS|': MODE + 'nX',
    '|GRAPHICS_CAR|': MODE + 'nY',
    '|GRAPHICS_BOMB|': MODE + 'nZ',
}


class BigDotUDP():
    def __init__(self, host, port):
        self.host = host
        self.port = port

    def set_address(self, address):
        hex_address = '{:02x}'.format(address).upper()
        message = PREAMBLE + '00' + STX + 'E7' + hex_address + EOT
        message_bytes = bytearray(message, 'ASCII')
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.sendto(message_bytes, (self.host, self.port))

        self.show_message(address, "SIGN ADDRESS #{}".format(address))

    def show_message(self, address, message):
        hex_address = '{:02x}'.format(address).upper()

        for key, value in CODES.items():
            message = message.replace(key, value)

        # if not specified, use standard rotate mode
        if message[0:2] != MODE:
            message = CODES['|MODE_ROTATE|'] + message

        message = PREAMBLE + hex_address + STX + 'AA' + message + EOT
        message_bytes = bytearray(message, 'ASCII')
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.sendto(message_bytes, (self.host, self.port))
