import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8).r,
      child: Card(
        semanticContainer: true,
        elevation: 4,
        color: Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Color(0xffE0E0E0),
              width: 1.r,
            )),
        child: Container(
          width: double.infinity,
          height: 110.r,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                project['image'],
                width: 110.r,
                height: 110.r,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      project['title'],
                      style: TextStyle(
                          color: Color(0xff303030),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              project['subject'],
                              style: TextStyle(
                                  color: Color(0xff303030),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              project['author'],
                              style: TextStyle(
                                  color: Color(0xff9E95A2),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Container(
                          width: 50.r,
                          height: 26.r,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffF39519), Color(0xffFFCD67)]),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
