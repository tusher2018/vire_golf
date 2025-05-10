import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 16),
        leading: BackButton(),
        centerTitle: true,
        title: commonText('Create Post', isBold: true, size: 16),
        actions: [commonSmallButton(text: "Post", padding: 24)],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg',
                  ),
                ),
                const SizedBox(width: 12),
                commonText('Jordy Sonia', isBold: true, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                maxLines: 10,
                minLines: 3,
                decoration: InputDecoration(
                  hintText: "What do you want to write?",
                  hintStyle: TextStyle(color: AppColors.gray),
                  border: InputBorder.none,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                // TODO: Upload photo functionality
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.image, color: Colors.black54),
                    const SizedBox(width: 8),
                    commonText('Upload Photos', color: Colors.black87),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
