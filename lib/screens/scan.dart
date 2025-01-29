import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in to class"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "CS401",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date & Time",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 104, 104, 104)),
                ),
                Icon(
                  Icons.verified,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 104, 104, 104),
                  ),
                ),
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Face ID",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 104, 104, 104),
                  ),
                ),
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "QR Code",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 104, 104, 104),
                  ),
                ),
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Scan Face ID"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Scan QR Code"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
