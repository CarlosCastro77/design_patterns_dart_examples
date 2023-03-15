abstract class Device {
  bool isEnabled();
  void enable();
  void disable();
  int getVolume();
  void setVolume(int percent);
  int getChannel();
  void setChannel(int channel);
  void printStatus();
}

class Radio implements Device {
  bool _on = false;
  int _volume = 30;
  int _channel = 1;

  @override
  void disable() {
    _on = false;
  }

  @override
  void enable() {
    _on = true;
  }

  @override
  int getChannel() {
    return _channel;
  }

  @override
  int getVolume() {
    return _volume;
  }

  @override
  bool isEnabled() {
    return _on;
  }

  @override
  void printStatus() {
   print("------------------------------------");
   print("| I'm radio.");
   print("| I'm ${_on ? "enabled" : "disabled"}");
   print("| Current volume is $_volume%");
   print("| Current channel is $_channel");
   print("------------------------------------\n");
  }

  @override
  void setChannel(int channel) {
    _channel = channel;
  }

  @override
  void setVolume(int volume) {
    if (_volume > 100) {
      _volume = 100;
    } else if (_volume < 0) {
      _volume = 0;
    } else {
      _volume = volume;
    }
  }
}

class Tv implements Device {
  bool _on = false;
  int _volume = 30;
  int _channel = 1;

  @override
  void disable() {
    _on = false;
  }

  @override
  void enable() {
    _on = true;
  }

  @override
  int getChannel() {
    return _channel;
  }

  @override
  int getVolume() {
    return _volume;
  }

  @override
  bool isEnabled() {
    return _on;
  }

  @override
  void printStatus() {
    print("------------------------------------");
    print("| I'm TV set.");
    print("| I'm ${_on ? "enabled" : "disabled"}");
    print("| Current volume is $_volume%");
    print("| Current channel is $_channel");
    print("------------------------------------\n");
  }

  @override
  void setChannel(int channel) {
    _channel = channel;
  }

  @override
  void setVolume(int volume) {
    if (_volume > 100) {
      _volume = 100;
    } else if (_volume < 0) {
      _volume = 0;
    } else {
      _volume = volume;
    }
  }
}

abstract class Remote {
  void power();

  void volumeDown();

  void volumeUp();

  void channelDown();

  void channelUp();
}

class BasicRemote implements Remote {
  late Device _device;

  BasicRemote();

  BasicRemote.withDevice(Device device) {
    _device = device;
  }

  @override
  void channelDown() {
    print("Remote: channel down");
    _device.setChannel(_device.getChannel() - 1);
  }

  @override
  void channelUp() {
    print("Remote: channel up");
    _device.setChannel(_device.getChannel() + 1);
  }

  @override
  void power() {
    print("Remote: power toggle");
    if (_device.isEnabled()) {
      _device.disable();
    } else {
      _device.enable();
    }
  }

  @override
  void volumeDown() {
    print("Remote: volume down");
    _device.setVolume(_device.getVolume() - 10);
  }

  @override
  void volumeUp() {
    print("Remote: volume up");
    _device.setVolume(_device.getVolume() + 10);
  }

}

class AdvancedRemote extends BasicRemote {
  AdvancedRemote(Device device) {
    super._device = device;
  }

  void mute() {
    print("Remote: mute");
    _device.setVolume(0);
  }
}

void testDevice(Device device) {
  print("Tests with basic remote.");
  BasicRemote basicRemote = BasicRemote.withDevice(device);
  basicRemote.power();
  device.printStatus();

  print("Testes with advanced remote.");
  AdvancedRemote advancedRemote = AdvancedRemote(device);
  advancedRemote.power();
  advancedRemote.mute();
  device.printStatus();
}

void main(List<String> arguments) {
  testDevice(Tv());
  testDevice(Radio());
}