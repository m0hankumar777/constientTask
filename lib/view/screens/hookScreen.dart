import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookExample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _number = useState(0);
    useEffect(
      () {
        final timer = Timer.periodic(Duration(seconds: 1), (time) {
          _number.value = time.tick;
        });
        return timer.cancel;
      },
      const [],
    );
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text("Hooks")),
      body: Center(
        child: Text(_number.value.toString()),
      ),
    );
  }
}
