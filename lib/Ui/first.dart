import 'package:ai/Bloc/main_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Repostory/Model/FirstModel.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late FirstModel first;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "AI",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: controller,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.black)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_outlined)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  if (state is MainBlocLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MainBlocError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (state is MainBlocLoaded) {
                    first = BlocProvider.of<MainBloc>(context).firstModel;

                    return Container(
                      width: 500.w,
                      height: 400.h,
                      decoration: ShapeDecoration(color: Colors.black,
                        shape: RoundedRectangleBorder(),
                      ),child: Image.network(first.url.toString()),                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<MainBloc>(context)
                    .add(FetchMainEvent(id: controller.text));
              },
              child: Container(
                width: 300.w,
                height: 70.h,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: Text(
                    "Submit",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
