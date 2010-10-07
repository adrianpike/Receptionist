require 'rubygems'
require 'serialport'

SerialPort.open("/dev/ttyUSB0", 9600) do |sp|
        p "Unlocking:"
        sleep 1
        sp.write("\xFF\x01\x01")
        sleep 1
        sp.write("\xFF\x01\x01")
        sleep 1
        sp.write("\xFF\x01\x01")
end
SerialPort.open("/dev/ttyUSB0", 9600) do |sp|
        p "Locking:"
        sleep 1
        sp.write("\xFF\x01\x00")
        sleep 1
        sp.write("\xFF\x01\x00")
        sleep 1
        sp.write("\xFF\x01\x00")
end
