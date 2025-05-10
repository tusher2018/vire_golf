import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/Feed/create_post_page.dart';
import 'package:vire_glof/player/League/leagues_details.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<FeedPost> feedPosts = [
    FeedPost(
      name: "John Doe earned the 'First Win' badge!",
      time: "Just now",
      loveCount: 207,
      commentCount: 30,
    ),
    FeedPost(
      name: "Spring League: John Doe vs. Jane Smith",
      activity: "Score: 72 vs. 75",
      time: "2h ago",
      loveCount: 207,
      commentCount: 10,
      imageUrl:
          "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg",
    ),
    FeedPost(
      name: "John Doe joined Summer Open League!",
      time: "Yesterday",
      canComment: false,
      loveCount: 207,
      hasButton: true,
    ),
  ];
  List<FeedPost> pinPosts = [
    FeedPost(
      name: "Spring League Finals\nStart Tomorrow!",
      loveCount: 207,
      commentCount: 30,
      canComment: false,
      hasButton: true,
      isPinned: true,
    ),
  ];

  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonBorderButton(
                "Create Post",
                onTap: () {
                  Get.to(CreatePostScreen());
                },
                imagePath: "assets/create_post_icon.png",
                color: Colors.blue,
                textColor: Colors.blue,
              ),
              const SizedBox(height: 20),
              commonText("Pinned Announcements", isBold: true, size: 16.0),
              const SizedBox(height: 8),
              Column(
                children: List.generate(pinPosts.length, (index) {
                  return _pinnedAnnouncementCard(pinPosts[index], index);
                }),
              ),

              const SizedBox(height: 20),
              commonText("Activity Highlights", isBold: true, size: 16.0),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: Row(
                  children: [
                    Expanded(
                      child: _highLightCard(
                        title: "Top Performer: Jane Smith",
                        subtitle: "Score: 68",
                        buttonText: "See More",
                        imageUrl:
                            "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",

                        ontap: () {
                          showParticipantProfileDialog(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _highLightCard(
                        title: "Top Performer: Jane Smith",
                        subtitle: "Score: 68",
                        buttonText: "See More",

                        imageUrl:
                            "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
                        ontap: () {
                          showParticipantProfileDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              commonText("Your Feed", isBold: true, size: 16.0),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: feedPosts.length,
                itemBuilder: (context, index) {
                  return _feedCard(feedPosts[index], index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pinnedAnnouncementCard(FeedPost post, int index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: _feedCard(post, index),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset("assets/pin.png", width: 24),
        ),
      ],
    );
  }

  Widget _highLightCard({
    required String title,
    required String subtitle,
    required String buttonText,
    required String imageUrl,
    required ontap,
    // double width = 200.0,
  }) {
    return Container(
      // width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            // width: width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  title,
                  maxline: 2,
                  size: 14.0,
                  isBold: true,
                  color: AppColors.white,
                ),

                commonText(subtitle, color: AppColors.white, isBold: true),
                SizedBox(height: 4),
                Center(
                  child: commonSmallButton(
                    text: buttonText,
                    padding: 30,
                    ontap: ontap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _feedCard(FeedPost post, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!post.isPinned)
            Align(alignment: Alignment.topRight, child: Icon(Icons.more_vert)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: commonText(post.name, isBold: true, size: 16),
                    ),
                    const SizedBox(height: 8),
                    if (post.activity != null) commonText(post.activity!),
                    if (post.time != null) commonText(post.time!),
                    if (post.imageUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            post.imageUrl!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (post.hasButton)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: commonSmallButton(
                          text: "View Details",
                          color: AppColors.yellow,
                          ontap: () {
                            Get.to(PlayerLeagueDetailsScreen(onlyView:true));
                          },
                        ),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              post.isLiked = !post.isLiked;
                            });
                          },
                          child: Icon(
                            post.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 18,
                            color: post.isLiked ? Colors.red : null,
                          ),
                        ),
                        const SizedBox(width: 6),
                        if (post.loveCount != null)
                          commonText("${post.loveCount}"),
                        const SizedBox(width: 16),
                        if (post.commentCount != null)
                          Image.asset("assets/massage_icon.png", width: 16),
                        const SizedBox(width: 6),
                        if (post.commentCount != null)
                          commonText(
                            "${post.commentCount}${(post.commentCount! > 10) ? "+" : ""}",
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    if (post.canComment)
                      Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg",
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Write comment...",
                            hintStyle: TextStyle(fontSize: 14),
                            isDense: true,
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> showParticipantProfileDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Header Row with Avatar and Close
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            "https://image.lexica.art/full_webp/9f8136dd-0fe5-4b22-b490-4c87e2722c5a",
                          ),
                        ),
                        const SizedBox(width: 8),
                        commonText("John Doe", size: 16, isBold: true),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Profile Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: commonText("Profile", isBold: true),
                ),

                const SizedBox(height: 8),

                /// Info Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F7FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Email: john@example.com", size: 14),
                      commonText("Phone: 123 456 789", size: 14),
                      commonText("Handicap: Undefined", size: 14),
                      commonText("Average Score: Undefined", size: 14),
                      commonText("Wins: Undefined", size: 14),
                      commonText("Match Played: 23", size: 14),
                      commonText("Leagues: Pine Hills", size: 14),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FeedPost {
  final String name;
  final String? time;
  final String? activity;
  final String? imageUrl;
  final int? loveCount;
  final int? commentCount;
  final bool canComment;
  final bool hasButton;
  final bool isPinned;
  bool isLiked;

  FeedPost({
    required this.name,
    this.time,
    this.activity,
    this.imageUrl,
    this.loveCount,
    this.commentCount,
    this.canComment = true,
    this.hasButton = false,
    this.isPinned = false,
    this.isLiked = false,
  });
}
