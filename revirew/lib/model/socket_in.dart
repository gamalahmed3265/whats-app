import 'package:socket_io_client/socket_io_client.dart' as IO;

class ScoketClint {
  IO.Socket? socket;
  static ScoketClint? _instance;

  ScoketClint._internal() {
    socket = IO.io('http://localhost:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();
  }

  static ScoketClint get instance {
    _instance ??= ScoketClint._internal();
    return _instance!;
  }
}


  // void conntect() {
  //   print("object-------");
  //   IO.Socket socket = IO.io('http://localhost:5000');
  //   socket.onConnect((_) {
  //     print('connect');
  //     socket.emit('message', {"message": "hello from em"});
  //   });
  //   socket.on('event', (data) => print(data));
  //   socket.onDisconnect((_) => print('disconnect'));
  //   socket.on('fromServer', (_) => print("_"));
  //   print("object-----");
  // }

  // void conntect() {
  //   //http://localhost:5000/
  //   //http://192.168.43.92:5000
  //   //http://10.0.3.2:5000
  //   // IO.Socket socket = IO.io('http://192.168.0.22:5000', <String, dynamic>{
  //   //   'transports': ['websocket'],
  //   //   'autoConnect': true,
  //   // });
  //   // socket.connect();
  //   // socket.emit('message', "hallo world Vs code ");
  //   // socket.onConnect((data) => print("Connect"));
  //   // print("${socket.connected}-------");
  //   IO.Socket socket = IO.io(
  //       'http://localhost:5000',
  //       OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
  //           .setExtraHeaders({'foo': 'bar'}) // optional
  //           .build());
  // }


    // conntect();
    // socket = io.io(
    //     'http://localhost:4000/',
    //     io.OptionBuilder()
    //         .setTransports(['websocket']) // for Flutter or Dart VM
    //         .enableAutoConnect() // disable auto-connection
    //         .build());
    // socket.connect();
    // socket.onConnect((data) => print("onConnect----------"));
    // print("----  ${socket.connected}    ----");
