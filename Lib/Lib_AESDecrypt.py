import base64
from Crypto.Cipher import AES


def decrypt(key, iv, data):
    def unpad(s): return s[:-ord(s[len(s)-1:])]

    enc = base64.b64decode(data)
    deIV = base64.b64decode(iv)
    deKey = base64.b64decode(key)
    cipher = AES.new(deKey, AES.MODE_CBC, deIV)
    return unpad(cipher.decrypt(enc)).decode('utf8')
