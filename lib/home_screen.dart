import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> list = [];
  final steamsSocket = SteamsSocket();
  final messageController = TextEditingController();

  Stream<int> generateNumber() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now().second;
    }
  }

  @override
  void initState() {
    list.add('Tom');
    steamsSocket.addResponse(list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: steamsSocket.getResponse,
                builder: (context, AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState ==
                          ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Text(snapshot.data![index].toString());
                        },
                      );
                    } else {
                      return const Text('Something went wrong');
                    }
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Enter message',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    list.add(messageController.text.toString());
                    steamsSocket.addResponse(list);
                    messageController.clear();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SteamsSocket {
  final _stream = StreamController<List<String>>.broadcast();

  void Function(List<String>) get addResponse => _stream.sink.add;

  Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();
}
