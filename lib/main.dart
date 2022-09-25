import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  build(BuildContext context) {
    PermissionStatus camerap = PermissionStatus.denied;
    PermissionStatus locationp = PermissionStatus.denied;
    PermissionStatus storagep = PermissionStatus.denied;
    PermissionStatus micrp = PermissionStatus.denied;
    PermissionStatus phonep = PermissionStatus.denied;
    PermissionStatus calenp = PermissionStatus.denied;
    PermissionStatus contp = PermissionStatus.denied;
    PermissionStatus photosp = PermissionStatus.denied;

    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Permission App"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await openAppSettings();
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(
                      child: Text("Permission Status"),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        myr(ic: Icons.camera_alt, vrnm: camerap),
                        myr(ic: Icons.location_on_outlined, vrnm: locationp),
                        myr(ic: Icons.storage, vrnm: storagep),
                        myr(ic: Icons.mic_none_rounded, vrnm: micrp),
                        myr(ic: Icons.phone, vrnm: phonep),
                        myr(ic: Icons.calendar_month, vrnm: calenp),
                        myr(ic: Icons.contact_page_rounded, vrnm: contp),
                        myr(ic: Icons.photo, vrnm: photosp),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.note_rounded))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Camera"),
                onTap: () async {
                  camerap = await Permission.camera.request();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${camerap}"),
                    backgroundColor:
                        (camerap.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text("Location"),
                onTap: () async {
                  locationp = await Permission.location.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${locationp}"),
                    backgroundColor:
                        (locationp.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.storage),
                title: const Text("Storage"),
                onTap: () async {
                  storagep = await Permission.storage.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${storagep}"),
                    backgroundColor:
                        (storagep.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.mic),
                title: const Text("Microphone"),
                onTap: () async {
                  micrp = await Permission.microphone.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${micrp}"),
                    backgroundColor:
                        (micrp.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone"),
                onTap: () async {
                  phonep = await Permission.phone.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${phonep}"),
                    backgroundColor:
                        (phonep.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text("Calendar"),
                onTap: () async {
                  calenp = await Permission.calendar.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${calenp}"),
                    backgroundColor:
                        (calenp.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text("Contacts"),
                onTap: () async {
                  contp = await Permission.contacts.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${contp}"),
                    backgroundColor:
                        (contp.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Photos"),
                onTap: () async {
                  photosp = await Permission.photos.request();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("${photosp}"),
                    backgroundColor:
                        (photosp.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  myr({required ic, required PermissionStatus vrnm}) {
    return Row(
      children: [
        Icon(ic),
        const Spacer(),
        (vrnm.isGranted)
            ? const Text("Permission Granted ")
            : const Text("Permission Denide  "),
        (vrnm.isGranted)
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.radio_button_unchecked,
                color: Colors.red,
              )
      ],
    );
  }
}
